
class ValyutaModel {
  int id;
  String code;
  String ccy;
  String ccyNmRu;
  String ccyNmUz;
  String ccyNmUzc;
  String ccyNmEn;
  String nominal;
  String rate;
  String diff;
  Date date;

  ValyutaModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.ccyNmEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  factory ValyutaModel.fromJson(Map<String, dynamic> json) => ValyutaModel(
    id: json["id"],
    code: json["Code"],
    ccy: json["Ccy"],
    ccyNmRu: json["CcyNm_RU"],
    ccyNmUz: json["CcyNm_UZ"],
    ccyNmUzc: json["CcyNm_UZC"],
    ccyNmEn: json["CcyNm_EN"],
    nominal: json["Nominal"],
    rate: json["Rate"],
    diff: json["Diff"],
    date: dateValues.map[json["Date"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Code": code,
    "Ccy": ccy,
    "CcyNm_RU": ccyNmRu,
    "CcyNm_UZ": ccyNmUz,
    "CcyNm_UZC": ccyNmUzc,
    "CcyNm_EN": ccyNmEn,
    "Nominal": nominal,
    "Rate": rate,
    "Diff": diff,
    "Date": dateValues.reverse[date],
  };
}

enum Date {
  THE_22012024
}

final dateValues = EnumValues({
  "22.01.2024": Date.THE_22012024
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
