import pymysql
import os

from dotenv import load_dotenv

load_dotenv()

def get_db_conn():
    return pymysql.connect(
        host=os.getenv("DB_HOST"), user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS"), db=os.getenv("DB_NAME"),
        charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor
    )
# nickname:str, job_class:str
def select_heros(nickname:str, job_class:str):
    conn = get_db_conn()
    try:
        with conn.cursor() as cursor:
            sql='''
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
                    nickname LIKE %s
                    AND job_class LIKE %s
                ORDER BY 
                    level DESC
            '''
            cursor.execute(sql,(f"%{nickname}%", f"%{job_class}%"))
            return cursor.fetchall()

    finally:
        conn.close()
        