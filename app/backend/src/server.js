const express = require("express");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());

app.get("/health", (req, res) => {
  res.status(200).json({ status: "UP" });
});

app.get("/api/message", (req, res) => {
  res.json({ message: "Backend running on Windows-native setup" });
});

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});
