// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Categories>.from(jsonData.map((x) => Categories.fromJson(x)));
}

String categoriesToJson(List<Categories> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Categories {
  int id;
  int count;
  String description;
  String link;
  String name;
  String slug;
  String taxonomy;
  int parent;
  List<dynamic> meta;
  List<dynamic> acf;
  Links links;

  Categories({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.acf,
    this.links,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => new Categories(
    id: json["id"],
    count: json["count"],
    description: json["description"],
    link: json["link"],
    name: json["name"],
    slug: json["slug"],
    taxonomy: json["taxonomy"],
    parent: json["parent"],
    meta: new List<dynamic>.from(json["meta"].map((x) => x)),
    acf: new List<dynamic>.from(json["acf"].map((x) => x)),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "description": description,
    "link": link,
    "name": name,
    "slug": slug,
    "taxonomy": taxonomy,
    "parent": parent,
    "meta": new List<dynamic>.from(meta.map((x) => x)),
    "acf": new List<dynamic>.from(acf.map((x) => x)),
    "_links": links.toJson(),
  };
}

class Links {
  List<About> self;
  List<About> collection;
  List<About> about;
  List<About> wpPostType;
  List<Cury> curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => new Links(
    self: new List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: new List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: new List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpPostType: new List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
    curies: new List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": new List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": new List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": new List<dynamic>.from(about.map((x) => x.toJson())),
    "wp:post_type": new List<dynamic>.from(wpPostType.map((x) => x.toJson())),
    "curies": new List<dynamic>.from(curies.map((x) => x.toJson())),
  };
}

class About {
  String href;

  About({
    this.href,
  });

  factory About.fromJson(Map<String, dynamic> json) => new About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Cury {
  String name;
  String href;
  bool templated;

  Cury({
    this.name,
    this.href,
    this.templated,
  });

  factory Cury.fromJson(Map<String, dynamic> json) => new Cury(
    name: json["name"],
    href: json["href"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "href": href,
    "templated": templated,
  };
}
