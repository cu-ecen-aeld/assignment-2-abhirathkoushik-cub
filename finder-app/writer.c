/*******************************************************************************
 * Copyright (C) 2025 by Abhirath Koushik
 *
 * Redistribution, modification or use of this software in source or binary
 * forms is permitted as long as the files maintain this copyright. Users are
 * permitted to modify this and use it to learn about the field of embedded
 * software. Abhirath Koushik and the University of Colorado are not liable for
 * any misuse of this material.
 * ****************************************************************************/

/**
 * @file    writer.c
 * @brief   This file is used to write the required content in a given text file, with suitable error checking.
 *
 *
 * @author  Abhirath Koushik
 * @date    01-26-2025
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {

    // Initialize syslog connection for logging
    openlog("writer", LOG_PID | LOG_PERROR, LOG_USER);

    // Check the Input Arguments of the Script
    if (argc != 3) {
        syslog(LOG_ERR, "ERROR: Required 2 Arguments (Full File Path and Text String) not present\n");
        closelog();
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    // Check if the string to write is empty
    if (strlen(writestr) == 0) {
        syslog(LOG_ERR, "ERROR: String to write is empty");
        closelog();
        return 1;
    }

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "ERROR: Could not open the file '%s' for writing\n", writefile);
        closelog();
        return 1;
    }

    // Write the string to the file
    syslog(LOG_DEBUG, "Writing %s to %s\n", writestr, writefile);
    if (fputs(writestr, file) == EOF) {
        syslog(LOG_ERR, "ERROR: Could not write to the file '%s'\n", writefile);
        fclose(file);
        closelog();
        return 1;
    }

    // Close the file
    if (fclose(file) != 0) {
        syslog(LOG_ERR, "ERROR: Could not close the file '%s'\n", writefile);
        closelog();
        return 1;
    }

    // Close syslog connection
    closelog();
    return 0;
}
