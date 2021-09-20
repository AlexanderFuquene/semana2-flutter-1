import 'package:flutter/material.dart';
import 'package:semanda2flutter1/widgets/botones.widget.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String values = '';
  String resultado = '';
  String operador = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: Row(
                  children: [
                    Text(resultado),
                  ],
                ),
                color: Colors.blue,
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Text(values),
                  ],
                ),
                color: Colors.red,
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila1()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila2()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila3()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _listaBotonesFila4()),
                  ],
                ),
                color: Colors.green,
              )),
        ],
      ),
    );
  }

  _listaBotonesFila1() {
    return [
      pintarBoton(
          metodo: () {
            setVal("7", false);
          },
          compoente: Text("7"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("8", false);
          },
          compoente: Text("8"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("9", false);
          },
          compoente: Text("9"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("÷", true);
          },
          compoente: Text("÷"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("CE", true);
          },
          compoente: Text("CE"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("C", true);
          },
          compoente: Text("C"),
          colorBoton: Colors.black),
    ];
  }

  _listaBotonesFila2() {
    return [
      pintarBoton(
          metodo: () {
            setVal("4", false);
          },
          compoente: Text("4"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("5", false);
          },
          compoente: Text("5"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("6", false);
          },
          compoente: Text("6"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("*", true);
          },
          compoente: Text("*"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("(", true);
          },
          compoente: Text("("),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal(")", true);
          },
          compoente: Text(")"),
          colorBoton: Colors.black),
    ];
  }

  _listaBotonesFila3() {
    return [
      pintarBoton(
          metodo: () {
            setVal("1", false);
          },
          compoente: Text("1"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("2", false);
          },
          compoente: Text("2"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("3", false);
          },
          compoente: Text("3"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("-", true);
          },
          compoente: Text("-"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("x²", true);
          },
          compoente: Text("x²"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {}, compoente: Text("√"), colorBoton: Colors.black),
    ];
  }

  _listaBotonesFila4() {
    return [
      pintarBoton(
          metodo: () {
            setVal("0", false);
          },
          compoente: Text("0"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal(",", true);
          },
          compoente: Text(","),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal("%", true);
          },
          compoente: Text("%"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            setVal('+', true);
          },
          compoente: Text("+"),
          colorBoton: Colors.black),
      pintarBoton(
          metodo: () {
            calcular();
          },
          valorFlex: 2,
          compoente: Text("="),
          colorBoton: Colors.black),
    ];
  }

  //_listaBotonesFila1() {
  //  return [
  //    ElevatedButton(
  //      onPressed: (){},
  //      child: Text("7")
  //    )
  //    ,ElevatedButton(
  //      onPressed: (){},
  //      child: Text("8")
  //    ),
  //    ElevatedButton(
  //      onPressed: (){},
  //      child: Text("9")
  //    ),
  //    ElevatedButton(
  //      onPressed: (){},
  //      child: Text("÷")
  //    ),
  //    ElevatedButton(
  //      onPressed: (){},
  //      child: Icon(Icons.arrow_back)
  //    ),
  //    ElevatedButton(
  //      onPressed: (){},
  //      child: Text("C")
  //    )];
  //}
  void setVal(String val, bool isOperador) {
    if (isOperador) {
      operador = val;
    }
    setState(() {
      if (values == "0")
        values = val;
      else
        values += val;
    });
  }

  void calcular() {
    switch (operador) {
      case '+':
        var arr = values.split('+');
        print(arr);
        var num1 = double.parse(arr[0]);
        var num2 = double.parse(arr[1]);
        var suma = num1 + num2;
        setState(() {
          resultado = suma.toString();
        });
        break;
      case '-':
        var arr = values.split('-');
        print(arr);
        var num1 = double.parse(arr[0]);
        var num2 = double.parse(arr[1]);
        var resta = num1 - num2;
        setState(() {
          resultado = resta.toString();
        });
        break;
      case '*':
        var arr = values.split('*');
        print(arr);
        var num1 = double.parse(arr[0]);
        var num2 = double.parse(arr[1]);
        var multiplicacion = num1 * num2;
        setState(() {
          resultado = multiplicacion.toString();
        });
        break;
      case '÷':
        var arr = values.split('÷');
        print(arr);
        var num1 = double.parse(arr[0]);
        var num2 = double.parse(arr[1]);
        var division = num1 / num2;
        setState(() {
          resultado = division.toString();
        });
        break;
      case 'C':
        var arr = values.split('C');
        print(arr);
        setState(() {
          resultado = '0';
          values = '';
        });
    }
  }
//    if (values.contains("+")) {
//      var arr = values.split('+');
//      print(arr);
//      var num1 = double.parse(arr[0]);
//      var num2 = double.parse(arr[1]);
//      var suma = num1 + num2;
//      setState(() {
//        resultado = suma.toString();
//      });
//    }
//  }
}
