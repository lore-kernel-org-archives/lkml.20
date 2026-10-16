Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6204E50DE;
	Fri, 16 Oct 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164523; cv=none; b=i+1JBm8n/1kQ6Ar2ikrQbZLDLFahZE1mX2vMPv/1TR+4KrnNV7hFx0SRLJflRNFMBT3RWdOlWZTHFUfYfGAQCGmhBSaOwoOR4p4x1YlLg19+wZyqhKo+G4Pk/C4fNfhX/HCuGq8yXcZe1D/xSutdxF0aRVVvZFb7Uyv5cSihzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164523; c=relaxed/simple;
	bh=u+eBDV2H2GZnGB405SsVbd9Q3O2W+XbyXEMJYjmCRk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIGf0622eINtjbE8fAJ3BF0p+vm7WL5SqBNwHpBfJv0nYND6lTkYeNdvNuJWr6qAKL+xarQUmkScI4TxqHWz7xsN273kv5ULzrUSW14oDl77mU40ffKtY0f99eR4XaDWdgTEq9ECoxsn2kXOWJPir+W3nIlauNVRORdU7iV94F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou/rjgGi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou/rjgGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3EE1F000C4;
	Fri, 16 Oct 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164522;
	bh=7jj44FRGkKeivlZUmSVx4TMQjDGg+fLfYc2DPlT6fxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ou/rjgGij3UcpJY2f4g18xrv9Jp+CAP6UAbw2DasoXo6wY2jt3eH2s82Ovv+Vh+xs
	 FrvBGMBe/YP4Uad1wzWNaNlmRNKd9zyVoOPTMZP9Td4urxbQ4oNbSq53CQURw4UbqY
	 0NiNQgh8je4AGFehNvJhOvi+sP7gckNKh7FyXX+bnS2CpIoZRxgHwFfIGiCz+y2LVm
	 dv/xgL31ewVvUYkQaLFXphYy1YK4PYA+orxIXgpcS8Kz73NdFK3eV+YHhULTNggVPg
	 s53cySKrHaoOgSnq15dDbE/QHyTznTaK6+/wRwe1Nkie/aAz/TKmmWFKRO5Nic8rxl
	 mEzzDqmfXNTjw==
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
Subject: [PATCH v3 5/7] agents: add a skill to determine stable tags
Date: Fri, 16 Oct 2026 11:28:25 -0400
Message-ID: <20261016152828.3765695-6-sashal@kernel.org>
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

Whether a fix needs a stable tag, and which releases it should reach, is
decided by hand and is often missed or left too broad. Add a skill that
sends the agent to stable-kernel-rules.rst for the decision and the tag
format, lists the kinds of changes the stable trees take and leave out
in practice, and adds the checks agents tend to get wrong: finding the
first release that contains each introducing commit, checking that the
fix applies to the oldest affected release, giving every stable tag the
same version, and following the subsystem's stable policy.

If the decision cannot be made, the skill returns no tag. Point the
bug-fix procedure in coding-assistants.rst at the skill.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst |  7 +-
 agents/skills/stable-tag/SKILL.md           | 72 +++++++++++++++++++++
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 agents/skills/stable-tag/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index ddff951856dce..fc4e98fd96e11 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -37,6 +37,8 @@ The following skills are available:
 
 * agents/skills/find-fixes/SKILL.md determines the Fixes tag of a bug fix, or
   checks an existing one.
+* agents/skills/stable-tag/SKILL.md decides whether a fix goes to stable and
+  returns its stable tag, or checks an existing one.
 
 Licensing and Legal Requirements
 ================================
@@ -101,8 +103,9 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
 6. Commit the working fix with a detailed message describing the problem, the
-   solution and a Fixes tag determined with the find-fixes skill. Do not add a
-   Signed-off-by tag, and add an Assisted-by tag, as described above.
+   solution, a Fixes tag determined with the find-fixes skill, and a stable tag
+   if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
+   add an Assisted-by tag, as described above.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/stable-tag/SKILL.md b/agents/skills/stable-tag/SKILL.md
new file mode 100644
index 0000000000000..d87bcc95089d3
--- /dev/null
+++ b/agents/skills/stable-tag/SKILL.md
@@ -0,0 +1,72 @@
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
+Read Documentation/process/stable-kernel-rules.rst. It says which changes go
+to stable and how to write the tag, its prerequisites and its version. Follow
+the rules for skills in Documentation/process/coding-assistants.rst.
+
+Judge a change by what it does, not by how its description labels it: a
+"cleanup" that releases a resource on an error path fixes a leak. In practice,
+the stable trees take:
+
+- Fixes for crashes, oopses, BUG and WARN splats, hangs, lockups, RCU stalls,
+  deadlocks, data corruption and security issues.
+- Fixes for use-after-free, double free, NULL pointer dereferences,
+  out-of-bounds accesses, integer overflows, uninitialized data, reference
+  counting errors, and memory or resource leaks.
+- Fixes for races, including data races.
+- Fixes for incorrect behavior, such as wrong results, wrong hardware
+  programming, or endianness and type errors.
+- Fixes for problems reported by syzbot, other fuzzers, or the KASAN, KMSAN,
+  KCSAN and UBSAN sanitizers.
+- New device IDs and quirks for drivers that exist in the stable trees, device
+  tree fixes, and device tree additions for hardware that existing drivers
+  support.
+- Corrections to documentation that is wrong.
+- Performance fixes that prevent lockups, stalls or hangs.
+- Reverts of commits that are in a released kernel.
+- Fixes for bugs introduced by commits that were backported to stable.
+
+They do not take the following, unless a fix that is taken depends on it:
+
+- New features, new user-visible interfaces or behavior, new drivers, and new
+  module parameters or sysfs attributes.
+- Refactoring, code movement and other preparation patches.
+- Optimizations that do not prevent lockups, stalls or hangs.
+- Cleanups that do not change behavior, such as style, renames and comment
+  changes.
+
+Then work out which releases need the fix:
+
+- Determine the Fixes tags with the find-fixes skill first. A change with no
+  introducing commit, such as a new device ID, a quirk or a build fix, or a
+  bug older than the available history, affects every release that contains
+  the code it changes. Otherwise, if the Fixes tags are unresolved, so is the
+  stable decision.
+- For each Fixes tag, find the first release that contains the commit, not the
+  release it was based on. If no release contains it, check whether the
+  commit was itself backported to stable.
+- Check that everything the fix uses exists in the oldest affected release.
+  If something is missing, list the commit that added it as a prerequisite
+  if it is small and fit for stable, or start the tag at the first release
+  that has it.
+- Give every stable tag in a commit the same version: a tag without a version
+  asks for every stable tree and overrides the versions in the other tags.
+  The stable tooling reads the first version number in a tag comment as the
+  version, so describe what older trees need in the commit message.
+- Follow the stable tag policy in the maintainer profiles, the `P:` entries in
+  MAINTAINERS, for the changed files.
+- Ask the caller whether the fix addresses an unpublished vulnerability, as
+  described in Documentation/process/threat-model.rst.
+
+Return the tag lines with the reasons for them, or the reasons for no tag. If
+the decision cannot be made, return no tag and say what is missing.
-- 
2.53.0

