class Product{
  final String id;
  final String title;
  final String description; 
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
     required this.id,
     required this.description,
     required this.imageUrl,
     required this.price,
     required this.title,
     this.isFavorite = false,
  });


  void toggleFavorite(){
    //alternar valor do favorito
    isFavorite = !isFavorite;
  }
}