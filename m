Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513023;
	b=gQAtc0Geg/Ik9DDLW3nlhRyXl+sgkOW2+EbktLncdKPKO70nNtt741Ad7BTIDUNHINqT
	 KGvoFyAcRRefJ68rjrYX9g7+BHKMHIffMUnHudy8WJgFZJ2sPkEuWWQtXxMHfQJqJFfD5
	 /WUlSSkRyC7fORAo7Bu3Yg4z9F5PjG1QZlO78Ol4YTEjwhEP5aSHNRwBbdNbwAEyBEyia
	 P1IIK0+z872pxya/GmkTjGFdG/ZiJOoL7a5gBr8S5hzHpfdj8R5ADqf1yWtxGDBMZyazw
	 9VstJQK9f/thb7N4+K7MK5f5D5RZYzrYJP3Tqeq+YkC/IAcxrKAcuU26+c1OMcVv+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513023;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oF8o2NkVOsBS01dOJyuHdHQ0Bcvo6IPZ+9izz83SPZo=;
	b=17REjM2ziW4xPiVpXk06zKJndL+ScxJtjWzP3+ifD4Bh8nXYS4eebu0DyBpKDAYzfTtR
	 yWgROF/ZCv0VPhKDts5481skSfy2ckohddPpATmLmbUniyg44rn29PGuUF7GOIip6QiIx
	 7mrFRdykZOsaGATGx3wfMiy1fSnPmqzeM4rrU258gj4Kkg2aLZy/XWpXYXFPCqh4DSTEe
	 mgMn64GP9VAoMm9ryMdld1wAH827VKUNy7d6v8iIM+JSWArG1kpQvTSzfH10RkN117/uI
	 fVzKVLsgukxOuBdNu5n4JLAMWBTYqckRrz2I35oNX6S4QxQpHE64YoQqQyoNbJ3fBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLbW5fDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537EF606A32D;
	Tue, 20 Oct 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLbW5fDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFFD1F000C4;
	Tue, 20 Oct 2026 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513023;
	bh=oF8o2NkVOsBS01dOJyuHdHQ0Bcvo6IPZ+9izz83SPZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JLbW5fDEVYrKo6ZjPeo5eyS966SGrbULngiTBtm1nuiL8LRkc/2e4V1WIkq0F2BWI
	 1EZpZuJHLQYXkvUOjV+adFLTid9IPmDnmq0b5OOtpBXyCN6kOngDeEXiV+8pjFmxVV
	 eXZgNuAGS4sWc2TpecBzf1B+B1YTwFlqkHTYZqs6KCN0sBj36nI73Kpqn1EjQEpWH2
	 k9DSQttz9YZ9oA6DPAM8qmFTkLmnEkig00Ng4JQfakwgB8+bWuVDJmCi6zkgskPAfB
	 Eua1wzgzzwKkHBcYtf3kvzqjgBYNOEEVbB+6VEdy00J5wD/VYIYT4PE7ngSYYT6LCm
	 KeK8/VJGuecDg==
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
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	SJ Park <sj@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v4 2/5] agents: add a skill to determine Fixes tags
Date: Tue, 20 Oct 2026 12:16:39 -0400
Message-ID: <20261020161642.3713052-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020161642.3713052-1-sashal@kernel.org>
References: <20261020161642.3713052-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Blame and existing Fixes tags can point to code movement instead of the
change that introduced a bug. Add a skill that sends the agent to the
description of the Fixes: tag in submitting-patches.rst, and adds the
checks agents tend to skip: pinning down the bug before searching,
following the code past moves and refactors, comparing each candidate
with its parent, tagging a later commit that only exposed the bug as
well, handling merges, reverts, backports and bugs older than the Git
history, and taking the commit ID and subject from the commit rather
than typing them.

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
index 0000000000000..12b6ea83876d9
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
+  the bug reachable, which gets a tag of its own.
+- Check each parent of a merge, whether the bug was reverted and later
+  reintroduced, and whether a backport differs from its upstream commit.
+- If the bug is already present in the first commit of the Git history, name
+  that commit: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2"). Confirm that the bug
+  exists there instead of using it as a default. A shallow clone boundary is
+  not an introducing commit; report the limit instead.
+
+Take the commit ID and subject from the commit itself instead of typing them.
+Return the tags with that explanation and the candidates you rejected. If the
+origin cannot be established, return no tag and say what is missing.
-- 
2.53.0

