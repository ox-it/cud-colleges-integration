# Summary: clunky powershell script to pull CUD person records from a CUD WS interface.
# Prerequisites: powershell, java >= 7, and the java GSS Negotiate client.
# Description: A wrapper for the GSS Negotiate (CUD client) call, which pulls XML from CUD,
# and includes the use of an external XSLT file to transform the CUD XML into something 
# more palatable to other XML-consuming data processors.
# Disclaimer: This script carries no guarantees. It would need local customisation and 
# improvement, if used.
#
# More info about CUD and its interfaces can be found at
# https://help.it.ox.ac.uk/services/iam/cud/cud-interfaces-detail
# and
# https://wiki.it.ox.ac.uk/itss/Core_User_Directory
#
# The CUD Client is available for CUD-using ITSS to download from
# https://downloads.oucs.ox.ac.uk/sysdev/cud/CudClient.zip
# 
# Author: oucs0098
# Date: 2014-11-06

Add-Type -AssemblyName System.Web

# The file to which the output from the client command will be directed
$CUDOutputFile = "CUD_Output_Original.xml"
# The XSL transformation source
$TransformationFile = "CUD_XML_Transform.xsl"
# The transformed XML file
$TransformedOutputFile = "CUD_Output_Transformed.xml"

# Set up paths
$env:Path += ";C:\Program Files (x86)\Java\jre7\bin"
$env:JAVA_HOME += "C:\Program Files (x86)\Java\jre7"

# Set up the java command
$JavaCmd = "java.exe" 
$JavaArgs = "-Djava.security.krb5.conf=C:\CUD-client\krb5.conf", "-jar", "NegotiateRestClient.jar"

# Set up the CUD Client options
$CudClientOpts = @( 
    "-c", 
    "C:\CUD-client\login.conf",
    "-m", 
    "gssnegotiate-keytabclient", 
    "-G", 
    "-u", 
    "https://ws.cud.ox.ac.uk/cudws/rest/search/person", 
    "-d" )

# the straightforward format options are "xml", "json", "csv"
$Format = "xml"
# Stream the results, no need to change this parameter
$Stream = "y"

# query for a single student by username (for testing)
#$SolrQuery = @'
#cud\:cas\:sso_username:card0177
#'@

# query for all with a scoped affiliation to New College and a current card
$SolrQuery = @'
(cud\:uas\:universitycard_comp_date_ts:[NOW TO *] AND ( cud\:cas\:scoped_affiliation:*New OR cud\:cas\:scoped_affiliation:*newc OR cud\:cas\:scoped_affiliation:*NEW ) ) OR cud\:cas\:scoped_affiliation:applicant@NEW
'@

# query for all with a scoped affiliation to LMH and a current card
#$SolrQuery = @'
#( cud\:uas\:universitycard_comp_date_ts:[NOW TO *] AND ( cud\:cas\:scoped_affiliation:*Lady OR cud\:cas\:scoped_affiliation:*lady OR cud\:cas\:scoped_affiliation:*LMH ) ) OR cud\:cas\:scoped_affiliation:Applicant@LMH
#'@

$EncodedQueryParam = "q=" + [System.Web.HttpUtility]::UrlEncode($SolrQuery)

