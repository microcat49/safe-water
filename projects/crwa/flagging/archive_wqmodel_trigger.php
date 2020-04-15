<html>
<body>
TESTING
<?php
// Trigger for automatically running model update and archiving
// Crontab should call this .php file
//-------------------------------------------------------------------------------------------

require_once('scripts/archive_wqmodel.php');
archive_wqmodel(FALSE) ;
print("OK");
?>
</body>
</html>
