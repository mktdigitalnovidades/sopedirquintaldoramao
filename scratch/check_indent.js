const fs = require('fs');
const content = fs.readFileSync('app/admin.html', 'utf8');
const lines = content.split('\n');

let level = 0;
for (let i = 0; i < lines.length; i++) {
    let line = lines[i];
    let tags = line.match(/<[a-zA-Z0-9]+(?:\s+[^>]*?)?>|<\/[a-zA-Z0-9]+>/g);
    
    let oldLevel = level;
    if (tags) {
        for (let tag of tags) {
            if (tag.startsWith('</')) {
                let tagName = tag.match(/<\/([a-zA-Z0-9]+)>/)[1].toLowerCase();
                if (['div', 'aside', 'main', 'section', 'header', 'nav'].includes(tagName)) level--;
            } else if (!tag.endsWith('/>')) {
                let tagNameMatch = tag.match(/<([a-zA-Z0-9]+)/);
                if (!tagNameMatch) continue;
                let tagName = tagNameMatch[1].toLowerCase();
                if (['div', 'aside', 'main', 'section', 'header', 'nav'].includes(tagName)) level++;
            }
        }
    }
    
    if (i + 1 >= 400 && i + 1 <= 550) {
        console.log(`${(i + 1).toString().padStart(4)} | ${oldLevel} -> ${level} | ${line.trim().substring(0, 50)}`);
    }
}
