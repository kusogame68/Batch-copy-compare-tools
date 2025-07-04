# Windows Batch Copy & Compare Tools

This repository contains two Windows batch scripts designed to provide file copy, structure comparison, and simple multi-command demonstrations in the console.

## 📄 Files
### pattern_copy2compare.bat
---

## ⚙️ Features

- Recursively copies files and folders from a **source path** to a **destination path**.
- Generates **relative path lists** to verify structure consistency.
- Compares:
  - Directory and file structure (paths and names).
  - File contents using binary comparison.
- Outputs clear **PASS** or **FAIL** results.
- Skips folder content comparison automatically.

---

## 🚀 Usage

### Command format

```cmd
pattern_copy2compare.bat "SourcePath" "DestinationPath"


### sayhi.bat

A demo batch script that supports multiple options:

- `-hello`: Print "hello".
- `-hay`: Print "hay".
- `--help`: Show usage instructions.
- Invalid options will show an error message: `Try 'hello --help' for more information`.

**Usage example:**

```cmd
sayhi.bat -hello [Parameters]
sayhi.bat -hay [Parameters]
sayhi.bat --help 
