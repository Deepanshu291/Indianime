import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
 final String name;
 final String imageurl;
 final String video;
 final String id;
 final String year;
final String rating;
final String description;
final String duration;

 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['name'] != null),
       assert(map['imageurl'] != null),
       assert(map['video']!= null),
       assert(map['id']!= null),
       assert(map['year']!= null),
       assert(map['rating']!= null),
       assert(map['description']!= null),
       assert(map['duration']!= null),
       id = map['id'],
       name = map['name'],
       imageurl = map['imageurl'],
       year = map['year'],
       rating = map['rating'],
       description = map['description'],
       duration = map['duration'],
       video = map['video'];

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name:$imageurl:$video:$id:$year:$description:$duration:$rating>";
}
