import 'package:flutter/material.dart';
import 'package:foodly/components/restaurant_item.dart';

import '../models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: Add Desktop Threshold
  static const desktopThreshold = 700;
  // TODO: Add Constraint Properties
  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;
  // TODO: Calculate Constrained Width
  double _calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
        ? screenWidth * largeScreenPercentage //
        : screenWidth)
        .clamp(0.0, maxWidth);
  }
  // TODO: Add Calculate Column Count
  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold ? 2 : 1;
  }

  // TODO: Build Custom Scroll View
  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        // TODO: Add Sliver App Bar
        _buildSliverAppBar(),
        // TODO: Add Restaurant Info Section
        _buildInfoSection(),
        // TODO: Add Menu Item Grid View Section
        _buildGridViewSection('Menu'),
      ],
    );
  }
  // TODO: Build Sliver App Bar
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0,),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.store, color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // TODO: Build Info Section
  SliverToBoxAdapter _buildInfoSection() {
    final textTheme = Theme.of(context).textTheme;

    final restaurant = widget.restaurant;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.name, style: textTheme.headlineLarge,),
            Text(restaurant.address, style: textTheme.bodySmall,),
            Text(restaurant.getRatingAndDistance(), style: textTheme.bodySmall,),
            Text(restaurant.attributes, style: textTheme.labelSmall,),
          ],
        ),
      ),
    );
  }
  // TODO: Build Grid Item
  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () {
        // Present Bottom Sheet in the future.
      },
      child: RestaurantItem(item: item),
    );
  }
  // TODO: Build Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
  // TODO: Build Grid View
  GridView _buildGridView(int columns) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.5,
        crossAxisCount: columns,
      ),
      itemBuilder: (context, index) => _buildGridItem(index),
      itemCount: widget.restaurant.items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
  // TODO: Build Grid View Section
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(title),
            _buildGridView(columns),
          ],
        ),
      ),
    );
  }

  // TODO: Replace build method 
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = _calculateConstrainedWidth(screenWidth);
    return Scaffold(
      body: Center(
        // TODO: Replace with Custom Scroll View
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(),
        ),
      ),
    );
  }
}
