// vite.config.js
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: '/',
    
    // Configuration pour le build de production
    build: {
        outDir: 'dist',
        assetsDir: 'assets',
        sourcemap: false,
        minify: 'terser',
        rollupOptions: {
            output: {
                manualChunks: {
                    vendor: ['react', 'react-dom'],
                    spline: ['@splinetool/react-spline']
                }
            }
        }
    },
    
    // Configuration du serveur de développement
    server: {
        port: 3000,
        host: true,
        open: true
    },
    
    // Configuration de preview
    preview: {
        port: 4173,
        host: true
    }
});