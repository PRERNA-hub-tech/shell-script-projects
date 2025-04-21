
#!/bin/bash

echo "Enter the filename"
read filename

# Step 1: Check in current directory
if [[ -e "$filename" ]]; then
    filepath="$filename"
else
    echo "File not found in current directory, searching in the system..."
    filepath=$(find / -type f -name "$filename" 2>/dev/null | head -n 1)

    if [[ -z "$filepath" ]]; then
        echo "File not found in the system."
        exit 1
    fi
fi

# Final check — is filepath valid?
if [[ -n "$filepath" ]]; then
    echo "File found at : $filepath"

    echo "📄 File Analysis Report"
    echo "----------------------------"
    echo "📁 File Path     : $filepath"
    echo "📦 File Type     : $(file "$filepath")"
    echo "📏 File Size     : $(stat -c%s "$filepath") bytes"
    echo "🕒 Last Modified : $(stat -c%y "$filepath")"
    echo "✍️  Word Count    : $(wc -w < "$filepath")"
    echo "📚 Line Count    : $(wc -l < "$filepath")"
    echo "👤 Owner         : $(stat -c%U "$filepath")"
    echo "🔐 Permissions   : $(stat -c%A "$filepath")"
else
    echo "Something went wrong — file path is still empty."
fi


