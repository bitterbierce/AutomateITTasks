
<#
While a function is not required, as your code gets more complex, this really helps to tame it.  
#>
function Rename-ImageFile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        $FullName,
        [Parameter(ValueFromPipelineByPropertyName)]
        $Extension,
	[Parameter(ValueFromPipelineByPropertyName)]
	$BaseName
        )

    process {

        # Use RegEx to capture the sku from the file name

	 ForEach-Object { $_.FullName -match "(?<sku>\d{6})" ;
	 if ($Matches) {
		  $skuName= $Matches['sku'] + $_.Extension;
		  Rename-Item  -Path $_.FullName -NewName $skuName
		  #$skuName;
		  #$_.FullName;
		  }	
		}
        # Rename the file to the new file name
	}		
}	

#$imageFileDirectory = './testImages/'; # FOR TESTING PURPOSES
$imageFileDirectory = './images';

Get-ChildItem $imageFileDirectory -File "*.jpg" |Rename-ImageFile
#interate the files in the image directory and filter out the non-image files
