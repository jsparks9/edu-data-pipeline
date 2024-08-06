#!/ban/bash

RAW_DIR="./Raw Data"

unzip "$RAW_DIR/2017-18-crdc-data.zip" -d "./Data/CRDC"

cp "$RAW_DIR/ussd17.xls" "./Data/ussd17.xls"

unzip "$RAW_DIR/EDGE_GEOCODE_PUBLICSCH_1718.zip" -d ./Data/HMDA_GEO/

unzip "$RAW_DIR/HMDA2017.zip" -d ./Data/HMDA/

unzip "$RAW_DIR/GRF17.zip" -d ./Data/SDGR/

# Find all CSV files in the ./Data directory and its subdirectories
find ./Data -type f -name "*.csv" | while read -r file; do
  # Remove empty lines from the current CSV file
  sed -i '/^$/d' "$file"
  echo "Processed: $file"
done

# Replace ,"" with , in HMDA file

input_file="./Data/HMDA/hmda_2017_nationwide_first-lien-owner-occupied-1-4-family-records_labels.csv"
temp_file="${input_file}.bak"

mv "$input_file" "$temp_file"

awk '{gsub(/,""/, ","); print}' "$temp_file" > "$input_file"

rm "$temp_file"

