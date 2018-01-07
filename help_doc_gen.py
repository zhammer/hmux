#!/usr/bin/env python3

import collections
import re
import sys

# Extract regex(es)
CONF_HELP_LINE_RE = r'bind -T HELP (\w) (.*)(?:\s+#\s+(.*))'
# TODO: When the description capture group (?:#\s+(.*)) is optional, the command
# capture group (.*) greedily extends to the end of the line. I tried to fix this
# by making the command capture group ([^#*]), so that the command capture forcibly
# ends right at the # docstring signifier. This, however, breaks any tmux command that
# used the tmux formatting style (ex: #{window_name}). I tried a lazy qualifier (.*?)
# but that doesn't work. Is there a way to keep docstring capture group optional, but
# also have the command (.*) include all characters up to that group then end?

# Output formatters
HELP_PAGE_LINE_FMT = '{key:<8}{doc}'
HELP_PAGE_HEADER = 'You have typed C-h, the help character. Type a Help option:'
HelpLine = collections.namedtuple('HelpLine', 'key command docstring')

def extract_conf_file_help_bindings(conf_file):
    """Extract all lines in our config that are help key bindings and return them as aa list of
    HelpLine namedtuples."""
    with open(conf_file) as lines:
        return [HelpLine(*re.match(CONF_HELP_LINE_RE, line).groups()) for line in lines
                if re.match(CONF_HELP_LINE_RE, line)]

def sort_help_lines_by_key(help_lines):
    """Sort a list of help lines alphabetically by key."""
    return sorted(help_lines, key=lambda x: x.key.lower())


def format_help_line(helpline):
    """Format a HelpLine namedtuple for output to the hmux help page."""
    return HELP_PAGE_LINE_FMT.format(
        key=helpline.key,
        doc=(helpline.docstring or helpline.command)
    )

def main():
    """Main"""
    conf_file = sys.argv[1]
    help_lines = extract_conf_file_help_bindings(conf_file)
    help_lines = sort_help_lines_by_key(help_lines)

    print(HELP_PAGE_HEADER + '\n')
    for help_line in help_lines:
        print(format_help_line(help_line))


if __name__ == '__main__':
    main()
