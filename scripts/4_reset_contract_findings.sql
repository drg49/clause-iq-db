-- Drop table

DROP TABLE IF EXISTS contract_findings;

-- Drop enum types

DROP TYPE IF EXISTS contract_finding_type;
DROP TYPE IF EXISTS contract_finding_severity;

-- Create enum types

CREATE TYPE contract_finding_type AS ENUM (
    'RISK',
    'MISSING_PROTECTION',
    'NEGOTIATION_OPPORTUNITY'
);

CREATE TYPE contract_finding_severity AS ENUM (
    'HIGH',
    'MEDIUM',
    'LOW'
);

-- Create table

CREATE TABLE contract_findings (

    id SERIAL PRIMARY KEY,

    -- Contract this finding belongs to
    contract_id INTEGER NOT NULL
        REFERENCES contracts(id)
        ON DELETE CASCADE,

    -- Finding classification
    type contract_finding_type NOT NULL,

    -- Severity
    -- Nullable because severity may not apply to every
    -- finding type.
    severity contract_finding_severity,

    -- Finding information
    title VARCHAR(255) NOT NULL,

    explanation TEXT NOT NULL,

    recommendation TEXT NOT NULL,

    -- Timestamp
    created_at TIMESTAMP NOT NULL DEFAULT NOW()

);
