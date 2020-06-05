class AuthException implements Exception {
  static const Map<String, String> erros = {
    'EMAIL_EXISTS': 'E-mail existe!',
    'OPERATION_NOT_ALLOWED': 'Operração não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Muitas tentativas, tente mais tarde!',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado!',
    'INVALID_PASSWORD': 'Senha inválida!',
    'USER_DISABLED': 'Usuário desativado!',
  };


  final String key;


  const AuthException(this.key);

  @override
  String toString() {
    if(erros.containsKey(key)){
      return erros[key];
    }
    return 'Ocorreu um erro na autenticação!';
  }

}