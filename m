Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793535696;
	b=puizY6mRAb/4UdFx20slomgMuzwuhiK4RNV9D53kJETJJsr4po5Yvms5mhUhZxaBdg72
	 dC5SOv6B/F1r5q7oGXi0FSSyof8UoaXC2N+nvaAs4CajtR8oArhq7CCOWcdgZ8k5lItd8
	 NzULPjqBAn4NS/Z0xttZ4kuOqDlCCu6kSoXkrzX+P3Z/s/8tzRyLs+yFSvOLGPRldVlCN
	 Y12fz3F5cCLixl0sI8Q02u3JzOi4TUqNu0TlhCUObG9cR3FU57F8vH+4yp1flyp8X9bfW
	 aZ/+hulGLd4PlkLFg+6MjgZYNRlBk0TIicR0iujca//g9TTMW1cyoguOPHtP75pnL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793535696;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=17cJmiuUCova0Iydm9bRMkHrls1dA/n7JgpWCE9LeH4=;
	b=vTJnI0hkUsXlZvLtEtUREAedGd75wb0zGGR95O8TnuiBEZXF6IBqPljgHAXNkLWPQ187
	 47FzLX/EwGAHklrwF7Tg3npCl2wNc+jVrPSi+9v4odsS8Ck98lBeoiHnFfTdeHIKE7xwf
	 GLgy1fyoCU+juLoIjBQXzB+0H9NndS+KVvR3ydVPhGHHmdRgC0jGemwN6MRkWGxfWQXZr
	 MeCcvhIZMgF1aVOxYsvRzNOu7xjhXdSeg4JNgsFgl4bmklrkuoWq/xrb3C+T+3gvKsQKC
	 vWnNG6N+JYHuEbagoqna2GUbcCnLR7dEiheWiUZ6Ja//XNjWv7Evnzj+5CAc4gOFY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q6VaBw/x";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92C606A324;
	Sun,  1 Nov 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6VaBw/x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14B11F000C1;
	Sun,  1 Nov 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793535695;
	bh=17cJmiuUCova0Iydm9bRMkHrls1dA/n7JgpWCE9LeH4=;
	h=From:To:Cc:Subject:Date;
	b=Q6VaBw/xwt3xjJKiOpVuAXS/HZYicUcZ9H9vsya1+Lus391pN5d+STWxoXdmnWaxp
	 FlMYGMIQlds8dXjXjKgZfai04vxCe+tryERfYXX61dArhe6rIDhAXKAbADRtLwQ4Rh
	 jSiXkHoP+/05wp8sjGbVI1cOUiMHvefjWJHeVLi3jE/2ySAs4KOmmesMP7rswti4yL
	 MrFDPtW1sAnHaYX5jLQcT4PlDYqx9mQr+2oDBY44Dwf0BZXytQlTPrnYOMncNdiaKq
	 BRNGhjsq9iPcQ6pll4HpcEtsPlj7PsLnW7CqBR43PqAH8w0w7DI1t2jtgs66CJqS10
	 ETs+PQZQq1Oiw==
From: Danilo Krummrich <dakr@kernel.org>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] of: unittest: Remove refcount underflow tests
Date: Sun,  1 Nov 2026 13:19:29 +0100
Message-ID: <20261101122128.2124348-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
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

