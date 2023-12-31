part of 'handlers.dart';

class IPFilterHandler extends BaseHandler {
  final List<String> _bannedIPs = ['192.168.0.1', '10.0.0.2'];

  @override
  void handleRequest(User user) {
    if (!_isIPBanned(user.IP)) {
      print("IP filtering passed.");
      super.handleRequest(user);
    } else {
      print("Access denied due to banned IP address: ${user.IP}");
    }
  }

  bool _isIPBanned(String ip) => _bannedIPs.contains(ip);
}
