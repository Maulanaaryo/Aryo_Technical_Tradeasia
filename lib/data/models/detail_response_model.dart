import 'dart:convert';

class DetailResponseModel {
  final DetailProduct detailProduct;
  final List<ListIndustry> listIndustry;
  final List<ListCategory> listCategory;
  final List<RelatedProduct> relatedProducts;

  DetailResponseModel({
    required this.detailProduct,
    required this.listIndustry,
    required this.listCategory,
    required this.relatedProducts,
  });

  factory DetailResponseModel.fromJson(String str) =>
      DetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailResponseModel.fromMap(Map<String, dynamic> json) =>
      DetailResponseModel(
        detailProduct: DetailProduct.fromMap(json["detail_product"]),
        listIndustry: List<ListIndustry>.from(
            json["list-industry"].map((x) => ListIndustry.fromMap(x))),
        listCategory: List<ListCategory>.from(
            json["list-category"].map((x) => ListCategory.fromMap(x))),
        relatedProducts: List<RelatedProduct>.from(
            json["related-products"].map((x) => RelatedProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "detail_product": detailProduct.toMap(),
        "list-industry": List<dynamic>.from(listIndustry.map((x) => x.toMap())),
        "list-category": List<dynamic>.from(listCategory.map((x) => x.toMap())),
        "related-products":
            List<dynamic>.from(relatedProducts.map((x) => x.toMap())),
      };
}

class DetailProduct {
  final String productname;
  final String productimage;
  final String iupacName;
  final String casNumber;
  final String hsCode;
  final String formula;
  final String description;
  final String application;
  final String packagingName;

  DetailProduct({
    required this.productname,
    required this.productimage,
    required this.iupacName,
    required this.casNumber,
    required this.hsCode,
    required this.formula,
    required this.description,
    required this.application,
    required this.packagingName,
  });

  factory DetailProduct.fromJson(String str) =>
      DetailProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailProduct.fromMap(Map<String, dynamic> json) => DetailProduct(
        productname: json["productname"],
        productimage: json["productimage"],
        iupacName: json["iupac_name"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        formula: json["formula"],
        description: json["description"],
        application: json["application"],
        packagingName: json["packaging_name"],
      );

  Map<String, dynamic> toMap() => {
        "productname": productname,
        "productimage": productimage,
        "iupac_name": iupacName,
        "cas_number": casNumber,
        "hs_code": hsCode,
        "formula": formula,
        "description": description,
        "application": application,
        "packaging_name": packagingName,
      };
}

class ListCategory {
  final String categoryUrl;
  final String categoryName;

  ListCategory({
    required this.categoryUrl,
    required this.categoryName,
  });

  factory ListCategory.fromJson(String str) =>
      ListCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListCategory.fromMap(Map<String, dynamic> json) => ListCategory(
        categoryUrl: json["category_url"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toMap() => {
        "category_url": categoryUrl,
        "category_name": categoryName,
      };
}

class ListIndustry {
  final String industryUrl;
  final String industryName;

  ListIndustry({
    required this.industryUrl,
    required this.industryName,
  });

  factory ListIndustry.fromJson(String str) =>
      ListIndustry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListIndustry.fromMap(Map<String, dynamic> json) => ListIndustry(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
      );

  Map<String, dynamic> toMap() => {
        "industry_url": industryUrl,
        "industry_name": industryName,
      };
}

class RelatedProduct {
  final String productname;
  final String productimage;
  final String casNumber;
  final String hsCode;
  final String seoUrl;

  RelatedProduct({
    required this.productname,
    required this.productimage,
    required this.casNumber,
    required this.hsCode,
    required this.seoUrl,
  });

  factory RelatedProduct.fromJson(String str) =>
      RelatedProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RelatedProduct.fromMap(Map<String, dynamic> json) => RelatedProduct(
        productname: json["productname"],
        productimage: json["productimage"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
      );

  Map<String, dynamic> toMap() => {
        "productname": productname,
        "productimage": productimage,
        "cas_number": casNumber,
        "hs_code": hsCode,
        "seo_url": seoUrl,
      };
}
