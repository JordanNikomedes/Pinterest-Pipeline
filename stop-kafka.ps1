# stop-kafka.ps1

# Stop Zookeeper
Get-Process | Where-Object { $_.Path -like "*zookeeper*" -or $_.ProcessName -like "*zookeeper*" } | ForEach-Object {
    Write-Host "🛑 Stopping Zookeeper (PID $($_.Id))"
    Stop-Process -Id $_.Id -Force
}

# Stop Kafka Broker
Get-Process | Where-Object { $_.Path -like "*kafka*" -or $_.ProcessName -like "*kafka*" } | ForEach-Object {
    Write-Host "🛑 Stopping Kafka Broker (PID $($_.Id))"
    Stop-Process -Id $_.Id -Force
}

# Stop Kafka Connect
Get-Process | Where-Object { $_.Path -like "*connect*" -or $_.ProcessName -like "*connect*" } | ForEach-Object {
    Write-Host "🛑 Stopping Kafka Connect (PID $($_.Id))"
    Stop-Process -Id $_.Id -Force
}

Write-Host "`n✅ All Kafka services stopped."
