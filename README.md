# CauseConnect
Crowdfunding platform — Java (JDK HttpServer + JDBC) backend, plain HTML/CSS/JS frontend, MySQL.

## Run locally
1. Import `database/schema.sql` into MySQL (create a DB named `crowdfunding` first).
2. From the repo root:
   ```
   javac -cp "Backend/lib/*" -d Backend/out $(find Backend/src -name "*.java")
   java -cp "Backend/out:Backend/lib/*" server.CauseConnectServer
   ```
   (Windows: use `;` instead of `:` in the classpath.)
3. Open http://localhost:8080

## Environment variables
| Var | Default |
|---|---|
| `DB_URL` | `jdbc:mysql://localhost:3306/crowdfunding` |
| `DB_USER` | `root` |
| `DB_PASSWORD` | `root` |
| `PORT` | `8080` |

## Deploy
Dockerfile included — works on Render / Railway / any Docker host. Set the DB_* variables there.
