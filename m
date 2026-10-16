Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218374E73B8;
	Fri, 16 Oct 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164528; cv=none; b=rmvcm5xZVB/vPPMEznXXvyC8wg3t+0XlGm3iiPeiIO/DfAO2GrtFIS1vqMwDdD3Cj9YyoDLYM0YUn1D1WTxDrLK0CwaEBO2dQ/Y+iVp7QoS2soYBxL2hIlUFdHUdh10UGmMipiff3sHt196sQs9Fdnv0c4NJPnO/7EFk+iJddf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164528; c=relaxed/simple;
	bh=/PwxB63ZoOfB2/5xFJosvWKGJ6EpfHIzhRbOfapizU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9hUbozbjcaQijmpxxoHTAZng+2aJWRWt54EABrH8wiITCEhxEK9b07la1IcIeM5B4gejqjkBnvdUd340tGT8hS/Na+3PGvW84ZcRFvQ+qI4K4pmnVrlGW1Q6Obgcvozkj08X7ukZ2pFbzZqA62wb8rU34OASKIm9B3rAcRMUog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flVrMcYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flVrMcYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30D91F000C4;
	Fri, 16 Oct 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164526;
	bh=scyt5e+BoH7eAKJNSiBVIsQ9P94M5xVl/mVZ28jvaOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=flVrMcYpJV87IqkvJnml08hgJRVew2VmPox+be/ylw70rygmdB1YDWb+1XgvdZ41E
	 BOtZcz0GWHKP5eTgGN9oiVcQ8SrJaTIV+CVjNIG1EA//8eaRkiQrexcvQp6KfqfDrg
	 zQSrXOzUIsI9zEqmTPv+WRCKHRP/KD2dPI+Akk6jBiJl9fEo/2NRezkIbiRQliJ/BJ
	 c4/qOA20ECN/r4PU0vbRkBuXTbXNpvMynsYkM6QPzrpaWU9cvE6gKd5hpEHcnwMpHq
	 xbFZ3/R/X1KSDAEH+N8nYuuRMgSp7mQ53tyGdwvyhKdwVL+2ms0tLOEBrRR1ruu7h+
	 0yTAUPstLWbHg==
From: Sasha Levin <sashal@kernel.org>
To: workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v3 7/7] agents: add a skill to write commit messages
Date: Fri, 16 Oct 2026 11:28:27 -0400
Message-ID: <20261016152828.3765695-8-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016152828.3765695-1-sashal@kernel.org>
References: <20261016152828.3765695-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assistants are asked to commit a fix with a detailed message, and the
find-fixes and stable-tag skills leave their tags for that message, but
nothing says how to write it. Messages written by assistants tend to be
long, and Linus recently asked that pull request text written with an
LLM be less verbose and prefer the imperative voice.

Add a skill that sends the agent to the parts of submitting-patches.rst,
5.Posting.rst and the maintainer documentation that cover commit
messages, cover letters and pull requests, and to the P: profiles of the
changed files. It adds what agents get wrong: stating only what the
change and the supplied sources support, keeping the text short and in
the imperative mood, and adding no tags that were not supplied.

Point the bug-fix procedure in coding-assistants.rst at the skill.

Link: https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst | 10 +++--
 agents/skills/commit-message/SKILL.md       | 42 +++++++++++++++++++++
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 agents/skills/commit-message/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index a89a33980c41f..9cae53cc5d8b9 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -41,6 +41,8 @@ The following skills are available:
   returns its stable tag, or checks an existing one.
 * agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere in the
   tree.
+* agents/skills/commit-message/SKILL.md writes, rewrites or reviews a commit
+  message or cover letter, and writes the text of a pull request.
 
 Licensing and Legal Requirements
 ================================
@@ -105,10 +107,10 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst). Then look for the same
    bug elsewhere with the find-siblings skill.
-6. Commit the working fix with a detailed message describing the problem, the
-   solution, a Fixes tag determined with the find-fixes skill, and a stable tag
-   if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
-   add an Assisted-by tag, as described above.
+6. Commit the working fix with a message written with the commit-message skill,
+   describing the problem, the solution, a Fixes tag determined with the
+   find-fixes skill, and a stable tag if the stable-tag skill calls for one. Do
+   not add a Signed-off-by tag, and add an Assisted-by tag, as described above.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/commit-message/SKILL.md b/agents/skills/commit-message/SKILL.md
new file mode 100644
index 0000000000000..0825c2f5117c9
--- /dev/null
+++ b/agents/skills/commit-message/SKILL.md
@@ -0,0 +1,42 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: commit-message
+description: >-
+  Write, rewrite or review the commit message for a Linux kernel change or
+  the cover letter for a patch series, and write the signed tag and pull
+  request text for a subsystem pull. Use when committing or preparing
+  patches, when asked to improve or check a commit message, or when
+  preparing a pull request for an upstream maintainer.
+---
+
+# Write a commit message
+
+Read "Describe your changes", the sections on tags, "The canonical patch
+format" and "Commentary" in Documentation/process/submitting-patches.rst, and
+Documentation/process/5.Posting.rst for cover letters. Follow the maintainer
+profiles, the `P:` entries in MAINTAINERS, for the changed files; they take
+precedence. Follow the rules for skills and for attribution in
+Documentation/process/coding-assistants.rst, and
+Documentation/process/generated-content.rst when a tool found the problem.
+When editing someone else's message, also follow
+Documentation/maintainer/modifying-patches.rst.
+
+- State only what the diff and the sources you were given support, such as a
+  bug report, a crash log, test results, or the list discussion found with
+  `lei q` on lore.kernel.org. If the reason for the change is not known,
+  return no message and say what is missing.
+- Take the Fixes and stable tags from the find-fixes and stable-tag skills.
+  Add other tags only when they were supplied or given on the list. Never add
+  a Signed-off-by.
+- Use the imperative mood and keep the message as short as its content
+  allows. Leave out markdown, labels such as "Root cause:", intensifiers, a
+  restatement of the subject, and the story of the investigation.
+- Check the result with `scripts/checkpatch.pl --no-signoff`.
+
+For the signed tag and email of a pull request, follow
+Documentation/maintainer/pull-requests.rst,
+Documentation/maintainer/rebasing-and-merging.rst and
+Documentation/maintainer/messy-diffstat.rst. Summarize what the pull contains
+and why from the commit messages in the range, in the same voice, without
+repeating the shortlog. Ask the caller for conflict resolutions and testing
+that the history does not show.
-- 
2.53.0

