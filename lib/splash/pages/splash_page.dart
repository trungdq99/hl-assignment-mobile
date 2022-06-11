import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import '../../joke/joke.dart';
import '../../utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route<dynamic> getRoute(RouteSettings settings) => GetPageRoute(
        page: () => const SplashPage(),
        settings: settings,
        transition: transition.Transition.fadeIn,
      );

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<JokeBloc>().add(JokeEventFetchJoke());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JokeBloc, JokeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (_, state) {
        if (state.status == JokeStatus.loaded) {
          Get.offAllNamed(RouteUtil.home);
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Get.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
