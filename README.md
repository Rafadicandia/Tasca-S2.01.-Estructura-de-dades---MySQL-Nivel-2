
## 📄 Description - Exercise Statement


### - Exercise 1 - YouTube

We will try to create a simple model of what the database would look like for a reduced version of YouTube.

**Users**
For each user, we store a **unique identifier**:
* Email.
* Password.
* Username.
* Date of birth.
* Gender.
* Country.
* Zip/Postal code.

**Videos**
A user publishes videos. For each video, we store a **unique identifier**:
* A title.
* A description.
* A size.
* The video filename.
* Duration of the video.
* A thumbnail.
* The number of views (plays).
* The number of likes.
* The number of dislikes.

A video can have three different states: **public**, **hidden** (unlisted), and **private**.
A video can have many **tags**. A tag is identified by a unique identifier and a tag name.
It is important to store **who** the user is that publishes the video and at **what date/time** they do so.

**Channels**
A user can create a **channel**. A channel has a **unique identifier**:
* A name.
* A description.
* A creation date.

**Subscriptions & Interactions**
A user can **subscribe** to other users' channels.
A user can give a **like** or a **dislike** to a video only once. It will be necessary to keep a record of the users who have liked and disliked a specific video and at what date/time they did so.

**Playlists**
A user can create **playlists** with the videos they like. Each playlist has a **unique identifier**:
* A name.
* A creation date.
* A status indicating whether it is public or private.

**Comments**
A user can write **comments** on a specific video. Each comment is identified by a **unique identifier**:
* The text of the comment.
* The date/time it was made.

A user can mark a comment as **like** or **dislike**. It will be necessary to keep a record of the users who have marked a comment as like/dislike, and at what date/time they did so.

---

**Would you like me to create an Entity-Relationship (ER) diagram or write the SQL code to create these tables for you?**
-----

## 💻 Used Technologies

| Technology | Version | Description |
| :--- | :--- | :--- |
| **MySQL** | Latest Official Image | The database server running inside the Docker container. |
| **Docker** | Latest | Containerization platform for setting up the environment. |
-----

## 📋 Requirements

- Operating System: Windows/macOS/Linux.
- **Docker Desktop:** Installed and running (essential for the database setup).
- **MySQL Client:** MySQL Workbench, DBeaver, or any other client to connect and verify the data.
-----

## 🛠️ Installation

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Rafadicandia/Tasca-S2.01.-Estructura-de-dades---MySQL-Nivel-2.git
    ```

2. Start the MySQL Container (Automatic Data Load)
   The following command starts the container, maps host port 3307 to container port 3306, and automatically executes the init.sql script located in the database/ folder.
   ```bash 
    docker run -d \
   --name mysql-java-db \
   -e MYSQL_ROOT_PASSWORD=Rafael4716 \
   -p 3307:3306 \
   -v mysql-data:/var/lib/mysql \
   -v $(pwd)/database:/docker-entrypoint-initdb.d \
   mysql
    ```

3. Verification
   Confirm that the container is running:

    ```bash
    docker ps
    ````
   The output should show the mysql-java-db container with the Up status.

-----

## ▶️ Execution

🔌 Database Connection Details
Use the following parameters to connect your application (Java, Python, etc.) or your MySQL Workbench client:

Parameter,Value
Host/Address,localhost or 127.0.0.1
Port,3307 (Mapped port)
User,root
Password,Rafael4716

-----

## 🤝 Contributions

Contributions are welcome. Please report any bugs by opening an issue or suggest improvements via a clear and concise Pull Request.