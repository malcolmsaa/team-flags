db = db.getSiblingDB(process.env.MONGO_INITDB_DATABASE || "team-flags-edu");
db.createCollection("students");
