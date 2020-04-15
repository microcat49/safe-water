<html>
<body>
TEST PAGE<br>
<?php

// $dbhost = "localhost";
// $dbuser = "crwa";
// $pwd = "crwatest";
// $database = "flagging";

// $con = mysqli_connect($dbhost, $dbuser, $pwd, $database);

archive_USGSflow("Waltham");

function archive_USGSflow($name) {
		//Reads data file from USGS flow gauge and updates local database archive

		// $dbkeys = read_key("dbuser");
		// $dbuser = $dbkeys[0]; $dbpw = $dbkeys[1];

		global $specialmsg, $corrections ;
		$specialmsg = "" ;
		$corrections = 0 ;
		$site = "";
		$sitenum = "";
		switch ($name) {
			case "Waltham":
				$site="CharlesWalthamUSGS" ;
				$sitenum = "01104500";
				break ;
		}

		//query database to get last date
		$arc_lastdate = mktime(0, 0, 0, 0, 0, 0);
		$datatable = "crwa_notification.rawdata";

        $rawdb = new mysqli(
            "localhost",
            "crwa",
            "crwatest",
            "flagging"
        );

		// $rawdb = new mysqli("notification.crwa.org", $dbuser, $dbpw, "crwa_notification");
		if ($rawdb->connect_error) {
    		$specialmsg = 'Connect Error: ' . $rawdb->connect_error;
			return FALSE;
		}
		if ($statement = $rawdb->query("SELECT datetime FROM $datatable WHERE site='$site' ORDER BY datetime DESC LIMIT 1")){
			$row = $statement->fetch_assoc();
			$arc_lastdate = strtotime($row['datetime']);
			$statement->free();
		}

		//open and read USGS data

        $arc_lastdate = strtotime("Apr 6, 2020 12:00:00");
		$starttime = max(mktime(date("G",$arc_lastdate)+1, 0, 0, date("m",$arc_lastdate), date("d",$arc_lastdate),
			date("Y",$arc_lastdate)), mktime(0, 0, 0, date("m"), date("d")-100, date("Y")));
		$endtime = mktime(date("G"), 0, 0, date("m"), date("d"), date("Y")) ; //hour required for starttime <= endtime logic

		if ($starttime <= $endtime) {
			$usg_handle = fopen("http://waterdata.usgs.gov/nwis/uv?cb_00060=on&format=rdb&period=&begin_date=" .
				date('Y\-m\-d',$starttime) . "&end_date=" . date('Y\-m\-d',$endtime) . "&site_no=" . $sitenum,"r");
			if (!$usg_handle) {
				$rawdb->close();
				return FALSE;
			}
			while (!feof($usg_handle)) {
				$line = fgets ($usg_handle,1024);
				if ((substr($line,0,1)!="#") && (strlen($line) > 10)) {
					//get column numbers
					$headers = explode("\t",$line) ;
					$count = 0 ;
					$usg_flowcol = -1 ;
					$usg_datecol = -1 ;
					foreach ($headers as $value) {
						switch (trim($value)) {
							case "datetime": $usg_datecol = $count ; break ;
							case "66190_00060": $usg_flowcol = $count ; break ;
						}
						$count = $count + 1 ;
					}
					if (min($usg_flowcol,$usg_datecol) <= -1) {
						fclose($usg_handle) ;
						$specialmsg = "Flowgauge columns not identified" ;
						return FALSE ;
					}
					//read data
					$trgthour = mktime(0,0,0,0,0,0) ;
					$flow = 0 ;
					$avgcount = 1 ;
					while (!feof($usg_handle)) {
						$line = fgets ($usg_handle,1024) ;
						if (substr($line,0,4) == "USGS") {
							$datavals = explode("\t",$line) ;
							$thistime = strtotime($datavals[$usg_datecol]) ;
							if (($thistime > $arc_lastdate) && ($datavals[$usg_flowcol] != "")) {
								$thistimestring = strftime("%Y-%m-%d %H:%M:%S", $thistime);
								$rawdb->query("INSERT INTO $datatable (site,datetime,flow_cfs) VALUES 	('$site',TIMESTAMP('$thistimestring'),trim($datavals[$usg_flowcol]))"); //trim removes hidden \r\n
							}
						}
					}
				}
			}
			fclose($usg_handle) ;
		}
		$rawdb->close();
		return TRUE ;
}





?>
</body>
</html>
