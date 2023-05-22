import 'package:flutter/material.dart';

class HomePageWear extends StatelessWidget {
  const HomePageWear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Builder(
          builder: (context) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
              children: [
                const Text('Menu', textAlign: TextAlign.center),
                ...List.generate(
                  10,
                  (index) => ElevatedButton(
                    onPressed: Scaffold.of(context).closeDrawer,
                    child: Text('Navigation $index'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.grey.shade900,
              automaticallyImplyLeading: false,
              centerTitle: true,
              toolbarHeight: 48,
              titleTextStyle: const TextStyle(fontSize: 18),
              title: GestureDetector(
                onTap: Scaffold.of(context).openDrawer,
                child: const Text('Wear'),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(bottom: 32),
          children: List.generate(
            10,
            (index) => ListTile(
              title: Text('Tile number $index'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 32),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
