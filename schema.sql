-- ============================================================
-- Furniture Store Service Operations Database
-- Schema: defines all tables and relationships
-- Domain: Retail furniture store — post-sale service management
-- Author: Dikshya Mathema | BA/BSA Portfolio Project
-- ============================================================

CREATE DATABASE IF NOT EXISTS furniture_ops;
USE furniture_ops;

-- ------------------------------------------------------------
-- TABLE 1: CUSTOMERS
-- Stores customer profile and their original order reference.
-- Every service request links back to a customer.
-- Real world: pulled from store POS system (e.g. Bassett order numbers)
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id     INT             PRIMARY KEY AUTO_INCREMENT,
    full_name       VARCHAR(100)    NOT NULL,
    phone           VARCHAR(20),
    email           VARCHAR(100),
    order_number    VARCHAR(20)     UNIQUE NOT NULL,   -- store order reference e.g. 22502802223
    created_at      DATE            NOT NULL
);

-- ------------------------------------------------------------
-- TABLE 2: SERVICE_REQUESTS
-- Core table — tracks every post-sale service case.
-- One customer can have multiple service requests.
-- Status reflects real operational workflow stages.
-- Real world: created when customer reports an issue post-delivery
-- ------------------------------------------------------------
CREATE TABLE service_requests (
    service_id          INT             PRIMARY KEY AUTO_INCREMENT,
    customer_id         INT             NOT NULL,
    ticket_number       VARCHAR(20)     UNIQUE NOT NULL,   -- internal service ticket e.g. 7391557
    issue_description   TEXT            NOT NULL,
    product_type        VARCHAR(100),                      -- e.g. Reclining Chair, Sofa, Table
    cause               VARCHAR(100),                      -- e.g. Damage on Delivery, Manufacturing Defect
    status              VARCHAR(50)     NOT NULL,          -- see status values below
    /*
        STATUS VALUES:
        - Awaiting Parts          : parts ordered, not yet received
        - Pending Outside Tech    : parts received, waiting for tech to be scheduled
        - Scheduled               : tech appointment confirmed with customer
        - WIP                     : work in progress, tech visit ongoing
        - Update Customer         : needs follow up call or communication
        - No Response             : customer not responding to scheduling attempts
        - Refused Service         : customer declined service offer
        - Completed               : service fully resolved
    */
    created_date        DATE            NOT NULL,
    scheduled_date      DATE,                              -- NULL if not yet scheduled
    completed_date      DATE,                              -- NULL if not yet resolved
    tech_notes          TEXT,                              -- technician findings and comments
    assigned_to         VARCHAR(100),                      -- store staff handling the case
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ------------------------------------------------------------
-- TABLE 3: PARTS_ORDERS
-- Tracks individual parts ordered for a service request.
-- One service request can require multiple parts.
-- Real world: parts ordered from factory or distribution center
-- ------------------------------------------------------------
CREATE TABLE parts_orders (
    part_id             INT             PRIMARY KEY AUTO_INCREMENT,
    service_id          INT             NOT NULL,
    part_description    VARCHAR(200)    NOT NULL,          -- e.g. 36-inch tack strip, outside back panel
    sku                 VARCHAR(50),                       -- manufacturer SKU if available
    quantity            INT             DEFAULT 1,
    part_status         VARCHAR(50)     NOT NULL,          -- Ordered / In Production / Delivered / Cancelled
    ordered_date        DATE,
    estimated_delivery  DATE,
    delivered_date      DATE,                              -- NULL until physically received
    notes               TEXT,
    FOREIGN KEY (service_id) REFERENCES service_requests(service_id)
);
