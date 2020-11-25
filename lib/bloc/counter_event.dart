part of 'counter_bloc.dart';

abstract class CounterEvent {
  int payload;
  CounterEvent(this.payload);
}

class Increment extends CounterEvent {
  Increment(int payload) : super(payload);
}

class Decrement extends CounterEvent {
  Decrement(int payload) : super(payload);
}
