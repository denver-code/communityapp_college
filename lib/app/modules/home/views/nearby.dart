import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class NearbyView extends GetView<HomeController> {
  const NearbyView({Key? key}) : super(key: key);
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
              onTap: () {},
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
          'NEARBY',
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
              'NEARBY\nEVENTS',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: controller.feedData
                  .map(
                    (post) => post.type == "Event"
                        ? SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  )
                  .toList(),
            )),
          ),
        ],
      ),
    );
  }
}
