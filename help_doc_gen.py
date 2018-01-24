#!/usr/bin/env python3

import collections
import re
import sys

# Config help binding extraction regex
CONF_HELP_BINDING_RE = r'bind -T HELP (\w) (.*)\s+#\s+(.*)'

# Output formatters
HELP_PAGE_LINE_FMT = '{key:<8}{doc}'
HELP_PAGE_HEADER = ('You have typed C-h, the help character. Type a Help option:\n'
                    '(Type q to exit the Help command.)')
HelpBinding = collections.namedtuple('HelpBinding', 'key command docstring')

def extract_help_bindings(tmux_conf_lines):
    """Extract all lines in an iterable of tmux config lines that are help key bindings and return
    them as a list of HelpBinding namedtuples."""
    return [HelpBinding(*re.match(CONF_HELP_BINDING_RE, line).groups()) for line in tmux_conf_lines
                if re.match(CONF_HELP_BINDING_RE, line)]

def sort_help_bindings_by_key(help_bindings):
    """Sort a list of help bindings alphabetically by key."""
    return sorted(help_bindings, key=lambda x: x.key.lower())


def format_help_binding(help_binding):
    """Format a HelpBinding namedtuple for output to the hmux help page."""
    return HELP_PAGE_LINE_FMT.format(
        key=help_binding.key,
        doc=(help_binding.docstring)
    )

def main():
    """Main"""
    with open(sys.argv[1]) as tmux_conf_file:
        tmux_conf_lines = [line for line in tmux_conf_file]

    help_bindings = extract_help_bindings(tmux_conf_lines)
    help_bindings = sort_help_bindings_by_key(help_bindings)

    print(HELP_PAGE_HEADER + '\n')
    for help_binding in help_bindings:
        print(format_help_binding(help_binding))


if __name__ == '__main__':
    main()
