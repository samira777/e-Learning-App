// To parse this JSON data, do
//
//     final postsOfCategories = postsOfCategoriesFromJson(jsonString);

import 'dart:convert';

List<PostsOfCategories> postsOfCategoriesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<PostsOfCategories>.from(jsonData.map((x) => PostsOfCategories.fromJson(x)));
}

String postsOfCategoriesToJson(List<PostsOfCategories> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PostsOfCategories {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
  String slug;
  StatusEnum status;
  Type type;
  String link;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  Status commentStatus;
  Status pingStatus;
  bool sticky;
  String template;
  Format format;
  List<dynamic> meta;
  List<int> categories;
  List<int> tags;
  Map<String, List<String>> metadata;
  List<dynamic> acf;
  Links links;

  PostsOfCategories({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.metadata,
    this.acf,
    this.links,
  });

  factory PostsOfCategories.fromJson(Map<String, dynamic> json) => new PostsOfCategories(
    id: json["id"],
    date: json["date"],
    dateGmt: json["date_gmt"],
    guid: Guid.fromJson(json["guid"]),
    modified: json["modified"],
    modifiedGmt: json["modified_gmt"],
    slug: json["slug"],
    status: statusEnumValues.map[json["status"]],
    type: typeValues.map[json["type"]],
    link: json["link"],
    title: Guid.fromJson(json["title"]),
    content: Content.fromJson(json["content"]),
    excerpt: Content.fromJson(json["excerpt"]),
    author: json["author"],
    featuredMedia: json["featured_media"],
    commentStatus: statusValues.map[json["comment_status"]],
    pingStatus: statusValues.map[json["ping_status"]],
    sticky: json["sticky"],
    template: json["template"],
    format: formatValues.map[json["format"]],
    meta: new List<dynamic>.from(json["meta"].map((x) => x)),
    categories: new List<int>.from(json["categories"].map((x) => x)),
    tags: new List<int>.from(json["tags"].map((x) => x)),
    metadata: new Map.from(json["metadata"]).map((k, v) => new MapEntry<String, List<String>>(k, new List<String>.from(v.map((x) => x)))),
    acf: new List<dynamic>.from(json["acf"].map((x) => x)),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "date_gmt": dateGmt,
    "guid": guid.toJson(),
    "modified": modified,
    "modified_gmt": modifiedGmt,
    "slug": slug,
    "status": statusEnumValues.reverse[status],
    "type": typeValues.reverse[type],
    "link": link,
    "title": title.toJson(),
    "content": content.toJson(),
    "excerpt": excerpt.toJson(),
    "author": author,
    "featured_media": featuredMedia,
    "comment_status": statusValues.reverse[commentStatus],
    "ping_status": statusValues.reverse[pingStatus],
    "sticky": sticky,
    "template": template,
    "format": formatValues.reverse[format],
    "meta": new List<dynamic>.from(meta.map((x) => x)),
    "categories": new List<dynamic>.from(categories.map((x) => x)),
    "tags": new List<dynamic>.from(tags.map((x) => x)),
    "metadata": new Map.from(metadata).map((k, v) => new MapEntry<String, dynamic>(k, new List<dynamic>.from(v.map((x) => x)))),
    "acf": new List<dynamic>.from(acf.map((x) => x)),
    "_links": links.toJson(),
  };
}

enum Status { OPEN }

final statusValues = new EnumValues({
  "open": Status.OPEN
});

class Content {
  String rendered;
  bool protected;

  Content({
    this.rendered,
    this.protected,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

enum Format { VIDEO }

final formatValues = new EnumValues({
  "video": Format.VIDEO
});

class Guid {
  String rendered;

  Guid({
    this.rendered,
  });

  factory Guid.fromJson(Map<String, dynamic> json) => new Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class Links {
  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> author;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<PredecessorVersion> predecessorVersion;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => new Links(
    self: new List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: new List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: new List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: new List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
    replies: new List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
    versionHistory: new List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
    predecessorVersion: new List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
    wpAttachment: new List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: new List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
    curies: new List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": new List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": new List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": new List<dynamic>.from(about.map((x) => x.toJson())),
    "author": new List<dynamic>.from(author.map((x) => x.toJson())),
    "replies": new List<dynamic>.from(replies.map((x) => x.toJson())),
    "version-history": new List<dynamic>.from(versionHistory.map((x) => x.toJson())),
    "predecessor-version": new List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
    "wp:attachment": new List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
    "wp:term": new List<dynamic>.from(wpTerm.map((x) => x.toJson())),
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

class Author {
  bool embeddable;
  String href;

  Author({
    this.embeddable,
    this.href,
  });

  factory Author.fromJson(Map<String, dynamic> json) => new Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class Cury {
  Name name;
  Href href;
  bool templated;

  Cury({
    this.name,
    this.href,
    this.templated,
  });

  factory Cury.fromJson(Map<String, dynamic> json) => new Cury(
    name: nameValues.map[json["name"]],
    href: hrefValues.map[json["href"]],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = new EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = new EnumValues({
  "wp": Name.WP
});

class PredecessorVersion {
  int id;
  String href;

  PredecessorVersion({
    this.id,
    this.href,
  });

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => new PredecessorVersion(
    id: json["id"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "href": href,
  };
}

class VersionHistory {
  int count;
  String href;

  VersionHistory({
    this.count,
    this.href,
  });

  factory VersionHistory.fromJson(Map<String, dynamic> json) => new VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "href": href,
  };
}

class WpTerm {
  Taxonomy taxonomy;
  bool embeddable;
  String href;

  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  factory WpTerm.fromJson(Map<String, dynamic> json) => new WpTerm(
    taxonomy: taxonomyValues.map[json["taxonomy"]],
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable,
    "href": href,
  };
}

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues = new EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG
});

enum StatusEnum { PUBLISH }

final statusEnumValues = new EnumValues({
  "publish": StatusEnum.PUBLISH
});

enum Type { POST }

final typeValues = new EnumValues({
  "post": Type.POST
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
