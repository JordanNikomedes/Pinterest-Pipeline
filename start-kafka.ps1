# start-kafka.ps1
$kafkaPath = "C:\Users\jorda\OneDrive\Documents\Pinterest-Pipeline\kafka\kafka_2.13-3.5.2"
$binPath = "$kafkaPath\bin\windows"
$configPath = "$kafkaPath\config"

function Start-KafkaService {
    param (
        [string]$title,
        [string]$batFile,
        [string]$configFile
    )
    Write-Host "🔄 Starting $title..."
    Start-Process -FilePath "$batFile" -ArgumentList "$configFile"
}

Start-KafkaService -title "Zookeeper" -batFile "$binPath\zookeeper-server-start.bat" -configFile "$configPath\zookeeper.properties"
Start-Sleep -Seconds 5

Start-KafkaService -title "Kafka Broker" -batFile "$binPath\kafka-server-start.bat" -configFile "$configPath\server.properties"
Start-Sleep -Seconds 5

Start-KafkaService -title "Kafka Connect" -batFile "$binPath\connect-distributed.bat" -configFile "$configPath\connect-distributed.properties"

Write-Host "`n✅ All services launched successfully."
