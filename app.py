from typing import Optional
from neo4j import GraphDatabase
import os
from dotenv import load_dotenv
from neo4j.graph import Node

load_dotenv()

global driver
def connect_db():
    global driver
    driver = GraphDatabase.driver(
            os.getenv('NEO4J_URI'),
            auth=(os.getenv('NEO4J_USERNAME'), os.getenv('NEO4J_PASSWORD'))
        )
    print("Neo4j Connected")

def close_db():
    global driver
    if driver is not None:
        driver.close()
        print("Connection closed")

def load_data(path):
    global driver
    if not os.path.exists(path):
        raise ValueError(f"Dataset path '{path}' does not exist.")
    
    try:
        with open(path, 'r') as file:
            data = file.read()
            run_query(data, write=True)
    except Exception as e:
        print(f"Error loading dataset")
        print(e)

def main():
    connect_db()
    load_data('./Data/data.cypher')
    print("Welcome to Deadstar Movies List")
    print("List of all users")
    try:
        users = list_all_users()
        for user_name in users:
            print(user_name)
        user = input("Login as (enter the name of the user): ")
        movies = recommendation(user)
        print(f"Top {len(movies)} Recommended movies")
        for movie in movies:
            print(movie)
    except Exception as e:
        print(e)
    finally:
        close_db()

def list_all_movies() -> list:
    query = "MATCH (n: Movie) RETURN n"
    result = run_query(query)
    if result is None:
        raise Exception("Can't execute query")
    return result

def list_all_users() -> list:
    query = "MATCH (n: Person) RETURN n"
    records = run_query(query)
    if records is None:
        raise Exception("Can't execute query")
    result = []
    for record in records:
        if isinstance(record['n'], Node):
            result.append(record['n']['name'])
    return result

def run_query(query, write=False) -> Optional[list]:
    global driver
    result = []
    with driver.session() as session:
        if write:
            session.run(query)
        else:
            result = session.run(query)
            result = [records for records in result]
            return result

def recommendation(user: str) -> list:
    query = f'''
    MATCH (person: Person {{name: '{user}'}})-[:WATCHED]->(movie: Movie)-[:BELONGS_TO]->(genre: Genre),
    (other_users: Person)-[:WATCHED]->(movie),
    (other_users)-[:WATCHED]->(recommended_movies: Movie)-[:BELONGS_TO]->(genre) 
    WHERE other_users <> person AND NOT (person)-[:WATCHED]->(recommended_movies)
    RETURN DISTINCT recommended_movies
    ORDER BY recommended_movies.rating DESC
    '''
    records = run_query(query)
    if records is None:
        raise Exception("Can't execute query")
    result = []
    for record in records:
        if isinstance(record['recommended_movies'], Node):
            result.append(record['recommended_movies']['title'])

    if len(result) == 0:
        second_query = f'''MATCH (person: Person {{name: '{user}'}})-[:WATCHED]->(movie: Movie) -[:BELONGS_TO]->(genre: Genre),
        (recommended_movies: Movie)-[:BELONGS_TO]->(genre)
        WHERE NOT (person)-[:WATCHED]->(recommended_movies)
        RETURN DISTINCT recommended_movies
        ORDER BY recommended_movies.rating DESC 
        LIMIT 5'''
        record = run_query(second_query)
        if record is None:
            raise Exception("Can't execute query")
        for record in records:
            if isinstance(record['recommended_movies'], Node):
                result.append(record['recommended_movies']['title'])
    return result

main()
