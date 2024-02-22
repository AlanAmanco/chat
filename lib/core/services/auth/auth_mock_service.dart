import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/pages/chat_user.dart';

class AuthMockService implements AuthService {
  @override
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  // TODO: implement userChange
  Stream<ChatUser?> get userChange => throw UnimplementedError();

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String nome, String email, String password, File image) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
