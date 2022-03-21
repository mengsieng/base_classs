import 'package:base_class/change_notifier/base_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

/// You can use [BaseStateless] to connect with change notifier
/// to controll state management easy and less code
abstract class BaseStateless<T extends BaseChangeNotifier>
    extends ConsumerWidget {
  BaseStateless({Key? key}) : super(key: key) {
    _changeNotifier = registerChangeNotifier();
    _provider = ChangeNotifierProvider.autoDispose((ref) => _changeNotifier);
  }

  late final T _changeNotifier;
  late final ProviderListenable<T> _provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// [LoaderOverlay] this widget used for show loading
    return LoaderOverlay(
      child: buildWidget(context, ref.watch(_provider)),
    );
  }

  /// This [buildWidget] need to override when extends
  /// This used for write UI design
  Widget buildWidget(BuildContext context, T provider);

  /// [registerChangeNotifier] for aassign changeNoifier instance
  /// for get acess to changeNoifier that you want to register for using
  @protected
  T registerChangeNotifier();
}
