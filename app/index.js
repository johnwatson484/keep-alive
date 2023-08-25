import axios from 'axios'

const endpoints = process.env.ENDPOINTS?.split(';') || []

for (const endpoint of endpoints) {
  console.log(`Making request to ${endpoint}`)
  await axios.get(endpoint)
}
