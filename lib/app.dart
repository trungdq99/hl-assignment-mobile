import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'joke/joke.dart';
import 'splash/splash.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  final JokeBloc jokeBloc;
  const App({
    Key? key,
    required this.jokeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => jokeBloc,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HL Assignment Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeUtil.defaultTheme,
      onGenerateRoute: RouteUtil.generateRoute,
      home: const SplashPage(),
    );
  }
}