$Attributes = @(
	"cud:cas:barcode", 
	"cud:cas:barcode7", 
	"cud:cas:cudid", 
	"cud:cas:current_affiliation", 
	"cud:cas:external_tel", 
	"cud:cas:firstname", 
	"cud:cas:fullname", 
	"cud:cas:internal_tel", 
	"cud:cas:known_as", 
	"cud:cas:lastname", 
	"cud:cas:middlenames", 
	"cud:cas:olis_number", 
	"cud:cas:oxford_email", 
	"cud:cas:scoped_affiliation", 
	"cud:cas:sso_username", 
	"cud:cas:suffix", 
	"cud:cas:title", 
	"cud:cas:university_card_status", 
	"cud:cas:university_card_type", 
	"cud:cas:universitycard_status", 
	"cud:cas:universitycard_type", 
	"cud:uas:universitycard_start_date",
	"cud:uas:universitycard_comp_date",
	"cud:uas:universitycard_mifare_id",
	"cud:uas:universitycard_paxton_id",
	"cud:fk:bodleian_record_number", 
	"cud:fk:hris_staff_number", 
	"cud:fk:oak_person_id", 
	"cud:fk:oak_primary_person_id", 
	"cud:fk:opendoor_staff_number", 
	"cud:fk:oss_student_number", 
	"cud:fk:oucs_pcode", 
	"cud:fk:sits_student_code", 
	"cud:fk:telecom_id", 
	"cud:fk:university_card_sysis", 
	"cud:fk:universitycard_sysis", 
	"cud:uas_sits:addresses", 
	"cud:uas_sits:alt_email", 
	"cud:uas_sits:applicant", 
	"cud:uas_sits:application_college_codes", 
	"cud:uas_sits:application_dept_codes", 
	"cud:uas_sits:award_aim", 
	"cud:uas_sits:birth_ctry_cd", 
	"cud:uas_sits:birth_ctry_name", 
	"cud:uas_sits:birth_iso_ctry_ct", 
	"cud:uas_sits:birth_s_ctry_name", 
	"cud:uas_sits:cntry_of_leg_residency", 
	"cud:uas_sits:co_owning_dept_code", 
	"cud:uas_sits:college_cd", 
	"cud:uas_sits:contact_details", 
	"cud:uas_sits:contributing_dept_code", 
	"cud:uas_sits:course_block", 
	"cud:uas_sits:course_join_status", 
	"cud:uas_sits:course_status", 
	"cud:uas_sits:crs_end_dt", 
	"cud:uas_sits:crs_exp_end_dt", 
	"cud:uas_sits:crs_start_dt", 
	"cud:uas_sits:deceased", 
	"cud:uas_sits:degree_class_cd", 
	"cud:uas_sits:dept_cd", 
	"cud:uas_sits:dept_desc", 
	"cud:uas_sits:dept_name", 
	"cud:uas_sits:disabilities", 
	"cud:uas_sits:div_cd", 
	"cud:uas_sits:div_desc", 
	"cud:uas_sits:dob", 
	"cud:uas_sits:dom_cd", 
	"cud:uas_sits:dom_hesa_cd", 
	"cud:uas_sits:dom_name", 
	"cud:uas_sits:external_ids", 
	"cud:uas_sits:finalist", 
	"cud:uas_sits:frnm1", 
	"cud:uas_sits:frnm2", 
	"cud:uas_sits:frnm3", 
	"cud:uas_sits:gnd", 
	"cud:uas_sits:gnd_name", 
	"cud:uas_sits:initials", 
	"cud:uas_sits:known_as", 
	"cud:uas_sits:middle_names", 
	"cud:uas_sits:mobile_phone_no", 
	"cud:uas_sits:mode_of_attendance", 
	"cud:uas_sits:nationalities",
	"cud:uas_sits:ox_email", 
	"cud:uas_sits:ox_sso", 
	"cud:uas_sits:ox_unicard", 
	"cud:uas_sits:prev_name", 
	"cud:uas_sits:prev_surnm", 
	"cud:uas_sits:prev_surnm_eff_dt", 
	"cud:uas_sits:primary_email", 
	"cud:uas_sits:primary_phone_no", 
	"cud:uas_sits:qualifications", 
	"cud:uas_sits:residency_status", 
	"cud:uas_sits:rout_cd", 
	"cud:uas_sits:rout_name", 
	"cud:uas_sits:scj_status_cd", 
	"cud:uas_sits:scj_status_name", 
	"cud:uas_sits:student", 
	"cud:uas_sits:suffix", 
	"cud:uas_sits:surnm", 
	"cud:uas_sits:titl_cd", 
	"cud:uas_sits:unit_set_cd"
  )

$AttributeList = ""
for ($i = 0; $i -lt $Attributes.length; $i++) {
    $AttributeList = $AttributeList + $Attributes[$i] + ","
}
$AttributeList = $AttributeList.Substring(0, $AttributeList.Length-1)
$EncodedAttributeList = "&fields=" + [System.Web.HttpUtility]::UrlEncode($AttributeList)

$FormatParam = "&format=" + $Format
$StreamParam = "&stream=" + $Stream

$URLParams = $EncodedQueryParam + $EncodedAttributeList + $FormatParam + $StreamParam

#Write-Host "Query Parameters:" $URLParams 
#Write-Host "About to Run:" $JavaExe $JavaArgs $CudClientOpts $URLParams

# Make the call to the CUD web service
Invoke-Command -ScriptBlock { & $JavaCmd $JavaArgs $CudClientOpts $URLParams } | Out-file $CUDOutputFile -Encoding UTF8

# Perform the XSL transformation
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.Load($TransformationFile);
$xslt.Transform($CUDOutputFile, $TransformedOutputFile);