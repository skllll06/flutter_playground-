import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class ProviderCounterPage extends HookConsumerWidget {
  const ProviderCounterPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Counter'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.state).state++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(builder: (context, ref, _) {
                final count = ref.watch(counterProvider.state).state;
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
              TextButton(
                onPressed: () => ref.read(counterProvider.state).state = 0,
                child: Text('Reset'),
              )
            ],
          ),
        ),
      );
}
