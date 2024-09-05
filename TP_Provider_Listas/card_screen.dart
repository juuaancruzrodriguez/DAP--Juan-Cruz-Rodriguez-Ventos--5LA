import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/List_provider.dart';

class CardScreen extends ConsumerWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider);
    final pressed = ref.watch(pressedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(list[pressed].title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              list[pressed].imagesrc,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              list[pressed].title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  list[pressed].text,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  context.push('/edit');
                },
                child: const Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}

