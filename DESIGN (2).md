```markdown
# Design System: The Rustic Editorial

## 1. Overview & Creative North Star: "The Artisanal Hearth"
This design system rejects the clinical coldness of modern SaaS interfaces in favor of "The Artisanal Hearth." Our Creative North Star is the sensory experience of a Brazilian *boteco*: the smell of grilled meat, the sound of laughter, and the tactile nature of a handwritten chalkboard menu.

To move beyond a "template" look, this system utilizes **Intentional Asymmetry** and **Textural Depth**. Elements should not always sit perfectly centered; they should feel placed by a human hand. We break the digital grid by overlapping hand-drawn chalk illustrations across container boundaries, creating an organic, editorial flow that guides the user’s eye toward conversion points (Laranja Buteco CTAs).

---

## 2. Colors: Tonal Depth & The "No-Line" Rule
The palette is rooted in a deep, textured dark mode that mimics a seasoned slate chalkboard.

### Color Roles
*   **Primary (Laranja Buteco):** `#F29221` (mapped to `primary_container`). Use this exclusively for high-intent actions.
*   **Surface Hierarchy:**
    *   `surface` (`#131313`): The base "chalkboard."
    *   `surface_container_low` (`#1b1b1b`): Secondary sections (e.g., menu categories).
    *   `surface_container_highest` (`#353535`): Interactive cards or floating modals.
*   **The "No-Line" Rule:** 1px solid borders are strictly prohibited for sectioning. Separation is achieved through background shifts (e.g., a `surface_container_low` card on a `surface` background) or hand-drawn chalk dividers.
*   **The Glass & Gradient Rule:** For floating headers or navigation bars, use `surface` with a 70% opacity and a `20px` backdrop-blur. Apply a subtle linear gradient to the Primary CTA (from `primary` to `primary_container`) to simulate the glowing warmth of a sunset in the "quintal" (backyard).

---

## 3. Typography: The Human Touch
We pair the raw, expressive nature of chalkboard lettering with the high-legibility of a refined sans-serif.

*   **Display & Headlines (Epilogue):** This is our "Chalk" voice. Use `display-lg` and `headline-lg` for hero messages and dish names. The weight should feel substantial, mimicking the pressure of chalk on slate.
*   **Body & Labels (Be Vietnam Pro):** This is our "Service" voice. It must be clean and highly legible, especially in low-light environments (bar settings). 
    *   `body-lg`: Descriptions of dishes.
    *   `label-md`: Prices and nutritional tags.
*   **Hierarchy Note:** Use dramatic scale shifts. A `display-sm` headline next to a `label-sm` price creates an editorial, high-end menu feel rather than a standard app list.

---

## 4. Elevation & Depth: Tonal Layering
Traditional drop shadows are too "tech." We achieve depth through atmospheric layering.

*   **The Layering Principle:** Stack `surface-container` tiers to create lift. A menu item card should be `surface_container_low`. When tapped, it elevates to `surface_container_high`.
*   **Ambient Shadows:** For floating elements like a "View Order" FAB, use a wide, diffused shadow: `box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);`. The shadow color should never be pure black, but a deeper tint of the background.
*   **The Ghost Border:** If a boundary is needed for accessibility, use `outline_variant` at **15% opacity**. It should be felt, not seen—a "whisper" of a line that suggests a frame.
*   **Hand-Drawn Accents:** Use SVG "chalk dust" textures on `surface_bright` containers to add tactile grit.

---

## 5. Components

### Buttons (The "Call to Feast")
*   **Primary:** Background `primary_container` (#F29221), text `on_primary_container`. Shape: `md` (0.375rem) to maintain a rugged, hand-cut feel.
*   **Secondary:** Ghost style with a `ghost border` (15% opacity `outline`). 
*   **States:** On hover/active, apply a subtle inner glow rather than a color change to mimic the warmth of the brand.

### Cards & Lists (The Menu)
*   **Constraint:** Forbid the use of divider lines.
*   **Execution:** Use `40px` vertical whitespace (from the spacing scale) to separate items. For featured items, use a `surface_container_high` background with an asymmetrical hand-drawn chalk flourish in the corner.

### Inputs (Ordering Details)
*   **Style:** Minimalist. A simple underline using `outline_variant` at 30% opacity. 
*   **Focus State:** The underline transitions to `primary` (Laranja Buteco) with a slight "chalk glow" (soft outer shadow).

### Signature Component: "The Chalk Divider"
Instead of a horizontal rule, use an SVG asset of a hand-drawn, wobbly chalk line or a row of small hand-drawn stars. This reinforces the "Quintal" (backyard/authentic) vibe.

---

## 6. Do’s and Don’ts

### Do:
*   **Do** embrace negative space. The chalkboard should feel expansive, not cluttered.
*   **Do** use Laranja Buteco sparingly. It is a "spice," not the main ingredient. Use it to lead the user's eye to "Add to Cart" or "Book a Table."
*   **Do** use asymmetrical image crops. A photo of a *coxinha* should feel like it was tucked into the menu, not a perfect square.

### Don’t:
*   **Don’t** use high-contrast white (#FFFFFF). Use `on_surface` (#e5e2e1) to reduce eye strain in dark environments.
*   **Don’t** use "perfect" geometric icons. Choose icons with a slight hand-drawn jitter or varying line weights.
*   **Don’t** use standard 90-degree grids for everything. Allow some elements to rotate by 1-2 degrees to simulate a hand-written sign.

### Accessibility Note:
Ensure that while we use "chalky" textures, the contrast ratio for `body-md` text against `surface` remains at least 4.5:1. Never sacrifice the ability to read the ingredients for the sake of the aesthetic.```