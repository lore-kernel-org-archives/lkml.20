Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AF4F96DD;
	Mon, 12 Oct 2026 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840904; cv=none; b=kNFDhOggZYAAt3AmFlQ7GcOrTC2l2pVuS4QCvszgnQKEbtTxMK+jZngtBuCX5l5IS8n4E/0iDIFCepBSVPSIELb11Rwv/p1HQmYyz6zD8+hQYccr1z4KY5aT1zcBBMq7ZeZazKPGqAfKWUWUUG2+6thpJYUN7RwPzsVh5j6/t7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840904; c=relaxed/simple;
	bh=bMee3RRm4e6lBgQ0nkXp4vKbKX7sqniYf8L3WLisK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9y5D/o/zrWcfvmg4yfqxLYbwJaUp08qtUDVUQ+E00sGXfx+FNf+QktXNu6oiE2QZm1yBBQTS01yU99yqLbd9d1/1fRK/1UId8Q4wZ2hNoqapAjW/DPCvZGJyLLpX7SUnhGwuwAIPKUsOlixncXmJld61u164cymgb7G0wbU9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA4rhIpH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA4rhIpH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBAB1F008A4;
	Mon, 12 Oct 2026 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840900;
	bh=BkwM3ezso8c2mXXsErIz/iIetTxMrj2klZ6d21Hs4zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UA4rhIpHTItojHX9O/7PcU//IpHjfTNc8VpNWX9QAzOdQD0mC4YUcL4WazbJmDtCX
	 ZWXxLoVtBiQH+T51VmlYm+sjERL2t/CRxGpaPrbT1KmJPUws/PzZKtDzjnJVra9TXP
	 U6cmVoMkxJwrI6B13m/jy0LENxBTA5BEYUWMMssRHFooiniCN5fEkrQGy1H4zEe87c
	 7NYZ/NZ9yW8ITAXuBr29yh9z2FnzUPunRVz2s30jqppucknr5f08Wt5xdbqEOTocm1
	 KTE6goni2tCa4wiM+GvfekZ+4x8ofCjOf8xqHSkR+vyTvkxh9sU8+jb4ErE5wXKnag
	 qHJhPSuPy5NtQ==
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
Subject: [PATCH v2 3/5] agents: add a skill to determine stable tags
Date: Mon, 12 Oct 2026 17:34:50 -0400
Message-ID: <20261012213452.1863248-4-sashal@kernel.org>
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

Whether a fix needs a stable tag, and which releases it should reach, is
decided by hand and is often missed or left too broad. Add a read-only
procedure that decides whether a change is stable material using the
criteria the stable trees apply in practice, finds the first release
containing each introducing commit with git tag --contains, checks that
the fix applies to the oldest affected release, and returns the stable
tag lines with supporting evidence.

Keep the skill entry point and procedure together under
agents/skills/stable-tag/. Connect it to the coding-assistant guidance so
bug fixes get a stable decision after Fixes attribution and before
finalization.

If the decision cannot be made, return no tag and keep the fix as a
draft. Applying the tag and writing the commit message remain outside the
skill.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst |  25 ++-
 agents/skills/find-fixes/guide.rst          |   5 +-
 agents/skills/stable-tag/SKILL.md           |  25 +++
 agents/skills/stable-tag/guide.rst          | 228 ++++++++++++++++++++
 4 files changed, 276 insertions(+), 7 deletions(-)
 create mode 100644 agents/skills/stable-tag/SKILL.md
 create mode 100644 agents/skills/stable-tag/guide.rst

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 8d42d3c10f9ce..0eb8dc91575bf 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -85,6 +85,21 @@ commit. If the origin remains unresolved, report the missing evidence and
 keep the fix as a draft. The calling workflow must hold finalization until
 the attribution is resolved.
 
+Determining stable tags
+=======================
+
+Once the Fixes tag is determined, an assistant must follow
+agents/skills/stable-tag/guide.rst to decide whether the fix should be
+backported to stable kernels and to generate the stable tag. This also
+applies to checking an existing stable tag during review. The skill entry
+point is agents/skills/stable-tag/SKILL.md. Tell the skill whether the fix
+addresses an unpublished vulnerability, as described in
+Documentation/process/threat-model.rst.
+
+The skill returns a decision only. It does not modify files or commit
+messages. If the decision remains unresolved, report the missing evidence
+and keep the fix as a draft.
+
 Procedure for finding and fixing bugs
 =====================================
 
