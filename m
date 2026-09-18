Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEF54705D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703935; cv=none; b=FiCkiOTVA8Rq2spev2izkEps6cM71YEuzzZc2L/fdO6JsIQZubpJrqGAK18sp6s1/RM4qM2Xk6VvtNFiQ6R1XJGKWH2HU1tSipWK59C7J0vTmGs8NN8GgCX6jmhInJ1Caf7dI8SNtTMKKbTemxK8iWJrXoAESh9QRWMsL123p+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703935; c=relaxed/simple;
	bh=qHRRxczt8J4eG+g2sOw/jM5GfYGKQK5Jkmn5R9iUIKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyPZG4x3g1pZrkbSVNvnEpp0KnLGFc3rD9BvG6V9k+zgX+EUlkTqSgyeYZjqKP/L0Hj5m4jMBE6UwlYWsLztIhacwKKH3voZnzBCFJWS8S5qu5Y62711fbWUqqWJH9V7qMX9VdNcxCkiSNmtSUFcar8xon+/mVdB+MsWCx/uJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JeIoQ6cm; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JeIoQ6cm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703930; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Gj7KZoF9VTbSXIKMoovF+7EFs6uTwEiek6buK+yA5uo=;
	b=JeIoQ6cmErZLfOR6mUd6fPoUPJjFWcAsjiHSrYTrC3y7UqTNShVVN+CvatlUACIzk+b4++uNMkQHzMMENLy3BINxVDKYov3v6Crq5x3GWSNmnvnyVHquVg81GoQPDKyOQ/3zHIXsj2AB3ahgOtJQXUiRmFHoS4+0xcwfgHh6UTA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9o3aj_1789703928;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9o3aj_1789703928 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:49 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] mm: khugepaged: drop the hugepage_madvise()
Date: Fri, 18 Sep 2026 11:58:33 +0800
Message-ID: <e4d6918e2e420a2378e8f8c502ccfbad2a7bc2d1.1789701677.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 2fd4e7693674 ("mm: fix incorrect vm_flags usage when checking
allowable orders for tmpfs"), hugepage_madvise() no longer calls any
khugepaged related functions and only updates the VMA flags. So remove this
helper and update the VMA flags directly in madvise_update_vma(), which
simplifies the code.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/huge_mm.h |  8 --------
 mm/khugepaged.c         | 22 ----------------------
 mm/madvise.c            |  8 +++++---
 3 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8ca0fa3be2ac..334c387ad997 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -508,8 +508,6 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			__split_huge_pud(__vma, __pud, __address);	\
 	}  while (0)
 
-int hugepage_madvise(struct vm_area_struct *vma, vm_flags_t *vm_flags,
-		     int advice);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
 			   unsigned long end, struct vm_area_struct *next);
 spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
@@ -707,12 +705,6 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 #define split_huge_pud(__vma, __pmd, __address)	\
 	do { } while (0)
 
-static inline int hugepage_madvise(struct vm_area_struct *vma,
-				   vm_flags_t *vm_flags, int advice)
-{
-	return -EINVAL;
-}
-
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 21d75f5b4b4d..f81ecaaa4890 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -380,28 +380,6 @@ static unsigned int collapse_max_ptes_swap(struct collapse_control *cc,
 	return cc->policy.max_ptes_swap;
 }
 
-int hugepage_madvise(struct vm_area_struct *vma,
-		     vm_flags_t *vm_flags, int advice)
-{
-	switch (advice) {
-	case MADV_HUGEPAGE:
-		*vm_flags &= ~VM_NOHUGEPAGE;
-		*vm_flags |= VM_HUGEPAGE;
-		break;
-	case MADV_NOHUGEPAGE:
-		*vm_flags &= ~VM_HUGEPAGE;
-		*vm_flags |= VM_NOHUGEPAGE;
-		/*
-		 * Setting VM_NOHUGEPAGE will prevent khugepaged from scanning
-		 * this vma even if we leave the mm registered in khugepaged if
-		 * it got registered before VM_NOHUGEPAGE was set.
-		 */
-		break;
-	}
-
-	return 0;
-}
-
 int __init khugepaged_init(void)
 {
 	mm_slot_cache = KMEM_CACHE(mm_slot, 0);
diff --git a/mm/madvise.c b/mm/madvise.c
index eb491fa88325..4150f6a8cf64 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1598,10 +1598,12 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 			goto out;
 		break;
 	case MADV_HUGEPAGE:
+		new_flags &= ~VM_NOHUGEPAGE;
+		new_flags |= VM_HUGEPAGE;
+		break;
 	case MADV_NOHUGEPAGE:
-		error = hugepage_madvise(vma, &new_flags, behavior);
-		if (error)
-			goto out;
+		new_flags &= ~VM_HUGEPAGE;
+		new_flags |= VM_NOHUGEPAGE;
 		break;
 	case __MADV_SET_ANON_VMA_NAME:
 		/* Only anonymous mappings can be named */
-- 
2.47.3

