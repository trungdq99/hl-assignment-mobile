import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../joke.dart';

class JokePage extends StatelessWidget {
  const JokePage({Key? key}) : super(key: key);

  static Route<dynamic> getRoute(RouteSettings settings) => GetPageRoute(
        page: () => const JokePage(),
        settings: settings,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (_, state) {
          return SafeArea(
            child: Column(
              children: const [
                JokeHeader(),
                JokeTitle(),
                SizedBox(
                  height: 40,
                ),
                Expanded(child: JokeContent()),
                JokeVoteButton(),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: ColorUtil.grey,
                ),
                JokeFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
