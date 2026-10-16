Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2274BFE9E;
	Fri, 16 Oct 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164521; cv=none; b=ckHNiFnm0i/MXqVgFTMi2sdiLM2XQQ5N+lZdyNQMLAbQvcT0AFLpB5MiWHbx14oxjS5m5BlROWEcxg2qa13Eywu/7msp668z9E4wqrQ73iVrExRUhO6vNmoEvvp6LqaxL26jlX9ksK5QtyFwuoNIhc9zTPazGQDleRdb2ML+6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164521; c=relaxed/simple;
	bh=INSoimjyuOYQbfqICS3wkQEQGXzFG6dNfAcLcLo1drE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnpiQPN9KeeGTOvuuIVJ3syMeiRKtpdVYnQyqn4ZGowpB/1rgFWEm7cPtwzX/q9lG2SGFXhLR2W0WDNTxJSCBUlrRLk2ThH1qGU3iGTBRn9GIQmhIOwaofqdJM9EmLLJDOGHIZqaZpNNQvFsLsOTobt8O6T3NINxR0RYEN8lTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4kvEb1M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4kvEb1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2A51F000C5;
	Fri, 16 Oct 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164519;
	bh=IBa14L6gx4vZB+8K0gvlvR12WDUCo9Y7fZkFO92pp8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c4kvEb1MtMjInqEqT03AAKfZxNjeBY2vzXBwxNLwo8VPQAx+S/chECCP44I3sT5s6
	 oGXRe8YW+nW3O8uidmGCoRJp9IPrBkuYkmlo+nVr1mCwGz20nbzjwdU8xCefYBKvzm
	 CO9b2yjmzSGW8VOXE5MaMFbPGaqaFiqvOscrY8zn6MC8t6XIX/2ByGtyNmr1uv1TKD
	 Cf/Wg2D17jJpZIDLKHOXYd9dRGdDrYmT/u3aUSVp6u2BYS0EJq8RvBROcTnIITVxVr
	 e7XD4Z1ztlVdIxLXUMmIOrwz7h20B0qR8izpbxsYFkve2SUQSOnrfFrh8zfHyT3ML5
	 Xhc1O2IpzeYMw==
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
Subject: [PATCH v3 4/7] agents: add a skill to determine Fixes tags
Date: Fri, 16 Oct 2026 11:28:24 -0400
Message-ID: <20261016152828.3765695-5-sashal@kernel.org>
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

Blame and existing Fixes tags can point to code movement instead of the
change that introduced a bug. Add a skill that sends the agent to the
description of the Fixes: tag in submitting-patches.rst, and adds the
checks agents tend to skip: pinning down the bug before searching,
following the code past moves and refactors, comparing each candidate
with its parent, handling merges, reverts, backports and bugs older than
the Git history, and taking the commit ID and subject from the commit
rather than typing them.

If the origin cannot be established, the skill returns no tag. Point the
bug-fix procedure in coding-assistants.rst at the skill.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst |  9 +++--
 agents/skills/find-fixes/SKILL.md           | 39 +++++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 agents/skills/find-fixes/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 1efc7b08f09f8..ddff951856dce 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -33,6 +33,11 @@ or send mail. A skill returns its result with the evidence for it, or says what
 is missing. Do not fill a missing result with a guess or a placeholder, and do
 not finalize the work until it is resolved.
 
+The following skills are available:
+
+* agents/skills/find-fixes/SKILL.md determines the Fixes tag of a bug fix, or
+  checks an existing one.
+
 Licensing and Legal Requirements
 ================================
 
@@ -96,8 +101,8 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
 6. Commit the working fix with a detailed message describing the problem, the
-   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
-   Assisted-by tag, as described above.
+   solution and a Fixes tag determined with the find-fixes skill. Do not add a
+   Signed-off-by tag, and add an Assisted-by tag, as described above.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/find-fixes/SKILL.md b/agents/skills/find-fixes/SKILL.md
new file mode 100644
index 0000000000000..b5dd51d66adb7
--- /dev/null
+++ b/agents/skills/find-fixes/SKILL.md
@@ -0,0 +1,39 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: find-fixes
+description: >-
+  Determine the bug-introducing commit and return a verified Fixes tag for
+  a Linux kernel fix. Use when preparing or reviewing bug-fix patches,
+  drafting their commit messages, or checking an existing Fixes tag.
+---
+
+# Determine a Fixes tag
+
+Read the description of the Fixes: tag in
+Documentation/process/submitting-patches.rst. It says which commit to name
+and how to format the tag. Follow the rules for skills in
+Documentation/process/coding-assistants.rst.
+
+- First establish exactly which bug the fix addresses: the failure, how it is
+  triggered and the code involved. Trace only that bug. If the search leads
+  to a different bug or subsystem, go back to the fix.
+- Name a commit from the history of the tree the fix applies to. A stable
+  backport of that commit, or a commit that exists only on another branch, is
+  not a valid tag.
+- Treat blame output, an existing Fixes tag and a bisection result as leads,
+  not answers. Follow the code back through moves, renames, file splits and
+  older implementations to the commit that made it wrong.
+- For each candidate, compare the commit with its parent and explain why the
+  code was correct before and wrong after. Keep apart the commit that added
+  the code, the commit that made it wrong, and a later commit that only made
+  the bug reachable.
+- Check each parent of a merge, whether the bug was reverted and later
+  reintroduced, and whether a backport differs from its upstream commit.
+- If the bug is already present in the first commit of the Git history, name
+  that commit: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2"). Confirm that the bug
+  exists there instead of using it as a default. A shallow clone boundary is
+  not an introducing commit; report the limit instead.
+
+Take the commit ID and subject from the commit itself instead of typing them.
+Return the tag with that explanation and the candidates you rejected. If the
+origin cannot be established, return no tag and say what is missing.
-- 
2.53.0

