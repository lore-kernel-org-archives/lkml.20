Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261D4F96C1;
	Mon, 12 Oct 2026 21:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840907; cv=none; b=Y9GEz9NBCQ4iT329Kf8C9wMQB5dtPFoUFePPDr2PfMk4vx5NEJ3S88ErFF4+JvnV7FNvEdRDHDpyQ8K1X7m8iiCcZW8owwB3LOvIc+5H9YE6vy10SDmr2C0ZsEIQhqadB/WFG3CsLQk55DbNEI2YU/LXC0+fzCul0ylnuH8b0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840907; c=relaxed/simple;
	bh=JTC8TLFs9ZzMIepkfXxMna6r1sbupt+WqrI/9cmE+cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoN9X5SVg9JJpI6BA6eQ9qKlmQOW8i22O2pTH874ZFdU+Uk30MAevx5SzYTMgQklEHGVkBMTspY+q3U0XlqtYjjwIiXTPjAy4tY4r/0s/9TLRavXiSeGRncqFHjYdbdzeu+Fr4ZlqaKlTOdRcuNBZlrusid1txeqs8aXzhnjQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9Eev32I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9Eev32I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537CF1F008A6;
	Mon, 12 Oct 2026 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840901;
	bh=bbQ2ZpGNZwMV6P908/6Yn16+KTj09Eqwbuwx/Sp87dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M9Eev32Ij8fy/fmV9IW/S4wSGB6S4iSB2+vhD6hUVDgwXrh7y0vfPxgvzv15QNNLO
	 iObTqf2Q/G254RnqR7FYvTa4TtxWH9bP937l7M+l0iFoPDj6QmPZgLBE7ysTyXlcqH
	 eqVE8t1O272s7ySHxN3ut6yk0fX3UKZsAZmKs8ivcigiuoFgmWCybGqptevp+HRMpU
	 o9mE9NUlbA/hBXxQ9zdjqO6Y9vkhfn4EvtITGTH6hAdiDkdBz5l7lBO0g3fYZjTc7t
	 IAuBbqYHL2Ib5DP1M3jrd5iXKNkO4ABSOmbmklxZH+orUM0Z8D379z0NvHS/9N+kwX
	 m72zTy+hkSyxA==
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2 4/5] agents: add a skill to find other instances of a fixed bug
Date: Mon, 12 Oct 2026 17:34:51 -0400
Message-ID: <20261012213452.1863248-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012213452.1863248-1-sashal@kernel.org>
References: <20261012213452.1863248-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bug fixed in one place often exists elsewhere, in copied code, sibling
drivers, or other users of the same interface, and reviewers routinely
ask whether that was checked. Add a read-only procedure that states the
defect as a rule, searches for it through shared interfaces, copied
code, the introducing series, Coccinelle patterns and earlier fixes,
and verifies each candidate before reporting it.

Keep the skill entry point and procedure together under
agents/skills/find-siblings/. Connect it to the coding-assistant guidance
so that the bug-fix procedure looks for the same bug elsewhere after a
fix is verified. The sites found are reported, not fixed; each needs its
own fix, Fixes tag and stable decision.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst |  16 ++-
 agents/skills/find-siblings/SKILL.md        |  22 ++++
 agents/skills/find-siblings/guide.rst       | 138 ++++++++++++++++++++
 3 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 agents/skills/find-siblings/SKILL.md
 create mode 100644 agents/skills/find-siblings/guide.rst

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 0eb8dc91575bf..004a1e7a20de1 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -100,6 +100,19 @@ The skill returns a decision only. It does not modify files or commit
 messages. If the decision remains unresolved, report the missing evidence
 and keep the fix as a draft.
 
