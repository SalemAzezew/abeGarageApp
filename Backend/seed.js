const fs = require('fs');
const path = require('path');
const db = require('./config/db.config');

async function runSeed() {
  try {
    const filePath = path.join(__dirname, 'init-sample-data.sql');
    const sql = fs.readFileSync(filePath, 'utf8');

    // Remove comment lines and split into statements
    const statements = sql
      .split(';')
      .map(stmt => stmt.trim())
      .filter(stmt => stmt.length > 0 && !stmt.startsWith('--'));

    for (let statement of statements) {
      await db.query(statement);
    }

    console.log('✅ Sample data inserted!');
    process.exit(0);
  } catch (err) {
    console.error('❌ Error inserting sample data:', err);
    process.exit(1);
  }
}

runSeed();
