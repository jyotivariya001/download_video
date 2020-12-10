class VideoStatusModel{
  List<Record> record;

  VideoStatusModel({this.record});

  factory VideoStatusModel.fromJson(Map<String, dynamic> json) => VideoStatusModel(
    record: List<Record>.from(json["Record"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Record": List<dynamic>.from(record.map((x) => x.toJson())),
  };
}

/*class Video{
  List<Record> record;
  Video({this.record});

  factory Video.fromjson(Map<String, dynamic> json) => Video(
    record: List<Record>.from(json["Record"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> tojson() => {
    "Record": List<dynamic>.from(record.map((x) => x.toJson()))
  };
}*/

class Record {
  String videourl;
  String imageurl;

  Record({this.videourl, this.imageurl});

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    videourl: json["videourl"],
    imageurl: json["imageurl"],
  );

  Map<String, dynamic> toJson() => {
    "videourl": videourl,
    "imageurl": imageurl,
  };
}
