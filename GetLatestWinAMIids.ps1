$regions = @(
    "us-east-1",
    "us-east-2",
    "us-west-2",
    "us-west-1",
    "eu-west-1",
    "eu-west-2",
    "eu-central-1",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-south-1",
    "ca-central-1",
    "sa-east-1"
)

foreach ($region in $regions) {
    $ami = ((Get-EC2Image -Filter @{"Name"="platform";"Value"="windows"} -Region $region  | where {$_.name -like "*2016*english*base*"} | sort -Property CreationDate -Descending)[0]).imageid
    $amiOutput = $region+":"+ "`n" + " Windows2016STD: "+ $ami
    $amiOutput >> "c:\temp.txt"
} 