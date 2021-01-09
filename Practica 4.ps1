#Eduardo Alonso Gaytan Valadez    Grupo: 063
#Práctica # 4 - Archivo powershell
#Profesor: Jose Anastacio Hernández Saldaña

# Aceptamos parametros desde la linea de comando
# Forma de ejecucion

# .\Practica 4.ps1 -EncryptionType e -key 12 -msg "Hola como estas"
# >>> Mensaje Encriptado: Taxm oaya qefme

#Explicación de arguentos
#-EncyptionType e para encriptar y d para desencriptar
#-key puede ser entre el 1 y el 26
#-msg Mensaje a encriptar (poner entre comillas dobles)

[Cmdletbinding()] 
param(
    [Parameter()] [char]$EncryptionType,
    [Parameter()] [int]$key,
    [Parameter()] [string]$msg
)
 
function Get-Encryption(){
    [Cmdletbinding()] 
    param(
        [Parameter()] [char]$EncryptionType,
        [Parameter()] [int]$key,
        [Parameter()] [string]$msg
    )

    if ($EncryptionType -eq "e")
    { 
        if ($key -gt 0 -and $key -le 26){
            $String=[char[]]$msg
            
            # Se usa la letra ASCII para determinar si la letra es mayuscula
            # o minuscula, o si es un simbolo, si la letra es un caracter no
            # alfabetico se pasa directo al proceso de concatenacion  
            foreach ($letter in $String)
            { 
                $nbr = [int[]][char]$letter
     
                If ($nbr -ge 0 -and $nbr -le 64)
                {
                    [string]$Snbr = $nbr
                    [int]$Nnbr = $Snbr  
                    [int]$Enbr = $Nnbr 
                    [string]$ELetter = [char]$Enbr
                }
                # Si el valor es mayuscula, entonces se pone el valor
                # del cifrado cesar de la letra mayuscula 
                If ($nbr -ge 65 -and $nbr -le 90) 
                {
                    [string]$Snbr = $nbr
                    [int]$Nnbr = $Snbr 
                    [int]$nkey = $key
                    [int]$Enbr = $Nnbr + $nkey
                    If ($Enbr -gt 90) {$Enbr = $Enbr - 26}
                    If ($Enbr -lt 65) {$Enbr = $Enbr + 26}
                    [string]$ELetter = [char]$Enbr    
                } 
   
                If ($nbr -ge 91 -and $nbr -le 96) #ASCII Codes
                {
                    [string]$Snbr = $nbr
                    [int]$Nnbr = $Snbr  
                    [int]$Enbr = $Nnbr 
                    [string]$ELetter = [char]$Enbr
                }
   
                If ($nbr -ge 97 -and $nbr -le 122) #Alphabet Lowercase
                {
                    [string]$Snbr = $nbr
                    [int]$Nnbr = $Snbr 
                    [int]$nkey = $key
                    [int]$Enbr = $Nnbr + $nkey 
                    If($Enbr -gt 122) {$Enbr = $Enbr - 26}
                    If  ($Enbr -lt 97) {$Enbr = $Enbr + 26}
                    [string]$ELetter = [char]$Enbr
                }
        
                If ($nbr -ge 123 -and $nbr -le 127) #ASCII Codes
                {
                        [string]$Snbr = $nbr
                        [int]$Nnbr = $Snbr  
                        [int]$Enbr = $Nnbr 
                        [string]$ELetter = [char]$Enbr
                }
                # Se van concatenando las letras      
                $EMsg = $EMsg + $ELetter
            }
            
            Write-Host "Mensaje Encriptado:" $EMsg   

        }
        else
        {

            Write-Host "Llave incorrecta"
        }
    }
}

Get-Encryption -EncryptionType $EncryptionType -key $key -msg $msg




function Get-Decrypt{
    [Cmdletbinding()] 
    param(
        [Parameter()] [char]$EncryptionType,
        [Parameter()] [int]$key,
        [Parameter()] [string]$msg
    )
    if ($EncryptionType -eq "d")
    {
        if ($key -gt 0 -and $key -le 26)
        {
            $String=[char[]]$msg

            foreach ($letter in $String)
            {
                $nbr = [int[]][char]$letter
   
                If ($nbr -ge 0 -and $nbr -le 64) #ASCII Codes
                {
                    [string]$Snbr = $nbr
                    [int]$Nnbr = $Snbr  
                    [int]$Enbr = $Nnbr 
                    [string]$ELetter = [char]$Enbr
                }
  
                If ($nbr -ge 65 -and $nbr -le 90) #Alphabet UpperCase
                {
                   [string]$Snbr = $nbr
                   [int]$Nnbr = $Snbr 
                   [int]$nkey = $key
                   [int]$Enbr = $Nnbr - $nkey 
                   If ($Enbr -gt 90) {$Enbr = $Enbr - 26}
                   If ($Enbr -lt 65) {$Enbr = $Enbr + 26}
                   [string]$ELetter = [char]$Enbr  
                }  
   
                If ($nbr -ge 91 -and $nbr -le 96) #ASCII Codes
                {
                   [string]$Snbr = $nbr
                   [int]$Nnbr = $Snbr  
                   [int]$Enbr = $Nnbr 
                   [string]$ELetter = [char]$Enbr
                }
          
                If ($nbr -ge 97 -and $nbr -le 122) #Alphabet LowerCase
                {
                   [string]$Snbr = $nbr
                   [int]$Nnbr = $Snbr 
                   [int]$nkey = $key
                   [int]$Enbr = $Nnbr - $nkey 
                   If($Enbr -gt 122) {$Enbr = $Enbr - 26}
                   If  ($Enbr -lt 97) {$Enbr = $Enbr + 26}
                   [string]$ELetter = [char]$Enbr       
                }    
     
                If ($nbr -ge 123 -and $nbr -le 127) #ASCII Codes
                {
                   [string]$Snbr = $nbr
                   [int]$Nnbr = $Snbr  
                   [int]$Enbr = $Nnbr 
                   [string]$ELetter = [char]$Enbr
                }    

                $EMsg = $EMsg + $ELetter    
            } 
            Write-Host "Texto Plano: " $EMsg
        
        }
        else{
            Write-Host "Llave incorrecta"
        }
    }

}

Get-Decrypt -EncryptionType $EncryptionType -key $key -msg $msg

