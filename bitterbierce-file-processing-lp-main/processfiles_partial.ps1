<#
While a function is not required, as your code gets more complex, thi really helps to tame it.
#>
function Rename-ImageFile   {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        $FullName,
        [Parameter(ValueFromPipelineByPropertyName)]
        $Extension,
        [Parameter(ValueFromPipelineByPropertyName)]
        $Name

        
        )
    process {

        Get-ChildItem -Path $imageFileDirectory -File | Where-Object{
            $_.Extension -match "(\.jpg)"} | Where-Object{ $_.Name -match 
            "(?<skew>\d{6})"} 
    }
}
# $imageFileDirectory = '.\images'
$imageFileDirectory = '.\testImages\' # Used a copy of .\images for testing 
                                      # since Rename-Item kept erasing this 
                                      # director after execution. 
                                      # Don't know  that much PS yet!
