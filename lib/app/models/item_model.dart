class ItemModel {

  String guid;
  DateTime date;
  String text;

  ItemModel({ required this.guid, required this.date, required this.text, });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    guid: json["guid"],
    date: DateTime.parse(json["date"]),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "guid": guid,
    "date": date.toIso8601String(),
    "text": text,
  };
}
