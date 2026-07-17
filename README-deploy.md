# Deploying this site

Two recommended ways to host this static site for free are shown below. Cloudflare Pages is the recommended option (fast CDN, free `*.pages.dev` domain).

Option A — Cloudflare Pages (recommended)
1. Create a Git repository (GitHub is easiest).
   ```bash
   cd <folder-containing-index.html>
   git init
   git add index.html
   git commit -m "Initial site"
   # create remote on GitHub and push
   git remote add origin git@github.com:YOURUSER/YOURREPO.git
   git branch -M main
   git push -u origin main
   ```
2. Sign in to Cloudflare (https://dash.cloudflare.com/) and open **Pages** → **Create a project**.
3. Connect your GitHub account, select the repository and branch (`main`).
4. Leave build settings empty (no build command) and set the build output directory to `/` (root). Create the project.
5. Cloudflare will build & deploy; your site will be available at `https://<project>.pages.dev`.

Notes: to use a custom domain, add it in Pages and follow Cloudflare's DNS verification steps.

Option B — One-off publish with Wrangler (CLI)
1. Install Node.js + npm (if not installed).
2. Install Wrangler: `npm install -g wrangler`.
3. Create a Cloudflare API token (or login with `wrangler login`).
4. Publish:
   ```bash
   # interactive login
   wrangler login
   # then from the site folder
   wrangler pages publish . --project-name YOUR_PROJECT_NAME
   ```

Wrangler publishing requires a Cloudflare account and a Pages project name (you can create the Pages project through the Cloudflare dashboard first).

If you want, I can prepare the Git repo locally and provide the exact `git` commands to push — I cannot push to your GitHub or Cloudflare accounts without your credentials/consent.

---
Files added to help:
- `deploy_with_wrangler.ps1` — helper script with suggested commands for Windows/PowerShell
