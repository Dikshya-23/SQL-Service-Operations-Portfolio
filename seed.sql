-- ============================================================
-- Customer Service Operations Database
-- Seed Data: sample data based on real operational workflow
-- Domain: Retail — post-sale service management
-- ============================================================

USE furniture_ops;

-- ------------------------------------------------------------
-- CUSTOMERS (18 records)
-- Fake names replacing real customer data
-- Order numbers follow store format (11 digits)
-- ------------------------------------------------------------
INSERT INTO customers (full_name, phone, email, order_number, created_at) VALUES
('James Holloway',   '636-555-0101', 'james.holloway@email.com',   '22503801001', '2026-01-15'),
('Patricia Nguyen',  '636-555-0102', 'patricia.nguyen@email.com',  '22503801002', '2026-01-22'),
('Robert Castellan', '636-555-0103', NULL,                          '22503801003', '2026-02-03'),
('Sandra Okafor',    '636-555-0104', 'sandra.okafor@email.com',    '22503801004', '2026-02-14'),
('Michael Tran',     '636-555-0105', 'michael.tran@email.com',     '22503801005', '2026-02-28'),
('Linda Ferreira',   '636-555-0106', NULL,                          '22503801006', '2026-03-07'),
('Kevin Ostrowski',  '636-555-0107', 'kevin.ostrowski@email.com',  '22503801007', '2026-03-19'),
('Barbara Simmons',  '636-555-0108', 'barbara.simmons@email.com',  '22503801008', '2026-03-25'),
('Thomas Eklund',    '636-555-0109', 'thomas.eklund@email.com',    '22503801009', '2026-04-02'),
('Carol Beaumont',   '636-555-0110', 'carol.beaumont@email.com',   '22503801010', '2026-04-10'),
('Gary Pimentel',    '636-555-0111', 'gary.pimentel@email.com',    '22503801011', '2026-04-18'),
('Susan Delacroix',  '636-555-0112', NULL,                          '22503801012', '2026-04-25'),
('William Nakamura', '636-555-0113', 'william.nakamura@email.com', '22503801013', '2026-05-03'),
('Dorothy Vasquez',  '636-555-0114', 'dorothy.vasquez@email.com',  '22503801014', '2026-05-11'),
('Charles Mbeki',    '636-555-0115', 'charles.mbeki@email.com',    '22503801015', '2026-05-20'),
('Helen Johansson',  '636-555-0116', 'helen.johansson@email.com',  '22503801016', '2026-05-28'),
('Frank Abramowitz', '636-555-0117', NULL,                          '22503801017', '2026-06-04'),
('Margaret Osei',    '636-555-0118', 'margaret.osei@email.com',    '22503801018', '2026-06-09');

-- ------------------------------------------------------------
-- SERVICE REQUESTS (18 records)
-- Covers all real status types from operational workflow
-- assigned_to: 'Diana Reyes' = SOA (you), 'Mark Sullivan' = Manager
-- ------------------------------------------------------------
INSERT INTO service_requests (
    customer_id, ticket_number, issue_description, product_type,
    cause, status, created_date, scheduled_date, completed_date,
    tech_notes, assigned_to
) VALUES

-- AWAITING PARTS
(1, 'SVC-7001', 
 'Customer received reclining chair with damaged outside back panels on both units. Motor head came unplugged on delivery. Two chairs affected.',
 'Reclining Chair', 'Damage on Delivery', 'Awaiting Parts',
 '2026-04-20', NULL, NULL,
 'Tech inspected both units. Outside back panels torn on both chairs. Motor head on unit 1 unplugged and reseated. Need 2x outside back panels and tack strips for both units.',
 'Diana Reyes'),

(2, 'SVC-7002',
 'Sofa delivered with black stains and scuff marks on the right arm and seat cushion.',
 'Sofa', 'Damage on Delivery', 'Awaiting Parts',
 '2026-04-25', NULL, NULL,
 'Tech confirmed stains are from delivery handling. New cut and sewn arm cover required. Currently in production at factory.',
 'Diana Reyes'),

(3, 'SVC-7003',
 'Table leg arrived cracked at the base. Customer noticed damage upon unboxing.',
 'Dining Table', 'Manufacturing Defect', 'Awaiting Parts',
 '2026-05-01', NULL, NULL,
 'Part ordered. Replacement leg SKU 2901-44LG confirmed with factory. Estimated 2 weeks production.',
 'Diana Reyes'),

-- PENDING OUTSIDE TECH
(4, 'SVC-7004',
 'Sectional sofa has a visible tear on the outside right panel. Noticed after delivery team left.',
 'Sectional Sofa', 'Damage on Delivery', 'Pending Outside Tech',
 '2026-04-15', NULL, NULL,
 'Parts received May 20. Replacement panel in store. Waiting to schedule outside tech for installation.',
 'Diana Reyes'),

