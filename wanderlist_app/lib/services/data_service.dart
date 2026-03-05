import '../models/place.dart';

class DataService {
  static final List<Place> _places = [
    Place(
      id: '1',
      name: 'Central Park',
      description:
          'Central Park is a vast green oasis in the heart of a bustling city offering a peaceful escape from urban life. With wide lawns, scenic lakes, tree-lined paths, and vibrant gardens, it\'s a favorite spot for walking, cycling, and relaxation. The park also features cultural landmarks, playgrounds, and recreational areas, making it a lively gathering place for both locals and visitors.',
      address: '5 Green way Avenue, Downtown City',
      hours: 'Open daily: 6:00 AM - 10:00 PM',
      phone: '+1 (555) 847 7890',
      imageUrl: 'assets/images/central_park.jpg',
    ),
    Place(
      id: '2',
      name: 'Everton Stadium',
      description:
          'Everton Stadium, officially known as Everton Stadium at Bramley-Moore Dock, is the upcoming home of Everton Football Club in Liverpool, England. Built on the historic waterfront of the River Mersey, this state-of-the-art venue will accommodate over 52,000 spectators.',
      address:
          'Bramley-Moore Dock, Regent Road, Liverpool, L3 0LD, United Kingdom',
      hours: 'Match days & events only - doors open 2 hours before events',
      phone: '+44 (0)151 556 1802',
      imageUrl: 'assets/images/everton_stadium.jpg',
    ),
  ];

  static final List<Place> _savedPlaces = [];

  static List<Place> getAllPlaces() {
    return _places
        .map(
          (place) => place.copyWith(
            isSaved: _savedPlaces.any((saved) => saved.id == place.id),
          ),
        )
        .toList();
  }

  static List<Place> getSavedPlaces() {
    return _savedPlaces;
  }

  static void savePlace(Place place) {
    if (!_savedPlaces.any((saved) => saved.id == place.id)) {
      _savedPlaces.add(place);
    }
  }

  static void removeSavedPlace(String placeId) {
    _savedPlaces.removeWhere((place) => place.id == placeId);
  }

  static Place? getPlaceById(String id) {
    try {
      return _places.firstWhere((place) => place.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Place> searchPlaces(String query) {
    if (query.isEmpty) return getAllPlaces();

    return _places
        .where(
          (place) =>
              place.name.toLowerCase().contains(query.toLowerCase()) ||
              place.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
