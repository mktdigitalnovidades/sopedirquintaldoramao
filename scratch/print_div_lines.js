const fs = require('fs');
const content = fs.readFileSync('app/admin.html', 'utf8');
const lines = content.split('\n');

for (let i = 0; i < lines.length; i++) {
    let line = lines[i];
    let tags = line.match(/<div|<\/div/g);
    if (tags) {
        console.log(`${(i + 1).toString().padStart(4)} | ${tags.join(' ')} | ${line.trim().substring(0, 40)}`);
    }
}
