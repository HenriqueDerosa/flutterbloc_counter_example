import 'dart:async';
import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is Increment) {
      yield InitialCounterState.usePrevious(initialState,
          amount: state.amount + event.payload);
    } else if (event is Decrement) {
      yield InitialCounterState.usePrevious(initialState,
          amount: state.amount + event.payload);
    }
  }
}
