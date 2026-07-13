Add-Type -AssemblyName PresentationFramework, System.Windows.Forms

# 1. 建立全螢幕黑色背景
$form = New-Object System.Windows.Forms.Form
$form.Text = "Slide To Restart"
$form.WindowState = "Maximized"
$form.FormBorderStyle = "None"
$form.BackColor = "Black"
$form.TopMost = $true
$form.Opacity = 0.85

# 2. 建立下拉的「手把/圖片」面板
$slidePanel = New-Object System.Windows.Forms.Panel
$slidePanel.Width = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
$slidePanel.Height = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height / 2
$slidePanel.BackColor = [System.Drawing.Color]::FromArgb(255, 0, 120, 215) # Windows 藍色
$slidePanel.Top = -$slidePanel.Height + 100 # 只露出一點點手把
$form.Controls.Add($slidePanel)

# 3. 加上提示文字
$label = New-Object System.Windows.Forms.Label
$label.Text = "往下拉以重新開機"
$label.ForeColor = "White"
$label.Font = New-Object System.Drawing.Font("Microsoft JhengHei", 24, [System.Drawing.FontStyle]::Bold)
$label.AutoSize = $true
$label.Left = ($slidePanel.Width - $label.PreferredWidth) / 2
$label.Top = $slidePanel.Height - 80
$slidePanel.Controls.Add($label)

# 4. 拖曳邏輯（已修正變數範圍語法）
$script:isDragging = $false
$script:startY = 0

$slidePanel.Add_MouseDown({
    param($sender, $e)
    $script:isDragging = $true
    $script:startY = $e.Y
})

$slidePanel.Add_MouseMove({
    param($sender, $e)
    if ($script:isDragging) {
        $newTop = $form.PointToClient([System.Windows.Forms.Cursor]::Position).Y - $script:startY
        if ($newTop -lt -$sender.Height + 100) { $newTop = -$sender.Height + 100 }
        if ($newTop -gt 0) { $newTop = 0 }
        $sender.Top = $newTop
    }
})

$slidePanel.Add_MouseUp({
    param($sender, $e)
    $script:isDragging = $false
    # 如果拉超過畫面的 1/3，就觸發重新開機！
    if ($sender.Top -gt (-$sender.Height / 1.5)) {
        shutdown /r /t 0
        $form.Close()
    } else {
        # 沒拉到位，彈回原處
        $sender.Top = -$sender.Height + 100
    }
})

# 5. 設定 4 秒自動關閉計時器
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 4000 # 4000 毫秒 = 4 秒
$timer.Add_Tick({
    $form.Close()
})
$timer.Start()

# 按 Esc 鍵也可以直接退出
$form.Add_KeyDown({
    param($sender, $e)
    if ($e.KeyCode -eq "Escape") { $form.Close() }
})
$form.KeyPreview = $true

# 顯示畫面
[System.Windows.Forms.Application]::Run($form)