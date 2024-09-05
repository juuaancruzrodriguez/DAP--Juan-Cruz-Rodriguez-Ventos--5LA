import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entities/User.dart';

List usuarios = [
  User(email: "SantiDP", password: "Pass1"),
  User(email: "JuanCruz", password: "Pass2"),
  User(email: "Feli", password: "Pass3"),
  User(email: "SantiVidal", password: "Pass4"),
  User(email: "Facundo", password: "Pass5")
];

String logged = '';

final userProvider = StateProvider((ref) {
  return usuarios;
});

final loggedProvider = StateProvider((ref) {
  return logged;
});