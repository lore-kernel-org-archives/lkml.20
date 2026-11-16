Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859518;
	b=wE4e2WGo6RfiQqS4b+76zKSTujJofFwPV/Zptab9NdymeeYVIZlahyNRS8h5UEHXCZNQ
	 mXHVFHV0YSQFRnQUsJIFCCQx2njvRsuMlOrmpWPCOdX2KvpfQDCGCmjd1hV0qMBXl+AcU
	 NP0XWX0h/xrfpbhUVnNYlGBx6cP0SDkV4q/N5QDoxHO0RCB/BaRkpDJO7TDOTYPqhBWnp
	 yLRkjpLiSd+/JBumvCTXmJbNUzdfnWwLkFsCOkyVcj0mzszmzmwtY+FeIuebdKLRwlEku
	 PGs0fRiec3tMaawmMS50TbTUIvNpyP+n9ydMhqFQdijpa59hrqju2NzBS2S5y4PP4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859518;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tRQeWuvmYi/U57BdSGyz2zs88m1YVfY13PrWPpE4BR8=;
	b=UuLy8K4bfKIaK0AjQYzFcc8YI55LOJX8CsHK5t9JDj+OREAvx8Wc80KMiEELPaLRi7R/
	 zZixKChMHoVC4YtguxUfugvnSyuBiLUoYjCTHCQUjlTZXxV6C83QDKYuTbVZqPz1OOpxx
	 nOBo2pj3paKG+3YKviw+ia1LkHQgsexjvMw4PNqMKaEwgJ63M98EB7Qxz2Tex87n85g8f
	 ZG9gi75N1dMzRWE03b825ZxjhN8SYpTkrDMJbYMeg8Uxz8RrMJGAS5Rf0AFH3o90CzKm6
	 0lknCRDlNbZlCJZ3K07XLlgUPPK5L1UhuIzKdS/HokVZper/wxdUdHOu9FKbq3yH+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHx1DP11;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB22606A88E;
	Mon, 16 Nov 2026 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHx1DP11
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338E91F000C6;
	Mon, 16 Nov 2026 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794859518;
	bh=tRQeWuvmYi/U57BdSGyz2zs88m1YVfY13PrWPpE4BR8=;
	h=From:To:Cc:Subject:Date;
	b=bHx1DP11wCI6xVH5jaqP1uVDSdtlFWU/1Ei7vF/ZMAdTjXTcmnkYtIRhMAc5rao5K
	 Zuo45tplMCK3pHmlRaUH9phIq9TZKektfkutyLr4cIOMveQSV+g9yhuPPgUXa902fI
	 TG5z1IbyzmMjU+MZerLr2Zzi7HIP4NrF77+JhP4v6DvyN+NlO9h956yTIncTKVXLQL
	 e7ddWaEB959Vh5EvsKWn0etAMV3O2nr3vSAi1b5VpDUyx1YV0dO7LJS3beA6qLRTAe
	 Q8xrwph9AiGVS5fwnaqevnFRChMGoDQclZRvhCxdFLjP8iof2hybcy+3pPFC+VO03L
	 qfgvUOBb7Zm0A==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: submitting-patches: ask bug fixes for their user-visible impact
Date: Mon, 16 Nov 2026 15:05:15 -0500
Message-ID: <20261116200515.352387-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

"Describe your changes" already asks for the user-visible impact of a
change, but changelogs for fixes still tend to say what the code does,
why that's wrong and what the patch changes, and stop there. Whoever
has to decide if the fix needs backporting is left to work out what
the bug does to a running system.

Say what that means for a bug fix, in two parts. For users who aren't
looking for the bug: what a normal workload is likely to run into, and
separately the worst case and what it takes to get there. For someone
triggering it on purpose: whether an unprivileged user could do it and
what that would take, since a race that no real workload loses can
still be won by a program written to win it. Give the paragraph a
label so people can be pointed at it.

Coding assistants are told to commit a fix with a message that
describes the problem and the solution. Add the user-visible impact to
that list and point them at the section.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Willy Tarreau <w@1wt.eu>
---
Changes since v1:
- Split the bug-fix paragraph into users who aren't looking for the bug
  and someone triggering it on purpose (Andrew, Willy).

v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org

 Documentation/process/coding-assistants.rst  |  6 +++--
 Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 509dbf23a099b..ef01ce8d0ff91 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -63,8 +63,10 @@ these steps:
    re-running a complete analysis; drop any fix that doesn't work and try
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
-6. Commit the working fix with a detailed message describing the problem, the
-   solution and a Fixes tag. Do not add a Signed-off-by tag.
+6. Commit the working fix with a detailed message describing the problem, its
+   user-visible impact (see "Describe your changes" in
+   Documentation/process/submitting-patches.rst), the solution and a Fixes
+   tag. Do not add a Signed-off-by tag.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 9cd19a71e96ec..e5f2181e4d663 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -51,6 +51,8 @@ motivated you to do this work.  Convince the reviewer that there is a
 problem worth fixing and that it makes sense for them to read past the
 first paragraph.
 
+.. _user_visible_impact:
+
 Describe user-visible impact.  Straight up crashes and lockups are
 pretty convincing, but not all bugs are that blatant.  Even if the
 problem was spotted during code review, describe the impact you think
@@ -61,6 +63,27 @@ from upstream, so include anything that could help route your change
 downstream: provoking circumstances, excerpts from dmesg, crash
 descriptions, performance regressions, latency spikes, lockups, etc.
 
+For a bug fix, this means saying what the bug does to a running system.
+An account of what the code does wrong is not a substitute, as it leaves
+every reader to work the consequences out again.  Cover two cases:
+
+- Users who are not looking for the bug.  Say what a normal workload is
+  likely to run into, and separately what the worst case is and what it
+  takes to get there: configuration, hardware, privileges, timing.  If
+  the bug was found by review or by a tool and has never been seen to
+  happen, say so.  If it has no effect that a user could notice, say
+  that too.
+
+- Someone triggering the bug on purpose.  Say whether an unprivileged
+  user could do it and what that would take.  A race that no normal
+  workload loses can still be won by a program that retries it on every
+  CPU for an hour.  If that makes the bug a vulnerability under
+  Documentation/process/threat-model.rst, follow
+  Documentation/process/security-bugs.rst.
+
+Maintainers and the people looking after stable trees decide from this
+whether the fix needs to be backported.
+
 Quantify optimizations and trade-offs.  If you claim improvements in
 performance, memory consumption, stack footprint, or binary size,
 include numbers that back them up.  But also describe non-obvious

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
2.53.0

