# Place Holder file

A place holder file to help `repo` to create top level build dir(s)

This is achieved by adding the following segment in the `common.xml` manifest fragment:

```
  <project path="./proj-top"
  ...
      <linkfile src="misc/templates_plcaeholders/Readme.buildfolder.md" dest="build/Readme.md"/>
  ...
  </project>
```
