import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/home.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200.0, // tinggi dari grid
            child: ListView(
              scrollDirection: Axis.horizontal, // mengatur scroll horizontal
              children: ProductsRepository.loadProducts(category)
                  .map((Product product) {
                return Container(
                  width: 160.0, // lebar dari item grid
                  margin: EdgeInsets.symmetric(
                      horizontal: 8.0), // margin antar item
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18 / 11, // Rasio aspek gambar
                          child: Image.asset(
                            product.assetName,
                            package: product.assetPackage,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize:
                                          15.0, // Atur ukuran teks menjadi 20.0
                                    ),
                                maxLines: 1,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\Rp. ${product.price}.000',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize:
                                          14.0, // Atur ukuran teks menjadi 16.0
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
