import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('AuthBloc - change $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print('AuthBloc - Transition $transition');
  }

  void _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        emit(AuthFailure("password cannot be less tha 6"));
        return;
      }
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: "$email-$password"));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthLoginRequested>((event, emit) async {
//       // TODO: implement event handler
//       emit(AuthLoading());
//       try {
//         final email = event.email;
//         final password = event.password;
//         if (password.length < 6) {
//           emit(AuthFailure("password cannot be less tha 6"));
//           return;
//         }
//         await Future.delayed(const Duration(seconds: 1), () {
//           return emit(AuthSuccess(uid: "$email-$password"));
//         });
//       } catch (e) {
//         return emit(AuthFailure(e.toString()));
//       }
//     });
//     on<AuthLogoutRequested>((event, emit) async{
//       emit(AuthLoading());
//       try {
//         await Future.delayed(const Duration(seconds: 1), () {
//           return emit(AuthInitial());
//         });
//       } catch (e) {
//         emit(AuthFailure(e.toString()));
//       }
//     });
//   }
// }
