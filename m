Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA4E4EFFB4;
	Fri, 16 Oct 2026 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166752; cv=none; b=rkfZQOs5xmPp4sD/eP2dZ/gIcfR+mVS2rm6Dn1rqC4GKrz7H/XKgIs8+ZOF4mmHExoO7H4+B0ZJ1yaEdXix86QPj9GKRXMaIJhckfmyda/xGwmjGvW+BQnMqi5iI8N1i6qql4WTktBfGNGey5T1+SqoBZcFiiP5PVpHJZyowW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166752; c=relaxed/simple;
	bh=z00kZSrfDHjx2jaAenRXcRDRrpo1U+a+Pz8k6xj3y3Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=fdWFoukB7wNbrvac+Etl4b55njA5sxkf70EGuyCwXXeaa5lIBcKSMtuiw7ZOASdrQGde8PpTLOdoPEwXuZ37xAk1HMShXIE+fc6nFavAidUDuH9rgt1AZNQOwFmszd7eRKZVvuVZNIGJOE3vMCY2VNqSuHAOzDDoyI/a1iEa4Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Fri, 16 Oct 2026 17:05:39 +0100
From: Bradley Morgan <brads@mainlining.org>
To: sashal@kernel.org
CC: broonie@kernel.org, corbet@lwn.net, error27@gmail.com, geert@linux-m68k.org,
 gregkh@linuxfoundation.org, kees@kernel.org, konstantin@linuxfoundation.org,
 ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com, leon@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@leemhuis.info,
 mst@redhat.com, ojeda@kernel.org, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: Re: [PATCH v3 7/7] agents: add a skill to write commit messages
In-Reply-To: <20261016152828.3765695-8-sashal@kernel.org>
Message-ID: <0CD32CFD-D3B9-4D48-A5E5-10C092719E70@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 October 2026 16:28:27 BST, Sasha Levin <sashal@kernel.org> wrote:
>Assistants are asked to commit a fix with a detailed message, and the
>find-fixes and stable-tag skills leave their tags for that message, but
>nothing says how to write it. Messages written by assistants tend to be
>long, and Linus recently asked that pull request text written with an
>LLM be less verbose and prefer the imperative voice.
>
>Add a skill that sends the agent to the parts of submitting-patches.rst,
>5.Posting.rst and the maintainer documentation that cover commit
>messages, cover letters and pull requests, and to the P: profiles of the
>changed files. It adds what agents get wrong: stating only what the
>change and the supplied sources support, keeping the text short and in
>the imperative mood, and adding no tags that were not supplied.
>
>Point the bug-fix procedure in coding-assistants.rst at the skill.
>

This would be relevant to kill verbosity, no?

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Link: https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com
>Assisted-by: LLM
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> Documentation/process/coding-assistants.rst | 10 +++--
> agents/skills/commit-message/SKILL.md       | 42 +++++++++++++++++++++
> 2 files changed, 48 insertions(+), 4 deletions(-)
> create mode 100644 agents/skills/commit-message/SKILL.md
>
>diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
>index a89a33980c41f..9cae53cc5d8b9 100644
>--- a/Documentation/process/coding-assistants.rst
>+++ b/Documentation/process/coding-assistants.rst
>@@ -41,6 +41,8 @@ The following skills are available:
>   returns its stable tag, or checks an existing one.
> * agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere
> in the
>   tree.
>+* agents/skills/commit-message/SKILL.md writes, rewrites or reviews a commit
>+  message or cover letter, and writes the text of a pull request.
> 
> Licensing and Legal Requirements
> ================================
>@@ -105,10 +107,10 @@ these steps:
>    another one. The fix must not add build warnings and must pass the
>    checkpatch.pl checks (see submitting-patches.rst). Then look for the same
>    bug elsewhere with the find-siblings skill.
>-6. Commit the working fix with a detailed message describing the problem, the
>-   solution, a Fixes tag determined with the find-fixes skill, and a stable tag
>-   if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
>-   add an Assisted-by tag, as described above.
>+6. Commit the working fix with a message written with the commit-message skill,
>+   describing the problem, the solution, a Fixes tag determined with the
>+   find-fixes skill, and a stable tag if the stable-tag skill calls for one. Do
>+   not add a Signed-off-by tag, and add an Assisted-by tag, as described above.
> 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>    Documentation/process/security-bugs.rst shows how to do that.
> 8. Indicate what could not be done. If the fix could not be built or
> tested, or
>diff --git a/agents/skills/commit-message/SKILL.md b/agents/skills/commit-message/SKILL.md
>new file mode 100644
>index 0000000000000..0825c2f5117c9
>--- /dev/null
>+++ b/agents/skills/commit-message/SKILL.md
>@@ -0,0 +1,42 @@
>+---
>+# SPDX-License-Identifier: GPL-2.0-only
>+name: commit-message
>+description: >-
>+  Write, rewrite or review the commit message for a Linux kernel change or
>+  the cover letter for a patch series, and write the signed tag and pull
>+  request text for a subsystem pull. Use when committing or preparing
>+  patches, when asked to improve or check a commit message, or when
>+  preparing a pull request for an upstream maintainer.
>+---
>+
>+# Write a commit message
>+
>+Read "Describe your changes", the sections on tags, "The canonical patch
>+format" and "Commentary" in Documentation/process/submitting-patches.rst, and
>+Documentation/process/5.Posting.rst for cover letters. Follow the maintainer
>+profiles, the `P:` entries in MAINTAINERS, for the changed files; they take
>+precedence. Follow the rules for skills and for attribution in
>+Documentation/process/coding-assistants.rst, and
>+Documentation/process/generated-content.rst when a tool found the problem.
>+When editing someone else's message, also follow
>+Documentation/maintainer/modifying-patches.rst.
>+
>+- State only what the diff and the sources you were given support, such as a
>+  bug report, a crash log, test results, or the list discussion found with
>+  `lei q` on lore.kernel.org. If the reason for the change is not known,
>+  return no message and say what is missing.
>+- Take the Fixes and stable tags from the find-fixes and stable-tag skills.
>+  Add other tags only when they were supplied or given on the list. Never add
>+  a Signed-off-by.
>+- Use the imperative mood and keep the message as short as its content
>+  allows. Leave out markdown, labels such as "Root cause:", intensifiers, a
>+  restatement of the subject, and the story of the investigation.
>+- Check the result with `scripts/checkpatch.pl --no-signoff`.
>+
>+For the signed tag and email of a pull request, follow
>+Documentation/maintainer/pull-requests.rst,
>+Documentation/maintainer/rebasing-and-merging.rst and
>+Documentation/maintainer/messy-diffstat.rst. Summarize what the pull contains
>+and why from the commit messages in the range, in the same voice, without
>+repeating the shortlog. Ask the caller for conflict resolutions and testing
>+that the history does not show.
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
