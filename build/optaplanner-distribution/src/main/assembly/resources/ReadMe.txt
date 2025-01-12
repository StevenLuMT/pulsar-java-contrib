====
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
====

Welcome to OptaPlanner
======================

Run the quickstarts
-------------------

On Linux, macOS or Cygwin:
  ./runQuickstarts.sh
On Windows:
  runQuickstarts.bat

Run the quickstarts in IDE
----------------------------

Please refer to https://github.com/kiegroup/optaplanner-quickstarts/blob/stable/README.adoc.

Run the examples
----------------

It's easy to run the examples:
On Linux, macOS or Cygwin:
  ./runExamples.sh
On Windows:
  runExamples.bat


Run the examples in IntelliJ
----------------------------

Open menu File, menu item Open project, select "examples/sources/pom.xml".

Open menu Run, menu item Edit Configurations, add a new Application
with main class "org.optaplanner.examples.app.OptaPlannerExamplesApp"
and run that.


Run the examples in Eclipse
---------------------------

Import "examples/sources/pom.xml" as a new project from Maven sources.

Open menu Run, menu item Run configurations, add new Java Application
with main class "org.optaplanner.examples.app.OptaPlannerExamplesApp"
and click button Run.


Read the reference manual
-------------------------

To see the reference_manual, just open:
  https://docs.optaplanner.org/latestFinal/optaplanner-docs/html_single/index.html
It contains information how to use it on your project (with Maven, Gradle, ...).


Sources
-------

But to build from sources, pull the sources with git:
  https://github.com/kiegroup/optaplanner

Backwards compatibility
-----------------------

OptaPlanner's api packages are backwards compatible.
The impl packages are not, apply the upgrade recipe if you use them:
  https://www.optaplanner.org/download/upgradeRecipe/
For more specific information, see the first chapter of the reference manual.


Questions?
----------

If you have any questions, visit:
  https://www.optaplanner.org/community/getHelp.html
