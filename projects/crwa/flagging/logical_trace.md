
# Data Gathering and Model Calculations
1. Cron job calls ./scripts/archive_wqmodel_trigger.php
2. archive_wqmodel_trigger.php calls ./scripts/archive_wqmodel:archive_wqmodel()
3. archive_wqmodel:archive_wqmodel() calls:
    * ./scripts/archive_repeatingcode:archive_OnsetRX3000() *gets hobolink data and inserts into crwa_notification.rawdata table*
    * ./scripts/archive_repeatingcode:archive_USGSflow() *gets USGS river flow data and inserts into crwa_notification.rawdata table*
    * ./scripts/archive_repeatingcode:archive_boatingmodel() *pulls data from crwa_notifications.rawdata table calculates model, and inserts results into crwa_notification.modeldata*


# Webpage Interface
1. ./wqmodel/boathouseflags.php calls ./scripts/archive_wqmodel:read_boatingmodel()
2. ./scripts/archive_wqmodel:read_boatingmodel() selects results from crwa_notification.modeldata table
3. ./wqmodel/boathouseflags.php calls ./scripts/ calls ./scripts/archive_repeatingcode.php:runflaglogic(), which determines flag color using model-dependent thresholds
