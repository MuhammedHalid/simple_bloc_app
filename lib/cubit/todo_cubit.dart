import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_app/moels/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    if (title.isEmpty) {
      addError("title canot empty");
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    //state.add(todo);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
