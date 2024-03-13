const core = require('@actions/core');
const artifact = require('@actions/artifact');

async function run() {
  try {
    const artifactClient = artifact.create();
    const artifactName = core.getInput('name');
    const filePath = core.getInput('path');

    const uploadResult = await artifactClient.uploadArtifact(
      artifactName,
      [filePath],
      process.cwd(),
      { continueOnError: false }
    );
    
    console.log(`Artifact ${artifactName} has been uploaded`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
