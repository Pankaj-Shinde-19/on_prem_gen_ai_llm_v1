

# On Premise Generative AI (on_prem_gen_ai)

## Description
**On Premise Generative AI (on_prem_gen_ai)** is a secure and efficient Retrieval-Augmented Generation (RAG) system designed for enterprise use. The key differentiator of this project is its capability to run all required Large Language Models (LLMs) and libraries locally, ensuring maximum **data security** and **control over sensitive information**.

This project includes:
- A **local deployment of LLMs** and libraries to process user queries.
- A **custom chatbot UI** for seamless interaction.
- An **automated PDF handling module** for processing documents in real time.

By running the application entirely offline, your data remains within your system, ensuring compliance with data security policies.

---

## Table of Contents
1. [Important Notes](#important-notes)
2. [Project Hierarchy](#project-hierarchy)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Qdrant Setup](#qdrant-setup)
6. [Docker Setup](#docker-setup)
7. [ChatBot UI](#chatbot-ui)
8. [Key Features](#key-features)

---

## Important Notes

1. **Excluded PDFs Directory**  
   The `pdfs` directory, which contains all the PDF files used in this project, is excluded from this repository using a `.gitignore` file. You can access the required PDF files through the following Google Drive link:  
   [PDF Files - Google Drive Link](https://drive.google.com/drive/folders/1VI63OL5TGYnp7d-yUSEqFoGcf3OhHZo-?usp=drive_link)

2. **Excluded Logo File**  
   The `logo.png` file located under the `frontend` directory is also excluded. You can access it through the following link:  
   [Logo Image - Google Drive Link](https://drive.google.com/drive/folders/11qbcWBCOTPk6qUNBf3q1QlJFqnD2gdiH?usp=drive_link)

---

## Project Hierarchy
Here's an overview of the project's structure:
```plaintext
on_prem_gen_ai_llm_v1/
├── api/
│   ├── __init__.py
│   └── app.py
│   └── requirements.txt
├── frontend/
│   ├── __init__.py
│   ├── chatbot_ui.py
│   ├── logo.png
│   └── style.css
├── handlers/
│   ├── __init__.py
│   ├── pdf_filehandler.py
│   ├── watcher.py
│   └── requirements.txt
├── data/
│   └── pdfs/  # Directory for storing PDF training data
├── .gitignore
├── docker-compose.yml
├── Dockerfile
├── Dockerfile.streamlit
├── Dockerfile.watcher
└── README.md

```

---

## Installation
To get started, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/Pankaj-Shinde-19/on_prem_gen_ai_llm_v1.git
   cd on_prem_gen_ai_llm_v1
   ```
2. Install dependencies:
   ```plaintext
   pip install -r requirements.txt - for "handlers" and "api" directory.
   ```
3. Install the Llama library using the following GitHub repository: [Ollama Python](https://github.com/ollama/ollama-python)

---

## Usage
Follow the steps below to use the application:

1. **Run the Watcher Script:**  
   This monitors the pdfs directory for new uploads.
   ```plaintext
   python handlers/watcher.py
   ```
2. **Start the Flask API**:  
   Ensure the backend is up and running.
   ```plaintext
   python api/app.py
   ```
3. **Run the Chatbot UI:**  
   Launch the user interface for interactions.
   ```plaintext
   python frontend/chatbot_ui.py
   ```
4. **PDF Uploads:**  
   Upload PDF files to the pdfs directory. The pdf_filehandler.py module processes them asynchronously.

---
## Qdrant for Storing Embeddings
Qdrant is a vector search engine that can store and retrieve document embeddings efficiently. Follow these steps to set up Qdrant using Docker:

**Prerequisites**

Ensure Docker is installed on your system. You can download it from [Docker's official site](https://www.docker.com/).

**Steps to Set Up Qdrant**
1. **Pull the Qdrant Docker Image:**
   
   Run the following command to pull the latest Qdrant Docker image:
   ```plaintext
    docker pull qdrant/qdrant
   ```
2. **Run the Qdrant Docker Container:**
   
   Start a Qdrant container using the following command:
    ```plaintext
    docker run -d --name qdrant -p 6333:6333 qdrant/qdrant
   ```

## Docker Setup 
To set up the project using Docker, follow these steps:

1. **Build and Start the Services:**
    
    Run the following command to build the Docker images and start the services:
     ```plaintext
    docker-compose up --build
     ```
2. **Verify in Docker Desktop:**
    
    Open the Docker Desktop app.

    You will see the containers for the project.

    Each container corresponds to a specific service.
3. **Service Links in Sequence:**

    Below is the sequence of services and their respective links (accessible through the container logs or UI):

- **API:** Link to the API service.

- **Qdrant:** Link to the Qdrant vector database.

- **Ollama:** Link for the Ollama service.

- **Watcher:** Link for the PDF watcher.

- **Streamlit:** Link for the Streamlit UI.

ake sure all containers are running correctly, and you can access the respective services as needed.

## ChatBot UI
![image](https://github.com/user-attachments/assets/b553db5d-5bd1-436d-b8ed-4bf4605c1af3)

---

## Key Features

1. **Data Security:**  
   The entire application, including LLMs and libraries, runs locally, eliminating the need for an internet connection and ensuring sensitive data stays secure.

2. **Customizable Deployment:**  
   Built for on-premise setups, making it ideal for enterprises with strict security policies.

3. **Retrieval-Augmented Generation (RAG):**  
   Combines local document retrieval with advanced LLMs to provide accurate and context-aware responses.

4. **Asynchronous File Handling:**  
   Automates the processing of PDF files for seamless integration into the chatbot.

5. **User-Friendly Interface:**  
   Intuitive chatbot UI for easy interaction with the system.

