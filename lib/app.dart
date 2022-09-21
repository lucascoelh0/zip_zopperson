import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zip_zopperson/bloc/auth_bloc/auth_bloc.dart';
import 'package:zip_zopperson/repositories/auth_repository.dart';
import 'package:zip_zopperson/screens/sign_in/sign_in.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zip Zopperson',
          home: SignIn(),
        ),
      ),
    );
  }
}
