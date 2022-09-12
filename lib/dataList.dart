import 'package:faker/faker.dart';
import 'Model/Product.dart';

List dataList = List.generate(
    200,
    (index) => Product(
          id: index,
          price: faker.randomGenerator.integer(1000).toDouble(),
          productBrand: faker.lorem.word(),
          productName: faker.lorem.word(),
        ));
