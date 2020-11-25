import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc bloc;

  @override
  void dispose() {
    bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocProvider<CounterBloc>(
              create: (BuildContext context) {
                CounterBloc tempBloc = CounterBloc(InitialCounterState());
                bloc = tempBloc;
                return tempBloc;
              },
              /* BlocListener 
                should be used for functionality that needs to 
                occur once per state change such as navigation, 
                showing a SnackBar, showing a Dialog, etc... 
                You don't need this by default. */
              child: BlocListener<CounterBloc, CounterState>(
                listener: (BuildContext context, CounterState state) {
                  if (state.amount == 2) {
                    print('You clicked twice');
                  }
                },
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (BuildContext context, CounterState state) => Text(
                    '${state.amount}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(Increment(1));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
