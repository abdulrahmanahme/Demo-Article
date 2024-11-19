import 'package:artical_tast/core/extantion.dart';
import 'package:artical_tast/cubit/product_cubit.dart';
import 'package:artical_tast/cubit/product_state.dart';
import 'package:artical_tast/service_locator%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // late ProductRepo productRepo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductCubit>()..fetchProduct(),
      child: Scaffold(
        body: BlocConsumer<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: state.productModel.length,
                itemBuilder: (context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardImage(
                    image: state.productModel[index].image,
                    title: state.productModel[index].title,
                    des: state.productModel[index].description,
                  ),
                ),
              );
            }
          },
          listener: (BuildContext context, ProductState state) {
            // if(state.productEnum.name is ProductEnum)
          },
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.title,
    required this.image,
    required this.des,
  });

  final String image;
  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .64,
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .64,
                child: Text(
                  des,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
