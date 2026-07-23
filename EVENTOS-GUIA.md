# Guía: Cómo Agregar Fotos de Eventos

## 📁 Estructura de Carpetas

Las fotos de eventos se organizan en la carpeta `events/`:

```
/mnt/sd2T/www/rust-peru/
├── events/
│   └── f13-2025/          ← Carpeta del evento F13
│       ├── photo1.jpg
│       ├── photo2.jpg
│       ├── photo3.jpg
│       └── ...
```

## 📸 Agregar Fotos al Evento F13

### Paso 1: Copiar tus fotos

Copia tus fotos del evento F13 a la carpeta:
```bash
cp /ruta/a/tus/fotos/* /rust-peru/events/f13-2025/
```

### Paso 2: Editar el HTML

Abre `index.html` y busca la sección con id `f13-gallery` (aproximadamente línea 886).

Descomenta y duplica el código de ejemplo para cada foto:

```html
<div class="gallery-grid" id="f13-gallery">
    <div class="gallery-item" onclick="openLightbox(0)">
        <img src="events/f13-2025/photo1.jpg" alt="F13 Evento - Foto 1" loading="lazy">
    </div>
    <div class="gallery-item" onclick="openLightbox(1)">
        <img src="events/f13-2025/photo2.jpg" alt="F13 Evento - Foto 2" loading="lazy">
    </div>
    <div class="gallery-item" onclick="openLightbox(2)">
        <img src="events/f13-2025/photo3.jpg" alt="F13 Evento - Foto 3" loading="lazy">
    </div>
    <!-- Agrega más fotos aquí -->
</div>
```

**Importante:**
- El índice en `openLightbox(X)` debe ser secuencial: 0, 1, 2, 3, etc.
- Actualiza el `src` con el nombre de tu archivo
- Actualiza el `alt` con una descripción de la foto

### Paso 3: Optimizar fotos (Recomendado)

Para mejor rendimiento, convierte tus fotos a formatos modernos:

```bash
# Instalar herramientas (si no las tienes)
sudo apt install webp imagemagick

# Convertir a WebP (mejor compresión)
for img in events/f13-2025/*.jpg; do
    cwebp -q 85 "$img" -o "${img%.jpg}.webp"
done
```

Luego usa `.webp` en lugar de `.jpg` en el HTML.

## 🎯 Agregar un Nuevo Evento Futuro

### En la sección "Próximos Eventos"

Edita `index.html` y descomenta/edita el template (línea ~827):

```html
<div class="event-card">
    <span class="event-badge">Próximamente</span>
    <h3 class="event-name">Nombre del Evento</h3>
    <div class="event-date">
        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V10h14v10zM9 14H7v-2h2v2zm4 0h-2v-2h2v2zm4 0h-2v-2h2v2zm-8 4H7v-2h2v2zm4 0h-2v-2h2v2zm4 0h-2v-2h2v2z"/>
        </svg>
        <span>Fecha del evento</span>
    </div>
    <p class="event-description">
        Descripción del evento aquí.
    </p>
    <a href="#" class="event-link">Más información</a>
</div>
```

## 🔄 Mover un Evento a "Eventos Pasados"

Cuando un evento termine:

1. **Crea la carpeta de fotos:**
   ```bash
   mkdir -p events/nombre-evento-2025
   ```

2. **Copia el evento** de la sección "Próximos Eventos" a "Eventos Pasados"

3. **Actualiza:**
   - Cambia `event-card` → `past-event-card`
   - Cambia `event-badge` → `event-badge-completed`
   - Cambia "Próximamente" → "Finalizado"
   - Cambia el texto a pasado ("participará" → "participó")

4. **Agrega la galería de fotos:**
   ```html
   <div class="photo-gallery">
       <h4 class="gallery-title">📸 Galería de Fotos</h4>
       <div class="gallery-grid" id="nombre-evento-gallery">
           <!-- Agrega tus fotos aquí -->
       </div>
   </div>
   ```

5. **Elimina el evento** de "Próximos Eventos"

## ✨ Características de la Galería

- **Grid responsive:** 3 columnas (desktop), 2 (tablet), 1 (móvil)
- **Lightbox:** Click en una foto para verla en grande
- **Navegación:** 
  - Flechas en pantalla para siguiente/anterior
  - Teclado: ← → para navegar, ESC para cerrar
  - Click fuera de la imagen para cerrar
- **Contador:** Muestra "X / Total" de fotos
- **Lazy loading:** Las fotos se cargan cuando son necesarias

## 🎨 Formatos de Imagen Recomendados

1. **WebP** - Mejor opción (85% menos peso que JPG)
2. **AVIF** - Aún mejor pero menos compatible
3. **JPG** - Compatible universalmente
4. **PNG** - Solo para imágenes con transparencia

## 📏 Tamaños Recomendados

- **Miniaturas:** 800x800px (se redimensionan automáticamente)
- **Lightbox:** Máximo 1920x1080px
- **Peso:** Máximo 500KB por foto (idealmente 200KB)

## 🚀 Ejemplo Completo

```bash
# 1. Crear carpeta
mkdir -p events/rustconf-2026

# 2. Copiar fotos
cp ~/fotos-evento/* events/rustconf-2026/

# 3. Optimizar (opcional)
cd events/rustconf-2026
for img in *.jpg; do
    cwebp -q 85 "$img" -o "${img%.jpg}.webp"
done

# 4. Editar index.html y agregar las fotos a la galería
```


