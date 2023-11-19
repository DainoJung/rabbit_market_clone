import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/screen/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/post_detail/w_post_content.dart';
import 'package:fast_app_base/screen/post_detail/w_user_prodile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostDetailScreen extends ConsumerWidget {
  final SimpleProductPost? simpleProductPost;
  final int id;

  const PostDetailScreen(
    this.id, {
    super.key,
    this.simpleProductPost,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));
    return productPost.when(
        data: (data) => _PostDetail(
              simpleProductPost ?? data.simpleProductPost,
              productPost: data,
            ),
        error: (error, trace) => "에러가 발생했습니다.".text.make(),
        loading: () => simpleProductPost != null
            ? _PostDetail(simpleProductPost!)
            : const Center(child: CircularProgressIndicator()));
  }
}

class _PostDetail extends HookWidget {
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  static const bottomMenuHeight = 100.0;

  const _PostDetail(
    this.simpleProductPost, {
    this.productPost,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImagePager(
                  pageController: pageController,
                  simpleProductPost: simpleProductPost,
                ),
                UserProfileWidget(
                  simpleProductPost.product.user,
                  address: simpleProductPost.address,
                ),
                PostContent(
                  simpleProductPost: simpleProductPost,
                  productPost: productPost,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60 + context.statusBarHeight,
            child: const _AppBar(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PostDetailBottomMenu(simpleProductPost.product),
          )
        ],
      ),
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  final Product product;
  const PostDetailBottomMenu(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _PostDetail.bottomMenuHeight,
      child: Column(
        children: [
          const Line(),
          Expanded(
            child: Row(
              children: [
                width20,
                Image.asset('$basePath/detail/heart_on.png', height: 25),
                width20,
                const VerticalDivider().pSymmetric(v: 15),
                width20,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          product.price.toWon().text.bold.make(),
                        ],
                      ),
                      '가격 제안하기'.text.orange400.underline.make(),
                    ],
                  ),
                ),
                RoundButton(
                  text: '채팅하기',
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                ),
                width10,
              ],
            ).pOnly(bottom: 5, right: 15, left: 15),
          )
        ],
      ),
    );
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      width: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: simpleProductPost.product.images
                .map((url) => CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.fill,
                    ))
                .toList(),
          ),
          if (simpleProductPost.product.images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: simpleProductPost.product.images.length,
                effect: const JumpingDotEffect(
                  dotColor: Colors.white54,
                  activeDotColor: Colors.black45,
                  dotHeight: 12,
                  dotWidth: 12,
                  verticalOffset: 10,
                ),
                onDotClicked: (index) {},
              ),
            )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Nav.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
    );
  }
}
