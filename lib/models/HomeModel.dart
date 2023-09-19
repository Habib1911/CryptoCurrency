class HomeModel {
  String id;
  String symbol;
  String name;
  String image;

  dynamic current_price;
  int market_cap_rank;
  double price_change_24h;
  double price_change_percentage_24h;

  HomeModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap_rank,
    required this.price_change_24h,
    required this.price_change_percentage_24h
  });

  factory HomeModel.fromJson(Map<String, dynamic>Json){
    return HomeModel(id: Json["id"],
        symbol: Json["symbol"],
        name: Json["name"],
        image: Json["image"],
        current_price: Json["current_price"],
        market_cap_rank: Json["market_cap_rank"],
        price_change_24h: Json["price_change_24h"],
        price_change_percentage_24h: Json["price_change_percentage_24h"]);
  }
}