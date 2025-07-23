import 'package:flutter/material.dart';
import 'package:foodly/api/mock_foodly_service.dart';

import '../components/category_section.dart';
import '../components/post_section.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockFoodlyService();

  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add Listview Future Builder
    // 1
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          // TODO: Replace this with Restaurant Section
          // TODO: Wrap in a ListView
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RestaurantSection(restaurants: restaurants),
              CategorySection(categories: categories),
              PostSection(posts: posts),
            ],
          );
        }
        else {
          return const Center(
            // child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
