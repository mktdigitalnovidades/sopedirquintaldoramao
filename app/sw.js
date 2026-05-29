const CACHE_NAME = 'quintal-v6'; // v6: fix anti-FOUC flash branco
const ASSETS = [
  './',
  './index.html',
  './admin.html',
  './manifest.json',
  './icons/icon-512.png'
];

self.addEventListener('install', (event) => {
  self.skipWaiting(); // Take control immediately
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS);
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.filter(key => key !== CACHE_NAME).map(key => caches.delete(key))
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  // Network first strategy: always try network, fallback to cache
  event.respondWith(
    fetch(event.request)
      .then(response => {
        // Update cache with new version
        const responseClone = response.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(event.request, responseClone));
        return response;
      })
      .catch(() => caches.match(event.request))
  );
});
