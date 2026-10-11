Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6923D2B1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681771; cv=none; b=cHPBPcTwhbBV7y6ET2R01YandgkKczmpI6LT2/r/LqXfOchDr0ZKjnz6jHR9y5gtuRVMajQiauAMVpdUKxJwd9TAUrt9EX4QkBGKbV9e0jpxQh84EinJFEw7utVHbBf2R4VoYJlHfGY1Zh9UK/VybxxWxEO4FpRADQiGPVFljts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681771; c=relaxed/simple;
	bh=vOLbuO6lWjlunZyY6CDisK4c6NDU2BubFE2Pc2REUPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=McKTQNLKAJlMS9w9N/wRR32u3hwf7Rw/Uh5my+FjQXMBTHDQ6VnrYYQENW0GOIvf5OzMYaNd2lZg5MoG3sjZ5cJB2X9/AgEoptvxRuQFCm8RQsNHyHPHaJ20CUBO6Fcey0yVtw9O5H0ewPrsgyIZ1BzJpammAjjQZvfI2VWQ/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFiH0-008ATg-6H;
	Sat, 10 Oct 2026 21:22:46 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nickolai Zeldovich <nickolai@csail.mit.edu>,
	Adam Harshbarger <handyhandyman.adam@gmail.com>,
	I Hsin Cheng <richard120310@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] lib/plist: add a plist_test case for plist_requeue() on the last priority bucket
Date: Sat, 10 Oct 2026 21:22:33 -0400
Message-ID: <20261011012245.765558-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010181016.44f5e2883b6820bb32c04204@linux-foundation.org>
References: <20261010181016.44f5e2883b6820bb32c04204@linux-foundation.org>
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
bucket, so plist_requeue() returned early every time, and
plist_test_check() only verifies the links, not that the shortcut's
insertion point is correct.

Add a deterministic case for the failing shape: A(1) B(2) C(2), requeue
B.  plist_test_check() verifies the node_list and prio_list links and
the ordering, and the new BUG_ON() checks that B ended up at the end of
the list rather than in front of A.

Before the fix the case produces B(2) A(1) C(2) and the BUG_ON() fires;
with the fix it produces A(1) C(2) B(2).  Verified with the three
functions transcribed to a userspace harness driving this exact case
against mainline (fails), the queued fix (passes) and the alternative
fix I had posted (passes); lib/plist.o builds with CONFIG_DEBUG_PLIST=y
(LLVM=1 ARCH=riscv).  Not booted.

Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 lib/plist.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/plist.c b/lib/plist.c
index b0273533c04d..ac3f55dc49e5 100644
--- a/lib/plist.c
+++ b/lib/plist.c
@@ -283,6 +283,25 @@ static int  __init plist_test(void)
 		plist_test_check(nr_expect);
 	}
 
+	/*
+	 * Requeue a node which is the first of the last priority run and has
+	 * a successor of the same priority, with an earlier run present: the
+	 * shortcut in plist_requeue() must append it at the end of the list,
+	 * not in front of the first run.  The random test above never
+	 * exercises this, since it only requeues nodes it has just added,
+	 * which are always the last of their run.
+	 */
+	plist_head_init(&test_head);
+	for (i = 0; i < 3; i++) {
+		plist_node_init(test_node + i, i ? 2 : 1);
+		plist_add(test_node + i, &test_head);
+	}
+	plist_test_requeue(test_node + 1);
+	plist_test_check(3);
+	BUG_ON(plist_last(&test_head) != test_node + 1);
+	for (i = 0; i < 3; i++)
+		plist_del(test_node + i, &test_head);
+
 	printk(KERN_DEBUG "end plist test\n");
 
 	/* Worst case test for plist_add() */
-- 
2.55.0

