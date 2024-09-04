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
