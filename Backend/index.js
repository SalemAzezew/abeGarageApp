const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const router = require('./routes/index');

app.use(cors());
app.use(express.json());
app.use(router);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`✅ Backend server running on http://localhost:${PORT}`);
});
