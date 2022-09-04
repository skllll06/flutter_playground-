import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/theme_provider.dart';
import 'widget/color_select_button.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ThemeData> themeData = ref.watch(themeModeProvider);
    return themeData.when(
      data: (themeData) {
        return MaterialApp(
          theme: themeData,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
      error: (error, stack) => Text('$error'),
      loading: () => const LoadingView(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
                value: ref.watch(isDarkProvider),
                onChanged: ref.watch(isDarkProvider.notifier).toggleThemeMode),
            Row(
              children: [
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.blue,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('blue'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.red,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('red'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.yellow,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('yellow'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.pinkAccent,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('pink'),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.green,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('green'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.purple,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('purple'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.brown,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('brown'),
                )),
                Expanded(
                    child: ColorSelectButton(
                  color: Colors.grey,
                  handleOnTap: () => ref
                      .watch(themePrimaryColorProvider.notifier)
                      .togglePrimaryColor('grey'),
                )),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.black87,
          child: const Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 23,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
