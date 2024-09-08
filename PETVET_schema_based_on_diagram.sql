/* users & admin table for database principal*//
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* pets info ni dri*/
CREATE TABLE pets (
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT NOT NULL,
    pet_name VARCHAR(50) NOT NULL,
    kind VARCHAR(50) NOT NULL,
    breed VARCHAR(50) NOT NULL,
    gender ENUM('male', 'female') NOT NULL,
    age INT,
    coat_hair_type VARCHAR(50),
    FOREIGN KEY (owner_id) REFERENCES users(user_id) ON DELETE CASCADE
);
/*Details sa nagpa  Appoint ni nga table*/
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT NOT NULL,
    pet_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    purpose VARCHAR(255),
    status ENUM('pending', 'confirmed', 'rejected', 'rescheduled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id) ON DELETE CASCADE
);
/*Dri mosulod ang katong gi ingon nimo principal nga mo notify sa customer */
CREATE TABLE admin_notes (
    note_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    note_type ENUM('special_request', 'medical_concern', 'behavioral_note', 'follow_up'),
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE
);
/*Admin appointment ni dri history sa tanan user nga nagpa appoint*/
CREATE TABLE appointment_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    treatment TEXT,
    prescription TEXT,
    admin_id INT NOT NULL,
    date_completed DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (admin_id) REFERENCES users(user_id)
);
/*  (add ons ni nga table kay nice man sd gud kong naay customers feedback  )
CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE
);  */

/*Info sa atong Clinic dri mag store ug info ang atong web para display sa homepage*/
CREATE TABLE branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100),
    address TEXT,
    contact_number VARCHAR(15)
);
