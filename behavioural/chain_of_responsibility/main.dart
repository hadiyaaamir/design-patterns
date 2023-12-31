import 'base_handler.dart';
import 'handlers/handlers.dart';
import 'user.dart';

void main() {
  //create chain
  final List<BaseHandler> handlers = [
    AuthenticationHandler(),
    AuthorisationHandler(),
    IPFilterHandler(),
    CachingHandler(),
  ];

  final BaseHandler handler = BaseHandler.createChain(handlers);

  //common variables
  String adminEmail = 'admin@gmail.com';
  String userEmail = 'user@gmail.com';
  String nonExistentEmail = 'nonexistent@gmail.com';

  String password = 'password';

  String unblockedIP = '192.0.0.1';
  String blockedIP = '192.168.0.1';

  String lines = '\n- - - - - - - - - - - - - - -';

  // Authentic admin request (unchached)
  print('Authentic admin request (unchached) $lines');
  User user = User(email: adminEmail, password: password, IP: unblockedIP);
  handler.handleRequest(user);

  // Authentic user request
  print('\nAuthentic user request $lines');
  user = User(email: userEmail, password: password, IP: unblockedIP);
  handler.handleRequest(user);

  // Unauthentic request
  print('\nUnauthentic request $lines');
  user = User(email: nonExistentEmail, password: password, IP: unblockedIP);
  handler.handleRequest(user);

  // Admin request with blocked IP
  print('\nAuthentic admin request with blocked IP $lines');
  user = User(email: adminEmail, password: password, IP: blockedIP);
  handler.handleRequest(user);

  // Cached admin request
  print('\nAuthentic cached admin request $lines');
  user = User(email: adminEmail, password: password, IP: unblockedIP);
  handler.handleRequest(user);
}
