#!/bin/bash

# Script Information
SCRIPT_NAME="steg_tool.sh"
SCRIPT_VERSION="1.0"

# Function to display help
show_help() {
    echo "Usage: $SCRIPT_NAME [command] [options]"
    echo
    echo "Commands:"
    echo "  embed    Embed a message in the file metadata"
    echo "  extract  Extract a message from the file metadata"
    echo
    echo "Options:"
    echo "  -f, --file FILE       Specify the target file (required)"
    echo "  -m, --message MSG     Specify the message to embed (required for embed)"
    echo "  -o, --output FILE     Specify the output file (optional)"
    echo "  -h, --help            Display this help message"
    echo "  -v, --version         Display the script version"
    echo
    echo "Examples:"
    echo "  $SCRIPT_NAME embed -f image.jpg -m 'Hidden message'"
    echo "  $SCRIPT_NAME extract -f image.jpg"
    exit 0
}

# Function to display version info
show_version() {
    echo "$SCRIPT_NAME version $SCRIPT_VERSION"
    exit 0
}

# Function to embed a message in file metadata
embed_message_exif() {
    local file=$1
    local message=$2
    local output_file=$3

    # Check if the file exists
    if [[ ! -f "$file" ]]; then
        echo "Error: File not found!"
        exit 1
    fi

    # Embed the message in the file metadata
    exiftool -Comment="$message" "$file"

    # If an output file is specified, rename the processed file
    if [[ -n "$output_file" ]]; then
        mv "${file}_original" "$output_file"
    else
        # Remove the backup file created by ExifTool
        rm "${file}_original"
    fi
    
    echo "Message embedded successfully in $file"
}

# Function to extract a message from file metadata
extract_message_exif() {
    local file=$1

    # Check if the file exists
    if [[ ! -f "$file" ]]; then
        echo "Error: File not found!"
        exit 1
    fi

    # Extract the message from the file metadata
    exiftool -Comment "$file"
}

# Parse command-line arguments
COMMAND=""
FILE=""
MESSAGE=""
OUTPUT_FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        embed|extract)
            COMMAND=$1
            shift
            ;;
        -f|--file)
            FILE=$1
            FILE=$2
            shift 2
            ;;
        -m|--message)
            MESSAGE=$2
            shift 2
            ;;
        -o|--output)
            OUTPUT_FILE=$2
            shift 2
            ;;
        -h|--help)
            show_help
            ;;
        -v|--version)
            show_version
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            ;;
    esac
done

# Validate required arguments
if [[ -z "$COMMAND" ]]; then
    echo "Error: Command (embed or extract) is required."
    show_help
fi

if [[ -z "$FILE" ]]; then
    echo "Error: File (-f or --file) is required."
    show_help
fi

if [[ "$COMMAND" == "embed" && -z "$MESSAGE" ]]; then
    echo "Error: Message (-m or --message) is required for embedding."
    show_help
fi

# Execute the specified command
if [[ "$COMMAND" == "embed" ]]; then
    embed_message_exif "$FILE" "$MESSAGE" "$OUTPUT_FILE"
elif [[ "$COMMAND" == "extract" ]]; then
    extract_message_exif "$FILE"
else
    echo "Error: Invalid command. Use 'embed' or 'extract'."
    show_help
fi
