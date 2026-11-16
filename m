Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856479;
	b=jQos5P0zDN3FxMWzKCmLga/vFyV3vwz6yyQnb//1HcbJ516ubEtocWEh961PPar+KHNA
	 Wdm+F1xUsEmrVRu0L3gX3qe7CuElq7Qy0Jr8rB+ieAJz91GZ2bmxorULYtQNShDvvv5YS
	 QzXhipKqj6K+7n01D+FIwoPGWR/ZzC+yqdh77oN0EvV/28t0ELShPErWuJC8uDz4QrlVg
	 pDE/ZxkBOfkmCXKDSm/VuWpw5LVlQkSqIOXhV1qirD6v81hbtb3y1CGzu7dnnJ0ZB0Vwq
	 SxiEIxAbWc/iWRgrPDE5Y6xw+bdVaUmQdxvrf5glgLiyB9cUcmUrlh2dKHAVd7LnhPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856479;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EAGpy5NDNTABSAAPJTapspr42FJ9GsEIq4x5fClYYvY=;
	b=oVe2wZgHNT07cMzY0QhpyS+myho2HIaAhGhvZ51tMaTN7E8S+T8XHLcwzNDfEtSgX3cD
	 fSk3/5oP2Crvq5K00c2Q5Wf0rlctcXWdHm0IzWCi3aZmb4uyD8SZ5TE9g9ZvWwGMcpbhr
	 OyAi2S8bBPE5NQHJ3InzpNKz4koIJv5u/mP4kDGjXIxpL12aZAKh7Ym0WL4f5NoVb7jis
	 ShqFmi/TtXq38YpNwQLLlSbXrwZPMdwgxh3RG+SXQoyLWJHn5wreYfLYcIadBYWP6uhm2
	 WhVl9Q3vIKxrt8Y03J2mPzDkuMN4rYx+UPQ42vI5rOMUCfive5i/beKkDnqr5EsT6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J/Rge9nW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB18606A31C;
	Mon, 16 Nov 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J/Rge9nW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50301F000C4;
	Mon, 16 Nov 2026 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794856479;
	bh=EAGpy5NDNTABSAAPJTapspr42FJ9GsEIq4x5fClYYvY=;
	h=From:To:Cc:Subject:Date;
	b=J/Rge9nWGYR8JZwBkdA9HlSYbPCEK+vTJXN41IzWN2MRhBusKVtjWRPo/uRgprY7s
	 1E9WvYSMR1/tVI7WQ/lCs4w9UlbnvtHywtceq6T6RQZ2LGOI10e6vIU5oSA8+Na88r
	 iHruIfzmc9gkcVMbIdNedbu9fe/bpEe6Et3cx6fOEWYRZ+ncTgVxa7xOH+9E58EBhd
	 FTXjShUGQJ13WMgbhVUM4s3kxMHbACVhO6KrHEXQDL2dR3Zvu5L56oDLrglzEqbJMC
	 Itto6EAV+MI2bTpHdEVDx0BRpgRrr9LG5A5PHP/x9Cws6v8LDwXT8zKpq9Uai2tgEG
	 IJPyjXZqOSamQ==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Willy Tarreau <w@1wt.eu>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: ask bug fixes for their user-visible impact
Date: Mon, 16 Nov 2026 14:14:36 -0500
Message-ID: <20261116191436.188098-1-sashal@kernel.org>
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

Say what that means for a bug fix: describe the worst a user can see
and what it takes to trigger it, say so if the bug was never seen to
happen, and say so if it has no visible effect at all. Give the
paragraph a label so people can be pointed at it.

Coding assistants are told to commit a fix with a message that
describes the problem and the solution. Add the user-visible impact to
that list and point them at the section.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst  |  6 ++++--
 Documentation/process/submitting-patches.rst | 11 +++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

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
index 9cd19a71e96ec..52cccb08ce896 100644
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
@@ -61,6 +63,15 @@ from upstream, so include anything that could help route your change
 downstream: provoking circumstances, excerpts from dmesg, crash
 descriptions, performance regressions, latency spikes, lockups, etc.
 
+For a bug fix, this means saying what the bug does to a running system:
+the worst that a user can see, and what it takes to trigger it.  An
+account of what the code does wrong is not a substitute, as it leaves
+every reader to work the consequences out again.  If the bug was found
+by review or by a tool and has never been seen to happen, say so.  If
+it has no effect that a user could notice, say that too.  Maintainers
+and the people looking after stable trees decide from this whether the
+fix needs to be backported.
+
 Quantify optimizations and trade-offs.  If you claim improvements in
 performance, memory consumption, stack footprint, or binary size,
 include numbers that back them up.  But also describe non-obvious

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
2.53.0

