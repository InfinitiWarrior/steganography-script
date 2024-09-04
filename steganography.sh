#!/bin/bash

# Function to embed a message in file metadata
embed_message_exif() {
    local file=$1
    local message=$2
    # Check if the file exists
    if [[! -f "$file" ]]; then
        echo "File not found!"
        exit 1
    fi

    # Embed the message in the file metadata
    exiftool -Comment="$message" "$file"

    # Remove the backup file creatded by ExifTool
    rm "${file}_original"

    echo "Message embedded Successfully in $file"

}
# Check for required arguments
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 [embed|extract] [file] [message (for embed)]"
    exit 1
fi

# Main script logic

if [["$1" == "embed"]]; then
    if [[ $# -lt 3]]; then
        echo "Please provide a message to embed."
        exit 1
    fi
    embed_message_exif "$2" "$3"
elif [[ "$1" == "extract" ]] then
    extract_message_exif "$2"
else 
    echo "Invaled Operation. Use 'embed' or 'extract'."
    exit 1
fi
