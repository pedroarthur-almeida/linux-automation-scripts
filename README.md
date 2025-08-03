# Linux-Automation-Scripts

These scripts were developed to automate some simple tasks on Ubuntu Linux. Their goal is to make the system easier to use for both regular Linux users and beginners by simplifying everyday operations.

# Available Scripts

## 📁 clean-system
- Performs a system cleanup by removing unnecessary files and packages to free up space and improve performance.

## 📁 report-system
- Generates a detailed report on different areas of the system (such as CPU, memory, disk, etc.) and saves the information in a `.txt` file.

## 📁 security-system
- Analyzes various aspects related to **system security and integrity**, displaying the results clearly to the user.

## 📁 update-system
- Updates the system and removes orphaned packages, keeping the system clean and up to date with the latest package versions.

# Using Cron

If you want to automate the execution of the scripts, you can use `cron`, which is built into Ubuntu Linux. With it, you can set exactly when each script should run — such as at system startup, on specific days, or at scheduled times — making the whole process more efficient, practical, and hands-free.

## 🔁 How to Automate Scripts on Ubuntu with Cron

If you want your scripts to run **automatically**, without needing to execute them manually, you can use `cron`, the Linux task scheduler.  
Below are some usage examples.

### ✅ To run the script every time Ubuntu starts:

1. Open the crontab:
```
crontab -e
```
2. Add the following line at the end of the file:
```
@reboot /caminho/completo/do/script.sh
```

### To run the script every two days:

1. In the same `crontab -e` file, add:
```
0 9 */2 * * /caminho/completo/do/script.sh
```

### 🔍 To view scheduled tasks:
```
crontab -l
```


