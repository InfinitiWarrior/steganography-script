# steganography-script
adds/reads steganography from pictures and videos

Requirements:
    Ubuntu/debian:
        sudo apt-get install exiftool
    macOS(Using Homebrew):
        brew install exiftool

Script Explanation

    Commands:
        embed: Embeds a message into the file's metadata.
        extract: Extracts a message from the file's metadata.

    Options:
        -f, --file FILE: Specifies the target file (required).
        -m, --message MSG: Specifies the message to embed (required for the embed command).
        -o, --output FILE: Specifies the output file (optional, useful if you want to keep the original file unchanged).
        -h, --help: Displays a help message.
        -v, --version: Displays the script version.