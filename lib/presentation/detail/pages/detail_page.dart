import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/detail/detail_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void initState() {
    context.read<DetailBloc>().add(GetDetailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoaded) {
                return Container(
                  child: Text(state.model.detailProduct.description),
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
