import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_app/bloc/auth/bloc/auth_bloc.dart';
import 'package:simple_bloc_app/pages/add_todo_page.dart';
import 'package:simple_bloc_app/bloc/counter_bloc.dart';
import 'package:simple_bloc_app/cubit/counter_cubit.dart';
import 'package:simple_bloc_app/cubit/todo_cubit.dart';
import 'package:simple_bloc_app/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const LoginScreen(),
          '/add-todo': (context) => const AddTodoPage(),
        },
      ),
    );
  }
}
          // '/': (_) => const TodoList(),
