import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/List_provider.dart';
import 'package:myapp/entities/Post.dart';

class EditScreen extends ConsumerWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider);
    final pressed = ref.watch(pressedProvider);
    String title;
    String imagesrc;
    final TextEditingController title_controller;
    final TextEditingController description_controller;
    final TextEditingController text_controller;
    final TextEditingController imgsrc_controller;

    if (pressed == -1) {
      title = 'Nuevo Post';
      title_controller = TextEditingController();
      description_controller = TextEditingController();
      text_controller = TextEditingController();
      imgsrc_controller = TextEditingController();
      imagesrc = 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo_lpf_afa.png';
    } else {
      title = list[pressed].title;
      title_controller = TextEditingController(text: list[pressed].title);
      description_controller = TextEditingController(text: list[pressed].description);
      text_controller = TextEditingController(text: list[pressed].text);
      imgsrc_controller = TextEditingController(text: list[pressed].imagesrc);
      imagesrc = list[pressed].imagesrc;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
              imagesrc,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: title_controller,
              decoration: const InputDecoration(
                labelText: "Titulo",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: description_controller,
              decoration: const InputDecoration(
                labelText: "Descripcion",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: text_controller,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Texto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imgsrc_controller,
              decoration: const InputDecoration(
                labelText: "Direccion de la Imagen",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (pressed != -1) {
                    list[pressed].title = title_controller.text;
                    ref.read(listProvider.notifier).state = list;
                  } else {
                    list.add(Post(title: title_controller.text, description: description_controller.text, text: text_controller.text, imagesrc: imgsrc_controller.text));
                    ref.read(listProvider.notifier).state = list;
                  }
                  context.push('/home');
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
