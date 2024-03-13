const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
  try {
    const token = core.getInput('github-token', { required: true });
    const octokit = github.getOctokit(token);

    const { context } = github;
    if (context.payload.pull_request.user.login !== 'dependabot[bot]') {
      console.log('Not a Dependabot PR, skipping.');
      return;
    }

    const prNumber = context.payload.pull_request.number;
    const owner = context.repo.owner;
    const repo = context.repo.repo;

    const mergeResponse = await octokit.rest.pulls.merge({
      owner,
      repo,
      pull_number: prNumber
    });

    console.log(`Merged PR #${prNumber}: ${mergeResponse.data.message}`);
  } catch (error) {
    core.setFailed(`Action failed with error: ${error}`);
  }
}

run();
