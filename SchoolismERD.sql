CREATE TABLE `Teacher` (
  `T_id` int PRIMARY KEY AUTO_INCREMENT,
  `p_password` varchar(255),
  `T_name` varchar(255),
  `T_birthdate` datetime,
  `T_graduationlevel` varchar(255),
  `T_address` varchar(255),
  `T_phone` int,
  `T_gender` varchar(255)
);

CREATE TABLE `Parent` (
  `P_id` int PRIMARY KEY AUTO_INCREMENT,
  `p_password` varchar(255),
  `P_name` varchar(255),
  `P_birthdate` datetime,
  `P_job` varchar(255),
  `P_gender` varchar(255),
  `P_address` varchar(255),
  `P_phone` int
);

CREATE TABLE `Teach` (
  `T_id` int,
  `Sub_id` int,
  PRIMARY KEY (`T_id`, `Sub_id`)
);

CREATE TABLE `Subject` (
  `Sub_id` int PRIMARY KEY,
  `Sub_name` varchar(255)
);

CREATE TABLE `Student` (
  `St_id` int AUTO_INCREMENT,
  `P_id` int,
  `St_name` varchar(255),
  `St_birthdate` datetime,
  `St_gender` varchar(255),
  `St_level` varchar(255),
  `St_class` varchar(255),
  `St_address` varchar(255),
  PRIMARY KEY (`St_id`, `P_id`)
);

CREATE TABLE `Grade` (
  `Sub_id` int,
  `St_id` int,
  `T_id` int,
  `G_Value` int,
  `G_type` varchar(255),
  `G_date` datetime,
  PRIMARY KEY (`Sub_id`, `St_id`, `T_id`)
);

CREATE TABLE `TeacherEvaluation` (
  `T_id` int,
  `P_id` int,
  `P_rate` int,
  `P_comment` varchar(255),
  PRIMARY KEY (`T_id`, `P_id`)
);

CREATE TABLE `StudentEvaluation` (
  `St_id` int,
  `T_id` int,
  `T_rate` int,
  `T_comment` varchar(255),
  PRIMARY KEY (`St_id`, `T_id`)
);

CREATE TABLE `SubjectEvaluation` (
  `Sub_id` int,
  `P_id` int,
  `Sub_rate` int,
  `Sub_comment` varchar(255),
  PRIMARY KEY (`Sub_id`, `P_id`)
);

CREATE TABLE `Talent` (
  `Ta_id` int AUTO_INCREMENT,
  `St_id` int,
  `Ta_type` varchar(255),
  PRIMARY KEY (`Ta_id`, `St_id`)
);

CREATE TABLE `DailyWork` (
  `D_id` int AUTO_INCREMENT,
  `Sub_id` int,
  `St_id` int,
  `T_id` int,
  `D_content` varchar(255),
  `D_level` varchar(255),
  `D_date` datetime,
  PRIMARY KEY (`D_id`)
);

CREATE TABLE `Question` (
  `Q_id` int,
  `QName` varchar(225),
  PRIMARY KEY (`Q_id`)
);

CREATE TABLE `Answer` (
  `A_id` int AUTO_INCREMENT,
  `Q_id` int,
  `AValue` varchar(255),
  `A_correct` varchar(255),
  PRIMARY KEY (`A_id`, `Q_id`)
);

CREATE TABLE `Activities` (
  `T_id` int,
  `Sub_id` int,
  `A_image` blob,
  `A_comment` varchar(255),
  PRIMARY KEY (`T_id`, `Sub_id`)
);

CREATE TABLE `TakeAttendace` (
  `St_id` int,
  `T_id` int,
  `Sub_id` int,
  `At_date` datetime,
  `At_status` int,
  PRIMARY KEY (`St_id`, `T_id`, `Sub_id`)
);

ALTER TABLE `Teach` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `Teach` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`P_id`) REFERENCES `Parent` (`P_id`);

ALTER TABLE `Grade` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `Grade` ADD FOREIGN KEY (`St_id`) REFERENCES `Student` (`St_id`);

ALTER TABLE `Grade` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `TeacherEvaluation` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `TeacherEvaluation` ADD FOREIGN KEY (`P_id`) REFERENCES `Parent` (`P_id`);

ALTER TABLE `StudentEvaluation` ADD FOREIGN KEY (`St_id`) REFERENCES `Student` (`St_id`);

ALTER TABLE `StudentEvaluation` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `SubjectEvaluation` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `SubjectEvaluation` ADD FOREIGN KEY (`P_id`) REFERENCES `Parent` (`P_id`);

ALTER TABLE `Talent` ADD FOREIGN KEY (`St_id`) REFERENCES `Student` (`St_id`);

ALTER TABLE `DailyWork` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `DailyWork` ADD FOREIGN KEY (`St_id`) REFERENCES `Student` (`St_id`);

ALTER TABLE `DailyWork` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `Activities` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `Activities` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `TakeAttendace` ADD FOREIGN KEY (`St_id`) REFERENCES `Student` (`St_id`);

ALTER TABLE `TakeAttendace` ADD FOREIGN KEY (`T_id`) REFERENCES `Teacher` (`T_id`);

ALTER TABLE `Answer` ADD FOREIGN KEY (`Q_id`) REFERENCES `Question` (`Q_id`);

ALTER TABLE `TakeAttendace` ADD FOREIGN KEY (`Sub_id`) REFERENCES `Subject` (`Sub_id`);

ALTER TABLE `Question` ADD FOREIGN KEY (`Q_id`) REFERENCES `DailyWork` (`D_id`);

