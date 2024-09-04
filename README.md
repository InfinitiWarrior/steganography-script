# Steganography Script

**Steganography Script** is a simple command-line tool for embedding and extracting hidden messages in the metadata of image and video files using `ExifTool`.

## Requirements

### Ubuntu/Debian

To install `ExifTool`, use the following command:

`sudo apt-get install exiftool`

### macOS

If you're using Homebrew, install `ExifTool` with:

`brew install exiftool`

## Script Overview

The script provides two main functionalities:
- **Embedding a message** into the metadata of a file.
- **Extracting a message** from the metadata of a file.

### Commands

- **`embed`**: Embeds a message into the file's metadata.
- **`extract`**: Extracts a message from the file's metadata.

### Options

- **`-f`, `--file FILE`**: Specifies the target file (required for both commands).
- **`-m`, `--message MSG`**: Specifies the message to embed (required for the `embed` command).
- **`-o`, `--output FILE`**: Specifies the output file (optional, useful if you want to keep the original file unchanged).
- **`-h`, `--help`**: Displays the help message.
- **`-v`, `--version`**: Displays the script version.

## Usage

### Embedding a Message

To embed a message into the metadata of a file, use the `embed` command. Here’s the syntax:

`./steg_tool.sh embed -f <file> -m "<message>" [-o <output>]`

**Example:**

`./steg_tool.sh embed -f image.jpg -m "This is a hidden message" -o output.jpg`

In this example:
- `image.jpg` is the target file.
- `"This is a hidden message"` is the message to embed.
- `output.jpg` is the file that will contain the hidden message. If not specified, the original file will be overwritten.

### Extracting a Message

To extract a hidden message from the metadata of a file, use the `extract` command. Here’s the syntax:

`./steg_tool.sh extract -f <file>`

**Example:**

`./steg_tool.sh extract -f image.jpg`

In this example:
- `image.jpg` is the file from which to extract the hidden message.

### Help and Version

To display the help message:

`./steg_tool.sh -h`

To display the script version:

`./steg_tool.sh -v`

## Script Details

**Script File**: `steg_tool.sh`

**Version**: 1.0

**Author**: [Your Name]

**License**: MIT License

## Additional Information

- **Backup Files**: ExifTool creates a backup of the original file by default (e.g., `file.jpg_original`). The script removes this backup or renames it based on the `-o` option.
- **File Formats**: This script works with files that support metadata, including JPG, PNG, MP3, and MP4. Ensure that your file type supports the metadata field used for embedding messages.
- **Security Note**: Metadata can be easily accessed and modified. For sensitive information, consider using additional encryption methods.

For any issues or feature requests, please contact [Your Contact Information] or open an issue on the [repository page](#).
