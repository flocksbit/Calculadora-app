import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora 02',
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String visor = '0';

  void setValor(String valor) {
    setState(() {
      visor += valor;
    });
  }

  void zerar() {
    setState(() {
      visor = '';
    });
  }

  void realizarCalculo() {
    Parser p = Parser();

    Expression expressao = p.parse(visor);
    ContextModel cm = ContextModel();

    double resultado = expressao.evaluate(EvaluationType.REAL, cm);
    setState(() {
      visor = resultado.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          'Calculadora',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: 400.0,
            height: 120.0,
            margin: EdgeInsets.all(15.0),
            color: Colors.white,
            child: Text(
              visor,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botoesCalculadora(
                          caracterDaTecla: 'C',
                          corTecla: Colors.cyan,
                          onPress: () => {zerar()},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: 'DEL',
                          corTecla: Colors.cyan,
                          onPress: () => {
                            zerar(),
                          },
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '%',
                          corTecla: Colors.cyan,
                          onPress: () => {setValor('%')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '/',
                          corTecla: Colors.cyan,
                          onPress: () => {setValor('/')},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botoesCalculadora(
                          caracterDaTecla: '7',
                          onPress: () => {setValor('7')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '8',
                          onPress: () => {setValor('8')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '9',
                          onPress: () => {setValor('9')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '*',
                          corTecla: Colors.cyan,
                          onPress: () => {setValor('*')},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botoesCalculadora(
                          caracterDaTecla: '4',
                          onPress: () => {setValor('4')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '5',
                          onPress: () => {setValor('5')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '6',
                          onPress: () => {setValor('6')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '+',
                          corTecla: Colors.cyan,
                          onPress: () => {setValor('+')},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botoesCalculadora(
                          caracterDaTecla: '1',
                          onPress: () => {setValor('1')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '2',
                          onPress: () => {setValor('2')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '3',
                          onPress: () => {setValor('3')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '-',
                          corTecla: Colors.cyan,
                          onPress: () => {setValor('-')},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botoesCalculadora(
                          caracterDaTecla: '0',
                          onPress: () => {setValor('0')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '.',
                          onPress: () => {setValor('.')},
                        ),
                        botoesCalculadora(
                          caracterDaTecla: '=',
                          corTecla: Colors.cyan,
                          onPress: () => {realizarCalculo()},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded botoesCalculadora({
    String caracterDaTecla,
    Color corTecla = Colors.amber,
    Function onPress,
  }) {
    return Expanded(
        child: ElevatedButton(
            onPressed: onPress,
            child: Text(
              caracterDaTecla,
              style: TextStyle(
                fontSize: 25.0,
                color: corTecla,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20.0),
              primary: Colors.purple[900],
            )));
  }
}
