#!/bin/bash

# Create a new Next.js project
npx create-next-app@latest nextjs-app --typescript --eslint --tailwind --src-dir --app --use-npm

# Navigate into the project directory
cd nextjs-app

# Create additional directories
mkdir -p public/images

# Create configuration files
cat > next.config.js << EOL
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
}

module.exports = nextConfig
EOL

cat > .env << EOL
# Environment variables
NEXT_PUBLIC_API_URL=https://api.example.com
EOL

cat > .env.local << EOL
# Local environment variables
DATABASE_URL=postgresql://username:password@localhost:5432/database
EOL

# Update package.json scripts
npm pkg set scripts.dev="next dev"
npm pkg set scripts.build="next build"
npm pkg set scripts.start="next start"
npm pkg set scripts.lint="next lint"

# Create basic pages
cat > src/app/page.tsx << EOL
import React from 'react'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="text-4xl font-bold">Welcome to Next.js</h1>
    </main>
  )
}
EOL

cat > src/app/layout.tsx << EOL
import React from 'react'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Next.js App',
  description: 'Created with create-next-app',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}
EOL

# Install additional common dependencies
npm install axios swr react-hook-form zod @hookform/resolvers

# Initialize git repository
git init
git add .
git commit -m "Initial commit"

echo "Next.js project setup complete!"
