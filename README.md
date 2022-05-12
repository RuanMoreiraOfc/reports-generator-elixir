<h1 align='center'>

Reports Generator

</h1>

<div align="center">

[ENGLISH][lang-en]
|
[PORTUGUÊS][lang-pt]
|
[日本語][lang-jp]

</div>

<div align="center">

[![card-languages]][btn-null]
[![card-last-commit]][btn-null]
[![card-repo-size]][btn-goto-clone]
[![card-code-size]][btn-null]
[![card-license]][btn-goto-license]
[![card-issues]][btn-goto-issues]

</div>

## About <span id="id-about"/>

**Reports Generator** is a simple tool to generate filtered report from a `csv` file, the return data is a map with which food has been more ordered in all the list and the

Project made on Ignite with **[Rafael Camada][btn-tutor]** at Elixir Journey.

## :triangular_ruler: Technology <span id="id-about"/>

It was used on development:

- [Elixir]

## :electric_plug: Requirements <span id="id-clone"/>

Before to start, you will need have installed on your computer these programs:

- [Git][btn-git]
- [Elixir][btn-elixir]

Also is good have a code editor like [VSCode][btn-vscode].

## :bulb: Do it by yourself

##### In your terminal clone the repository and install the dependencies.

###### - to clone the repository

```bash
git clone https://github.com/ruanmoreiraofc/reports-generator-elixir.git
```

###### - to enter into the folder

```bash
cd reports-generator-elixir
```

###### - to install the dependencies

```bash
mix deps.get
```

##### Now see the result with:

###### - to test the project

```bash
mix test
```

###### - to run the project

```bash
iex -S mix
```

##### Copy this code to use the module

```elixir
"reports/report_complete.csv"
|> ReportsGenerator.build
```

```elixir
["reports/report_1.csv", "reports/report_2.csv", "reports/report_3.csv"]
|> ReportsGenerator.build_many
```

```elixir
["reports/report_1.csv", "reports/report_2.csv", "reports/report_3.csv"]
|> ReportsGenerator.build_many
|> ReportsGenerator.retrieve_higher_value("foods")
```

## :balance_scale: License <span id="id-license"/>

This project is under the MIT license. See the [LICENSE][btn-license] for more information.

# :boy: Author <span id="id-author"/>

<div align="center">

  <p>
    <img
      alt="author-img"
      title="Ruan Moreira de Jesus"
      width="100"
      src="https://github.com/ruanmoreiraofc.png">
  </p>

  <!-- ![author-img] does not work with Github's default profile image -->

Made with :heart: by Ruan Moreira de Jesus!

[![author-card-email]][author-btn-email]
[![author-card-discord]][author-btn-discord]
[![author-card-github]][author-btn-github]

</div>

<!--
  ***---- VARIABLES ----***
-->

[btn-null]: #

<!-- *** AUTHOR *** -->

[author-img]: https://github.com/ruanmoreiraofc.png?size=100 "Ruan Moreira de Jesus"
[author-card-email]: https://img.shields.io/badge/Email--$?style=social&logo=microsoft-outlook
[author-card-discord]: https://img.shields.io/badge/Discord--$?style=social&logo=discord
[author-card-github]: https://img.shields.io/github/followers/ruanmoreiraofc?style=social
[author-btn-email]: mailto:ruanmoreiraofc@hotmail.com "Get in touch!"
[author-btn-discord]: #RuanMoreiraOfc#7904 "RuanMoreiraOfc#7904"
[author-btn-github]: https://github.com/ruanmoreiraofc "Github Profile"

<!-- *** LANGUAGES README *** -->

[lang-en]: #
[lang-pt]: #
[lang-jp]: #

<!-- *** INFO CARDS *** -->

[card-languages]: https://img.shields.io/github/languages/count/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge&label=Languages
[card-last-commit]: https://img.shields.io/github/last-commit/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge&label=Last%20Commit
[card-repo-size]: https://img.shields.io/github/repo-size/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge&label=Repo%20Size
[card-code-size]: https://img.shields.io/github/languages/code-size/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge&label=Code%20Size
[card-license]: https://img.shields.io/github/license/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge&label=License
[card-issues]: https://img.shields.io/github/issues/ruanmoreiraofc/reports-generator-elixir?style=for-the-badge

<!-- *** MAIN BUTTONS *** -->

[btn-tutor]: https://github.com/rafaelcamarda "Rocketseat Educator"
[btn-git]: https://git-scm.com
[btn-elixir]: https://elixir-lang.org/install.html
[btn-vscode]: https://code.visualstudio.com
[btn-goto-clone]: #id-clone
[btn-goto-license]: #id-license
[btn-goto-issues]: https://github.com/ruanmoreiraofc/reports-generator-elixir/issues?q=is%3Aopen
[btn-license]: LICENSE

<!-- *** TECHNOLOGY *** -->

[elixir]: https://elixir-lang.org
