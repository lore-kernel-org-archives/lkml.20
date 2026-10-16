Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9054E73BE;
	Fri, 16 Oct 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164526; cv=none; b=mqR1SlmtkWujwRwHtiXR8wvWUant9SFX2sJFhzBWhdGs1IbU4R7pJHFTc15RJ74brIDT1xp+KjYHEPOs5hhw7lTofU9H8M7eFmFLBKJ7qe7y9o8yx+P1NGJD8H8CxPJ/ZEZ660dd9w4WTp6fQqNiqlKEvT2URKsloASFGPRrb2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164526; c=relaxed/simple;
	bh=8kVjykMyManGZhZ+/2f3hBYbozBVDhZFuz4DVC06+a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbEHzibaO3fUIdLa5wSiju8C6+UzkYKqv2PgWiwA0rOuWRzGvJVMFkD1vhj5FFAYP2/8seJRTURfLZ2QvLD81t7+dejSYMPDJyHORemewpzn+Aq4w1vRCqvf8JgJIMTM4zZo4FGNoZ393jlVf9GrUguDqKCmPtOPUtt6a3IcpMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M27pB3Zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M27pB3Zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7243D1F000C6;
	Fri, 16 Oct 2026 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164524;
	bh=RnQ7OsHSHtRunD9WK97qAaLfBda46Z6BJcOTHh72RCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M27pB3ZrYq7A+R93QTT471Z504gBz51KsngkYS4G+T4J6UD9KX8z0phxi7y0bCqgJ
	 Rz5tMk/OBFajoqAkD+fwVR6WR80RzUI4gO0WZi2HIgEHBcdBUqjLubtJ8K+X+14/NJ
	 D28jJcdAy4/+I8z5+oIeG8WH9CMsh11s3Rr6TpngbdG3IKpbPYem5DV5Ih+KYC/+BD
	 gLBWbdaGmCKnqjwhxhbWhDNVoWWUN60dvTnIf4V8eRKgC2DsFqhoQNh6fKyjeKGcWS
	 O5sTvIIMdQlSFpY+4CbIkEUPog6GirmTCGwevlLUoHSrmciFFh5AemPcW8zx45RRtM
	 eaYwdw5+brkSg==
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
Subject: [PATCH v3 6/7] agents: add a skill to find other instances of a fixed bug
Date: Fri, 16 Oct 2026 11:28:26 -0400
Message-ID: <20261016152828.3765695-7-sashal@kernel.org>
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

A bug fixed in one place often exists elsewhere, in copied code, sibling
drivers, or other users of the same interface, and reviewers routinely
ask whether that was checked. Left alone, agents tend to audit the whole
tree by reading it. Add a skill that states the defect as a rule,
searches for it through shared interfaces, copied code, the introducing
series and earlier fixes, and verifies each candidate before reporting
it.

When Coccinelle is available, the skill searches with a semantic patch:
it looks for an existing one under scripts/coccinelle/, checks that the
rule marks the fixed site in the code before the fix, runs it over the
whole tree with coccicheck, and checks which code spatch could not
parse. These steps live in references/coccinelle.md, which the agent
reads only when it uses Coccinelle.

