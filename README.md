Daily Backup Script (backup.sh)

Overview:
This Bash script performs an incremental backup by archiving only the files that were modified in the last 24 hours from a target directory. It compresses these files into a .tar.gz archive and moves the archive to a destination directory.

How It Works:

1. Takes two arguments:
   * targetDirectory: the directory to back up
   * destinationDirectory: where to store the backup archive
2. Checks that both directories exist.
3. Scans the target directory for files modified in the last 24 hours.
4. Adds those files into a compressed archive named: backup<timestamp>.tar.gz
5. Moves the archive to the destination directory.

Usage:
./backup.sh /path/to/targetDirectory /path/to/destinationDirectory

Example:
./backup.sh /home/project/important-documents /home/project

This creates a file like:
backup1751894021.tar.gz
Inside: /home/project

Requirements:

* Bash shell
* tar and date utilities (standard in most Linux environments)
* Script must have execute permissions:
  chmod +x backup.sh

Testing:
Run the script manually:
./backup.sh /your/source /your/destination

To schedule it via cron:
crontab -e

Add this line to schedule daily:
@daily /usr/local/bin/backup.sh /home/project/important-documents /home/project

Make sure the cron service is started:
sudo service cron start
Output Example:
A successful run will place a compressed file in the destination directory:
backup1751894021.tar.gz
It contains only files from the target folder modified in the last 24 hour
