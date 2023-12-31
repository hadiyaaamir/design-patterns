import '../collections/social_network.dart';
import '../profile.dart';

part 'facebook_iterator.dart';
part 'linkedin_iterator.dart';

// interface

abstract class ProfileIterator {
  bool hasMore();
  Profile? getNext();
}
