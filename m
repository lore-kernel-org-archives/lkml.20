Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBA42E8F8;
	Fri, 16 Oct 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166674; cv=none; b=b6puxHXQJlexU5NMuKQGwWXUhrYrVnLRToc5bzFJRmxzdc9UfNVyPnrxt9sIicA2ljdZIwil+It4RR85b4Atjk3j0SBMj1JP4CioxIl5gwQw0+rIDaq8H9HTaqnreP3CxYmjm/vhvlde0JXRuzOtfpDbl0mRSsh99V8xWu+t9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166674; c=relaxed/simple;
	bh=pifa04UL3YclPpF4Z5KTj4zcVl6EU7UC7u8rina5Psc=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Nu6qIX/zMHtf2GesSZWohNGluBI+V6cSo6C7wuMpboM3/NvfUZNvVCK+D5F786Czr+xXzbsH/YS4gQf+zpRsfjlLU7L0M1q3Iw7k39y/2k8s7sWqEtQDEMxvLWwKJ+ZzeMczDk4U9jytcjWtf10izx3uZlZ1PnbvmmVr3S2aCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Fri, 16 Oct 2026 17:04:31 +0100
From: Bradley Morgan <brads@mainlining.org>
To: sashal@kernel.org
CC: broonie@kernel.org, corbet@lwn.net, error27@gmail.com, geert@linux-m68k.org,
 gregkh@linuxfoundation.org, kees@kernel.org, konstantin@linuxfoundation.org,
 ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com, leon@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@leemhuis.info,
 mst@redhat.com, ojeda@kernel.org, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: Re: [PATCH v3 4/7] agents: add a skill to determine Fixes tags
In-Reply-To: <20261016152828.3765695-5-sashal@kernel.org>
Message-ID: <99CAFCE8-9004-4D44-A788-F7AD390A23C4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 October 2026 16:28:24 BST, Sasha Levin <sashal@kernel.org> wrote:
>Blame and existing Fixes tags can point to code movement instead of the
>change that introduced a bug. Add a skill that sends the agent to the
>description of the Fixes: tag in submitting-patches.rst, and adds the
>checks agents tend to skip: pinning down the bug before searching,
>following the code past moves and refactors, comparing each candidate
>with its parent, handling merges, reverts, backports and bugs older than
>the Git history, and taking the commit ID and subject from the commit
>rather than typing them.
>
>If the origin cannot be established, the skill returns no tag. Point the
>bug-fix procedure in coding-assistants.rst at the skill.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>
>Assisted-by: LLM
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> Documentation/process/coding-assistants.rst |  9 +++--
> agents/skills/find-fixes/SKILL.md           | 39 +++++++++++++++++++++
> 2 files changed, 46 insertions(+), 2 deletions(-)
> create mode 100644 agents/skills/find-fixes/SKILL.md
>
>diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
>index 1efc7b08f09f8..ddff951856dce 100644
>--- a/Documentation/process/coding-assistants.rst
>+++ b/Documentation/process/coding-assistants.rst
>@@ -33,6 +33,11 @@ or send mail. A skill returns its result with the evidence for it, or says what
> is missing. Do not fill a missing result with a guess or a placeholder,
> and do
> not finalize the work until it is resolved.
> 
>+The following skills are available:
>+
>+* agents/skills/find-fixes/SKILL.md determines the Fixes tag of a bug fix, or
>+  checks an existing one.
>+
> Licensing and Legal Requirements
> ================================
> 
>@@ -96,8 +101,8 @@ these steps:
>    another one. The fix must not add build warnings and must pass the
>    checkpatch.pl checks (see submitting-patches.rst).
> 6. Commit the working fix with a detailed message describing the problem,
> the
>-   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
>-   Assisted-by tag, as described above.
>+   solution and a Fixes tag determined with the find-fixes skill. Do not add a
>+   Signed-off-by tag, and add an Assisted-by tag, as described above.
> 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>    Documentation/process/security-bugs.rst shows how to do that.
> 8. Indicate what could not be done. If the fix could not be built or
> tested, or
>diff --git a/agents/skills/find-fixes/SKILL.md b/agents/skills/find-fixes/SKILL.md
>new file mode 100644
>index 0000000000000..b5dd51d66adb7
>--- /dev/null
>+++ b/agents/skills/find-fixes/SKILL.md
>@@ -0,0 +1,39 @@
>+---
>+# SPDX-License-Identifier: GPL-2.0-only
>+name: find-fixes
>+description: >-
>+  Determine the bug-introducing commit and return a verified Fixes tag for
>+  a Linux kernel fix. Use when preparing or reviewing bug-fix patches,
>+  drafting their commit messages, or checking an existing Fixes tag.
>+---
>+
>+# Determine a Fixes tag
>+
>+Read the description of the Fixes: tag in
>+Documentation/process/submitting-patches.rst. It says which commit to name
>+and how to format the tag. Follow the rules for skills in
>+Documentation/process/coding-assistants.rst.
>+
>+- First establish exactly which bug the fix addresses: the failure, how it is
>+  triggered and the code involved. Trace only that bug. If the search leads
>+  to a different bug or subsystem, go back to the fix.
>+- Name a commit from the history of the tree the fix applies to. A stable
>+  backport of that commit, or a commit that exists only on another branch, is
>+  not a valid tag.
>+- Treat blame output, an existing Fixes tag and a bisection result as leads,
>+  not answers. Follow the code back through moves, renames, file splits and
>+  older implementations to the commit that made it wrong.
>+- For each candidate, compare the commit with its parent and explain why the
>+  code was correct before and wrong after. Keep apart the commit that added
>+  the code, the commit that made it wrong, and a later commit that only made
>+  the bug reachable.
>+- Check each parent of a merge, whether the bug was reverted and later
>+  reintroduced, and whether a backport differs from its upstream commit.
>+- If the bug is already present in the first commit of the Git history, name
>+  that commit: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2"). Confirm that the bug
>+  exists there instead of using it as a default. A shallow clone boundary is
>+  not an introducing commit; report the limit instead.
>+
>+Take the commit ID and subject from the commit itself instead of typing them.
>+Return the tag with that explanation and the candidates you rejected. If the
>+origin cannot be established, return no tag and say what is missing.
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