(5, 'SVC-7005',
 'Recliner mechanism not functioning correctly. Chair not returning to upright position smoothly.',
 'Recliner', 'Manufacturing Defect', 'Pending Outside Tech',
 '2026-04-28', NULL, NULL,
 'Replacement mechanism received. Ready for tech visit.',
 'Mark Sullivan'),

(6, 'SVC-7006',
 'Seat cushion casing seams misaligned on delivery. Factory confirmed this is within standard but customer unhappy.',
 'Sofa Chair', 'Manufacturing Defect', 'Pending Outside Tech',
 '2026-05-10', NULL, NULL,
 'Per factory, seams on casings are supposed to be that way for this model. Customer wants follow up before closing.',
 'Diana Reyes'),

-- SCHEDULED
(7, 'SVC-7007',
 'Headboard delivered with rub marks and scratches on the left panel.',
 'Bed Frame', 'Damage on Delivery', 'Scheduled',
 '2026-05-05', '2026-06-10', NULL,
 'Tech scheduled for June 10 between 10am and 12pm. Customer confirmed.',
 'Diana Reyes'),

(8, 'SVC-7008',
 'Sofa legs uneven causing wobble. Customer reports furniture rocks on flat floor.',
 'Sofa', 'Manufacturing Defect', 'Scheduled',
 '2026-05-12', '2026-06-12', NULL,
 'Parts received May 28. Service scheduled June 12 between 11am and 1pm.',
 'Diana Reyes'),

(9, 'SVC-7009',
 'Accent chair fabric pilling excessively after two weeks of normal use.',
 'Accent Chair', 'Manufacturing Defect', 'Scheduled',
 '2026-05-18', '2026-07-01', NULL,
 'Replacement fabric panel ordered and delivered. Tech scheduled July 1.',
 'Mark Sullivan'),

-- WIP
(10, 'SVC-7010',
 'Power recliner not responding to remote. USB port also not charging.',
 'Power Recliner', 'Manufacturing Defect', 'WIP',
 '2026-05-20', '2026-06-05', NULL,
 'Tech visited June 5. Found wiring harness loose. Ordered replacement harness. Return visit needed once part arrives.',
 'Diana Reyes'),

-- UPDATE CUSTOMER
(11, 'SVC-7011',
 'Ottoman delivered with stain on top fabric. Customer wants replacement or repair.',
 'Ottoman', 'Damage on Delivery', 'Update Customer',
 '2026-05-22', NULL, NULL,
 'Parts ordered. Need to call customer with estimated delivery update. Left one voicemail so far.',
 'Diana Reyes'),

(12, 'SVC-7012',
 'Dresser drawer not closing flush. Gap visible on left side when closed.',
 'Dresser', 'Manufacturing Defect', 'Update Customer',
 '2026-05-25', NULL, NULL,
 'Waiting for clarity from factory on which hardware SKU is needed for this model. Left multiple voicemails internally. Need to advise customer once confirmed.',
 'Mark Sullivan'),

-- NO RESPONSE
(13, 'SVC-7013',
 'Dining chair seat cushion has loose stitching on two corners.',
 'Dining Chair', 'Manufacturing Defect', 'No Response',
 '2026-05-15', NULL, NULL,
 'Called customer three times. Left voicemails each time. No response received. Will attempt again next week.',
 'Diana Reyes'),

(14, 'SVC-7014',
 'Customer reported delivery team left scratch on hardwood floor near sofa placement area.',
 'Sofa', 'Damage on Delivery', 'No Response',
 '2026-05-28', NULL, NULL,
 'Customer out of town until July 6. Will follow up after that date.',
 'Diana Reyes'),

-- REFUSED SERVICE
(15, 'SVC-7015',
 'Sofa fabric cleaned by tech but customer reports chemical smell causing headaches. Wants to reselect.',
 'Sofa', 'Post Service Complaint', 'Refused Service',
 '2026-05-08', '2026-06-02', NULL,
 'Customer refused second service visit. Does not want unit cleaned again due to chemical sensitivity. Requesting reselect option. Escalated to manager.',
 'Mark Sullivan'),

(16, 'SVC-7016',
 'Recliner handle feels loose. Customer declined tech visit after initial scheduling.',
 'Recliner', 'Manufacturing Defect', 'Refused Service',
 '2026-05-30', '2026-06-08', NULL,
 'Customer refused service on scheduled date. Did not want technician in home. Case on hold.',
 'Diana Reyes'),

-- COMPLETED
(17, 'SVC-7017',
 'Coffee table top had visible scratch from packaging. Replacement top panel requested.',
 'Coffee Table', 'Damage on Delivery', 'Completed',
 '2026-04-05', '2026-05-10', '2026-05-10',
 'Tech replaced top panel successfully. Customer satisfied. Case closed.',
 'Diana Reyes'),

(18, 'SVC-7018',
 'Nightstand drawer handle missing from delivery. Customer requested replacement hardware.',
 'Nightstand', 'Missing Parts on Delivery', 'Completed',
 '2026-04-10', '2026-04-28', '2026-04-28',
 'Replacement handle delivered and installed by tech. Customer confirmed satisfaction. Case closed.',
 'Diana Reyes');

