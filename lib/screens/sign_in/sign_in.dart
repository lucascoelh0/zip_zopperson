import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zip_zopperson/bloc/auth_bloc/auth_bloc.dart';
import 'package:zip_zopperson/screens/messages/messages.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Messages()),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _authenticateWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
                        child: Image.asset(
                          'assets/images/google-logo-9808.png',
                          height: 40.0,
                        ),
                      ),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithGoogle(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequestedEvent());
}
