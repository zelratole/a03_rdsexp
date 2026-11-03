/*
host주소 :  mariadb01.crkcemwo6fwv.ap-southeast-2.rds.amazonaws.com
계정/비밀전호 : admin/11111111
port번호 : 3306
DB명 : mariadb01
*/

-- 1. 데이터베이스(스키마) 선택 (생성되어 있지 않다면 미리 생성)
CREATE DATABASE IF NOT EXISTS hrms_db 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_general_ci;

USE hrms_db;

-- 2. 기존 테이블이 있다면 삭제 후 재생성 (초기화 목적)
DROP TABLE IF EXISTS emp_test;

-- 3. 사원 정보 테이블 생성
CREATE TABLE emp_test (
    empno INT PRIMARY KEY COMMENT '사원번호',
    ename VARCHAR(50) NOT NULL COMMENT '사원이름',
    job VARCHAR(50) COMMENT '직책',
    sal INT COMMENT '급여'
) COMMENT '사원 테스트 테이블';



INSERT INTO emp_test (empno, ename, job, sal) VALUES
(7369, 'SMITH', 'CLERK', 800),
(7499, 'ALLEN', 'SALESMAN', 1600),
(7521, 'WARD', 'SALESMAN', 1250),
(7566, 'JONES', 'MANAGER', 2975),
(7654, 'MARTIN', 'SALESMAN', 1250),
(7698, 'BLAKE', 'MANAGER', 2850),
(7782, 'CLARK', 'MANAGER', 2450),
(7788, 'SCOTT', 'ANALYST', 3000),
(7839, 'KING', 'PRESIDENT', 5000),
(7844, 'TURNER', 'SALESMAN', 1500),
(7876, 'ADAMS', 'CLERK', 1100),
(7900, 'JAMES', 'CLERK', 950),
(7902, 'FORD', 'ANALYST', 3000),
(7934, 'MILLER', 'CLERK', 1300);



CREATE TABLE hero_guild (
    hero_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '용사 고유 번호',
    nickname VARCHAR(50) NOT NULL COMMENT '용사 닉네임',
    job_class VARCHAR(30) NOT NULL COMMENT '직업군',
    level INT DEFAULT 1 COMMENT '현재 레벨',
    main_skill VARCHAR(100) COMMENT '주력 스킬',
    tactical_position VARCHAR(50) COMMENT '전술 배치 포지션',
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '길드 가입일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='RPG 용사 길드 명부';


INSERT INTO hero_guild (nickname, job_class, level, main_skill, tactical_position) VALUES
('뼈의 군주', '강령술사', 99, '뼈 창 (Bone Spear)', '후방 광역 딜러'),
('빛의 수호자', '수도사', 70, '빛의 파동 (Wave of Light)', '전방 탱커 겸 딜러'),
('아이어의 검', '광전사', 50, '사이오닉 돌진', '최전방 돌격 대장'),
('새벽의 순례자', '치유사', 60, '아침 걷기 (회복 벞)', '후방 지원 및 힐러'),
('단백질 전사', '투사', 45, '닭가슴살 섭취 (체력 증가)', '측면 방어선');

COMMIT;
SELECT * FROM hero_guild;

-- '검색어' 위치에 사용자가 입력한 값을 전달합니다.
SELECT 
    hero_id, 
    nickname, 
    job_class, 
    level, 
    main_skill, 
    tactical_position, 
    join_date
FROM 
    hero_guild
WHERE 
    nickname LIKE '%검색어%' 
    OR job_class LIKE '%검색어%'
ORDER BY 
    level DESC
    ;
    
    


