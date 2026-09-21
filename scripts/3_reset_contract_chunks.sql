-- Drop table

DROP TABLE IF EXISTS contract_chunks;

-- Create table

CREATE TABLE contract_chunks (

    id SERIAL PRIMARY KEY,

    -- Contract this chunk belongs to
    contract_id INTEGER NOT NULL
        REFERENCES contracts(id)
        ON DELETE CASCADE,

    -- Position of the chunk within the contract
    chunk_index INTEGER NOT NULL,

    -- Extracted text
    content TEXT NOT NULL,

    -- Gemini embedding
    -- gemini-embedding-2 with output_dimensionality=768
    embedding vector(768) NOT NULL,

    -- Timestamp
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),

    -- Prevent duplicate chunk positions within a contract
    CONSTRAINT unique_contract_chunk
        UNIQUE (contract_id, chunk_index)
);
