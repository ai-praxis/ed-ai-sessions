# Migration strategy

# Overview

I started a project, ITS4LL (Intelligent Tutoring System for Language Learning), to build an intelligent tutoring system (ITS) that supports language learners in practicing and improving their skills. I developed a whitepaper-ish document (../its4ll/_resources/collaboration/its4ll-overview-collaborators.qmd) to share with potential collaborators. I then met with a few people to discuss the project and get feedback. From these discussions, I realized that the ITS4LL project is really just one specific instance of a broader set of ideas around using AI to support the mission of higher education. In this sense, there are a multitude of possible applications (larger and smaller) in which AI could be used to enhance the exisiting educational infrastructure. In fact, the ITS4LL is, in a way, a "moonshot" project that aims to incorporate a wide range of AI capabilities into a single system to provide comprehensive support for in-class learning (for language, but potentially other subjects as well). However, there are many smaller, more focused applications of AI that could be developed and implemented more quickly and easily, and that could have a significant impact on student learning and success.

Examples of potential applications include:

- After talking with **Ryan Shirey** from the Writing Center, we realized that they have a potential need that we could address with AI. The Writing Center meets with students one-on-one to help them with their writing assignments. However, before students come to the Writing Center, they often struggle to articulate what they need help with. They have a sign-up form where students can indicate their needs, but many students are unsure of how to describe their challenges. An AI-powered tool could help students prepare for their Writing Center sessions by guiding them through a series of questions to help them identify and articulate their needs more clearly. This would not only help the Writing Center staff better understand how to assist the students, but it would also empower the students to take more ownership of their learning process. This could logically be extended to students signing up to meet with their insrtuctors or other academic support services. This "micro-intervention" could make a big difference in the effectiveness of these support services and enhance the existing educational infrastructure, instead of replacing it.

What are some other potential applications of AI in higher education?

Ideas:

- AI-driven help services that assist students in navigating campus resources and support services.
- AI-powered study aids that help students review and reinforce their learning material.
- AI-driven personalized learning paths that adapt to individual student needs and learning styles.
- AI-driven service that takes into account students' previous courses and can help students make interdisciplinary connections to enhance the inter-relational understanding of their learning.
- ...

To find more applications, we need to ask how can we identify and prioritize these applications based on their potential impact and feasibility. This will require collaboration with various stakeholders, including students, faculty, and support staff, to understand their needs and challenges. A worthy, but ambitious goal. As AI is quickly dominated by the large tech companies, higher education institutions need to find ways to leverage AI to enhance their educational mission and support their students effectively in ways that empower institutions to be more than just consumers of AI services.

The question is how to organize and manage these various ideas and projects in a way that allows for collaboration, knowledge sharing, and efficient development. The previous ITS4LL project repository is not structured to accommodate this broader scope of work. Therefore, I propose to create a new GitHub organization and a set of repositories that follow a hub-and-spoke model to facilitate this work. this is described in the next section.

# AI-PRAXIS GitHub Organization and Hub-and-Spoke Model {#ai-praxis}

1. Create a GitHub Organization called `ai-praxis`. This will be the umbrella for all projects related to AI in education, from theory to practice.
2. Create the first main, or "hub", repository `ed-ai`. This hub will be aimed at collecting and organizing the literature reviews, notes, and ideas around AI interventions in (higher) educational contexts.
3. From this hub, create "spoke" repositories (forks) for each specific project or paper that arises and needs its own space for development. For example, one spoke could be related to the ITS `ed-ai-its` application, another could be connected to an AI intervention that prepares students for tutoring sessions by helping them realize and describe the questions and needs that they have `ed-ai-session-prep`.
4. Collaborators can be added to specific spoke repositories or to the hub as needed, allowing for focused work on particular aspects of the overall project.
5. Updates to the hub repository can include summaries and links to the spoke repositories, creating a networked structure that reflects the interconnected nature of the research and development work.

Here's a possible structure for the hub repository `ed-ai`:

```bash
ai-praxis/
└── ed-ai/
    ├── flake.nix
    ├── README.md
    ├── .envrc
    ├── _quarto.yml
    ├── CLAUDE.md
    ├── references.bib
    ├── .claude/
    ├── index.qmd
    ├── .gitignore
    ├── _extensions/
    ├── assets/
    ├── funding/
    ├── research/
    │   ├── literature/
    │   │   ├── ai-in-education.qmd
    │   │   ├── intelligent-tutoring-systems.qmd
    │   │   ├── ai-interventions.qmd
    │   │   └── ...
    └── logs/
        ├── 2025-11-06.md
        └── ...
```

This would be a flake-based Nix project with a Quarto project website for documentation and note-taking. The research/literature directory would house the various literature review documents with some attention to organization and linking between them. The logs directory would contain periodic notes, updates, and reflections on the research process. The whole structure is designed to be modular and expandable as new ideas and projects emerge under a `./project/` directory. This repo will also provide a website interface for easy navigation and access to the collected knowledge.

For spoke repositories, they inherit the hub structure, but focus on building out their project-specific files and documentation under `./project/`. So, assuming the hub is `ed-ai`, a spoke for the ITS project would look like this:

```bash
ai-praxis/
└── ed-ai-its/
    ├── flake.nix
    ├── README.md
    ├── .envrc
    ├── _quarto.yml
    ├── CLAUDE.md
    ├── references.bib
    ├── .claude/
    ├── index.qmd
    ├── .gitignore
    ├── _extensions/
    ├── assets/
    ├── funding/
    ├── research/
    │   ├── ... (as above)
    └── project/
        ├── research/
        │   ├── its-development.qmd
        │   ├── its-evaluation.qmd
        │   └── ...
        ├── data/
        │   ├── ...
        ├── funding/
        │   ├── ...
        ├── write-ups/
        │   ├── ...
        └── ...
```

# Migration Steps

- [x] Create the new GitHub organization `ai-praxis`.
- [x] Create the hub repository `ed-ai` with the structure outlined above.
- [x] Migrate relevant literature reviews and notes from the ITS4LL project to the `research/literature/` directory in the `ed-ai` repository.
  - **Completed 2025-11-10**: Migrated general AI-in-education literature, research notes, IRB template, funding strategies, and blog posts. See `logs/2025-11-10.md` for details.
- [ ] Identify potential spoke projects and create corresponding repositories under the `ai-praxis` organization. Starting with two to begin with: `ed-ai-its` and `ed-ai-session-prep`.
- [ ] Add project-specific files and documentation to each spoke repository.
- [ ] Invite collaborators to the appropriate repositories based on their interests and expertise.
- [ ] Set up continuous integration and deployment (CI/CD) pipelines for the hub and spoke repositories as needed.
