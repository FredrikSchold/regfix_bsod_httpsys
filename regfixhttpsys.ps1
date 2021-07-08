#Fixes the BSOD that occurs when debugging with Visual Studio 2019. 
#BSOD stop code: SYSTEM_THREAD_EXCEPTION_NOT_HANDLED
#What failed: HTTP.sys

$regPath = "HKLM:\System\CurrentControlSet\Services\HTTP\Parameters"
$value = 0

$VerbosePreference="Continue"

$key = "EnableHttp2Tls"
$key2 = "EnableHttp2Cleartext"

try {

    New-ItemProperty -Path $regPath -Name $key -Value $value
 
    Write-Host "Registry key $key"
}

catch {

    Write-Verbose "Something went wrong, could not add $key"
    Continue
}

try {

    New-ItemProperty -Path $regPath -Name $key -Value $value

    Write-Host "Registry key $key2"
}

catch {

    Write-Verbose "Something went wrong, could not add $key2."
    
}

