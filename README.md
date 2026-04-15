# NoAiLicense

A license addendum that bars AI/ML training on your source code, documentation, and related files.
Copy the modified MIT License (`LICENSE`) or append `ADDENDUM.md` to your existing license.

> **DISCLAIMER:** This is a good faith effort to bar AI/ML training on your work, but it comes with no guarantees or warranty. This is not legal advice; consult a qualified attorney for formal legal guidance.

---

## Table of Contents

1. [What is NoAiLicense?](#what-is-noailicense)
2. [Plain-Language Summary](#plain-language-summary)
3. [Legal Text (Addendum)](#legal-text-addendum)
4. [How to Adopt](#how-to-adopt)
5. [Combining with Existing Licenses](#combining-with-existing-licenses)
6. [SPDX Metadata](#spdx-metadata)
7. [License Header Snippets](#license-header-snippets)
8. [Related Projects & Resources](#related-projects--resources)

---

## What is NoAiLicense?

NoAiLicense is a **license addendum** — a short legal clause you add on top of your existing open-source license (e.g., MIT, Apache 2.0, GPL) to explicitly forbid the use of your work for training, fine-tuning, or otherwise improving any artificial intelligence or machine-learning system.

It does **not** replace your main license; it supplements it with an additional restriction.  However, there is an MIT Livense with the text applied in LICENSE.md; you are free to copy that (as long as you are human).

---

## Plain-Language Summary

> *This is a human-readable summary; the [legal text](#legal-text-addendum) governs.*

- ✅ **You may** read, use, modify, and distribute this software under the terms of the main license.
- ✅ **You may** study the code for personal learning or research.
- ❌ **You may NOT** use this software (or any derivative) to train, fine-tune, validate, or otherwise improve any machine-learning model, large language model (LLM), generative AI system, or any similar technology — whether it exists today or is invented in the future.
- ❌ **You may NOT** include this software in any dataset or corpus used for AI/ML purposes.
- ⚠️ Violating the addendum is an **express violation** of the license. Where the addendum conflicts with any other part of the license, the addendum wins.

---

## Legal Text (Addendum)

The full addendum text is in [`ADDENDUM.md`](ADDENDUM.md):

```
ADDENDUM:
Regardless of anything stated or implied in this license or the associated software,
documentation, and other files (hereafter "Software"),
the Software may not be used to train, improve, teach, extend, validate, build,
create, or otherwise help any form of machine learning, generative,
artificial intelligence or related algorithm, including, but not limited to,
transformer models, convolutional models, K-Nearest Neighbor ("knn") models,
large language models ("LLMs"), or any similar technology now in existence
or yet to be invented.  Use of the Software in such a manner is an express
violation of this license.  In any case where a statement in this addendum is
found to be in conflict with any part of the Software or this license, the
statement in this addendum remains in force.
```

---

## How to Adopt

### Option A — Use the pre-built MIT + Addendum license

Copy [`LICENSE`](LICENSE) directly into your repository. It is a standard MIT license with the NoAiLicense addendum already embedded.

### Option B — Append the addendum to your existing license

1. Copy [`ADDENDUM.md`](ADDENDUM.md) into your repository root.
2. Add the following line to the bottom of your existing `LICENSE` file:

   ```
   See ADDENDUM.md for additional restrictions on AI/ML use.
   ```

3. Optionally, paste the full addendum text at the bottom of your `LICENSE` file so it is self-contained.

### Option C — Add a header to every source file

Use the ready-made snippets in the [`snippets/`](snippets/) directory and the provided [install script](#license-header-snippets) to prepend a short header to each source file.

---

## Combining with Existing Licenses

### MIT + NoAiLicense Addendum

This is the recommended combination for permissive open-source projects. The `LICENSE` file in this repo is already an MIT license with the addendum embedded.

**Example `LICENSE` structure:**

```
MIT License

Copyright (c) <YEAR> <AUTHOR>

Permission is hereby granted ... [standard MIT text] ...

The Software may not be used to train, improve, teach, extend, validate, build,
create, or otherwise help any form of machine learning, generative,
artificial intelligence or related algorithm ... [full addendum text] ...
```

### Apache 2.0 + NoAiLicense Addendum

Add `ADDENDUM.md` to your repo and reference it from `LICENSE`:

```
Licensed under the Apache License, Version 2.0 (the "License") ...
[standard Apache 2.0 text]

ADDITIONAL RESTRICTION — AI/ML TRAINING PROHIBITION:
See ADDENDUM.md for additional restrictions that supplement this license.
Where the terms of ADDENDUM.md conflict with this License, ADDENDUM.md governs.
```

### GPL v3 + NoAiLicense Addendum

Append the addendum after the GPL text or reference `ADDENDUM.md`. Note that GPL additional restrictions are allowed under §7 of GPLv3 when they bar uses not otherwise prohibited by the GPL.

---

## SPDX Metadata

NoAiLicense does not yet have an official SPDX identifier. Until one is assigned, use the following convention for SPDX expressions:

| Scenario | Suggested SPDX Expression |
|---|---|
| MIT + NoAiLicense addendum | `MIT AND LicenseRef-NoAiLicense-Addendum` |
| Apache 2.0 + addendum | `Apache-2.0 AND LicenseRef-NoAiLicense-Addendum` |
| GPL-3.0 + addendum | `GPL-3.0-only AND LicenseRef-NoAiLicense-Addendum` |

**Per-file SPDX header example (MIT + addendum):**

```
SPDX-License-Identifier: MIT AND LicenseRef-NoAiLicense-Addendum
SPDX-FileCopyrightText: <YEAR> <AUTHOR>
```

**`LICENSES/LicenseRef-NoAiLicense-Addendum.txt`** — to be REUSE-compliant, create this file in your repo with the full addendum text as its content. See [REUSE specification](https://reuse.software/spec/) for details.

---

## License Header Snippets

Ready-to-use file headers are provided in the [`snippets/`](snippets/) directory:

| File | Language |
|---|---|
| [`snippets/c_cpp_header.txt`](snippets/c_cpp_header.txt) | C / C++ |
| [`snippets/python_header.txt`](snippets/python_header.txt) | Python |
| [`snippets/js_header.txt`](snippets/js_header.txt) | JavaScript / TypeScript |
| [`snippets/text_header.txt`](snippets/text_header.txt) | Generic / plain text |

### Install Script

[`snippets/install_snippets.sh`](snippets/install_snippets.sh) automates prepending the appropriate header to every source file in a target directory.

**Usage:**

```bash
# Make executable (first time only)
chmod +x snippets/install_snippets.sh

# Prepend headers to all supported files under ./my-project
./snippets/install_snippets.sh ./my-project
```

The script will:
- Prepend the C/C++ header to `*.c`, `*.cpp`, `*.h`, `*.hpp` files
- Prepend the Python header to `*.py` files
- Prepend the JavaScript header to `*.js`, `*.ts`, `*.mjs` files
- Skip files that already contain the NoAiLicense header

---

## Related Projects & Resources

- [SPDX License List](https://spdx.org/licenses/) — standard machine-readable license identifiers
- [REUSE Software](https://reuse.software/) — tool for SPDX-compliant per-file copyright and license info
- [Creative Commons NoAI](https://creativecommons.org/2021/03/04/should-a-creative-commons-license-prohibit-use-of-licensed-work-in-ai-training-datasets/) — CC's discussion on AI training restrictions
- [BigScience OpenRAIL](https://www.licenses.ai/blog/2022/8/26/bigscience-open-rail-m-license) — responsible AI license family
- [ai-license](https://github.com/nicklvsa/ai-license) — similar AI restriction license project
- [No-AI-LICENSE](https://github.com/NoAI-License/license) — another community effort in the same space

---

## Contributing

Contributions are welcome! Please open an issue or pull request. All contributions to this repository are subject to the same MIT + NoAiLicense terms (see `LICENSE`).

---

*NoAiLicense is maintained by [28pins](https://github.com/28pins).*
