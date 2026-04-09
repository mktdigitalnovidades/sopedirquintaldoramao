-- Script SQL para o Quintal do Ramão
-- Execute este código no SQL Editor do seu painel Supabase

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS quintal_pedidos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    customer_name TEXT,
    items JSONB,
    total DECIMAL(10,2),
    delivery_method TEXT,
    payment_method TEXT,
    address TEXT,
    status TEXT DEFAULT 'pendente'
);

-- Tabela de Produtos (Opcional, se quiser gerenciar via DB)
CREATE TABLE IF NOT EXISTS quintal_produtos (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    category TEXT,
    image_url TEXT,
    is_available BOOLEAN DEFAULT true
);

-- Habilitar RLS (Segurança)
ALTER TABLE quintal_pedidos ENABLE ROW LEVEL SECURITY;
ALTER TABLE quintal_produtos ENABLE ROW LEVEL SECURITY;

-- Políticas de Acesso
-- Permitir que qualquer pessoa insira pedidos (checkout público)
CREATE POLICY "Permitir inserção pública de pedidos" ON quintal_pedidos FOR INSERT WITH CHECK (true);

-- Permitir que apenas admins vejam os pedidos
CREATE POLICY "Permitir leitura de pedidos para admins" ON quintal_pedidos FOR SELECT USING (auth.jwt() ->> 'email' = 'contato@agentecstar.com');
CREATE POLICY "Permitir update de pedidos para admins" ON quintal_pedidos FOR UPDATE USING (auth.jwt() ->> 'email' = 'contato@agentecstar.com');

-- Produtos: todos podem ver, apenas admins editam
CREATE POLICY "Permitir leitura pública de produtos" ON quintal_produtos FOR SELECT USING (true);
CREATE POLICY "Permitir gestão de produtos para admins" ON quintal_produtos FOR ALL USING (auth.jwt() ->> 'email' = 'contato@agentecstar.com');
