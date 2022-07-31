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
            $_.Extension -match "(\.(jpg)"} |foreach{ if ($_.Name -match 
            "(?<skew>\d{6})") { Rename-Item $_.FullName -NewName 
            $_.Matches.skew + ".jpg"} } # Have to use the $Matches inmediately
                                        # before it changes but:

#<< I just can't find a way to yank the "(\d{6})" argument and assign it to 
#<< $matches.skew and use to rename the file. I looked into the documentation
#<< but, I'm out of ideas. Also the Cmdlet qualifying option for an 'advanced'
#<< function was not obvious if one is not into them.  
#>>        
    }
}
# $imageFileDirectory = '.\images'
$imageFileDirectory = '.\testImages\' # Used a copy of .\images for testing 
                                      # since Rename-Item kept erasing this 
                                      # director after execution. 
                                      # Don't know  that much PS yet!
