# windowns_reboot

## Project Introduction
This project simulates the "Slide to Restart" interface on Windows mobile devices.

After execution, the following will occur:

1. Open a full-screen black semi-transparent window

2. Display a draggable sliding panel

3. The user can trigger the restart function through sliding operations

4. Provide a more aesthetically pleasing and interactive reboot experience

---

## 📁 Project Structure

```text

.
├── reboot_1.bat

└── SlideToRestart.ps1

```

### reboot_1.bat

The batch file is responsible for calling the PowerShell script:

```bat

@echo off
pwsh -NoProfile -ExecutionPolicy Bypass -File "C:\Users\DQA\Desktop\SlideToRestart.ps1"

```

### SlideToRestart.ps1

PowerShell GUI script, main functions include:

* Creating a full-screen window

* Black semi-transparent background

* Top-Most display

* Create a sliding panel

* Detect user swipe actions

* Restart the program

---

## 🛠️ System Requirements

* Windows 10 / Windows 11

* PowerShell 7 (pwsh)

* .NET Framework

* System.Windows.Forms

* PresentationFramework

You can use the following command to check your PowerShell version:

``powershell pwsh --version

```

---

## 🚀 Usage

### Method 1: Execute the BAT file directly

Double-click:

```text reboot_1.bat

```
The program will automatically call:

```powershell SlideToRestart.ps1

```

---

### Method 2: Execute using PowerShell

```powershell pwsh -ExecutionPolicy Bypass -File .\SlideToRestart.ps1

```

---
## ⚙️ Execution Flow

```text
Execute BAT

│
▼
Start PowerShell

│
▼
Create a full-screen black interface

│
▼
Display the Slide To Restart control

│
▼
User drags and slides

│
▼
Execute the restart program

```

---

## 📌 Application Scenarios

* Demonstrate PowerShell GUI development capabilities
* Simulate Windows system interface
* Automated maintenance tools
* Customized restart process
* Internal demonstration or teaching purposes

---

## 👨‍💻 Author

**Travis Chou**

* Department: Design Quality Assurance (DQA)

* Language: PowerShell, Batch

* Platform: Windows

---

## 📄 License

This project is released under the MIT License.