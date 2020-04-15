

crwa_notification.rawdata
site            varchar(255)
datetime        varchar(255)
watertemp_F     real
pressure_inHg   real
par_uE          real
rain_in         real
airtemp_F       real
relhumidity_pct real
dewpoint_F      real
windspeed_mph   real
gustspeed_mph    real
winddir_deg     real
flow_cfs	    real


crwa_notification.eventdata
location    varchar(255)
startdate   varchar(255)
enddate     varchar(255)
event       varchar(255)

crwa_notification.modeldata
indx,               int
location,           varchar(255)
datetime,           varchar(255)
watertemp_C,        real
airtemp_C,          real
rain_in,            real
raindays,           real
windspeed_mph,      real
flow_cfs,           real
par_uE,             real
lg_prb_R2_pct,      real
lg_prb_R3_pct,      real
lg_prb_R4_pct,      real
li_conc_LF_cfu,     real
lg_prb_LF_pct,      real
cso_CP,             real
cyano_NewtonYC,     real
cyano_WatertownYC,  real
cyano_CommRowing,   real
cyano_CRCK,         real
cyano_HarvardWeld,  real
cyano_RiversideBC,  real
cyano_CRYC,         real
cyano_UnionBC,      real
cyano_CommBoating,  real
cyano_CRCKKendall   real

crwa_notification.rawdata
ons_wtmpcol
$ons_prescol
$ons_pharcol
$ons_raincol
$ons_atmpcol
$ons_rhumcol
$ons_dewpcol
$ons_windcol
$ons_gustcol
$ons_wdircol
site		varchar(255)
datetime	varchar(255)
flow_cfs	real
