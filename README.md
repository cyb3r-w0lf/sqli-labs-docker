# SQLi-Labs

**SQLi-Labs by AUDI-1** has been our companion since the days of BackTrack, helping us master the basics of SQL injection. Initially crafted for BackTrack, these labs evolved through the years, adapting to modern environments like Kali Linux. SQLI-LABS is a platform to learn SQLI.

This is a Dockerized version of [Rock718/SQLI-LABS-PHP7](https://github.com/Rock718/sqli-labs-php7)

---

## Overview

SQLi-Labs is a platform dedicated to learning and practicing SQL Injection techniques. The labs cover a wide range of SQLi scenarios across both GET and POST methods, making it a valuable resource for both beginners and seasoned practitioners.

---

## Installation

### Prerequisites

- **Docker:**  
  - **UNIX:**  
    ```bash
    sudo apt install docker.io -y
    ```  
  - **Windows:**  
    Follow the instructions on the [Docker Get Started page](https://www.docker.com/get-started/).

### Steps

1. **Clone the Repository**
    ```bash
    git clone https://github.com/cyb3r-w0lf/sqli-labs-docker.git
    cd sqli-labs-docker
    ```

2. **Build the Docker Image**
    ```bash
    sudo docker build -t sqli-labs .
    ```

3. **Run the Docker Container**
    ```bash
    sudo docker run -d -p 8080:80 sqli-labs
    ```

4. **Access the Labs**
    - Open your browser and navigate to: [http://127.0.0.1:8080/sqli-labs](http://127.0.0.1:8080/sqli-labs)

5. **Setup the Database**
    - Click on the `setup/resetDB` link to initialize the database, create the necessary tables, and populate the data.

6. **Start Learning**
    - Click on any lesson number to open the corresponding lesson page.

7. **Enjoy the Labs!**

8. **Stopping the Docker Container**
    - To list running containers:
      ```bash
      sudo docker ps
      ```
    - To stop (kill) the running SQLi-Labs container, note the container ID from the previous command and run:
      ```bash
      sudo docker kill <container_id>
      ```
      *Alternatively, if you want to stop by container name (if named during run), replace `<container_id>` with the container name.*

---

## Labs Covered

The platform offers a comprehensive set of labs covering various SQL Injection techniques:

1. **Error Based Injections (Union Select)**
   - String-based
   - Integer-based

2. **Error Based Injections (Double Injection Based)**

3. **Blind Injections**
   - Boolean-based
   - Time-based

4. **Update Query Injection**

5. **Insert Query Injections**

6. **Header Injections**
   - Referer-based
   - User-Agent-based
   - Cookie-based

7. **Second Order Injections**

8. **Bypassing WAF**
   - Bypassing Blacklist Filters:
     - Stripping comments
     - Stripping OR & AND
     - Stripping spaces and comments
     - Stripping UNION & SELECT
   - Impedance Mismatch

9. **Bypass addslashes()**

10. **Bypassing mysql_real_escape_string** (under special conditions)

11. **Stacked SQL Injections**

12. **Secondary Channel Extraction**

... and many more. Dive in and explore all the sections to enhance your SQLi skills.

---

## Acknowledgements

This project builds upon the foundational work of SQLi-Labs by [AUDI-1_SQLI-LABS](https://github.com/Audi-1/sqli-labs.git). Special thanks to all contributors who have enriched this learning resource.

---

## License

This project is intended for educational purposes only. Please ensure that you use the labs responsibly and adhere to legal guidelines in your jurisdiction.

---

Enjoy your journey into SQL injection with SQLi-Labs!