+Finding similar bugs
+====================
+
+After fixing a bug, an assistant should follow
+agents/skills/find-siblings/guide.rst to look for the same defect elsewhere
+in the tree. This also applies when a reviewer asks whether other places
+have the same problem. The skill entry point is
+agents/skills/find-siblings/SKILL.md.
+
+The skill reports the sites it finds and verifies. It does not fix them or
+add them to the fix being prepared. Report confirmed sites with the fix, so
+that they can be fixed separately.
+
 Procedure for finding and fixing bugs
 =====================================
 
@@ -122,7 +135,8 @@ these steps:
 5. Build and verify that the fix works either using the reproducer or by
    re-running a complete analysis; drop any fix that doesn't work and try
    another one. The fix must not add build warnings and must pass the
-   checkpatch.pl checks (see submitting-patches.rst).
+   checkpatch.pl checks (see submitting-patches.rst). Then look for the same
+   bug elsewhere, as described above.
 6. Determine the Fixes tag and the stable tag as described above. Once both
    are resolved, commit the working fix with a detailed message describing
    the problem, the solution, the verified Fixes tag and any stable tag. This
diff --git a/agents/skills/find-siblings/SKILL.md b/agents/skills/find-siblings/SKILL.md
new file mode 100644
index 0000000000000..f5aeb1744cdc8
--- /dev/null
+++ b/agents/skills/find-siblings/SKILL.md
@@ -0,0 +1,22 @@
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
+Read and follow [the search procedure](guide.rst), relative to this skill
+directory. The canonical path in the kernel repository is
+`agents/skills/find-siblings/guide.rst`. If necessary, locate the
+repository root with `git rev-parse --show-toplevel`.
+
+Perform the search only. Return the verified sites, the candidates ruled
+out and the searches performed, with supporting evidence. Do not fix the
+sites found or add them to the fix being prepared. Do not change files in
+the repository, the index, refs, or commit messages; temporary search
+inputs such as semantic patches belong outside the repository. Fixing the
+sites found belongs to the calling workflow.
diff --git a/agents/skills/find-siblings/guide.rst b/agents/skills/find-siblings/guide.rst
new file mode 100644
index 0000000000000..dd24e319fec20
--- /dev/null
+++ b/agents/skills/find-siblings/guide.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. _find_siblings:
+
+Finding other instances of a fixed bug
+======================================
+
+A bug fixed in one place often exists elsewhere: in code copied from the same
+origin, in sibling drivers built from a common template, in other users of the
+same interface, or wherever the same mistaken assumption was made. Reviewers
+routinely ask whether other places have the same problem. This procedure
+searches for such sites and verifies each candidate.
+
+The procedure uses read-only inspection. It does not authorize changing files
+in the repository, applying patches, checking out revisions, fetching history,
+or creating or amending commits. Temporary search inputs, such as semantic
+patches, belong outside the repository.
+
+Characterize the defect
+-----------------------
+
+Record the fix and its base revision. For a commit, its parent is the base. For
+uncommitted changes, record the base commit and inspect ``git diff --cached``
+and ``git diff`` separately. If the bug's introducing commit is known, for
+example from agents/skills/find-fixes/guide.rst, record it too.
+
+State the defect as a rule that does not depend on local names: the object or
+resource involved, the operation, the condition that must hold, and what goes
+wrong when it does not. For example, "memory from kvmalloc() is released with
+kfree()", or "a field written under a lock is read before taking that lock and
+used after it". Separate what the fix needs from what it changes
+incidentally, such as variable names, error codes, or surrounding cleanups.
+
+Identify anchors to search for: the functions, macros, structure fields,
+callbacks, and locks involved, and distinctive lines of the code before the
+fix.
+
+Search for candidates
+---------------------
+
+Use several strategies, since each finds a different kind of sibling. Search
+the base revision rather than the working tree, so that the fix being
+prepared does not hide or duplicate results. Start with the same file, driver,
+and subsystem, and widen to the whole tree when an anchor is a common
+interface. Record each search and its scope; the completeness of the result
+depends on them.
+
+* **Same interface.** Find the other callers of a misused function, the other
+  users of the same field or lock, and the other implementations of the same
+  callback::
+
+      git grep -n -w 'function_name' "$base"
+      git grep -n -E '\.callback_name\s*=' "$base"
+
+* **Copied code.** Search for distinctive lines of the code before the fix,
+  and trace where that code came from and where else it was copied::
+
+      git grep -n -F 'distinctive line' "$base"
+      git log --oneline -S 'distinctive line' "$base" -- "$dir"
+
+  A history search without a path walks the entire history and is slow;
+  limit it to the relevant directories. Drivers that were derived from the
+  affected one often say so in their commit messages.
+
+* **Same origin.** If the introducing commit is known, inspect its whole diff
+  and the other patches of its series. A mistake made once is often made in
+  each place the series touched.
+
+* **Structural patterns.** When the defect is a code shape, such as a missing
+  put when leaving a loop or a mismatched allocation and release, write a
+  Coccinelle semantic patch outside the repository and run it with
+  ``make coccicheck``, which supplies the kernel's include paths::
+
+      make coccicheck COCCI=/path/outside/repo/pattern.cocci MODE=context \
+          M=drivers/foo
+
+  See Documentation/dev-tools/coccinelle.rst for the language and the
+  existing semantic patches under ``scripts/coccinelle/``. A semantic patch
+  can miss sites without reporting an error:
+
+  - Check that it reports the known site. Coccinelle reads the working tree,
+    where the fix may already be applied, so run ``spatch --sp-file`` on the
+    file as it was before the fix, extracted outside the repository with
+    ``git show "$base:$path"``.
+  - Header files are only searched with ``SPFLAGS=--include-headers``.
+  - Functions that Coccinelle cannot parse are skipped. Check the searched
+    files with ``spatch --parse-c`` and search any functions it reports as
+    bad by other means.
+
+  If Coccinelle is not available, use regular expressions and report that
+  limitation.
+
+* **Earlier fixes.** Earlier commits fixing the same defect elsewhere show the
+  variants the pattern takes, and may be part of an incomplete sweep::
+
+      git log --oneline -G 'pattern' "$base" -- "$dir"
+
+Validate each candidate
+-----------------------
+
+A textual match is a lead, not a bug. For each candidate, read the complete
+function at the base revision, along with its callers and the relevant
+locking, allocation, and lifetime rules. Establish that the same failure can
+occur there: the triggering condition must be reachable, and nothing else may
+prevent the failure, such as a caller that already holds the lock, an
+allocation that cannot come from vmalloc, a check elsewhere, or a different
+object lifetime. Do not confirm a candidate by analogy alone.
+
+Check whether the candidate is already fixed at the base, or by the change
+being prepared. If other trees, such as linux-next, are available locally,
+check whether a fix is already pending there. Note code that cannot run, such
+as code without callers or code that depends on ``CONFIG_BROKEN``.
+
+Classify each candidate as one of:
+
+* **Confirmed:** the same defect, with an explanation of how it fails there.
+* **Safe:** the same pattern without the defect, with the reason.
+* **Undetermined:** with the information that is missing.
+
+Return the result
+-----------------
+
+Return the search result to the caller. Fixing the sites found, or adding them
+to the fix being prepared, is outside this procedure.
+
+Provide:
+
+* The defect rule searched for, and the base revision.
+* The searches performed and their scope, including any semantic patch used,
+  and their limits, such as unavailable tools or directories not searched.
+* For each confirmed site, its location at the base revision, how the failure
+  occurs there, and its maintainers from ``scripts/get_maintainer.pl -f``.
+* The safe and undetermined candidates, with their reasons.
+
+Each confirmed site is a separate bug. It needs its own fix, and its own Fixes
+tag and stable decision, as described in agents/skills/find-fixes/guide.rst
+and agents/skills/stable-tag/guide.rst. Sites in different drivers or
+subsystems usually get separate patches, possibly in one series.
-- 
2.53.0

