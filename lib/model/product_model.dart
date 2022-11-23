class Prod_model {
  int id;
  int categoryId;
  String name;
  int price;
  String imageUrl;
  Prod_model({
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.categoryId,
  });

  factory Prod_model.fromJson(Map<String, dynamic> json) {
    return Prod_model(
        id: json['id']??0,
        price: json["price"]??0,
        imageUrl: json["image_url"]??"",
        name: json["name"]??"",
        categoryId: json["categoryId"]??0,
    );
  }

  Map toJson()=>{
    "id":id,
    "categoryId":categoryId,
    "name":name,
    "price":price,
    "imageUrl":imageUrl
  };
}