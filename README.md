# FastAPI Boilerplate

A production-ready FastAPI boilerplate with authentication, user management, and essential features for rapid backend development.

## 🚀 Features

### Authentication & Security
- **JWT Authentication** with access tokens
- **Two-Factor Authentication (2FA)** with QR code generation
- **Google OAuth Login** integration
- **Password Management** (reset, change with email verification)
- **Email Verification** for user registration
- **Secure Cookie Handling** with httpOnly and secure flags

### User Management
- **User Registration & Login**
- **Profile Management** (update info, bio, avatar)
- **PIN & Key Management** for enhanced security
- **User Query & Search** functionality

### Technical Features
- **SQLAlchemy ORM** with MySQL support
- **Database Migrations** with SQL scripts
- **Global Exception Handling** with custom error codes
- **Token Middleware** for request authentication
- **CORS Configuration** for cross-origin requests
- **Request/Response DTOs** with Pydantic validation
- **Repository Pattern** for data access
- **Service Layer** for business logic

## 📁 Project Structure

```
backend/
├── controller/           # API route controllers
│   ├── auth_controller.py    # Authentication endpoints
│   └── user_controller.py    # User management endpoints
├── dto/                 # Data Transfer Objects
│   ├── request/         # Request DTOs
│   │   └── auth/        # Auth-related requests
│   └── response/        # Response DTOs
├── enums/               # Enumeration definitions
├── exception/           # Custom exceptions and handlers
├── middleware/          # Custom middleware
├── model/               # SQLAlchemy models
├── repository/          # Data access layer
├── service/             # Business logic layer
├── utils/               # Utility functions
├── config.py           # Configuration settings
├── database.py         # Database setup
├── main.py             # FastAPI application entry point
├── migration.sql       # Database migration script
└── requirements.txt    # Python dependencies
```

## 🛠️ Setup & Installation

### Prerequisites
- Python 3.8+
- MySQL 5.7+
- pip or pipenv

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd BE_FastAPI_CodeBase
```

### 2. Install Dependencies
```bash
cd backend
pip install -r requirements.txt
```

### 3. Database Setup
```bash
# Create database and run migration
mysql -u root -p < migration.sql
```

### 4. Configuration
Create a `config.py` file with your settings:
```python
app_config = {
    "DATABASE": {
        "MYSQL": {
            "HOST": "localhost",
            "PORT": "3306",
            "USERNAME": "your_username",
            "PASSWORD": "your_password",
            "DATABASE": "fastapi_boilerplate"
        }
    },
    "JWT": {
        "SECRET_KEY": "your-secret-key",
        "ALGORITHM": "HS256",
        "ACCESS_TOKEN_EXPIRE_MINUTES": 30
    },
    "EMAIL": {
        "SMTP_SERVER": "your-smtp-server",
        "SMTP_PORT": 587,
        "EMAIL": "your-email@domain.com",
        "PASSWORD": "your-email-password"
    }
}
```

### 5. Run the Application
```bash
python main.py
# or
uvicorn main:app --host 0.0.0.0 --port 9990 --reload
```

The API will be available at `http://localhost:9990`

## 📚 API Documentation

Once running, access the interactive API documentation at:
- **Swagger UI**: `http://localhost:9990/docs`
- **ReDoc**: `http://localhost:9990/redoc`

## 🔐 Authentication Endpoints

### Auth Routes (`/api`)
- `POST /signup` - User registration
- `POST /login` - User login
- `POST /login/google` - Google OAuth login
- `POST /logout` - User logout
- `POST /forgot-password` - Request password reset
- `POST /reset-password` - Reset password with token
- `POST /change-password` - Change password (authenticated)
- `POST /check-2fa` - Verify 2FA code
- `POST /enable-2fa` - Enable 2FA for user
- `GET /verify-email-signup` - Verify email for registration

### User Routes (`/api/user`)
- `GET /by-id` - Get user by ID
- `POST /me` - Get current user info
- `PUT /update-me` - Update user profile
- `PUT /update-me-bio` - Update user biography
- `POST /set-pin` - Set PIN and encryption keys
- `POST /restore-private-key` - Restore private key with PIN
- `GET /by-email` - Get user by email
- `GET /query-email` - Query users by email pattern

## 🧩 Extending the Boilerplate

This boilerplate is designed to be easily extensible. To add new features:

1. **Add Models**: Create new SQLAlchemy models in `model/`
2. **Add Repositories**: Create data access layers in `repository/`
3. **Add Services**: Implement business logic in `service/`
4. **Add Controllers**: Create API endpoints in `controller/`
5. **Add DTOs**: Define request/response schemas in `dto/`
6. **Update Main**: Register new routes in `main.py`

## 🔧 Configuration Options

### CORS Settings
Modify the CORS origins in `main.py`:
```python
origins = [
    "http://localhost",
    "http://localhost:3000",
    "https://yourdomain.com"
]
```

### Database Configuration
Update database settings in `config.py` and `database.py`

### JWT Configuration
Configure JWT settings for token expiration and security

## 🚦 Error Handling

The boilerplate includes comprehensive error handling:
- **Custom Exceptions**: `AppException` for business logic errors
- **Global Exception Handler**: Centralized error response formatting
- **Error Codes**: Standardized error code system
- **HTTP Exception Handling**: Proper HTTP status codes

## 🧪 Development

### Adding New Features
1. Create feature branch: `git checkout -b feature/new-feature`
2. Add models, repositories, services, and controllers
3. Update migration script if needed
4. Test endpoints using Swagger UI
5. Commit and create pull request

### Database Migrations
When adding new models or modifying existing ones:
1. Update the model in `model/`
2. Add migration SQL to `migration.sql`
3. Run migration: `mysql -u root -p < migration.sql`

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

For questions or support, please open an issue in the repository or contact the maintainers.

---

**Happy Coding! 🎉**