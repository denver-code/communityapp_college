import 'package:community_app/app/modules/home/views/nearby.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Community App',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // Feed
            ListTile(
              title: const Text('Feed'),
              onTap: () {
                Get.toNamed('/home');
              },
            ),
            // Nearby
            ListTile(
              title: const Text('Nearby'),
              onTap: () {
                Get.to(() => const NearbyView());
              },
            ),
            // Services
            ListTile(
              title: const Text('Services'),
              onTap: () {
                Get.toNamed('/services');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'COMMUNITY',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: const Icon(Icons.account_circle, color: Colors.black),
          ),
        ],
        // remove background and shadow
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 5),
            child: Text(
              'POPULAR\nEDITIONS',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 25.0,
              ),
              child: Container(
                // border 10 black
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SingleChildScrollView(
                    // display the controller.feedData
                    child: Column(
                  children: controller.feedData
                      .map((post) => Container(
                            // if post is a post fill backgound with 1E1E1E
                            color: post.type == 'Post'
                                ? const Color(0xFF1E1E1E)
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        post.type,
                                        style: TextStyle(
                                          color: post.type == 'Post'
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${post.views} views',
                                        style: TextStyle(
                                          color: post.type == 'Post'
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    post.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      // if post fill text with white
                                      color: post.type == 'Post'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // location and time if event
                                  if (post.type == 'Event')
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // text small hitn LOCATION
                                        const Text(
                                          'LOCATION',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          post.location,
                                          style: TextStyle(
                                            color: post.type == 'Post'
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'DATE',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          "${post.date.day}/${post.date.month}/${post.date.year}",
                                          style: TextStyle(
                                            color: post.type == 'Post'
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  post.type == 'Post'
                                      ? const SizedBox(
                                          height: 200,
                                        )
                                      : const SizedBox(
                                          height: 120,
                                        ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "By ${post.author}",
                                            style: TextStyle(
                                              color: post.type == "Post"
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${post.timePosted.day}/${post.timePosted.month}/${post.timePosted.year}",
                                            style: TextStyle(
                                              color: post.type == "Post"
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // circle button with arrow
                                      GestureDetector(
                                        onTap: () {
                                          Get.snackbar("Event Registration",
                                              "Great News! You have successfully registered for this event.");
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.2),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
