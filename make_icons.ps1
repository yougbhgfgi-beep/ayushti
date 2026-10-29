Add-Type -AssemblyName System.Drawing

$source = Join-Path (Get-Location) "assets\images\aya.jpg"
$outDir = Join-Path (Get-Location) "assets\icons"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

function New-AppIcon {
    param([string]$Src, [string]$Out, [int]$Size, [double]$PadPercent)

    $img = [System.Drawing.Image]::FromFile($Src)
    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

    $rect = New-Object System.Drawing.Rectangle(0, 0, $Size, $Size)
    $c1 = [System.Drawing.Color]::FromArgb(35, 0, 20)
    $c2 = [System.Drawing.Color]::FromArgb(9, 10, 15)
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $c1, $c2, 90)
    $g.FillRectangle($bg, $rect)

    $pad = [int]($Size * $PadPercent)
    $maxW = $Size - (2 * $pad)
    $maxH = $Size - (2 * $pad)
    $ratio = [Math]::Min($maxW / $img.Width, $maxH / $img.Height)
    $w = [int]($img.Width * $ratio)
    $h = [int]($img.Height * $ratio)
    $x = [int](($Size - $w) / 2)
    $y = [int](($Size - $h) / 2)

    # soft magenta glow behind the photo
    $glowRect = New-Object System.Drawing.Rectangle(($x - 6), ($y - 6), ($w + 12), ($h + 12))
    $glow = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(70, 196, 13, 116))
    $g.FillRectangle($glow, $glowRect)

    $g.DrawImage($img, $x, $y, $w, $h)

    $bmp.Save($Out, [System.Drawing.Imaging.ImageFormat]::Png)

    $g.Dispose()
    $bmp.Dispose()
    $img.Dispose()
    $bg.Dispose()
    $glow.Dispose()
}

New-AppIcon -Src $source -Out (Join-Path $outDir "icon-192.png") -Size 192 -PadPercent 0.08
New-AppIcon -Src $source -Out (Join-Path $outDir "icon-512.png") -Size 512 -PadPercent 0.08
New-AppIcon -Src $source -Out (Join-Path $outDir "icon-maskable-512.png") -Size 512 -PadPercent 0.20
New-AppIcon -Src $source -Out (Join-Path $outDir "apple-touch-icon.png") -Size 180 -PadPercent 0.08
New-AppIcon -Src $source -Out (Join-Path $outDir "favicon.png") -Size 64 -PadPercent 0.05

Get-ChildItem $outDir | Select-Object Name, Length
