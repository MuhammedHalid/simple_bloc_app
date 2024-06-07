part of "counter_bloc.dart";
// sealed is a dart modifiers

sealed class CounterEvent {}

final class CounterIncremented extends CounterEvent {}

final class CounterDecreamented extends CounterEvent {}
