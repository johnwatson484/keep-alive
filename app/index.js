import axios from 'axios'

const endpoints = process.env.ENDPOINTS?.split(';') || []

for (const endpoint of endpoints) {
  try {
    console.log(`Making request to ${endpoint}`)
    await axios.get(endpoint)
  } catch (error) {
    console.error(`Failed to make request to ${endpoint}, error: ${error}`)
  }
}
