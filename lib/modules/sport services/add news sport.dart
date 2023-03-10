// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/providers/sport%20services%20provider.dart';
import 'package:provider/provider.dart';

import '../../shared/Components.dart';
import '../../shared/Style.dart';
import '../../shared/const.dart';

class AddNewsSport extends StatefulWidget {
  String id;

  AddNewsSport(this.id, {Key? key}) : super(key: key);

  @override
  State<AddNewsSport> createState() => _AddNewsSportState();
}

class _AddNewsSportState extends State<AddNewsSport> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController link = TextEditingController();
  final TextEditingController tellAboutYourSelf = TextEditingController();
  final TextEditingController publisherName = TextEditingController();
  final TextEditingController publisherCountry = TextEditingController();
  late SportServicesProvider sportServicesProvider;

  @override
  Widget build(BuildContext context) {
    sportServicesProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        backgroundColor: primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'IFMIS',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: sizeFromWidth(context, 23),
                color: white,
              ),
            ),
            Container(
              height: sizeFromHeight(context, 15, hasAppBar: true),
              width: sizeFromWidth(context, 5),
              decoration: const BoxDecoration(
                color: Color(0xFFbdbdbd),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo 2.jpeg'),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: sizeFromWidth(context, 1),
        height: sizeFromHeight(context, 1, hasAppBar: true),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    textFormField(
                      controller: name,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '?????? ?????????? ??????????????';
                        }
                        return null;
                      },
                      hint: '???????? ??????????????',
                    ),
                    textFormField(
                      controller: description,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '?????? ?????????? ?????????? ???? ?????????? ???? ??????????';
                        }
                        return null;
                      },
                      hint: '???????? ?????????? ???? ?????????? ???? ??????????',
                      maxLines: 4,
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                    textFormField(
                      controller: link,
                      type: TextInputType.text,
                      validate: (value) {
                        return null;
                      },
                      hint: '???????? ???????? ?????????? ????????????',
                    ),
                    textFormField(
                      controller: tellAboutYourSelf,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '?????? ???? ???????? ???????? ??????????';
                        }
                        return null;
                      },
                      hint: '???????? ???????? ??????????',
                    ),
                    textFormField(
                      controller: publisherName,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '?????? ?????????? ?????? ??????????';
                        }
                        return null;
                      },
                      hint: '???????? ?????? ??????????',
                    ),
                    textFormField(
                      controller: publisherCountry,
                      type: TextInputType.text,
                      validate: (value) {
                        return null;
                      },
                      hint: '???????? ???????? ????????????',
                    ),
                    if (!sportServicesProvider.isLoading)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Expanded(
                            child: textButton(
                              context,
                              '???????? ???????? ???????? ????????????',
                              primaryColor,
                              white,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                              () {
                                sportServicesProvider.pickImagePublisher();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!sportServicesProvider.isLoading)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Expanded(
                            child: textButton(
                              context,
                              '???????? ?????? ??????????',
                              primaryColor,
                              white,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                              () {
                                sportServicesProvider.pickImagesNews();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!sportServicesProvider.isLoading)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: textButton(
                                context,
                                '???? ???????????? ??????????',
                                primaryColor,
                                white,
                                sizeFromWidth(context, 20),
                                FontWeight.bold,
                                () async {
                                  if (formKey.currentState!.validate()) {
                                    sportServicesProvider.addNews(
                                      name.text.trim(),
                                      description.text.trim(),
                                      link.text.trim(),
                                      widget.id,
                                      tellAboutYourSelf.text.trim(),
                                      publisherName.text.trim(),
                                      publisherCountry.text.trim(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (sportServicesProvider.isLoading)
                      Center(
                        child: circularProgressIndicator(
                            lightGrey, primaryColor, context),
                      ),
                    SizedBox(height: sizeFromHeight(context, 90)),
                  ],
                ),
              ),
              Container(
                color: primaryColor,
                height: sizeFromHeight(context, 10),
                width: sizeFromWidth(context, 1),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CarouselSlider(
                    items: downBanners.map((e) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(e.image),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 250,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
