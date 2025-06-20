#!/bin/bash 

#Crear table con datos layout 

CREATE TABLE Layout_general (
    Location VARCHAR(10),
    Cisco_SN VARCHAR(20),
    IP_Cisco VARCHAR(20),
    Model VARCHAR(30),
    Junniper_1 VARCHAR(30),
    IP_1 VARCHAR(20),
    Junniper_2 VARCHAR(30),
    IP_2 VARCHAR(20),
    Dlink_SN VARCHAR(30),
    IP_Dlink VARCHAR(20),
    Dlink_Model VARCHAR(30),
    UPS VARCHAR(30)
);

INSERT INTO Layout_general VALUES
('Bay 01', 'FDO22470P1B', '172.17.8.115', 'N9K-C9336C-FX2', 'NX3623031430', '172.17.8.114', 'N/A', 'N/A', '', 'N/A', '', 'HP');
('Bay 02', 'FDO23080252', '172.17.8.113', 'N9K-C9336C-FX2', 'NX3623031692', '172.17.8.112', 'N/A', 'N/A', '', 'N/A', '', 'HP');
INSERT INTO Layout_general VALUES ('Bay 03', 'FDO23080X6G', '172.17.8.111', 'N9K-C9336C-FX2', 'NX3622050521', '172.17.8.110', 'N/A', 'N/A', '', 'N/A', '', 'HP');
INSERT INTO Layout_general VALUES ('Bay 04', 'FOC2130R0KP', '172.17.8.124', 'N3K-C3132Q-40GX', '', 'N/A', 'N/A', '', '', '', '', 'HP');
INSERT INTO Layout_general VALUES ('Bay 05', 'FOC2139R10C', '172.17.8.122', 'N3K-C3132Q-40GX', 'NX3622050510', '172.17.8.121', 'N/A', 'N/A', '', 'N/A', '', 'HP');
INSERT INTO Layout_general VALUES ('Bay 06', 'FDO230701A1', '172.17.254.25', 'N9K-C9336C-FX2', '', '', '', '', '', '', '', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 07', 'FDO23080G4J', '172.17.254.37', 'N9K-C9336C-FX2', '', '', '', '', '', '', '', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 08', 'FOC2145R0GL', '172.17.2.246', 'N3K-C3132Q-40GX', '', '', '', '', '', '', 'DGS-1100-24V2', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 09', 'FOC2015R2PY', '172.17.4.250', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', 'HP');
INSERT INTO Layout_general VALUES ('Bay 10', 'FOC1850R235', '172.17.4.249', 'N3K-C3132Q-40GE', '', '', '', '', '', '', '', 'APC');
INSERT INTO Layout_general VALUES ('Bay 11', 'FOC1850R20P', '172.17.4.246', 'N3K-C3132Q-40GE', '', '', '', '', '', '', '', 'Under mainteinance');
INSERT INTO Layout_general VALUES ('Bay 12', 'FOC2136R1C5', '172.17.4.247', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', '');
INSERT INTO Layout_general VALUES ('Bay 13', 'FOC2139R10U', '172.17.0.253', 'N3K-C3132Q-40GX', '', '172.17.0.245', '', '', '', '', 'DGS-1100-24V2', 'APC');
INSERT INTO Layout_general VALUES ('Bay 14', 'FOC1906R1H8', '172.17.2.250', 'N3K-C3132Q-40GE', '', '', '', '', '', '', '', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 15', 'FOC1825R05V', '172.17.0.249', 'N3K-C3132Q-40GX', '', '', '', '', 'TY0M106000158', '172.17.0.129', 'DGS-1100-24V2', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 16', 'FOC2136R1B9', '172.17.0.251', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', '');
INSERT INTO Layout_general VALUES ('Bay 17', 'FOC1902R224', '172.17.0.248', 'N3K-C3132Q-40GX', '', '', '', '', '', '', 'DGS-1100-24V2', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 18', 'FOC2139R01C', '172.17.0.250', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', 'NO UPS');
INSERT INTO Layout_general VALUES ('Bay 19', 'FOC2139R1ZP', '172.17.2.247', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', 'APC');
INSERT INTO Layout_general VALUES ('Bay 20', 'FOC2234R17U', '172.17.2.249', 'N3K-C3132Q-V', 'NX3623031448', '172.17.254.13', '', '', '', '', '', 'APC');
INSERT INTO Layout_general VALUES ('Bay 21', 'FOC2136R1BE', '172.17.2.248', 'N3K-C3132Q-40GX', '', '', '', '', '', '', '', 'NO UPS');
