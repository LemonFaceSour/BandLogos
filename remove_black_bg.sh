#!/bin/bash

# INSTALL MAGICK FISRT
# This script uses Magick to remove the black background and leave a transparent PNG. 
# Instructions to Install:
# https://imagemagick.org/script/download.php

# Set the directory where images are stored
IMAGE_DIR="Artists"  # Change this if needed

# Find all artist.jpeg files
find "$IMAGE_DIR" -type f -name "artist.jpeg" | while read -r image; do
    # Define output path (same directory, different filename)
    output_image="${image%/*}/artist.png"

    # Check if the output image already exists
    if [[ -f "$output_image" ]]; then
        echo "Skipping $image (artist_no_bg.png already exists)"
        continue
    fi

    echo "Processing: $image"

    # Run ImageMagick command to remove black background
    magick "$image" -alpha set -background none -fuzz 40% -transparent black "$output_image"

    echo "Saved: $output_image"
done
