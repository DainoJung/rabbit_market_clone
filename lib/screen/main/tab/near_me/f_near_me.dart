import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NearMeFragment extends ConsumerStatefulWidget {
  const NearMeFragment({super.key});

  @override
  ConsumerState<NearMeFragment> createState() => _NearMeFragmentState();
}

class _NearMeFragmentState extends ConsumerState<NearMeFragment> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
