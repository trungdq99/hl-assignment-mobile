import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'joke/joke.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(
      App(
        jokeBloc: JokeBloc(
          repository: JokeRepository(),
        ),
      ),
    ),
    storage: storage,
  );
}
