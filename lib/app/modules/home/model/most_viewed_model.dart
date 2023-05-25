import 'dart:convert';

List<MostViewedModel> mostViewedModelFromMap(String str) =>
    List<MostViewedModel>.from(
        json.decode(str).map((x) => MostViewedModel.fromMap(x)));

class MostViewedModel {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  DateTime? publishedDate;
  DateTime? updated;
  String? section;
  Subsection? subsection;
  String? nytdsection;
  String? adxKeywords;
  dynamic column;
  String? byline;
  String? type;
  String? title;
  String? mostViewedModelAbstract;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  MostViewedModel({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.mostViewedModelAbstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory MostViewedModel.fromMap(Map<String, dynamic> json) => MostViewedModel(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        source: json["source"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        section: json["section"],
        subsection: subsectionValues.map[json["subsection"]]!,
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        type: json["type"],
        title: json["title"],
        mostViewedModelAbstract: json["abstract"],
        desFacet: json["des_facet"] == null
            ? []
            : List<String>.from(json["des_facet"]!.map((x) => x)),
        orgFacet: json["org_facet"] == null
            ? []
            : List<String>.from(json["org_facet"]!.map((x) => x)),
        perFacet: json["per_facet"] == null
            ? []
            : List<String>.from(json["per_facet"]!.map((x) => x)),
        geoFacet: json["geo_facet"] == null
            ? []
            : List<String>.from(json["geo_facet"]!.map((x) => x)),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromMap(x))),
        etaId: json["eta_id"],
      );
}

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadatum>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: json["media-metadata"] == null
            ? []
            : List<MediaMetadatum>.from(
                json["media-metadata"]!.map((x) => MediaMetadatum.fromMap(x))),
      );
}

class MediaMetadatum {
  String? url;
  Format? format;
  int? height;
  int? width;

  MediaMetadatum({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetadatum.fromMap(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: formatValues.map[json["format"]]!,
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "format": formatValues.reverse[format],
        "height": height,
        "width": width,
      };
}

enum Format {
  STANDARD_THUMBNAIL,
  MEDIUM_THREE_BY_TWO210,
  MEDIUM_THREE_BY_TWO440
}

final formatValues = EnumValues({
  "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
  "mediumThreeByTwo440": Format.MEDIUM_THREE_BY_TWO440,
  "Standard Thumbnail": Format.STANDARD_THUMBNAIL
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({"photo": Subtype.PHOTO});

enum MediaType { IMAGE }

enum Source { NEW_YORK_TIMES }

enum Subsection { EMPTY, EUROPE, POLITICS, MUSIC }

final subsectionValues = EnumValues({
  "": Subsection.EMPTY,
  "Europe": Subsection.EUROPE,
  "Music": Subsection.MUSIC,
  "Politics": Subsection.POLITICS
});

enum MostViewedModelType { ARTICLE }

final mostViewedModelTypeValues =
    EnumValues({"Article": MostViewedModelType.ARTICLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
