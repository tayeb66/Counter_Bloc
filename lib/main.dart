import 'package:counter_bloc/Blocs/counter_bloc.dart';
import 'package:counter_bloc/Blocs/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$state",
                  textScaleFactor: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrementCounter());
                    },
                    child: Text("Add")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecrementCounter());
                    },
                    child: Text("Remove")),
              ],
            ),
          );
        },
      ),
    );
  }
}
