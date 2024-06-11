import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/detail/detail_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<DetailBloc>().add(GetDetailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    const urlImage =
        'https://chemtradea.chemtradeasia.com/images/product/dipentene.webp';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoaded) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 53, left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Container(
                                height: 50,
                                width: 240,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const ListTile(
                                  leading: Icon(Icons.search),
                                  title: Text(
                                    'Dipentene',
                                    style: TextStyle(
                                      color: Color(0XFF17234D),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1BA2CA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage('assets/shop.png'),
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 130),
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.model.detailProduct.productname,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0XFF17234D),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('CAS Number :'),
                                          Text(state
                                              .model.detailProduct.casNumber)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('HS Code :'),
                                          Text(state.model.detailProduct.hsCode)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Formula :'),
                                          Text(state
                                              .model.detailProduct.iupacName)
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff123C69),
                                          fixedSize: const Size(140, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'Download TDS',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(140, 40),
                                          backgroundColor:
                                              const Color(0xff123C69),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'Download MSDS',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Text(
                          'Basic Information',
                        ),
                      ],
                    ))
                  ],
                );
              } else if (state is DetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DetailError) {
                return const Center(child: Text('Error loading details'));
              } else {
                return const Center(child: Text('No details available'));
              }
            },
          ),
        ],
      ),
    );
  }
}
