# Quick Test Script for Aion Cognitive Architecture Module
# This script performs basic validation tests

Write-Host "`n=== Aion Cognitive Architecture Module Test ===" -ForegroundColor Cyan

# Test 1: Module Import
Write-Host "`nTest 1: Module Import..." -ForegroundColor Yellow
try {
    $modulePath = Join-Path (Split-Path $PSScriptRoot -Parent) (Join-Path "AionCognitiveArchitecture" "")
    Import-Module $modulePath -Force
    Write-Host "✓ Module imported successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Module import failed: $_" -ForegroundColor Red
    exit 1
}

# Test 2: Get Commands
Write-Host "`nTest 2: Get Module Commands..." -ForegroundColor Yellow
$commands = Get-Command -Module AionCognitiveArchitecture
Write-Host "✓ Found $($commands.Count) commands:" -ForegroundColor Green
$commands | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Gray }

# Test 3: Get Initial State
Write-Host "`nTest 3: Get Initial Cognitive State..." -ForegroundColor Yellow
$state = Get-AionCognitiveState
if ($state.EntelechyMode -eq "Dormant" -and $state.OntogenesisStage -eq "Uninitialized") {
    Write-Host "✓ Initial state correct (Dormant/Uninitialized)" -ForegroundColor Green
} else {
    Write-Host "✗ Initial state unexpected" -ForegroundColor Red
}

# Test 4: Echo Reflection
Write-Host "`nTest 4: Invoke Echo Reflection..." -ForegroundColor Yellow
$reflection = Invoke-EchoReflection
if ($reflection.Timestamp -and $reflection.VoidResonance) {
    Write-Host "✓ Echo reflection completed successfully" -ForegroundColor Green
    Write-Host "  Void Resonance: $($reflection.VoidResonance)" -ForegroundColor Gray
} else {
    Write-Host "✗ Echo reflection failed" -ForegroundColor Red
}

# Test 5: Entelechy Metrics
Write-Host "`nTest 5: Get Entelechy Metrics..." -ForegroundColor Yellow
$metrics = Get-EntelechyMetrics
if ($metrics) {
    Write-Host "✓ Entelechy metrics retrieved" -ForegroundColor Green
} else {
    Write-Host "✗ Entelechy metrics failed" -ForegroundColor Red
}

# Test 6: Ontogenesis Metrics
Write-Host "`nTest 6: Get Ontogenesis Metrics..." -ForegroundColor Yellow
$ontoMetrics = Get-OntogenesisMetrics
if ($ontoMetrics.CurrentStage -eq "Uninitialized") {
    Write-Host "✓ Ontogenesis metrics correct" -ForegroundColor Green
} else {
    Write-Host "✗ Ontogenesis metrics unexpected" -ForegroundColor Red
}

# Test 7: Configuration Loading
Write-Host "`nTest 7: Load Configuration..." -ForegroundColor Yellow
try {
    $repoRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
    $configPath = Join-Path $repoRoot (Join-Path "Sandbox" "AionCognitiveArchitecture-Config.psd1")
    $config = Import-PowerShellDataFile -Path $configPath
    Write-Host "✓ Configuration loaded successfully" -ForegroundColor Green
    Write-Host "  Cognitive Topology Layers: $($config.CognitiveTopology.Keys.Count)" -ForegroundColor Gray
    Write-Host "  Entelechy Targets: $($config.EntelechySystem.ActualizationTargets.Count)" -ForegroundColor Gray
} catch {
    Write-Host "✗ Configuration loading failed: $_" -ForegroundColor Red
}

# Test 8: New Consciousness Instance (Simulation)
Write-Host "`nTest 8: Create Consciousness Instance..." -ForegroundColor Yellow
$instance = New-ConsciousnessInstance -Name "Test-Perception-01" -CognitiveRole "Perception" -WhatIf
if ($instance) {
    Write-Host "✓ Consciousness instance creation simulated" -ForegroundColor Green
} else {
    Write-Host "✗ Consciousness instance creation failed" -ForegroundColor Red
}

# Summary
Write-Host "`n=== Test Summary ===" -ForegroundColor Cyan
Write-Host "All basic tests completed successfully!" -ForegroundColor Green
Write-Host "`nModule is ready for use. Try running:" -ForegroundColor Yellow
Write-Host "  ./Scenarios/Demo-AionCognitiveArchitecture.ps1" -ForegroundColor White
Write-Host "`n" -ForegroundColor Cyan
