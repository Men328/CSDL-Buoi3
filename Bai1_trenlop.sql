USE `session04`;

-- EX2
ALTER TABLE `Building`
ADD FOREIGN KEY (`host_id`) REFERENCES `host`(id);

ALTER TABLE `Building`
ADD FOREIGN KEY (`contractor_id`) REFERENCES `contractor`(`id`);

ALTER TABLE `Work`
ADD FOREIGN KEY (`Building_id`) REFERENCES `Building`(`id`);

ALTER TABLE `Design`
ADD FOREIGN KEY (`building_id`) REFERENCES `Building`(`id`);

ALTER TABLE `Design`
ADD FOREIGN KEY (`architect_id`) REFERENCES `architect`(`id`);

-- EX3
SELECT * FROM `architect`;

SELECT `name`, `sex` FROM `architect`;

SELECT DISTINCT `birthday` FROM `architect`;

SELECT `name`, `birthday` FROM `architect`
ORDER BY `birthday` ASC;

SELECT `name`, `birthday` FROM `architect`
ORDER BY `birthday` DESC;

SELECT * FROM `building`
ORDER BY `cost` ASC, `name` ASC;

-- EX4
SELECT * FROM `architect`
WHERE `name` = 'Le Thanh Tung';

SELECT `name`, `birthday` FROM worker
WHERE `skill` IN ('Hàn', 'Điện');

SELECT name FROM `worker`
WHERE (`skill` = 'Hàn' OR `skill` = 'Điện')
AND `birthday` > 1948;

SELECT * FROM `worker`
WHERE `birthday` < `birthday` + 20;

SELECT * FROM `worker`
WHERE `birthday` IN (1945, 1940, 1948);

SELECT * FROM `worker`
WHERE `birthday` = 1945 
   OR `birthday` = 1940 
   OR `birthday` = 1948;

SELECT * FROM `building`
WHERE `cost` BETWEEN 200000000 AND 500000000;

SELECT * FROM `building`
WHERE `cost` >= 200000000 AND `cost` <= 500000000;

SELECT * FROM `architect`
WHERE name LIKE 'Nguyen%';

SELECT * FROM `architect`
WHERE `name` LIKE '% Anh %' OR `name` LIKE 'Anh %' OR `name` LIKE '% Anh';

SELECT * FROM `architect`
WHERE name LIKE 'Th_';