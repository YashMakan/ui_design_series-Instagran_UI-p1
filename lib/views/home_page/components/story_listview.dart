import 'package:flutter/material.dart';
import 'package:instagram_clone/views/home_page/components/circular_profile_widget.dart';

import '../../../constants/assets.dart';

class StoryListView extends StatefulWidget {
  const StoryListView({Key? key}) : super(key: key);

  @override
  State<StoryListView> createState() => _StoryListViewState();
}

class _StoryListViewState extends State<StoryListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Row(
            children: List.generate(
                MyAssets.storyPersons.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularProfileWidget(
                      asset: MyAssets.storyPersons[index],
                      name: "Debra",
                      isMyProfile: index == 0),
                )),
          ),
        ));
  }
}