-- ------------------------------------------------------------
-- PARTS ORDERS (22 records)
-- Multiple parts per service where applicable
-- Covers: Ordered, In Production, Delivered, Cancelled
-- ------------------------------------------------------------
INSERT INTO parts_orders (
    service_id, part_description, sku, quantity,
    part_status, ordered_date, estimated_delivery, delivered_date, notes
) VALUES

-- SVC-7001 (James Holloway - two chairs, multiple parts)
(1, 'Outside back panel - Reclining Chair Unit 1', '2900-BP-CH1', 1, 'In Production', '2026-04-22', '2026-06-15', NULL,
 'Cut and sewn panel. Currently in production at factory.'),
(1, 'Outside back panel - Reclining Chair Unit 2', '2900-BP-CH2', 1, 'In Production', '2026-04-22', '2026-06-15', NULL,
 'Same model as unit 1. Ordered together.'),
(1, '36-inch long tack strips', '2900-TS-36', 2, 'Delivered', '2026-04-22', '2026-06-01', '2026-06-05',
 'Delivered June 5. Stored in back warehouse ready for tech visit.'),

-- SVC-7002 (Patricia Nguyen - sofa arm cover)
(2, 'Cut and sewn arm cover - Sofa Right Arm', '2901-AC-RSF', 1, 'In Production', '2026-04-27', '2026-06-20', NULL,
 'Factory confirmed part is in production. No ETA update yet.'),

-- SVC-7003 (Robert Castellan - table leg)
(3, 'Replacement dining table leg - base unit', '2901-44LG', 1, 'Ordered', '2026-05-03', '2026-05-24', NULL,
 'Standard 2 week lead time from factory.'),

-- SVC-7004 (Sandra Okafor - sectional panel)
(4, 'Replacement outside right panel - Sectional', '2902-RP-SEC', 1, 'Delivered', '2026-04-18', '2026-05-15', '2026-05-20',
 'Received May 20. Stored and ready for outside tech installation.'),

-- SVC-7005 (Michael Tran - recliner mechanism)
(5, 'Recliner return mechanism assembly', '2900-RM-ASM', 1, 'Delivered', '2026-04-30', '2026-05-20', '2026-05-22',
 'Mechanism received. Awaiting tech scheduling.'),

-- SVC-7006 (Linda Ferreira - casing)
(6, 'Seat casing - LSF position', '2900-72TM-LSF', 1, 'Ordered', '2026-05-12', '2026-06-05', NULL,
 'Awaiting factory confirmation on correct SKU. Do not process PO until confirmed.'),

-- SVC-7007 (Kevin Ostrowski - headboard panel)
(7, 'Left panel replacement - Bed headboard', '2903-HP-LFT', 1, 'Delivered', '2026-05-07', '2026-05-28', '2026-05-30',
 'Part received. Tech visit confirmed June 10.'),

-- SVC-7008 (Barbara Simmons - sofa legs)
(8, 'Replacement sofa leg set - 4 pack', '2901-SL-4PK', 1, 'Delivered', '2026-05-14', '2026-05-25', '2026-05-28',
 'Full set of 4 legs delivered. Tech scheduled June 12.'),

-- SVC-7009 (Thomas Eklund - fabric panel)
(9, 'Accent chair fabric replacement panel', '2904-FP-ACC', 1, 'Delivered', '2026-05-20', '2026-06-10', '2026-06-12',
 'Panel delivered. Tech visit July 1 confirmed.'),

-- SVC-7010 (Carol Beaumont - wiring harness)
(10, 'Power recliner wiring harness', '2900-WH-PWR', 1, 'Ordered', '2026-06-06', '2026-06-20', NULL,
 'Ordered after tech visit June 5. Required for second visit.'),

-- SVC-7011 (Gary Pimentel - ottoman fabric)
(11, 'Ottoman top fabric replacement', '2905-OT-TOP', 1, 'Ordered', '2026-05-24', '2026-06-14', NULL,
 'Standard order. ETA 3 weeks. Customer to be updated once confirmed.'),

-- SVC-7012 (Susan Delacroix - drawer hardware)
(12, 'Dresser drawer alignment hardware kit', '2906-DW-HW', 2, 'Ordered', '2026-05-27', '2026-06-17', NULL,
 'SKU unconfirmed. Do not process until factory clarifies correct part for this model.'),

-- SVC-7017 (Frank Abramowitz - coffee table - COMPLETED)
(17, 'Coffee table top replacement panel', '2907-CT-TOP', 1, 'Delivered', '2026-04-07', '2026-04-28', '2026-05-02',
 'Delivered and installed successfully. Case closed.'),

-- SVC-7018 (Margaret Osei - nightstand handle - COMPLETED)
(18, 'Nightstand drawer handle - brushed nickel', '2908-NS-HDL', 1, 'Delivered', '2026-04-12', '2026-04-22', '2026-04-24',
 'Handle delivered and installed. Customer satisfied.');
