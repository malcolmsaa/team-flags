import { MongoClient } from "mongodb";

let client: MongoClient | null = null;

export function getMongoClient() {
  if (!process.env.MONGODB_URI) {
    throw new Error("MONGODB_URI is missing (runtime only)");
  }

  if (!client) {
    client = new MongoClient(process.env.MONGODB_URI);
  }

  return client;
}
