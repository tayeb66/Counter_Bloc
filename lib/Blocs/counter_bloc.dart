import 'package:counter_bloc/Blocs/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc() : super(0){
    on<IncrementCounter>((event, emit) => emit(state+1));
    on<DecrementCounter>((event, emit) => emit(state -1));
  }
}