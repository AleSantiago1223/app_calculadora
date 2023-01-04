// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Calculadora',
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 180,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Primeira linha
                Row(
                  children: [
                    Botao(
                      temaBotao: TemaBotao.acoes,
                      texto: 'AC',
                    ),
                    Botao(
                      temaBotao: TemaBotao.acoes,
                      texto: '+/-',
                    ),
                    Botao(
                      temaBotao: TemaBotao.acoes,
                      texto: '%',
                    ),
                    Botao(
                      temaBotao: TemaBotao.operacoes,
                      texto: '/',
                    ),
                  ],
                ),
                // Segunda linha
                Row(
                  children: [
                    Botao(
                      texto: '7',
                    ),
                    Botao(
                      texto: '8',
                    ),
                    Botao(
                      texto: '9',
                    ),
                    Botao(
                      temaBotao: TemaBotao.operacoes,
                      texto: '*',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Botao(
                      texto: '4',
                    ),
                    Botao(
                      texto: '5',
                    ),
                    Botao(
                      texto: '6',
                    ),
                    Botao(
                      temaBotao: TemaBotao.operacoes,
                      texto: '-',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Botao(
                      texto: '1',
                    ),
                    Botao(
                      texto: '2',
                    ),
                    Botao(
                      texto: '3',
                    ),
                    Botao(
                      temaBotao: TemaBotao.operacoes,
                      texto: '+',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Botao(
                      texto: '0',
                      ehMaior: true,
                    ),
                    Botao(
                      texto: ',',
                    ),
                    Botao(
                      temaBotao: TemaBotao.operacoes,
                      texto: '=',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    this.temaBotao = TemaBotao.numeros,
    required this.texto,
    this.ehMaior = false,
    this.onTap,
  }) : super(key: key);

  final TemaBotao temaBotao;
  final String texto;
  final bool ehMaior;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ehMaior
        ? _buildContet()
        : Center(
            child: _buildContet(),
          );
  }

  Widget _buildContet() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: ehMaior ? Alignment.centerLeft : Alignment.center,
        decoration: BoxDecoration(
          color: temaBotao.corFundo,
          borderRadius: BorderRadius.circular(100),
        ),
        height: 50,
        width: ehMaior ? 116 : 50,
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.only(left: ehMaior ? 20 : 0),
        child: Text(
          texto,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: temaBotao.corTexto,
          ),
        ),
      ),
    );
  }
}

enum TemaBotao {
  numeros(Color.fromARGB(255, 40, 42, 44), Colors.white),
  acoes(Colors.grey, Colors.black),
  operacoes(Colors.orange, Colors.white);

  const TemaBotao(
    this.corFundo,
    this.corTexto,
  );

  final Color corFundo;
  final Color corTexto;
}
