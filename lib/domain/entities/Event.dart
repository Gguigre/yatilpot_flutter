class Event implements Comparable<Event> {
  String name;
  String location;
  DateTime start;
  DateTime end;

  Event(this.name, this.location, this.start, this.end);

  @override
  String toString() {
    return "The event \"$name\" takes place $location between $start and $end";
  }

  @override
  int compareTo(Event other) {
    return other.start.compareTo(other.start);
  }
}
