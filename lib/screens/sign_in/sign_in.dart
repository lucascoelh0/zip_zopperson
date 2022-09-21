import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zip_zopperson/bloc/auth_bloc/auth_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _authenticatedWithGoogle(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequestedEvent());
}
