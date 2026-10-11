Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358C33E6DE7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719515; cv=none; b=deAzxOsfmJDJ23USusoEwysGXJfea7AmSdr0Q/YONC9KOjteWIt9IyrYMm2MJkPB91UqH04T/hnnX3dYSnwYrbWaiazphGvxvnUB2Tac+TiJipf6OknsqETR/KxcY48oWK4rH9i1QdbBYhqrK7Qs5SP1wyS3FWEIWUpOCCEhQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719515; c=relaxed/simple;
	bh=xIqBsLY7HlZ6fo/WyI+n2ytjpnEJcuDWba/1TWl0GQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q249QBaU1gh7tndpqp47UwC1Jctc/H6bOZkTWIgPKD66IocMpVvub9hznh3cOh6i/tbX3laexifD6zmN6tIEgWh2dM9cYEizPHiXAm2mgrSfiGxjdayqP2rWeu6rZLFBWTnN5W773vAQsLfR59KR8brwxrwS4YOySjejj8C3A1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFs5f-00A4OF-Qx;
	Sun, 11 Oct 2026 07:51:43 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nickolai Zeldovich <nickolai@csail.mit.edu>,
	Adam Harshbarger <handyhandyman.adam@gmail.com>,
	I Hsin Cheng <richard120310@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2] lib/plist: add a plist_test case for plist_requeue() on the last priority bucket
Date: Sun, 11 Oct 2026 07:51:34 -0400
Message-ID: <20261011115136.767838-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org>
References: <20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plist_requeue() shortcut inserted the node at the head of the list
when the node was the first of the last priority bucket and had a
successor of the same priority, with an earlier bucket present (fixed
by "lib/plist: fix plist_requeue() corrupting order in the last
bucket").  The CONFIG_DEBUG_PLIST self-test did not catch it: it only
requeues nodes it has just added, which are always the last of their
bucket, so plist_requeue() returned early every time.

Add a deterministic case for the failing shape: A(1) B(2) C(2), requeue
B.  The expected result is A(1) C(2) B(2), with B at the end of the
list; the broken shortcut produced B(2) A(1) C(2).  Check it with a
WARN() rather than a BUG_ON(), and skip plist_test_check() when the
warning fires, since its BUG_ON()s would stop the boot on the misordered
list; the node_list and prio_list links of the result are still verified
by plist_test_check() when the order is right.

Boot-tested on QEMU virt with a riscv64 defconfig kernel plus
CONFIG_DEBUG_PLIST=y, built with LLVM=1.  With the fix applied the test
passes and the boot proceeds.  With the fix reverted the warning fires at
boot and the boot proceeds:

  [    0.864761] start plist test
  [    0.871849] ------------[ cut here ]------------
  [    0.871905] plist_requeue() put the node in front of the list
  [    0.872921] WARNING: lib/plist.c:295 at plist_test+0x33a/0x342, CPU#0: swapper/0/1
  ...
  [    0.885968] ---[ end trace 0000000000000000 ]---
  [    0.887060] end plist test

Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
v2: per Andrew's review of v1,
    https://lore.kernel.org/lkml/20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org/
  - WARN() instead of BUG_ON(), and plist_test_check() is skipped when
    the warning fires, so a broken plist_requeue() no longer stops the
    boot at this test.
  - Boot-tested on QEMU virt, both with the queued fix (test passes)
    and without it (warning fires, boot continues).
  - Applies on top of "lib/plist: fix plist_requeue() corrupting order
    in the last bucket" (Adam Harshbarger).
v1: https://lore.kernel.org/lkml/20261011012245.765558-1-nickolai@csail.mit.edu/

 lib/plist.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/lib/plist.c b/lib/plist.c
index b0273533c04d..9591c38e8ad6 100644
--- a/lib/plist.c
+++ b/lib/plist.c
@@ -283,6 +283,27 @@ static int  __init plist_test(void)
 		plist_test_check(nr_expect);
 	}
 
+	/*
+	 * Requeue a node which is the first of the last priority run and has
+	 * a successor of the same priority, with an earlier run present: the
+	 * shortcut in plist_requeue() must append it at the end of the list,
+	 * not in front of the first run.  The random test above never
+	 * exercises this, since it only requeues nodes it has just added,
+	 * which are always the last of their run.  On failure warn and skip
+	 * plist_test_check(), which would BUG_ON() the misordered list.
+	 */
+	plist_head_init(&test_head);
+	for (i = 0; i < 3; i++) {
+		plist_node_init(test_node + i, i ? 2 : 1);
+		plist_add(test_node + i, &test_head);
+	}
+	plist_test_requeue(test_node + 1);
+	if (!WARN(plist_last(&test_head) != test_node + 1,
+		  "plist_requeue() put the node in front of the list\n"))
+		plist_test_check(3);
+	for (i = 0; i < 3; i++)
+		plist_del(test_node + i, &test_head);
+
 	printk(KERN_DEBUG "end plist test\n");
 
 	/* Worst case test for plist_add() */
-- 
2.55.0

