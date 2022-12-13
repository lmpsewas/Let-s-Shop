class AutoGenerate {
  AutoGenerate({
    required this.fproducts,
    required this.installModule,
  });
  late final Fproducts fproducts;
  late final String installModule;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    fproducts = Fproducts.fromJson(json['fproducts']);
    installModule = json['install_module'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fproducts'] = fproducts.toJson();
    _data['install_module'] = installModule;
    return _data;
  }
}

class Fproducts {
  Fproducts({
    required this.title,
    required this.products,
  });
  late final String title;
  late final List<Products> products;

  Fproducts.fromJson(Map<String, dynamic> json){
    title = json['title'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.isInWishlist,
    required this.name,
    required this.availableForOrder,
    required this.showPrice,
    required this.newProducts,
    required this.onSaleProducts,
    required this.categoryName,
    required this.cartQuantity,
    required this.ClickActivityName,
    required this.categoryId,
    required this.hasAttributes,
    required this.price,
    required this.minimum,
    required this.numberOfReviews,
    required this.averagecomments,
    required this.src,
    required this.discountPrice,
    required this.discountPercentage,
    this.buttonToggle = true,
  });
  late final String id;
  late final bool isInWishlist;
  late final String name;
  late final String availableForOrder;
  late final String showPrice;
  late final int newProducts;
  late final int onSaleProducts;
  late final String categoryName;
  late final int cartQuantity;
  late final String ClickActivityName;
  late final String categoryId;
  late final String hasAttributes;
  late final String price;
  late final String minimum;
  late final String numberOfReviews;
  late final String averagecomments;
  late final String src;
  late final String discountPrice;
  late final String discountPercentage;
  late bool buttonToggle;



  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    isInWishlist = json['is_in_wishlist'];
    name = json['name'];
    availableForOrder = json['available_for_order'];
    showPrice = json['show_price'];
    newProducts = json['new_products'];
    onSaleProducts = json['on_sale_products'];
    categoryName = json['category_name'];
    cartQuantity = json['cart_quantity'];
    ClickActivityName = json['ClickActivityName'];
    categoryId = json['category_id'];
    hasAttributes = json['has_attributes'];
    price = json['price'];
    minimum = json['minimum'];
    numberOfReviews = json['number_of_reviews'];
    averagecomments = json['averagecomments'];
    src = json['src'];
    discountPrice = json['discount_price'];
    discountPercentage = json['discount_percentage'];
    buttonToggle = true;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['is_in_wishlist'] = isInWishlist;
    _data['name'] = name;
    _data['available_for_order'] = availableForOrder;
    _data['show_price'] = showPrice;
    _data['new_products'] = newProducts;
    _data['on_sale_products'] = onSaleProducts;
    _data['category_name'] = categoryName;
    _data['cart_quantity'] = cartQuantity;
    _data['ClickActivityName'] = ClickActivityName;
    _data['category_id'] = categoryId;
    _data['has_attributes'] = hasAttributes;
    _data['price'] = price;
    _data['minimum'] = minimum;
    _data['number_of_reviews'] = numberOfReviews;
    _data['averagecomments'] = averagecomments;
    _data['src'] = src;
    _data['discount_price'] = discountPrice;
    _data['discount_percentage'] = discountPercentage;
    return _data;
  }
}