# Buster's Flooring — Share Batch 2 deploy

100 SEO-named social share cards (1200×630 WebP + JPG twins) for Daltile product pages.

## Install on server3

```bash
# After tarball is on the box (Drive download or scp):
cd /tmp
tar -xzf busters-share-batch2-deploy.tgz
bash install_busters_batch2.sh
# or if nested:
# bash busters-share-batch2-deploy/install_busters_batch2.sh
```

Writes into:
- `/var/www/bustersflooring.com/frontend/build/img/share/`
- `/var/www/bustersflooring.com/frontend/public/img/share/`

## SEO filenames

See `FILELIST.txt` (100 files). Examples:
- `daltile-adventuro-journey.webp` / `.jpg`
- `daltile-perpetuo-brilliant-white.webp` / `.jpg`

## History

After files are live, wire `og:image` / `twitter:image` on product pages to:
`https://bustersflooring.com/img/share/{slug}.webp`

Then re-run share-audit so https://monitor.profuctions.com/share/history/ picks them up.

## Meta tags

```html
<meta property="og:image" content="https://bustersflooring.com/img/share/SLUG.webp" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta property="og:image:type" content="image/webp" />
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:image" content="https://bustersflooring.com/img/share/SLUG.webp" />
```

## Pack location

Full binary pack (21MB tgz): Google Drive file `busters-share-batch2-deploy.tgz` id `1MO6SqYX0CLUYCO3umHu9xGbVei7ryBx6`
Also in Grok artifacts: `/workspace/artifacts/busters-share-batch2-deploy.tgz`
