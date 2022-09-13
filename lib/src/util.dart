///
extension MapExtension<K> on Map<K, dynamic> {
  /// Merges entries from [other].
  /// Unlike [addAll], tries to recursively merge an entry recursively
  /// if it is a compatible map.
  void addAllRecursive(Map<K, dynamic> other) {
    for (final entry in other.entries) {
      final oldValue = this[entry.key];
      final newValue = entry.value;

      if (oldValue is Map<K, dynamic> && newValue is Map<K, dynamic>) {
        oldValue.addAllRecursive(newValue);

        continue;
      }

      this[entry.key] = newValue;
    }
  }
}
