class LotDto {
  final int id;
  final String name;
  final DateTime creationDate;

  LotDto({this.id, this.name, this.creationDate});

  factory LotDto.fromJson(Map<String, dynamic> json) {
    return LotDto(
      id: json['id'],
      name: json['name'],
      creationDate: json['creationDate'],
    );
  }
}