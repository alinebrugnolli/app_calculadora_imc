import 'dart:io';
import 'dart:math';

import 'package:app_calculadora_imc/pessoa.dart';

void execute() {
  print('SEJA BEM VINDO A CALCULADORA DE IMC!');

  var pessoa = Pessoa();  
  String? nome;
  double? peso;
  double? altura;
  double? imc;

  do {
    stdout.write("DIGITE O SEU NOME: ");
    nome = stdin.readLineSync();

    if (nome == null || nome.isEmpty) {
      print("NOME INVÁLIDO. POR FAVOR, DIGITE SEU NOME NOVAMENTE.");
    }
  } while (nome == null || nome.isEmpty);

  do {
    stdout.write("DIGITE SEU PESO (KG): ");
    peso = double.tryParse(stdin.readLineSync()!);

    if (peso == null || peso < 1) {
      print("PESO INVÁLIDO. DIGITE SEU PESO NOVAMENTE. Ex: 55 .");
    }
  } while (peso == null || peso < 1);

  do {
    stdout.write("DIGITE A SUA ALTURA (CM): ");
    altura = double.tryParse(stdin.readLineSync()!);

    if (altura == null || altura < 100) {
      print("ALTURA INVÁLIDA. DIGITE SUA ALTURA NOVAMENTE. Ex: 177 .");
    }
  } while (altura == null || altura < 100);

  String nomeValido = nome;
  imc = peso / pow(altura / 100, 2);

  if (imc < 18.5) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ ABAIXO DO PESO NORMAL!");
  } else if (imc > 18.5 && imc < 24.9) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ COM O PESO NORMAL!");
  } else if (imc >= 25 && imc <= 29.9) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ COM SOBREPESO!");
  } else if (imc >= 30 && imc <= 34.9) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ NA OBESIDADE GRAU I!");
  } else if (imc >= 35 && imc <= 39.9) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ NA OBESIDADE GRAU II!");
  } else if (imc > 40) {
    print(
        " ${pessoa.getNome(nomeValido)?.toUpperCase()} O RESULTADO DO SEU IMC É: ${imc.toStringAsFixed(1)}, VOCÊ ESTÁ NA OBESIDADE GRAU III!");
  }
}
