import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:flutter/material.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final List<String> imageList = [];

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '내 물건 팔기'.text.bold.make(),
        actions: [
          Tap(
            onTap: () {},
            child: '임시저장'.text.make().p(15),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageSelectWidget(
              imageList,
              onTap: () {},
            ),
            _TitleEditor(titleController),
            _PriceEditor(priceController),
            _DescEditor(descriptionController),
          ],
        ),
      ),
      bottomSheet: RoundButton(
        text: '작성완료',
        isFullWidth: true,
        borderRadius: 6,
        onTap: () {},
      ),
    );
  }
}

class _ImageSelectWidget extends StatelessWidget {
  final List<String> imageList;
  final VoidCallback onTap;

  const _ImageSelectWidget(this.imageList, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: imageList.length.toString(),
                      style: const TextStyle(color: Colors.orange),
                    ),
                    const TextSpan(text: '/10'),
                  ])),
                ],
              ).box.rounded.border(color: Colors.grey).make(),
            )
          ],
        ),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  final TextEditingController controller;

  const _TitleEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _PriceEditor extends StatelessWidget {
  final TextEditingController controller;

  const _PriceEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DescEditor extends StatelessWidget {
  final TextEditingController controller;

  const _DescEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
