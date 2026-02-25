#!/usr/bin/env bash
# install_snippets.sh — Prepend NoAiLicense headers to source files.
#
# Usage:
#   chmod +x install_snippets.sh
#   ./install_snippets.sh <target-directory>
#
# The script prepends the appropriate license header to every supported source
# file that does not already contain the NoAiLicense header.  Supported types:
#   C/C++      : *.c  *.cpp  *.h  *.hpp
#   Python     : *.py
#   JavaScript : *.js  *.ts  *.mjs
#
# A backup of each modified file is written to <file>.bak before modification.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

C_CPP_HEADER="${SCRIPT_DIR}/c_cpp_header.txt"
PYTHON_HEADER="${SCRIPT_DIR}/python_header.txt"
JS_HEADER="${SCRIPT_DIR}/js_header.txt"

MARKER="LicenseRef-NoAiLicense-Addendum"

# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------

usage() {
    echo "Usage: $0 <target-directory>"
    exit 1
}

check_headers() {
    for f in "$C_CPP_HEADER" "$PYTHON_HEADER" "$JS_HEADER"; do
        if [[ ! -f "$f" ]]; then
            echo "ERROR: header file not found: $f" >&2
            exit 1
        fi
    done
}

prepend_header() {
    local header_file="$1"
    local target_file="$2"

    # Skip if the marker is already present
    if grep -q "$MARKER" "$target_file" 2>/dev/null; then
        echo "  [skip]   $target_file (header already present)"
        return
    fi

    # Write backup
    cp "$target_file" "${target_file}.bak"

    # Prepend header + blank line then original content
    {
        cat "$header_file"
        echo ""
        cat "${target_file}.bak"
    } > "$target_file"

    echo "  [done]   $target_file"
}

# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------

if [[ $# -lt 1 ]]; then
    usage
fi

TARGET_DIR="$1"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "ERROR: '$TARGET_DIR' is not a directory." >&2
    exit 1
fi

check_headers

echo "Installing NoAiLicense headers in: $TARGET_DIR"
echo ""

# C / C++
while IFS= read -r -d '' file; do
    prepend_header "$C_CPP_HEADER" "$file"
done < <(find "$TARGET_DIR" -type f \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) -print0)

# Python
while IFS= read -r -d '' file; do
    prepend_header "$PYTHON_HEADER" "$file"
done < <(find "$TARGET_DIR" -type f -name "*.py" -print0)

# JavaScript / TypeScript
while IFS= read -r -d '' file; do
    prepend_header "$JS_HEADER" "$file"
done < <(find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.ts" -o -name "*.mjs" \) -print0)

echo ""
echo "Done. Backup files (*.bak) were created for every modified file."
