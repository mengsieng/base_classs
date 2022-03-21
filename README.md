## base_class library

Our job is to make you easier to use `hooks_riverpod` with `ConsumerWidget` with less code.

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  base_class:
    git: git@github.com:mengsieng/base_classs.git
```

## Example

Frist you have to create changenotifier class that extends with `ChangeNotifier` or `BaseChangeNotifier` that we have provide some functionality.

```dart
class CounterProvider extends BaseChangeNotifier{
    int count = 0;
    fun increaseCount(){
        count += 1;
    }
}
```

Now let extends `BaseStateless` for create UI design that register with `ChangeNotifier` class to separate UI and state easy.

```dart
class CounterScreen extends BaseStateless<CounterProvider> {
  @override
  CountProvider registerChangeNotifier() => CounterProvider();

  @override
  Widget buildWidget(BuildContext context, CountProvider povider) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Counter Example'),
            body: Center(
                child: Text("Count = ${provider.count}"),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  povider.increas();
                },
            ),
        ),
    );
  }
}
```
