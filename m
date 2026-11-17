Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903536;
	b=JsTbrZ+KYJX/TshHwKsqX3SA2OqwTgPbmNK27F+TpZxWptIdGT3qgB0DWV6Wd7nrNjmq
	 3pH1HUE5sPgVt8qEEJVbEavi+OkBqcJzISk/5GNcd95ZChX6ruhkV5Xsf0Ys1ppfd6lRW
	 CzwlkpVyC81mBkz8xTiWe2CaRjs+lePbDT1/ZDrutwr6C8lhA35ZSXsdFif33PjmcpACu
	 1T1hS+HXSCu+m1+9FQ+7SktwToEaN03tw8n0kua1sukJ6JPjx8UhbjRlvC36D18BVrD09
	 ActU9xLja96pWrK1CBQyQy+jOEK1jR7dxUoahZ0VJkbkr3vBEazs1wSvQ4xxOlPGjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903536;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YhtEV+fDeZTJ08RYkT+mQubrYxatIPSQ6bLyOMfEMlE=;
	b=O608cnRJ0izA1APR6Dy45etfKOShUWeByD1bAcuUK38gXmn7uxO6EA02T117pWpXSXuS
	 gzSBxPHkSqRogPinYfIBITS1b9lHGXXlemm+KGrky9qFPmyAu3xpwTyVpGQbsbhdTU5/G
	 kbBgungH6gr4XDnmAd7VhoPW64kUbk22JCUjpC/sO1CTwtepZ2WIiynPL/28YjU5Rnpb8
	 VbMb+F8KlrQwcNv82AYpdN7LkOQkR76gwE/TikXbcCm2LjIXNeC41m/zsI3mkLUiqPX/K
	 Oly2jSS3NXNPwi5ggJ8tgaloDrfOzn0ZnzOvEPQ0iCxYqE+f+v1cqBv3O0AijKw79tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWaSISJR;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWaSISJR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ySNz+TNmyqi6iQ6MbWzuBl/rhL5C1OnuBt5JbV4NuZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794903533; v=1; x=1795508333;
 b=MWaSISJRh2+uyRRak7JAnxzRKaYKYA/950l4BmxmqRy/oKAV4TjRXeGWNwjE+y0UY8N7LTyc
 5+OHJ7sstWEEKzyiFiAR+glNCrqbuMhc0GGNH8CpDxBtZ8v0RNlQdGNYuozNdxpveQN6IRSq+8T
 YgyVlnEYDAbnF2/GFkLe3OS4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 50c09de987ed1a19;
	Tue, 17 Nov 2026 08:18:53 +0000
X-Mizu-Trace-ID: 50c09de987ed1a19
X-Migadu-Flow: FLOW_OUT
From: xu.xin@linux.dev
To: David Hildenbrand <david@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xu Xin <xu.xin@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
Date: Tue, 17 Nov 2026 16:18:21 +0800
Message-Id: <20261117081821.7211-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: "Xu Xin (vivo)" <xu.xin@linux.dev>

As documented in Documentation/admin-guide/mm/ksm.rst, ksm_zero_pages
accounts only for zero pages actually placed by KSM.  However, the
current implementation wrongly accounts for forked zero-page PTEs as
KSM's contribution, inflating both the child's per-mm counter and the
global ksm_zero_pages counter.

Originally, commit e2942062e01d ("ksm: count all zero pages placed by
KSM") marked KSM-placed zero-page PTEs with the dirty bit for unmap
accounting, but forgot to clear this marker during fork().  Later, to
prevent ksm_might_unmap_zero_page() from underflowing the counters on
child exit[1], commit 4d6fc29f3634 ("mm/ksm: fix incorrect KSM counter
handling in mm_struct during fork") kept the child's inherited per-mm
counter and added it to the global counter.

Instead of inflating the counters, fix the root cause by resetting the
child's mm->ksm_zero_pages to 0 in ksm_fork() and clearing the dirty
bit marker via pte_mkclean() when copying a KSM zero PTE in
__copy_present_ptes().  With the marker cleared,
ksm_might_unmap_zero_page() will not decrement the counters on child
exit, MADV_UNMERGEABLE in the child will not unnecessarily unshare
inherited zero pages, and the global counter remains untouched.

[1] https://lore.kernel.org/all/53a7bf3d-843d-4e19-b0a3-cc6852fe72c1@redhat.com/

Fixes: 4d6fc29f3634 ("mm/ksm: fix incorrect KSM counter handling in mm_struct during fork")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 include/linux/ksm.h | 8 +++++---
 mm/memory.c         | 8 ++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index 93793ca6bcc4..3c6db19d825e 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -56,11 +56,13 @@ static inline void ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm)
 {
 	/* Adding mm to ksm is best effort on fork. */
 	if (mm_flags_test(MMF_VM_MERGEABLE, oldmm)) {
-		long nr_ksm_zero_pages = atomic_long_read(&mm->ksm_zero_pages);
-
+		/*
+		 * Child's inherited zero-page PTEs are unmarked on copy and
+		 * were not placed by KSM in the child, so reset its counter.
+		 */
 		mm->ksm_merging_pages = 0;
 		mm->ksm_rmap_items = 0;
-		atomic_long_add(nr_ksm_zero_pages, &ksm_zero_pages);
+		atomic_long_set(&mm->ksm_zero_pages, 0);
 		__ksm_enter(mm);
 	}
 }
diff --git a/mm/memory.c b/mm/memory.c
index cf075fcec3c5..7dce96af2a51 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1160,6 +1160,14 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
 		pte = pte_mkclean(pte);
 	pte = pte_mkold(pte);
 
+	/*
+	 * Clear the dirty-bit marker on KSM-placed zero-page PTEs in the
+	 * child so inherited mappings are not accounted against the child or
+	 * unshared by MADV_UNMERGEABLE.  Special PTEs always have nr == 1.
+	 */
+	if (is_ksm_zero_pte(pte))
+		pte = pte_mkclean(pte);
+
 	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
 }
 
-- 
2.34.1

