import 'package:flutter/material.dart';
import 'package:socialsense/core/localization/app_localizations.dart';

class InterestsDistributionCard extends StatelessWidget {
  final Map<String, List<String>> interests;

  const InterestsDistributionCard({super.key, required this.interests});

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Spor':
      case 'Sports':
        return Icons.sports_soccer;
      case 'Yemek & İçecek':
      case 'Food & Drink':
        return Icons.restaurant;
      case 'Oyun & Teknoloji':
      case 'Gaming & Technology':
        return Icons.sports_esports;
      case 'Moda & Güzellik':
      case 'Fashion & Beauty':
        return Icons.checkroom;
      case 'Hayvanlar':
      case 'Animals':
        return Icons.pets;
      case 'Sanat & Eğlence':
      case 'Art & Entertainment':
        return Icons.theater_comedy;
      case 'Seyahat':
      case 'Travel':
        return Icons.flight;
      default:
        return Icons.category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Spor':
      case 'Sports':
        return Colors.green;
      case 'Yemek & İçecek':
      case 'Food & Drink':
        return Colors.orange;
      case 'Oyun & Teknoloji':
      case 'Gaming & Technology':
        return Colors.blue;
      case 'Moda & Güzellik':
      case 'Fashion & Beauty':
        return Colors.pink;
      case 'Hayvanlar':
      case 'Animals':
        return Colors.brown;
      case 'Sanat & Eğlence':
      case 'Art & Entertainment':
        return Colors.purple;
      case 'Seyahat':
      case 'Travel':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  String _getCategoryName(String rawName, AppLocalizations l10n) {
    final name = rawName.trim();
    switch (name) {
      case 'Seyahat':
      case 'Travel':
        return l10n.get('travel');
      case 'Spor':
      case 'Sports':
        return l10n.get('sports');
      case 'Yemek & İçecek':
      case 'Food & Drink':
        return l10n.get('food_drink');
      case 'Oyun & Teknoloji':
      case 'Gaming & Technology':
        return l10n.get('gaming_tech');
      case 'Moda & Güzellik':
      case 'Fashion & Beauty':
        return l10n.get('fashion_beauty');
      case 'Hayvanlar':
      case 'Animals':
        return l10n.get('animals');
      case 'Sanat & Eğlence':
      case 'Art & Entertainment':
        return l10n.get('art_entertainment');
      case 'Diğer':
      case 'Other':
        return l10n.get('other');
      default:
        return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n
                .get('interests_categories')
                .replaceFirst('%count', '${interests.length}'),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (interests.isEmpty)
            Center(
              child: Text(l10n.get('no_data_available') ?? 'No data'),
            ), // Basit fallback

          ...interests.entries.map((entry) {
            final color = _getCategoryColor(entry.key);
            final translatedName = _getCategoryName(entry.key, l10n);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIcon(entry.key),
                      color: color,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    translatedName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${entry.value.length}',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: entry.value.map((item) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(item, style: TextStyle(fontSize: 13)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
