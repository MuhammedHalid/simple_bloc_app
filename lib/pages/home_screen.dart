import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_app/bloc/auth/bloc/auth_bloc.dart';
import 'package:simple_bloc_app/pages/login_screen.dart';
import 'package:simple_bloc_app/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {},
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          

          return Column(
            children: [
              Center(
                child: Text((state
                 as AuthSuccess).uid),
              ),
              GradientButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
