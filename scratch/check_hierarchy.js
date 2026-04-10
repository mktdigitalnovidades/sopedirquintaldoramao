const fs = require('fs');
const content = fs.readFileSync('app/admin.html', 'utf8');
const lines = content.split('\n');

let stack = [];
for (let i = 0; i < lines.length; i++) {
    let line = lines[i].trim();
    if (i + 1 === 534) {
        console.log('Hierarchy at line 534:');
        stack.forEach(s => console.log(`- <${s.tag}> (line ${s.line})`));
    }
    
    let tags = lines[i].match(/<[a-zA-Z0-9]+(?:\s+[^>]*?)?>|<\/[a-zA-Z0-9]+>/g);
    if (!tags) continue;

    for (let tag of tags) {
        if (tag.startsWith('</')) {
            let tagName = tag.match(/<\/([a-zA-Z0-9]+)>/)[1].toLowerCase();
            if (stack.length > 0) {
                let last = stack.pop();
                if (last.tag !== tagName) {
                    stack.push(last); // Ignore mismatch for now to see hierarchy
                }
            }
        } else if (!tag.endsWith('/>')) {
            let tagNameMatch = tag.match(/<([a-zA-Z0-9]+)/);
            if (!tagNameMatch) continue;
            let tagName = tagNameMatch[1].toLowerCase();
            if (['img', 'input', 'br', 'hr', 'meta', 'link'].includes(tagName)) continue;
            stack.push({tag: tagName, line: i + 1});
        }
    }
}
