import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/views/home_page/components/header_section.dart';
import 'package:instagram_clone/views/home_page/components/post_section.dart';
import 'package:instagram_clone/views/home_page/components/story_listview.dart';

import '../../constants/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> posts;

  @override
  void initState() {
    posts = List.generate(
        3,
        (index) => PostSection(
            post: Post(
                profilePicture: MyAssets.postPersons[0],
                username: "travel_desh",
                posts: List.generate(6, (index) => MyAssets.posts[0]),
                likes: 23046,
                caption:
                    "I have filmed a small vlog of north Dhaka, and I’m very excited to post on YouTube, will post on YouTube as I’m very excited to post on YouTube, will post on YouTube I’m very excited to post on YouTube, will post on YouTube",
                comments: 1012,
                dateTime: DateTime(2022, 7, 15))));
    posts.insert(0, header());
    super.initState();
  }

  Widget header() {
    return Column(
      children: const [
        StoryListView(),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const HeaderSection(),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return posts[index];
                  },
                ),
              )
            ],
          ),
        ));
  }
}
