# Résumé / CV

The `resume-cv`class boils down to a variety of custom commands to style your résumé. There are three primary commands:

* `\namesection`: styles a header and a background color
* `\contactsection`: displays three pieces of contact information
* `\bodysection`: creates a section with a background color and free-form content

Four additional commands provide more custom styling:

* `\jobentry`: formats all data related to a single job
* `\edentry`: formats all data related to an educational degree
* `\skillentry`: formats category and list of skills
* `\pubentry`: formats metadata about a publication

The [class file](https://github.com/juliaferraioli/tex-customizations/blob/master/cv/resume-cv.cls) provides additional detail on arguments for each command, and the [example résumé](https://github.com/juliaferraioli/tex-customizations/blob/master/cv/resume.tex) shows how to use them ([sneak peak](https://github.com/juliaferraioli/tex-customizations/blob/master/cv/resume.pdf) at the generated document).

There's a fair amount of leeway in the class file, and it should be fairly easy to extend it.

To compile the example:

```shell
$ xelatex resume.tex
```