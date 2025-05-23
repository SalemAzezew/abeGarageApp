const fs = require('fs');
const path = require('path');
const db = require('./config/db.config'); // This should be your query wrapper

async function runSqlFile() {
  try {
    const sqlFilePath = path.join(__dirname, './services/sql/initial-queries.sql');
    const sql = fs.readFileSync(sqlFilePath, 'utf8');

    const statements = sql
      .split(';')
      .map(stmt => stmt.trim())
      .filter(stmt => stmt.length > 0);

    for (let statement of statements) {
      await db.query(statement);
    }

    console.log('✅ All tables created successfully from SQL file!');
    process.exit(0);
  } catch (err) {
    console.error('❌ Error creating tables:', err);
    process.exit(1);
  }
}

runSqlFile();
