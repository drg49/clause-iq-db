-- Drop table

DROP TABLE IF EXISTS finding_chunks;

-- Create table

CREATE TABLE finding_chunks (

    id SERIAL PRIMARY KEY,

    -- Finding
    finding_id INTEGER NOT NULL
        REFERENCES contract_findings(id)
        ON DELETE CASCADE,

    -- Supporting contract chunk
    chunk_id INTEGER NOT NULL
        REFERENCES contract_chunks(id)
        ON DELETE CASCADE,

    -- Order in which the evidence should be presented
    evidence_order INTEGER NOT NULL,

    -- Prevent the same chunk from being attached
    -- to the same finding more than once.
    CONSTRAINT unique_finding_chunk
        UNIQUE (finding_id, chunk_id)

);
