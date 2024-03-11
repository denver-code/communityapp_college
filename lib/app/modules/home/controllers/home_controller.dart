import 'package:get/get.dart';

class HomeController extends GetxController {
  List feedData = [
    Post(
      type: 'Post',
      views: 50,
      title: 'New Product Launch',
      description: 'Introducing our latest innovation!',
      author: 'TechCompanyXYZ',
      timePosted: DateTime.now().subtract(Duration(hours: 6)),
    ),
    Event(
      type: 'Event',
      views: 100,
      title: 'Art Exhibition',
      description: 'Join us for a stunning display of contemporary art.',
      author: 'ArtGallery123',
      timePosted: DateTime.now().subtract(Duration(days: 3)),
      location: '123 Main Street, Cityville',
      date: DateTime.now().add(Duration(days: 10)),
    ),
    Post(
      type: 'Post',
      views: 30,
      title: 'Book Recommendation',
      description: 'A must-read for all book lovers!',
      author: 'Bookworm101',
      timePosted: DateTime.now().subtract(Duration(days: 2)),
    ),
    Event(
      type: 'Event',
      views: 75,
      title: 'Charity Fundraiser',
      description: 'Help us raise funds for children in need.',
      author: 'CharityOrg',
      timePosted: DateTime.now().subtract(Duration(days: 1)),
      location: '456 Elm Avenue, Townsville',
      date: DateTime.now().add(Duration(days: 20)),
    ),
  ];
}

class Post {
  final String type;
  final int views;
  final String title;
  final String description;
  final String author;
  final DateTime timePosted;

  Post({
    required this.type,
    required this.views,
    required this.title,
    required this.description,
    required this.author,
    required this.timePosted,
  });
}

class Event extends Post {
  final String location;
  final DateTime date;

  Event({
    required String type,
    required int views,
    required String title,
    required String description,
    required String author,
    required DateTime timePosted,
    required this.location,
    required this.date,
  }) : super(
          type: type,
          views: views,
          title: title,
          description: description,
          author: author,
          timePosted: timePosted,
        );
}
