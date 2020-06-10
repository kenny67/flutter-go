///
/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/4/28
/// Time: 3:19 PM
/// email: zhu.yan@alibaba-inc.com
///
class Suggestion {
  String query;
  List<Suggestions> suggestions;
  int code;

  Suggestion({this.query, this.suggestions, this.code});

  Suggestion.fromJson(Map<String, dynamic> json) {
    query = json['query'].toString();
    if (json['suggestions'] != null) {
      suggestions = new List<Suggestions>();
      json['suggestions'].forEach((v) {
        Map<String, dynamic> vItem = v as Map<String, dynamic>;
        suggestions.add(new Suggestions.fromJson(vItem));
      });
    }
    code = int.parse(json['code'].toString());
    //code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Suggestions {
  Data data;
  String value;

  Suggestions({this.data, this.value});

  Suggestions.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> mydata = json['data'] as Map<String, dynamic>;

    data = json['data'] != null ? new Data.fromJson(mydata) : null;
    value = json['value'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['value'] = this.value;
    return data;
  }
}

class Data {
  String category;

  Data({this.category});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    return data;
  }
}
