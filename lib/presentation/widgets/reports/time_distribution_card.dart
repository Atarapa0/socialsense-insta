import 'package:flutter/material.dart';
import 'package:socialsense/core/localization/app_localizations.dart';

class TimeDistributionCard extends StatelessWidget {
  final Map<String, double> timeData;
  final Map<String, double> weekData;

  const TimeDistributionCard({
    super.key,
    required this.timeData,
    required this.weekData,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        _buildTimeSection(context, l10n),
        const SizedBox(height: 16),
        _buildWeekSection(context, l10n),
      ],
    );
  }

  Widget _buildTimeSection(BuildContext context, AppLocalizations l10n) {
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
            l10n.get('time_dist'),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildTimeItem(
            context,
            l10n.get('morning_time'),
            timeData['morning'] ?? 0,
            Colors.orange,
            Icons.wb_sunny_outlined,
          ),
          const SizedBox(height: 16),
          _buildTimeItem(
            context,
            l10n.get('afternoon_time'),
            timeData['afternoon'] ?? 0,
            Colors.blue,
            Icons.wb_cloudy_outlined,
          ),
          const SizedBox(height: 16),
          _buildTimeItem(
            context,
            l10n.get('evening_time'),
            timeData['evening'] ?? 0,
            Colors.deepPurple,
            Icons.nightlight_outlined,
          ),
          const SizedBox(height: 16),
          _buildTimeItem(
            context,
            l10n.get('night_time'),
            timeData['night'] ?? 0,
            Colors.indigo,
            Icons.bedtime_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeItem(
    BuildContext context,
    String label,
    double percentage,
    Color color,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '%${percentage.toStringAsFixed(1)}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: color),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  backgroundColor: color.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeekSection(BuildContext context, AppLocalizations l10n) {
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
            l10n.get('weekly_dist'),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildWeekItem(
                  context,
                  l10n.get('weekdays'),
                  weekData['weekday'] ?? 0,
                  const Color(0xFFE1306C),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildWeekItem(
                  context,
                  l10n.get('weekends'),
                  weekData['weekend'] ?? 0,
                  const Color(0xFF833AB4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekItem(
    BuildContext context,
    String label,
    double percentage,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text(
            percentage.toStringAsFixed(1) + '%',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        ],
      ),
    );
  }
}
