import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFragment extends ConsumerStatefulWidget {
  const MyFragment({super.key});

  @override
  ConsumerState<MyFragment> createState() => _MyFragmentState();
}

class _MyFragmentState extends ConsumerState<MyFragment> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
