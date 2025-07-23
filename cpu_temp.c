#include <stdio.h>
int main() {
    FILE *temp_file = fopen("/sys/class/thermal/thermal_zone0/temp", "r");
    if (!temp_file) {
        printf("Error: Could not read CPU temp. Is lm-sensors installed?\n");
        return 1;
    }
    float temp; 
    fscanf(temp_file, "%f", &temp); 
    fclose(temp_file);
    printf("CPU Temp: %.1f°C (Logged to cpu_temp.log)\n", temp / 1000);
    FILE *log_file = fopen("cpu_temp.log", "a");
    fprintf(log_file, "CPU Temp: %.1f°C\n", temp / 1000);
    fclose(log_file);
    return 0;
}
