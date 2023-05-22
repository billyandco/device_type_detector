import 'package:device_type_detector/widget/focusable_container.dart';
import 'package:flutter/material.dart';

class HomePageTv extends StatelessWidget {
  const HomePageTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 18,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text('Television'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: Center(
                      child: Text('Search something'),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: Center(
                      child: Text('Profile information'),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.person),
          ),
          const SizedBox(width: 32),
        ],
      ),
      body: GridView.custom(
        padding: const EdgeInsets.all(32),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 4 / 3,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 24,
          (context, index) {
            return FocusableBuilder(
              onSelect: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Center(
                        child: Text('Content $index'),
                      ),
                    );
                  },
                );
              },
              builder: (context, focused) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: focused
                        ? Border.all(
                            color: Colors.white,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      'Content $index',
                      style: TextStyle(
                        color: focused ? Colors.white : Colors.blueGrey,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
