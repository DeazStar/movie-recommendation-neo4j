from neo4j import GraphDatabase, Result
import os
from dotenv import load_dotenv
from neo4j.graph import Node

load_dotenv()

global driver
def connect_db():
    global driver
    url = os.getenv('NEO4J_URI')
    print(url)
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

def main():
    connect_db() 
    print("Welcome to deadstar movies list")
    print("List of all users")
    users = list_all_users()
    for user_name in users:
        print(user_name)
    user = input("Login as(enter the name of the user): ")
    print(user, type(user))
    movies = recommendaton(user)
    print(f"Top ${len(movies)} Recommended movies")
    for i in range(len(movies)):
        print(movies[i])

    close_db()

def list_all_movies():
    query = "MATCH (n: Movie) RETURN n"
    result = run_query(query)
    # TODO: format the result
    return result

def list_all_users():
    query = "MATCH (n: Person) RETURN n"
    record = run_query(query)
    result = []
    for nodes in record:
        for record in nodes.values():
            if isinstance(record, Node):
                name = record['name']
                result.append(name)
    return result

def run_query(query) -> list:
    global driver
    result = []
    with driver.session() as session:
        result = session.run(query)
        result_list = [records for records in result]
        return result_list

def recommendaton(user) -> list:
    # TODO: use both collobrative and content based
    query = f'''MATCH (person: Person {{name: '{user}'}})-[:WATCHED]->(movie: Movie),
    (other_users: Person)-[:WATCHED]->(movie),
    (other_users)-[:WATCHED]->(recomended_movies: Movie) WHERE other_users <> person AND NOT (person)-[:WATCHED]->(recomended_movies)
    RETURN DISTINCT recomended_movies
    ORDER BY recomended_movies.rating DESC
    '''
    print(query)
    record = run_query(query)
    result = []
    for nodes in record:
        for record in nodes.values():
            if isinstance(record, Node):
                name = record['title']
                result.append(name)
    return result
main()
