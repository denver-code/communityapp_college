import 'package:community_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'PROFILE',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Ihor Savenko',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      '@denver-code',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Some Cool description of the super puper profile on this awesome platform
            const Text(
              'Some Cool description of the super puper profile on this awesome platform',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            // Location: Kyiv, Ukraine
            const SizedBox(
              height: 5,
            ),
            const Text(
              '📍Worthing, England',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
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
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.2),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
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
      ),
    );
  }
}
