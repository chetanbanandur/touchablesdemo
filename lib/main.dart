import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import 'package:vector_math/vector_math.dart' as vector_math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child:
          CanvasTouchDetector(
            builder: (context) => CustomPaint(
                painter: DrawAmPlansPainter( context),
          )
        )
    )
    );
  }
}

class DrawAmPlansPainter extends CustomPainter {
  final BuildContext context;
  DrawAmPlansPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context,canvas);

    myCanvas.drawCircle(Offset(10, 10), 60, Paint()..color=Colors.orange ,
        onTapDown: (tapDetail) {
          print("orange Circle touched");
        },
        onPanDown:(tapDetail){
          print("orange circle swiped");
        }
    );

    myCanvas.drawLine(
        Offset(0, 0),
        Offset(size.width - 100, size.height - 100),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 50,
        onPanUpdate: (detail) {
          print('Black line Swiped'); //do cooler things here. Probably change app state or animate
        });
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
