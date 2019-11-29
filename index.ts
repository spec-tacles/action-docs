import { exec } from '@actions/exec';
import { which } from '@actions/io';
import { getInput, setFailed } from '@actions/core';

which('bash', true).then(bash => {
	return exec(bash, ['docs.sh'], {
		env: {
			REPO: `https://${process.env.GITHUB_ACTOR}:${getInput('githubToken')}@github.com/${process.env.GITHUB_REPOSITORY}.git`,
			DOCS_DIRECTORY: getInput('docsDirectory'),
			TARGET_BRANCH: getInput('targetBranch'),
			TARGET_DIRECTORY: getInput('targetDirectory'),
			DOCS_COMMAND: getInput('docsCommand'),
		},
	});
}).catch(error => {
	setFailed(error.message);
});
