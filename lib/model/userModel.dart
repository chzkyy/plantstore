import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userModel extends Equatable {
  final String id;
  final String name;
  final String email;

  userModel({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
