# windowns_reboot

# Slide To Restart

A PowerShell-based application that simulates the **Windows "Slide to Restart"** interface. The project provides an interactive full-screen restart experience by displaying a slide panel that allows users to trigger a system restart through a sliding action.

## Features

* Full-screen restart interface
* Semi-transparent black background
* Always-on-top window
* Interactive slide-to-restart panel
* PowerShell GUI implementation
* Easy execution through a batch file

## Project Structure

```text
.
├── reboot_1.bat
└── SlideToRestart.ps1
```

### Files Description

#### `reboot_1.bat`

A batch file that launches the PowerShell script.

```bat
@echo off
pwsh -NoProfile -ExecutionPolicy Bypass -File "C:\Users\DQA\Desktop\SlideToRestart.ps1"
```

#### `SlideToRestart.ps1`

The main PowerShell script responsible for:

* Creating a full-screen window
* Displaying a semi-transparent background
* Setting the window to stay on top
* Building the slide interface
* Detecting user slide actions
* Triggering the restart process

## Requirements

* Windows 10 or Windows 11
* PowerShell 7 (pwsh)
* .NET Framework
* System.Windows.Forms
* PresentationFramework

Check your PowerShell version:

```powershell
pwsh --version
```

## Usage

### Method 1: Run the Batch File

Double-click:

```text
reboot_1.bat
```

The batch file will automatically execute:

```powershell
SlideToRestart.ps1
```

### Method 2: Run with PowerShell

```powershell
pwsh -ExecutionPolicy Bypass -File .\SlideToRestart.ps1
```

## Workflow

```text
Run reboot_1.bat
        │
        ▼
Launch PowerShell Script
        │
        ▼
Create Full-Screen Interface
        │
        ▼
Display Slide Panel
        │
        ▼
Detect Slide Action
        │
        ▼
Execute System Restart
```

## Use Cases

* PowerShell GUI demonstrations
* Windows interface simulations
* System administration tools
* Custom restart workflows
* Learning and educational projects

## Author

**Travis Chou**

* Department: Design Quality Assurance (DQA)
* Languages: PowerShell, Batch
* Platform: Windows

## License

This project is licensed under the MIT License.