@@ -108,11 +123,11 @@ these steps:
    re-running a complete analysis; drop any fix that doesn't work and try
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
-6. Determine the Fixes tag as described above. Once attribution is resolved,
-   commit the working fix with a detailed message describing the problem,
-   the solution and the verified Fixes tag. This commit is part of the
-   fix-preparation workflow, not the attribution skill. Do not add a
-   Signed-off-by tag, and add an Assisted-by tag, as described above.
+6. Determine the Fixes tag and the stable tag as described above. Once both
+   are resolved, commit the working fix with a detailed message describing
+   the problem, the solution, the verified Fixes tag and any stable tag. This
+   commit is part of the fix-preparation workflow, not the skills. Do not add
+   a Signed-off-by tag, and add an Assisted-by tag, as described above.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/find-fixes/guide.rst b/agents/skills/find-fixes/guide.rst
index 7b58c526f3149..c1e66a5d1d29b 100644
--- a/agents/skills/find-fixes/guide.rst
+++ b/agents/skills/find-fixes/guide.rst
@@ -173,5 +173,6 @@ trailer or placeholder. The calling bug-fix workflow must hold finalization
 and surface the unresolved origin instead of fabricating a tag or silently
 treating the investigation as complete.
 
-Determining a Fixes tag does not establish stable eligibility or replace the
-requirements in Documentation/process/stable-kernel-rules.rst.
+Determining a Fixes tag does not establish stable eligibility. Follow
+agents/skills/stable-tag/guide.rst to decide whether the fix needs a stable
+tag.
diff --git a/agents/skills/stable-tag/SKILL.md b/agents/skills/stable-tag/SKILL.md
new file mode 100644
index 0000000000000..5fcad4eed6027
--- /dev/null
+++ b/agents/skills/stable-tag/SKILL.md
@@ -0,0 +1,25 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: stable-tag
+description: >-
+  Decide whether a Linux kernel fix should be backported to stable kernels
+  and return verified Cc: stable tag lines. Use when preparing or reviewing
+  bug-fix patches, drafting their commit messages, or checking an existing
+  stable tag.
+---
+
+# Determine a stable tag
+
+Read and follow [the decision procedure](guide.rst), relative to this
+skill directory. The canonical path in the kernel repository is
+`agents/skills/stable-tag/guide.rst`. If necessary, locate the
+repository root with `git rev-parse --show-toplevel`.
+
+Perform the stable decision only. Return the tag lines and their supporting
+evidence, a no-tag decision with its reasons, or an unresolved result
+explaining the missing evidence. Return no other trailers or commit-message
+draft as part of the skill. Do not change files, the index, refs, or commit
+messages, do not send mail, and do not apply the tag or create a commit. An
+unresolved result must contain no stable tag or placeholder; it tells the
+calling workflow to hold finalization. Applying the tag belongs to that
+workflow.
diff --git a/agents/skills/stable-tag/guide.rst b/agents/skills/stable-tag/guide.rst
new file mode 100644
index 0000000000000..ad6c0fc14f24b
--- /dev/null
+++ b/agents/skills/stable-tag/guide.rst
@@ -0,0 +1,228 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. _stable_tag:
+
+Deciding whether a fix needs a stable tag
+=========================================
+
+A stable tag in the sign-off area asks the stable team to backport a commit to
+the stable and longterm trees once it is merged in mainline. The tag syntax is
+described in Documentation/process/stable-kernel-rules.rst. Deciding on a tag
+requires knowing whether the change is stable material, which released kernels
+contain the bug, and whether the fix applies to them.
+
+This procedure applies to fixes being prepared for mainline and to reviews of
+existing stable tags. It decides using read-only inspection. It does not
+authorize changing files, applying patches, checking out revisions, fetching
+history, sending mail, or creating or amending commits.
+
+Establish the change and its inputs
+-----------------------------------
+
+Record the change being decided:
+
+* For a commit, resolve its full object ID and inspect its message, diff, and
+  parent. For a patch, identify its base revision. For uncommitted changes,
+  inspect ``git diff --cached`` and ``git diff`` separately and record the base
+  commit.
+* For a patch series, note the other patches, their order, and which of them
+  are being tagged for stable.
+* Obtain the verified Fixes tags for the change. If the change fixes a bug and
+  attribution has not been done, follow agents/skills/find-fixes/guide.rst
+  first. If attribution is unresolved, the stable decision is unresolved too,
+  unless attribution established that the bug predates the available history.
+* Determine from the calling workflow whether the change fixes an unpublished
+  vulnerability. See Documentation/process/security-bugs.rst.
+
+Decide whether the change is stable material
+--------------------------------------------
+
+Judge the change by what it does, not by how its message describes it. Many
+fixes are described as cleanups or improvements. A change that frees
+resources on an error path, initializes data, balances reference counts,
+corrects locking, or adds a missing check fixes a bug. The absence of Fixes
+or Reported-by tags is not a reason to leave a fix untagged.
+
+Tag the following:
+
+* Fixes for crashes, oopses, BUG and WARN splats, hangs, soft and hard
+  lockups, RCU stalls, deadlocks, data corruption, and security issues.
+* Fixes for use-after-free, double free, NULL pointer dereference,
+  out-of-bounds access, integer overflow, uninitialized data, reference
+  counting errors, and memory or resource leaks.
+* Fixes for races, including data races.
+* Fixes for incorrect behavior, such as wrong results, wrong hardware
+  programming, or endianness and type errors.
+* Fixes for problems reported by syzbot, other fuzzers, or the KASAN, KMSAN,
+  KCSAN, and UBSAN sanitizers.
+* Build fixes, including Kconfig dependency and missing include fixes, other
+  than for code that depends on ``CONFIG_BROKEN``.
+* New device IDs for drivers that exist in the affected releases, and quirks
+  or workarounds for broken hardware.
+* Device tree fixes, and device tree additions for hardware that existing
+  drivers support.
+* Corrections to documentation that is wrong.
+* Performance fixes that prevent lockups, stalls, or hangs.
+* Reverts of commits that are in a released kernel.
+* Fixes for bugs introduced by commits that were backported to stable.
+
+Do not tag the following:
+
+* New features, new user-visible interfaces or behavior, new drivers, and new
+  module parameters or sysfs attributes.
+* Refactoring, code movement, and preparation patches that fix nothing on
+  their own. If a tagged fix depends on such a patch, handle it as a
+  prerequisite, as described below.
+* Optimizations that do not prevent lockups, stalls, or hangs.
+* Cleanups that do not change behavior, such as style, whitespace, renames,
+  and comment rewording.
+* Changes to ``drivers/staging/``.
+* Changes to code that no released kernel contains.
+
+When a change is a borderline case, decide it and record the reasoning that
+settled it, so that the author and maintainers can review it.
+
+Find the affected releases
+--------------------------
+
+For each Fixes tag, find the first mainline release that contains the
+introducing commit. With ``introducer`` set to its full commit ID::
+
+    git tag --contains "$introducer" --list 'v[0-9]*' |
+        grep -v -- -rc | sort -V | head -n 1
+
+Use tag containment as shown; do not derive the release from ``git describe``
+output. Check that the repository has the release tags (``git tag --list
+'v[0-9]*'``). Missing tags are a limit to report, not evidence that no release
+contains the commit.
+
+* The oldest release found across all Fixes tags is the oldest affected
+  release.
+* If no release contains an introducer, the bug exists only in the current
+  development cycle, and the fix needs no stable tag for it. The exception is
+  an introducer that was itself backported to stable: tag the fix if the
+  introducer carries a stable tag or a Fixes tag that points into a released
+  kernel::
+
+      git log -1 --format=%B "$introducer" | grep -i -E '^(cc: *<?stable@|fixes:)'
+
+  If a stable repository is available, also look for a backport of the
+  introducer in the stable branches, whose messages record the upstream
+  commit ID.
+* If the change has no Fixes tag, as with device IDs, quirks, build fixes, and
+  bugs that predate the available history, the affected releases are those
+  containing the code it changes. Find them with the checks in the next
+  section.
+
+Check that the fix applies to the affected releases
+---------------------------------------------------
+
+With ``oldest`` set to the oldest affected release tag, check that every file,
+function, macro, structure field, and Kconfig symbol that the fix uses or
+modifies exists there with compatible semantics. For example::
+
+    git show "$oldest:$path"
+    git grep -n -w 'symbol' "$oldest" -- "$path"
+    git log --oneline --follow "$oldest..$base" -- "$path"
+
+Follow renames: a file that moved since the release does not mean the code is
+absent. Conversely, a file with the same name in an older release can hold
+different code, so compare the relevant code rather than paths.
+
+If something the fix needs is missing from the oldest affected release,
+identify the commit that added it, and then either:
+
+* list that commit as a prerequisite, if it is small, self-contained, and
+  suitable for stable on its own terms; or
+* set the floor to the first release that contains it, so that the tag covers
+  only the releases where the fix applies, and describe what older releases
+  need in the commit message.
+
+A shared file, membership in the same series, or an existing dependency note
+is not evidence that a prerequisite is needed. Establish that the fix fails to
+build or behaves incorrectly without it.
+
+For a series, a patch that the fix depends on and that is part of the same
+series does not need to be listed as a prerequisite, but it needs its own
+stable tag with the same floor.
+
+Check subsystem policy
+----------------------
+
+Find the maintainer profiles for the files the change touches::
+
+    scripts/get_maintainer.pl --sections -f "$path"
+
+Read each ``P:`` document listed and follow its instructions on stable tags.
+Some subsystems require an explicit stable tag even when a Fixes tag is
+present. Others prefer that maintainers add stable tags themselves; for those,
+return the tag as a suggestion for the patch notes below the ``---`` line
+instead of as a trailer.
+
+Return the decision
+-------------------
+
+Return the stable decision to the caller. Drafting a commit message or adding
+other trailers is outside this procedure.
+
+For a tag, provide:
+
+* The change and base revisions analyzed.
+* Why the change is stable material, including the failure and how it is
+  triggered.
+* The first release containing each introducer, and how backports of the
+  introducers were checked.
+* The applicability checks, prerequisites, and floor, with the evidence for
+  each.
+* The subsystem policy consulted, and any limitations such as missing tags or
+  history.
+* The tag lines.
+
+Render the tag lines as follows:
+
+* Use a plain tag when the Fixes tags identify the affected releases and the
+  fix applies to all of them::
+
+      Cc: stable@vger.kernel.org
+
+* Add a floor when the change has no Fixes tag and older releases are not
+  affected, or when the fix applies only from a later release than the Fixes
+  tags imply. The floor names the first release to receive the fix::
+
+      Cc: stable@vger.kernel.org # 6.1.x
+
+* List prerequisites in cherry-pick order before the tag for the fix itself,
+  all with the same floor. With ``floor`` set to the floor and ``prereq`` to
+  the prerequisite's full commit ID::
+
+      git show --no-patch --abbrev=12 \
+          --format="Cc: stable@vger.kernel.org # $floor: %h: %s" "$prereq"
+
+  This produces lines of the following form::
+
+      Cc: stable@vger.kernel.org # 6.1.x: 0123456789ab: subsys: Prerequisite subject
+      Cc: stable@vger.kernel.org # 6.1.x
+
+* For an unpublished vulnerability, use ``stable@kernel.org`` instead of
+  ``stable@vger.kernel.org`` in every line.
+
+Give every stable line in a commit the same floor: a line without a version
+asks for every tree and cancels the floor of the others. Stable tooling reads
+the first version number in a line as its floor, so put notes about older
+releases in the commit message rather than in the tag comment. Do not add a
+display name, and start any comment with ``#``; ``scripts/checkpatch.pl``
+warns about both. The tag belongs in the sign-off area and is not a mail
+recipient. ``git send-email`` adds Cc trailers as recipients by default, which
+the submission workflow must account for.
+
+For no tag, give the reasons: the change is not stable material, or no
+released kernel contains the bug. A Fixes tag is still useful when the
+introducer is in the current development cycle.
+
+For an unresolved result, give the missing information and the next
+investigation that could settle it. Do not emit a stable tag or placeholder.
+The calling workflow must hold finalization and surface the open question
+instead of guessing.
+
+When reviewing an existing stable tag, apply the same procedure and report
+any difference from the existing tag with its evidence.
-- 
2.53.0

