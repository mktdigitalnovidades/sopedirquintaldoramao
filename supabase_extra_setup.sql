-- Script SQL Extra para o Quintal do Ramão
-- Execute este código no SQL Editor do seu painel Supabase para habilitar as novas funções

-- 1. Tabela de Configurações da Loja
CREATE TABLE IF NOT EXISTS quintal_configs (
    id SERIAL PRIMARY KEY,
    key TEXT UNIQUE NOT NULL,
    value JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Tabela de Estoque
CREATE TABLE IF NOT EXISTS quintal_estoque (
    id SERIAL PRIMARY KEY,
    item_name TEXT NOT NULL,
    category TEXT,
    quantity DECIMAL(10,2) DEFAULT 0,
    unit TEXT, -- kg, un, l, etc
    min_quantity DECIMAL(10,2) DEFAULT 0,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Tabela de Equipe
CREATE TABLE IF NOT EXISTS quintal_equipe (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    role TEXT,
    shift TEXT,
    avatar_url TEXT,
    status TEXT DEFAULT 'ativo', -- ativo, ausente, ferias
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);


-- 4. Tabela de Categorias
CREATE TABLE IF NOT EXISTS quintal_categorias (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    icon TEXT DEFAULT 'restaurant',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Seed de Categorias Iniciais
INSERT INTO quintal_categorias (name, slug, icon) VALUES 
('Lanches', 'lanches', 'lunch_dining'),
('Prensados', 'prensados', 'lunch_dining'),
('Porções', 'porcoes', 'restaurant_menu'),
('Marmitex', 'marmitex', 'takeout_dining'),
('Bebidas', 'bebidas', 'local_bar')
ON CONFLICT (slug) DO NOTHING;

-- 5. Habilitar RLS
ALTER TABLE quintal_configs ENABLE ROW LEVEL SECURITY;
ALTER TABLE quintal_estoque ENABLE ROW LEVEL SECURITY;
ALTER TABLE quintal_equipe ENABLE ROW LEVEL SECURITY;
ALTER TABLE quintal_categorias ENABLE ROW LEVEL SECURITY;

-- 6. Políticas de Segurança (Extra)
CREATE POLICY "Leitura pública de categorias" ON quintal_categorias FOR SELECT USING (true);
CREATE POLICY "Gestão de categorias para admins" ON quintal_categorias FOR ALL USING (auth.jwt() ->> 'email' IN ('contato@agentecstar.com', 'agentecstar@gmail.com'));

-- 7. Políticas para o Storage (Buckets - execute se o storage estiver habilitado)
-- Nota: O bucket 'produtos' deve ser criado no Painel do Supabase primeiro
-- Permite leitura pública de objetos no bucket 'produtos'
-- CREATE POLICY "Public Access" ON storage.objects FOR SELECT USING ( bucket_id = 'produtos' );
-- Permite upload para admins
-- CREATE POLICY "Admin Upload" ON storage.objects FOR INSERT WITH CHECK ( bucket_id = 'produtos' AND auth.jwt() ->> 'email' IN ('contato@agentecstar.com', 'agentecstar@gmail.com') );

-- 6. Inserir Configurações Iniciais (Se não existirem)
INSERT INTO quintal_configs (key, value) VALUES 
('store_info', '{"name": "Quintal do Ramão", "whatsapp": "19987654321", "address": "Rua Exemplo, 123", "theme": "dark", "primary_color": "#ffb874"}'::jsonb)
ON CONFLICT (key) DO NOTHING;
