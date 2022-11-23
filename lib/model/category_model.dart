class Cat_model {
  int id;
  String name;
  String imageUrl;
  Cat_model({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory Cat_model.fromJson(Map<String, dynamic> json) {
    return Cat_model(
        id: json['id'] ?? 0,
        imageUrl: json['image_url'] ?? "",
        name: json['name'] ?? ""
    );
  }

  Map toJson() =>{
    "id":id,
    "name":name,
    "imageUrl":imageUrl
  };

}