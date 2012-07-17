# encoding: utf-8

import sys

lines = sys.stdin.readlines()

# Contact details are expected to begin on the fourth line, following the
# header and a blank line, and extend until the next blank line.  Lines with
# bullets (•) will be split into separate lines.
contact_lines = []
for line in lines[3:]:
    lines.remove(line)
    parts = [x.strip() for x in line.split("•")]
    if parts == ['']:
        break

    contact_lines.extend(parts)

if '--tex' in sys.argv:
    lines.insert(0, "\\begin{nospace}\\begin{flushright}\n" +
                    "\n\n".join(contact_lines) +
                    "\n\\end{flushright}\\end{nospace}\n")

    print "".join(lines)

if '--html' in sys.argv:
    lines.insert(0, "<div id='container'><div id='contact'>%s</div>\n" %
                        "<br>".join(contact_lines))
    lines.insert(1, "<div>")
    lines.append("</div>")

    print "".join(lines)
