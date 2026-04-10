const fs = require('fs');
const content = fs.readFileSync('app/admin.html', 'utf8');
const lines = content.split('\n');

for (let i = 0; i < lines.length; i++) {
    let line = lines[i];
    // Simple check for unquoted attributes or broken tags
    let matches = line.match(/<[a-zA-Z0-9]+\s+([^>]+)>/g);
    if (matches) {
        for (let m of matches) {
            // Check for odd number of quotes
            let quotes = (m.match(/"/g) || []).length;
            if (quotes % 2 !== 0) {
                console.log(`POENTIAL ERROR: Odd number of quotes at line ${i + 1}: ${m}`);
            }
        }
    }
}
