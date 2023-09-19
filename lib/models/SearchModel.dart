class SearchModel {
  String id;
  String symbol;
  String name;
  String image;
  int market_cap_rank;
  List coins ;

  SearchModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.market_cap_rank,
  required this.coins,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["large"],
        market_cap_rank: json["market_cap_rank"],
        coins: json["coins"]
    );
  }
}
