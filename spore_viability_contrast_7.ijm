macro "adjust FDA_PI channels" {
function action(input, output, filename) {
  open(input + filename);
  name=getTitle();
  selectWindow(name);
  run("Split Channels");
  selectWindow("C1-" + name);
  namec1=getTitle();
  run("Enhance Contrast", "saturated=0.35");
  setMinAndMax(1325, 3207);
  selectWindow("C2-" + name);
  namec2=getTitle();
  run("Enhance Contrast", "saturated=0.35");
  setMinAndMax(200, 800);
  selectWindow("C3-" + name);
  namec3=getTitle();
  run("Enhance Contrast", "saturated=0.35");
  setMinAndMax(200, 800);
  run("Merge Channels...", "red=["+namec3+"] green=["+namec2+"] gray=["+namec1+"] create");
  saveAs("tiff", output + filename);
  close();
}

input = getDirectory("Choose input directory");
output = getDirectory("Choose output directory");

setBatchMode(true);
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);
setBatchMode(false);

}