Tested on the parent of commit 989fe6771266 ("drm/nouveau/gsp: fix
mismatched alloc/free for kvmalloc()"): both the existing
api/kfree_mismatch.cocci and the example rule mark the two kfree() calls
that commit fixed, and a whole-tree run found the same bug in four other
drivers that were later fixed separately.

The sites found are reported, not fixed; each needs its own fix, Fixes
tag and stable decision. Point the bug-fix procedure in
coding-assistants.rst at the skill.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst   |  5 +-
 agents/skills/find-siblings/SKILL.md          | 31 +++++++++
 .../find-siblings/references/coccinelle.md    | 66 +++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 agents/skills/find-siblings/SKILL.md
 create mode 100644 agents/skills/find-siblings/references/coccinelle.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index fc4e98fd96e11..a89a33980c41f 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -39,6 +39,8 @@ The following skills are available:
   checks an existing one.
 * agents/skills/stable-tag/SKILL.md decides whether a fix goes to stable and
   returns its stable tag, or checks an existing one.
+* agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere in the
+  tree.
 
 Licensing and Legal Requirements
 ================================
@@ -101,7 +103,8 @@ these steps:
 5. Build and verify that the fix works either using the reproducer or by
    re-running a complete analysis; drop any fix that doesn't work and try
    another one. The fix must not add build warnings and must pass the
-   checkpatch.pl checks (see submitting-patches.rst).
+   checkpatch.pl checks (see submitting-patches.rst). Then look for the same
+   bug elsewhere with the find-siblings skill.
 6. Commit the working fix with a detailed message describing the problem, the
    solution, a Fixes tag determined with the find-fixes skill, and a stable tag
    if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
diff --git a/agents/skills/find-siblings/SKILL.md b/agents/skills/find-siblings/SKILL.md
new file mode 100644
index 0000000000000..471ce8d9c0bd6
--- /dev/null
+++ b/agents/skills/find-siblings/SKILL.md
@@ -0,0 +1,31 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: find-siblings
+description: >-
+  Find other places in the Linux kernel tree that have the same defect as a
+  bug being fixed, and verify each candidate. Use after fixing or reviewing
+  a bug fix, or when asked whether the same bug exists elsewhere.
+---
+
+# Find other instances of a bug
+
+Follow the rules for skills in Documentation/process/coding-assistants.rst.
+
+- State the defect as a rule that does not depend on local names, such as
+  "memory from kvmalloc() is released with kfree()".
+- Search the tree as it was before the fix, not the working tree. Look at
+  other users of the same interface, field or lock, code copied from the same
+  origin, the rest of the series that introduced the bug, and earlier fixes
+  for the same defect. Limit history searches to the relevant directories.
+- If Coccinelle is available (`spatch --version` works), search for the
+  defect with a semantic patch as
+  [references/coccinelle.md](references/coccinelle.md) describes. Otherwise
+  use text searches and report that limit.
+- A match is a lead. Read each candidate with its callers, locking and object
+  lifetimes, and classify it as confirmed, safe or undetermined, with the
+  reason. Check whether a confirmed site is already fixed in the current tree
+  or in a pending tree such as linux-next.
+
+Return the searches you ran and their scope, and the classified sites with
+their maintainers. Do not fix the sites: each confirmed one is a separate bug
+that needs its own fix, Fixes tag and stable decision.
diff --git a/agents/skills/find-siblings/references/coccinelle.md b/agents/skills/find-siblings/references/coccinelle.md
new file mode 100644
index 0000000000000..6b09ce9d04c8c
--- /dev/null
+++ b/agents/skills/find-siblings/references/coccinelle.md
@@ -0,0 +1,66 @@
+<!-- SPDX-License-Identifier: GPL-2.0-only -->
+
+# Searching for a bug pattern with Coccinelle
+
+Documentation/dev-tools/coccinelle.rst describes `make coccicheck` and its
+options. The semantic patch language is documented at
+https://coccinelle.gitlabpages.inria.fr/website/docs/.
+
+1. Look under `scripts/coccinelle/` for a semantic patch that already covers
+   the defect. Read its rules rather than its name: `kfree()` of memory from
+   `kvmalloc()` is covered by `api/kfree_mismatch.cocci`, while
+   `api/kvmalloc.cocci` only flags an open-coded `is_vmalloc_addr()` test.
+
+2. Otherwise, write a semantic patch outside the repository. Match only what
+   the defect needs, not names or statements specific to the fixed site. Mark
+   the lines of interest with `*`, and declare `virtual context`: coccicheck
+   passes `-D context`, and spatch rejects a mode the file does not declare.
+   A minimal rule for memory from `kvmalloc()` released with `kfree()`, a
+   case that `api/kfree_mismatch.cocci` covers more completely:
+
+       virtual context
+
+       @@
+       expression E;
+       @@
+       E = \(kvmalloc\|kvzalloc\|kvcalloc\|kvmalloc_array\)(...);
+       ...
+       * kfree(E);
+
+3. Check that it finds the site you fixed. Coccinelle reads the files on
+   disk, where the fix is usually already applied, so copy the file as it was
+   before the fix to a directory outside the repository and run
+   `spatch -D <mode> --very-quiet --sp-file <rule> <copy>`, with a mode the
+   rule declares on a `virtual` line, such as `context` or `report`. Without
+   `-D`, rules that depend on a mode do not run and nothing is reported. The
+   rule must mark the fixed site in that copy, and nothing in the fixed
+   version. If it misses the site, correct the rule before searching further.
+
+4. Search the whole tree:
+
+       make coccicheck MODE=context COCCI=<rule> DEBUG_FILE=<new log file>
+
+   - Use a `MODE` the rule declares on a `virtual` line, as in step 3.
+   - In context mode the output is a diff, and each line starting with `-`
+     is a line the rule marked; report mode prints one warning per site.
+     coccicheck searches the files on disk, so a site you already fixed
+     there is not marked; step 3 covers it.
+   - The kernel's `.cocciconfig` makes spatch skip files that do not contain
+     the rule's identifiers, so a whole-tree search is usually quick when the
+     rule names distinctive functions. Add `M=<dir>/` only if it is not.
+   - Give `COCCI` and `DEBUG_FILE` as absolute paths. With `M=`, coccicheck
+     runs from that directory.
+   - Read the log. Without `DEBUG_FILE`, spatch errors are discarded and a
+     broken rule shows only as "coccicheck failed". coccicheck refuses to
+     reuse an existing log file.
+   - Header files are searched only with `SPFLAGS=--include-headers`, or with
+     a `// Options: --include-headers` line at the top of the rule.
+
+5. Check what was not searched. Coccinelle skips code it cannot parse without
+   saying so. Run `spatch --parse-c` on the searched files or directories: a
+   nonzero `nb bad` count means part of them was skipped. Search those files
+   another way and report the gap.
+
+If the rule marks many sites that turn out to be safe, tighten it, for example
+with `when !=` constraints, and run it again rather than discarding candidates
+by hand.
-- 
2.53.0

