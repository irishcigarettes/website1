# Simple HTTP Server using PowerShell
$port = 8000
$url = "http://localhost:$port/"

Write-Host "Starting server on $url" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Create a simple HTTP listener
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()

Write-Host "Server is running! Open your browser and go to: $url" -ForegroundColor Cyan
Write-Host ""

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    $localPath = $request.Url.LocalPath
    if ($localPath -eq "/") {
        $localPath = "/index.html"
    }
    
    $filePath = Join-Path $PSScriptRoot $localPath.TrimStart('/')
    
    if (Test-Path $filePath) {
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $extension = [System.IO.Path]::GetExtension($filePath)
        
        # Set content type
        $contentType = "text/html"
        if ($extension -eq ".css") { $contentType = "text/css" }
        elseif ($extension -eq ".js") { $contentType = "application/javascript" }
        elseif ($extension -eq ".png") { $contentType = "image/png" }
        elseif ($extension -eq ".jpg" -or $extension -eq ".jpeg") { $contentType = "image/jpeg" }
        elseif ($extension -eq ".svg") { $contentType = "image/svg+xml" }
        
        $response.ContentType = $contentType
        $response.ContentLength64 = $content.Length
        $response.StatusCode = 200
        $response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $response.StatusCode = 404
        $notFound = [System.Text.Encoding]::UTF8.GetBytes("404 - File Not Found")
        $response.ContentLength64 = $notFound.Length
        $response.OutputStream.Write($notFound, 0, $notFound.Length)
    }
    
    $response.Close()
}

