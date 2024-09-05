import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/List_provider.dart';
import 'package:myapp/providers/User_provider.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(listProvider);
    String usuario = ref.watch(loggedProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hola $usuario",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text("Logout"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: posts.length * 100,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      onTap: () {
                        ref.read(pressedProvider.notifier).state = index;
                        context.push('/card');
                      },
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  ref.read(pressedProvider.notifier).state = -1;
                  context.push('/edit');
                },
                child: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
