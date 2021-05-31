class TableModel {
  String userId = "";
  String channelname = "";
  String titile = "";
  String hthumbnail = "";
  String mthumbnail = "";
  String lthumbnail = "";

  TableModel(this.userId, this.channelname, this.titile, this.hthumbnail,
      this.mthumbnail, this.lthumbnail);

  TableModel.fromMap(Map<String, dynamic> res)
      : userId = res["userId"],
        channelname = res["channelname"],
        titile = res["titile"],
        hthumbnail = res["hthumbnail"],
        mthumbnail = res["mthumbnail"],
        lthumbnail = res["lthumbnail"];

  Map<String, Object?> toMap() {
    return {
      'userId': userId,
      'channelname': channelname,
      'titile': titile,
      'hthumbnail': hthumbnail,
      'mthumbnail': mthumbnail,
      'lthumbnail': lthumbnail
    };
  }
}
