const String productsTable = "cached_products";

class SqlProdfield {
  static final List<String> values = [
    id, productId, count, name, price, imageUrl,
  ];
  static const String id = "_id";
  static const String productId = "product_id";
  static const String count = "count";
  static const String name = "name";
  static const String price = "price";
  static const String imageUrl = "image_url";
}

class SqlSelectedProduct {
  final int? id;
  final int productId;
  final int count;
  final String name;
  final int price;
  final String imageUrl;

  SqlSelectedProduct({
    this.id,
    required this.imageUrl,
    required this.price,
    required this.count,
    required this.name,
    required this.productId,
  });

  SqlSelectedProduct copyWith({
    int? id,
    int? productId,
    int? count,
    int? price,
    String? name,
    String? imageUrl,
  }) =>
      SqlSelectedProduct(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        count: count ?? this.count,
        price: price ?? this.price,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  static SqlSelectedProduct fromJson(Map<String, Object?> json) => SqlSelectedProduct(
    id: json[SqlProdfield.id] as int?,
    productId: json[SqlProdfield.productId] as int,
    count: json[SqlProdfield.count] as int,
    price: json[SqlProdfield.price] as int,
    name: json[SqlProdfield.name] as String,
    imageUrl: json[SqlProdfield.imageUrl] as String,
  );

  Map<String, Object?> toJson() => {
    SqlProdfield.id: id,
    SqlProdfield.productId: productId,
    SqlProdfield.count: count,
    SqlProdfield.price: price,
    SqlProdfield.name: name,
    SqlProdfield.imageUrl: imageUrl,
  };

  @override
  String toString() => '''
        ID: $id 
        COUNT $count
        PRODUCT ID $productId
        PRICE $price
        NAME $name
        IMAGE URL $imageUrl
      ''';
}