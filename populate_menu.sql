-- Script para popular o cardápio do Quintal do Ramão
-- Copie e cole este código no SQL Editor do seu Supabase

-- Limpar dados existentes para evitar duplicatas (OPCIONAL)
-- DELETE FROM quintal_produtos;
-- DELETE FROM quintal_categorias;

-- 1. Inserir Categorias
INSERT INTO quintal_categorias (name, slug, icon) VALUES
('Marmitas (1 Pessoa)', 'marmitas-1-pessoa', 'restaurant'),
('Marmitas (2 Pessoas)', 'marmitas-2-pessoas', 'group'),
('Lanches', 'lanches', 'lunch_dining'),
('Lanches Prensados', 'lanches-prensados', 'lunch_dining'),
('Porções', 'porcoes', 'restaurant_menu'),
('Bebidas e Cervejas', 'bebidas-cervejas', 'local_bar'),
('Bebidas Quentes', 'bebidas-quentes', 'liquor'),
('Refrigerantes', 'bebidas-refrigerantes', 'local_drink'),
('Bebidas sem Álcool', 'bebidas-sem-alcool', 'water_drop');

-- 2. Inserir Produtos
INSERT INTO quintal_produtos (name, price, category, description, is_available) VALUES
-- MARMITAS 1 PESSOA
('Omelete de Queijo', 25.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Filé de Frango', 25.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('2 Filé de Frango', 30.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Frango Empanado', 27.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Parmeggiana de Frango', 29.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Frango Emp c/ Catupiry', 30.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Hamburguer', 35.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Picanha', 39.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Bife à Milanesa', 39.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),
('Do Dia', 22.00, 'marmitas-1-pessoa', 'Acompanhado das Guarnições: Arroz, Feijão, Farofa, Legumes, Ovo frito, Salada e Fritas (Escolha entre: Batata Frita, Nuggets, Polenta Frita ou Mandioca Frita)', true),

-- MARMITAS 2 PESSOAS
('Fraldinha na Mostarda (800g)', 250.00, 'marmitas-2-pessoas', 'Acompanha: Arroz, Feijão, Farofa, Vinagrete, Fritas e Ovo Frito. (TODAS AS NOSSAS PROTEÍNAS SÃO DA EMPORIO NOVILHO).', true),
('Beef de Tira (750g)', 245.00, 'marmitas-2-pessoas', 'Acompanha: Arroz, Feijão, Farofa, Vinagrete, Fritas e Ovo Frito. (TODAS AS NOSSAS PROTEÍNAS SÃO DA EMPORIO NOVILHO).', true),
('Shoulder Steak (600g)', 205.00, 'marmitas-2-pessoas', 'Acompanha: Arroz, Feijão, Farofa, Vinagrete, Fritas e Ovo Frito. (TODAS AS NOSSAS PROTEÍNAS SÃO DA EMPORIO NOVILHO).', true),
('Pernil de Cordeiro (600g)', 0.00, 'marmitas-2-pessoas', 'Acompanha: Arroz, Feijão, Farofa, Vinagrete, Fritas e Ovo Frito. (TODAS AS NOSSAS PROTEÍNAS SÃO DA EMPORIO NOVILHO).', true),

-- LANCHES
('Frango Crocante', 25.00, 'lanches', '(Pão Brioche, Maionese de Bacon / Maionese de Mostarda Dijon, Alface Americana, Frango Empanado na Panko e Queijo Cheddar / Catupiry / Mussarela)', true),
('Filézinho', 35.00, 'lanches', '(Pão Brioche, Maionese de Bacon / Maionese de Mostarda Dijon, Alface Americana, Bife à Milanesa e Queijo Cheddar / Catupiry / Mussarela)', true),
('Classic', 35.00, 'lanches', '(Pão Brioche, Maionese de Bacon / Maionese de Mostarda Dijon, Alface Americana, Hambúrguer, Queijo Cheddar / Catupiry / Mussarela, Tomate e Cebola Roxa)', true),
('Cheddar & Bacon', 35.00, 'lanches', '(Pão Brioche, Hambúrguer, Queijo Cheddar / Catupiry / Mussarela, Bacon, Cebola e Mel)', true),
('Viela', 35.00, 'lanches', '(Pão Brioche, Hambúrguer, Queijo Cheddar / Catupiry / Mussarela, Picles, Cebola, Ketchup e Mostarda)', true),
('Cheesburguer', 30.00, 'lanches', '(Pão Brioche, Hambúrguer, Queijo Cheddar / Catupiry / Mussarela)', true),

-- LANCHES PRENSADOS
('X Salada', 40.00, 'lanches-prensados', '(Pão Prensado, Maionese de Mostarda Dijon, Alface Americana, Hambúrguer, Mussarela, Tomate e Cebola Roxa)', true),
('X Bacon', 45.00, 'lanches-prensados', '(Pão Prensado, Maionese de Bacon, Alface, Hambúrguer, Mussarela e Bacon)', true),
('X Egg', 40.00, 'lanches-prensados', '(Pão Prensado, Maionese de Mostarda Dijon, Alface Americana, Hambúrguer, Mussarela e Ovo Frito)', true),
('X Quintal', 55.00, 'lanches-prensados', '(Pão Prensado, Maionese de Bacon, Ketchup, Mostarda, Alface, Hambúrguer, Catupiry e Milho)', true),

-- PORÇÕES
('Fritas, Mandioca ou Polenta', 45.00, 'porcoes', 'Porção clássica do Quintal.', true),
('Picadinho de Carne Acebolado', 90.00, 'porcoes', 'COM CATUPIRY E ALHO FRITO 500G. Acompanha pão de alho da casa.', true),
('Picadinho de Frango Acebolado', 60.00, 'porcoes', 'COM CATUPIRY E ALHO FRITO 500G. Acompanha pão de alho da casa.', true),
('Tiras de Fígado Acebolado (500G)', 45.00, 'porcoes', 'Acompanha pão de alho da casa.', true),
('Bife à Milanesa', 45.00, 'porcoes', 'COM MOLHO DE QUEIJO(FAVOR CONSULTAR O DO DIA). Acompanha pão de alho da casa.', true),
('Linguicinha da Empório', 75.00, 'porcoes', 'Acompanha pão de alho da casa.', true),
('Picanha com Creme de Gorgonzola', 165.00, 'porcoes', 'Acompanha pão de alho da casa.', true),

-- BEBIDAS E CERVEJAS
('Heineken', 17.00, 'bebidas-cervejas', 'Cerveja Long Neck/Garrafa', true),
('Original', 16.00, 'bebidas-cervejas', 'Cerveja 600ml', true),
('Antártica', 14.00, 'bebidas-cervejas', 'Cerveja 600ml', true),
('Brahma', 12.00, 'bebidas-cervejas', 'Cerveja 600ml', true),
('Long Neck', 12.00, 'bebidas-cervejas', 'Diversas marcas', true),

-- BEBIDAS QUENTES
('Cachaça Prata', 6.00, 'bebidas-quentes', 'Dose', true),
('Cachaça Ouro', 8.00, 'bebidas-quentes', 'Dose', true),
('Licor da Casa', 8.00, 'bebidas-quentes', 'Dose', true),
('Caipirinha', 25.00, 'bebidas-quentes', 'Limão ou Frutas da Estação', true),
('Wisky', 30.00, 'bebidas-quentes', 'Dose', true),

-- REFRIGERANTES
('Refrigerante Lata', 8.00, 'bebidas-refrigerantes', '350ml', true),
('Refrigerante 600 ml', 11.00, 'bebidas-refrigerantes', '600ml', true),
('Refrigerante 2 litros', 18.00, 'bebidas-refrigerantes', '2 Litros', true),

-- BEBIDAS SEM ÁLCOOL
('Água sem Gás', 7.00, 'bebidas-sem-alcool', '500ml', true),
('Água com Gás', 8.00, 'bebidas-sem-alcool', '500ml', true),
('Suco Del Valle', 9.00, 'bebidas-sem-alcool', 'Lata', true),
('H2O', 10.00, 'bebidas-sem-alcool', '500ml', true);