With CONFIG_OF_UNITTEST=y and CONFIG_BUG_ON_DATA_CORRUPTION=y, the
machine no longer boots after commit 5b5224220747 ("refcount: Use
CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors").

of_unittest_lifecycle() deliberately calls of_node_put() after the
node's reference count has reached zero. The test expects a warning and
continues to check that a subsequent put does not produce another
warning. With BUG_ON_DATA_CORRUPTION enabled, refcount underflow now
triggers BUG() instead. This panics the kernel during boot:

	kernel BUG at lib/refcount.c:37!
	Oops: invalid opcode: 0000 [#1] SMP NOPTI
	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N  7.3.0+ #14 PREEMPT(full)
	RIP: 0010:refcount_warn_saturate+0x89/0x90
	Call Trace:
	 of_unittest_lifecycle+0x158/0x310
	 of_unittest+0x105/0x130
	 do_one_initcall+0x127/0x350
	 do_initcall_level+0x7c/0xe0
	 do_initcalls+0x59/0xa0
	 kernel_init_freeable+0x118/0x1a0
	 kernel_init+0x1f/0x140
	Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Remove the refcount underflow tests, which exercise the refcount
implementation rather than OF-specific behavior.

Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/of/unittest.c | 43 -------------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..03fc941c0995 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3678,9 +3678,6 @@ static void __init of_unittest_lifecycle(void)
 	 * - Decrementing refcount to zero via of_node_put() should cause the
 	 *   attempt to free the node memory by of_node_release() to fail
 	 *   because the node is not a dynamic node.
-	 *
-	 * - Decrementing refcount past zero should result in additional
-	 *   errors reported.
 	 */
 
 	np = of_find_node_by_path(refcount_path);
@@ -3714,46 +3711,6 @@ static void __init of_unittest_lifecycle(void)
 
 	EXPECT_END(KERN_INFO, "OF: ERROR: of_node_release() detected bad of_node_put() on /testcase-data/refcount-node");
 
-
-	/*
-	 * expect stack trace for subsequent of_node_put():
-	 *   __refcount_sub_and_test() calls:
-	 *   refcount_warn_saturate(r, REFCOUNT_SUB_UAF)
-	 *
-	 * Not capturing entire WARN_ONCE() trace with EXPECT_*(), just
-	 * the first three lines, and the last line.
-	 */
-	EXPECT_BEGIN(KERN_INFO, "------------[ cut here ]------------");
-	EXPECT_BEGIN(KERN_INFO, "WARNING: <<all>>");
-	EXPECT_BEGIN(KERN_INFO, "refcount_t: underflow; use-after-free.");
-	EXPECT_BEGIN(KERN_INFO, "---[ end trace <<int>> ]---");
-
-	/* refcount is now zero, this should fail */
-	unittest(1, "/testcase-data/refcount-node is zero");
-	of_node_put(np);
-
-	EXPECT_END(KERN_INFO, "---[ end trace <<int>> ]---");
-	EXPECT_END(KERN_INFO, "refcount_t: underflow; use-after-free.");
-	EXPECT_END(KERN_INFO, "WARNING: <<all>>");
-	EXPECT_END(KERN_INFO, "------------[ cut here ]------------");
-
-	/*
-	 * Q. do we expect to get yet another warning?
-	 * A. no, the WARNING is from WARN_ONCE()
-	 */
-	EXPECT_NOT_BEGIN(KERN_INFO, "------------[ cut here ]------------");
-	EXPECT_NOT_BEGIN(KERN_INFO, "WARNING: <<all>>");
-	EXPECT_NOT_BEGIN(KERN_INFO, "refcount_t: underflow; use-after-free.");
-	EXPECT_NOT_BEGIN(KERN_INFO, "---[ end trace <<int>> ]---");
-
-	unittest(1, "/testcase-data/refcount-node is zero, second time");
-	of_node_put(np);
-
-	EXPECT_NOT_END(KERN_INFO, "---[ end trace <<int>> ]---");
-	EXPECT_NOT_END(KERN_INFO, "refcount_t: underflow; use-after-free.");
-	EXPECT_NOT_END(KERN_INFO, "WARNING: <<all>>");
-	EXPECT_NOT_END(KERN_INFO, "------------[ cut here ]------------");
-
 	/*
 	 * refcount of zero will trigger stack traces from any further
 	 * attempt to of_node_get() node "refcount-node". One example of

base-commit: a287f97d4256b5f5527f5b5a54f8ada55e1482c7
-- 
2.56.0

