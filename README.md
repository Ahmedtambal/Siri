# Siri Todo List App

The Siri Todo List App is a task management application that allows users to create and manage their todo lists. The app utilizes Firebase Authentication for user authentication and Firestore database for storing todo list data on the cloud.

## Features

- User Authentication: Users can create an account and log in to the app using their email and password.
- Todo List Management: Users can create new todo lists, add tasks to the lists, mark tasks as completed, and delete tasks.
- Real-time Data Sync: The app syncs user's todo lists across multiple devices in real-time using Firestore database.
- Secure Data Storage: User data is securely stored on the cloud using Firebase Firestore, ensuring data integrity and reliability.

## Installation

To run the Siri Todo List App locally, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/siri-todo-list-app.git`
2. Navigate to the project directory: `cd siri-todo-list-app`
3. Install dependencies: `npm install`
4. Configure Firebase:
   - Create a Firebase project at https://console.firebase.google.com.
   - Enable Firebase Authentication and Firestore in the Firebase project.
   - Create a `.env` file in the root directory and add your Firebase configuration details:
     ```
     REACT_APP_FIREBASE_API_KEY=YOUR_API_KEY
     REACT_APP_FIREBASE_AUTH_DOMAIN=YOUR_AUTH_DOMAIN
     REACT_APP_FIREBASE_PROJECT_ID=YOUR_PROJECT_ID
     REACT_APP_FIREBASE_STORAGE_BUCKET=YOUR_STORAGE_BUCKET
     REACT_APP_FIREBASE_MESSAGING_SENDER_ID=YOUR_SENDER_ID
     REACT_APP_FIREBASE_APP_ID=YOUR_APP_ID
     ```
5. Start the development server: `npm start`
6. Open the app in your browser at `http://localhost:3000`

## Technologies Used

- React: JavaScript library for building user interfaces.
- Firebase Authentication: Securely authenticate and manage user accounts.
- Firestore: NoSQL database for storing and syncing app 
