$BEARER="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

$parts=$BEARER.Split(".")

for ($i=0; $i -lt 2; $i++) {
  $part = $parts[$i];
  echo $part
  $Stripped = $part.Replace('=','')  
  $ModulusValue = ($Stripped.length % 4)   
    Switch ($ModulusValue) {
        '0' {$part = $Stripped}
        '1' {$part = $Stripped.Substring(0,$Stripped.Length - 1)}
        '2' {$part = $Stripped + ('=' * (4 - $ModulusValue))}
        '3' {$part = $Stripped + ('=' * (4 - $ModulusValue))}
    }

  [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($part))
}



