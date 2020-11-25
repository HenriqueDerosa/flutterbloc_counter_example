part of 'counter_bloc.dart';

abstract class CounterState {
  final int amount;
  CounterState({this.amount});
  int get getAmount => this.amount;
}

class InitialCounterState extends CounterState {
  InitialCounterState({int amount = 0}) : super(amount: amount);
  InitialCounterState.usePrevious(CounterState oldState, {int amount})
      : super(amount: amount);
}
