const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/**/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
safelist: [
  // Background colors
  {
    pattern: /^bg-(red|green|blue|orange|gray|yellow|purple|pink)-[0-9]{3,4}$/,
  },
  // Text colors
  {
    pattern: /^text-(white|black|gray-[0-9]{3,4})$/,
  },
  // Font weights
  {
    pattern: /^font-(bold|medium|semibold)$/,
  },
  // Padding
  {
    pattern: /^p[xy]-[0-9]$/,
  },
  // Rounded corners
  {
    pattern: /^rounded(-full|-[a-z]+)?$/,
  },
  // Shadows
  {
    pattern: /^shadow(-[a-z]+)?$/,
  },
  // Hover states
  {
    pattern: /^hover:bg-(red|green|blue|orange|gray|yellow|purple|pink)-[0-9]{3,4}$/,
  },
  // Focus states
  {
    pattern: /^focus:(outline-none|ring-[0-9]|ring-(red|green|blue|orange|gray)-[0-9]{3,4})$/,
  },
  // Transitions and durations
  {
    pattern: /^transition(-[a-z]+)?$/,
  },
  {
    pattern: /^duration-[0-9]{2,4}$/,
  }
],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
