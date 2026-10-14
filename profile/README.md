<a href="https://wyro.in">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/WyroBase/.github/main/profile/assets/banner-dark.png">
    <img alt="Wyro. Generating a backend is easy. Checking one isn't." src="https://raw.githubusercontent.com/WyroBase/.github/main/profile/assets/banner-light.png" width="100%">
  </picture>
</a>

<p align="center">
  <a href="https://wyro.in"><b>wyro.in</b></a> ·
  <a href="https://wyro.in/scan">Scan a repo</a> ·
  <a href="https://wyro.in/docs">Docs</a> ·
  <a href="https://wyro.in/blog">Changelog</a> ·
  <a href="https://discord.gg/gAYQxahvnV">Discord</a> ·
  <a href="https://www.youtube.com/@WyroBackend">YouTube</a>
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/wyro-check"><img alt="npm" src="https://img.shields.io/npm/v/wyro-check?style=flat-square&label=wyro-check&labelColor=14151a&color=6b62e6"></a>
  <a href="https://github.com/DominicPaaul7/wyro-check-action"><img alt="GitHub Action" src="https://img.shields.io/badge/GitHub%20Action-v1-6b62e6?style=flat-square&labelColor=14151a&logo=githubactions&logoColor=white"></a>
  <a href="https://github.com/DominicPaaul7/wyro-cursor-plugin"><img alt="Claude Code and Cursor plugin" src="https://img.shields.io/badge/plugin-Claude%20Code%20%C2%B7%20Cursor-6b62e6?style=flat-square&labelColor=14151a"></a>
  <a href="https://discord.gg/gAYQxahvnV"><img alt="Discord" src="https://img.shields.io/badge/Discord-join-6b62e6?style=flat-square&labelColor=14151a&logo=discord&logoColor=white"></a>
</p>

Wyro reads the backend your coding agent wrote and shows which routes reach your data without checking who is asking. It parses the code into a map of routes, guards and tables, then checks that map. No model is involved, so the same commit always gets the same answer, and "fix it and check again" converges.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/WyroBase/.github/main/profile/assets/terminal-dark.png">
  <img alt="wyro-check run on prisma/prisma-examples orm/express: read 4 files, 9 routes, 2 tables. One critical finding: no route in this backend authenticates, 8 routes reach Post and User with nothing in front of them. 1 error, 10 warnings." src="https://raw.githubusercontent.com/WyroBase/.github/main/profile/assets/terminal-light.png" width="100%">
</picture>

<sub>A real run on <a href="https://github.com/prisma/prisma-examples/tree/latest/orm/express">prisma/prisma-examples › orm/express</a>, an example app that leaves auth to whoever builds on it. <a href="https://wyro.in/scan/prisma/prisma-examples?path=orm/express">Same result on /scan →</a></sub>

## Run it where you work

**In your coding agent.** One line gives Claude Code, Cursor or Codex the check as a tool. The agent runs it after it changes a route, a handler or the schema, and fixes what it broke before it hands the work back.

```bash
claude mcp add -s user wyro -- npx -y wyro-check --mcp
```

Other MCP clients take the same command, `npx -y wyro-check --mcp`. Or install the [plugin](https://github.com/DominicPaaul7/wyro-cursor-plugin) for the `check`, `fix`, `map` and `ship` commands. [Setup for every editor →](https://wyro.in/docs/mcp)

**In pull requests.** The GitHub Action fails a PR that introduces a *new* problem. Record what is already there as a baseline once, and you can switch it on today without fixing your history first.

```yaml
# .github/workflows/architecture.yml
on: pull_request
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: DominicPaaul7/wyro-check-action@v1
```

[Baselines, exit codes and central policy →](https://wyro.in/docs/ci)

**In a terminal.** Runs locally, and your code does not leave your machine.

```bash
npx wyro-check .
```

**On any public repo.** Open `wyro.in/scan/<owner>/<repo>` with no account, or add the [Chrome extension](https://chromewebstore.google.com/detail/dplnnphkdjfpphojnjgkbjealenihool) for a *Check with Wyro* button on every GitHub repository.

## What it catches

- Routes that reach your data without authenticating
- Public writes, and sensitive data readable by anyone
- Data flowing to a third party
- Row-level security that is off or open
- Routes that check who you are but not what you may touch

Each finding is ranked by risk, points at the file and line, and says what is missing.

## What it reads

| | Supported |
|---|---|
| **Languages** | TypeScript, JavaScript, Python |
| **Routes** | Express, Fastify, Hono, NestJS, Next.js route handlers and Server Actions, FastAPI, Supabase, SAP CAP |
| **Schemas** | Prisma, Drizzle, TypeORM, Mongoose, SQLAlchemy, SQL with row-level security |

If it cannot read your backend it says so, and says what the repository looks like instead. It never reports a clean result for code it did not understand.

## How it stays trustworthy

- **Rule-based, not a model.** Same commit, same result, every time.
- **A baseline, not a suppression list.** Findings are keyed to the route and table, not a line number, so editing a file does not break the gate.
- **An agent cannot silence itself.** No tool writes the baseline. Accepting a finding as known debt stays your call.
- **Measured precision.** Benchmarked on 45 public backends written with coding agents. Every confirmed false alarm becomes a test. Hit one? [Tell us on Discord](https://discord.gg/gAYQxahvnV).

## Repositories

| Repository | What it is |
|---|---|
| [**wyro-check-action**](https://github.com/DominicPaaul7/wyro-check-action) | GitHub Action that fails a pull request introducing a new architecture violation |
| [**wyro-cursor-plugin**](https://github.com/DominicPaaul7/wyro-cursor-plugin) | Wyro for Claude Code and Cursor: the MCP server, a rule, and the check and fix skills |
| [**wyro-check** on npm](https://www.npmjs.com/package/wyro-check) | The CLI and MCP server |

<sub>Checking public repositories, the CLI, the agent tool, the extension and the GitHub Action are free. Built in Bengaluru. Questions: <a href="mailto:support@wyro.in">support@wyro.in</a></sub>
