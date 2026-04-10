const fs = require('fs');
const { parse } = require('node-html-parser');

const content = fs.readFileSync('app/admin.html', 'utf8');
const root = parse(content);

const adminProdutos = root.getElementById('admin-produtos');
const adminCategorias = root.getElementById('admin-categorias');

if (adminProdutos && adminCategorias) {
    let isNested = false;
    let curr = adminCategorias.parentNode;
    while(curr) {
        if (curr.id === 'admin-produtos') {
            isNested = true;
            break;
        }
        curr = curr.parentNode;
    }
    
    console.log('Is Categorias nested in Produtos (Static Check)?', isNested);
    
    if (isNested) {
        console.log('Hierarchy trace:');
        let trace = [];
        let cur = adminCategorias;
        while(cur) {
            trace.push(`${cur.tagName} ${cur.id ? '(#' + cur.id + ')' : ''}`);
            cur = cur.parentNode;
        }
        console.log(trace.reverse().join(' > '));
    }
} else {
    console.log('Could not find ids.');
}
