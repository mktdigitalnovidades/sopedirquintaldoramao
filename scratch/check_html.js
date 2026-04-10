const fs = require('fs');
const content = fs.readFileSync('app/admin.html', 'utf8');

let stack = [];
let lines = content.split('\n');

for (let i = 0; i < lines.length; i++) {
    let line = lines[i];
    let tags = line.match(/<[a-zA-Z0-9]+(?:\s+[^>]*?)?>|<\/[a-zA-Z0-9]+>/g);
    if (!tags) continue;

    for (let tag of tags) {
        if (tag.startsWith('</')) {
            let tagNameMatch = tag.match(/<\/([a-zA-Z0-9]+)>/);
            if (!tagNameMatch) continue;
            let tagName = tagNameMatch[1].toLowerCase();
            if (stack.length === 0) {
                console.log(`ERROR: Extra closing tag </${tagName}> at line ${i + 1}`);
            } else {
                let last = stack.pop();
                if (last.tag !== tagName) {
                    console.log(`ERROR: Tag mismatch at line ${i + 1}! Expected </${last.tag}> (from line ${last.line}), found ${tag}`);
                    // Push back to try to recover
                    stack.push(last);
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

if (stack.length > 0) {
    console.log('Unclosed tags at end of file:');
    for (let item of stack) {
        console.log(`- <${item.tag}> opened at line ${item.line}`);
    }
} else {
    console.log('No unclosed tags found (at least they match).');
}
