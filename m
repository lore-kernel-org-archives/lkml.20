Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276F334FF41
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167460; cv=none; b=dUE/04KxYC5Wm+Tl5v1BL6iItcSZhVw/tRO8Qo3qBiv6ZGRMrdC2jLei8IOZBcPFsPCpd8FvgC3MWJyOc4eMSJrZN98Ctn20e1r0Qelxw4FO9kx9fh4t5AMyLREc0JouHTIQwW+E7B3qdA7PJbcRe+JXVdYjxg5uFnZJTCWPQO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167460; c=relaxed/simple;
	bh=Va30dqYwl3bmyAwlFfl0rQ5mJO9s+f2+/Pzz2h/nY1w=;
	h=From:Date:Message-Id:Content-Type:Mime-Version:To:Cc:Subject; b=RA40PGVYPC3FQbDpJN4zpHdpTUfngnPFlBxOrTeVQRHeFYf8p7tOhm6Pda3bnt7Np8g/JdQrgtJgfBc0pnS+UF/6r51VhZYmCq8ps14yC1j4G7vB/AhEtdgNLevclA2+Xk5NtK7j3aSXnYlFkvvQUIeAS2yhQWloFplu8VMY5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QGVSyqsm; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QGVSyqsm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788167447; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=8Eo7QMhdQ3M9V1QnYKplCQa1xPwiIVALWEZ6TYtEi2g=;
 b=QGVSyqsmZrBEHDNvJp+AAGgtVckvxUKBqOqUV7QYqMBeDqNioBnXhuf15krYgyDG/6iqzZ
 Rp17Dz5lGwrLvd7owblUUj78X/Cwrm/x/OJhIXdfFKyW/PLXgM4EfpMVlvFXC3MMaV4ypw
 PteHnKmc8Pqdtsaxg63wRDOrJevCocaGd3nOz59o9OpDAV3neAbWUsXfeeE9Nr95URmlll
 gNEFV2ygHO0I1PADWlf70XuOLb5R4lldiTsOx9lKQ9vrYzuIp5j3wDOvp75OLh1yB8r76F
 Ci3tEcWfbZ22MCEOnjfMP7XssdoXqyR00i4ZLc6+zN84LQIXlI+ZDjJnGOOLpQ==
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Mon, 31 Aug 2026 17:10:23 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <20260831091023.66581-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
X-Lms-Return-Path: <lba+26a954515+bbd36b+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<lizhe.67@bytedance.com>, <aiqi.i7@bytedance.com>
Subject: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs

Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
PMD sharing is possible. That is only needed when huge_pmd_unshare()
actually detaches a shared PMD page table, because clearing the PUD
invalidates the whole PUD-sized virtual address range.

For hugetlbfs hole punch and MADV_DONTNEED, a shared mapping can pass
the "PMD sharing is possible" range test in function
adjust_range_if_pmd_sharing_possible() even when the PMD table covering
the target 2M page is not shared. KVM then receives a 1G invalidation for
a 2M operation and zaps unrelated secondary mappings, so the guest has to
fault them back in.

Fix this by using the existing cheap "sharing possible" test only as a
gate, then inspect the candidate PMD tables under the locks held by the
hugetlb unmap paths. The notifier is expanded only for PUDs whose PMD
table is actually shared, while the other callers keep the existing
conservative expansion.

On a Redis-in-VM workload that punches cold 2M hugetlb pages, this
patch improves P99 QPS stability while punching pages, reducing the QPS
degradation ratio from 7.09% to 1.45%.

Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/hugetlb.c | 118 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 101 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7857728457952..e80e1118385f0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5353,16 +5353,105 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	huge_pmd_unshare_flush(tlb, vma);
 }
 
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+static bool
+pmd_sharing_possible_range(struct vm_area_struct *vma, unsigned long start,
+			   unsigned long end, unsigned long *range_start,
+			   unsigned long *range_end)
+{
+	unsigned long v_start = ALIGN(vma->vm_start, PUD_SIZE);
+	unsigned long v_end = ALIGN_DOWN(vma->vm_end, PUD_SIZE);
+
+	/*
+	 * vma needs to span at least one aligned PUD size, and the range
+	 * must be at least partially within it.
+	 */
+	if (!(vma->vm_flags & VM_MAYSHARE) || !(v_end > v_start) ||
+	    (end <= v_start) || (start >= v_end))
+		return false;
+
+	*range_start = max(ALIGN_DOWN(start, PUD_SIZE), v_start);
+	*range_end = min(ALIGN(end, PUD_SIZE), v_end);
+	return true;
+}
+
+static void
+adjust_range_for_pmd_sharing(unsigned long *start, unsigned long *end,
+			     unsigned long range_start, unsigned long range_end)
+{
+	/* Extend the range to be PUD aligned for a worst case scenario */
+	if (*start > range_start)
+		*start = range_start;
+
+	if (*end < range_end)
+		*end = range_end;
+}
+
+static void
+adjust_range_for_shared_pmds_in_range(struct vm_area_struct *vma,
+				      unsigned long *start, unsigned long *end,
+				      unsigned long range_start,
+				      unsigned long range_end)
+{
+	struct hstate *h = hstate_vma(vma);
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long address;
+
+	hugetlb_vma_assert_locked(vma);
+	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
+
+	for (address = range_start; address < range_end; address += PUD_SIZE) {
+		pte_t *ptep;
+		bool shared;
+
+		ptep = hugetlb_walk(vma, address, PMD_SIZE);
+		if (!ptep)
+			continue;
+
+		spin_lock(huge_pte_lockptr(h, mm, ptep));
+		shared = ptdesc_pmd_is_shared(virt_to_ptdesc(ptep));
+		spin_unlock(huge_pte_lockptr(h, mm, ptep));
+
+		if (shared)
+			adjust_range_for_pmd_sharing(start, end, address,
+						     address + PUD_SIZE);
+	}
+}
+
+static void
+adjust_range_for_shared_pmds(struct vm_area_struct *vma, unsigned long *start,
+			     unsigned long *end)
+{
+	unsigned long range_start, range_end;
+
+	if (huge_page_size(hstate_vma(vma)) != PMD_SIZE)
+		return;
+
+	if (!pmd_sharing_possible_range(vma, *start, *end,
+					&range_start, &range_end))
+		return;
+
+	adjust_range_for_shared_pmds_in_range(vma, start, end, range_start, range_end);
+}
+#else
+static void
+adjust_range_for_shared_pmds(struct vm_area_struct *vma, unsigned long *start,
+			     unsigned long *end)
+{
+}
+#endif
+
 void __hugetlb_zap_begin(struct vm_area_struct *vma,
 			 unsigned long *start, unsigned long *end)
 {
 	if (!vma->vm_file)	/* hugetlbfs_file_mmap error */
 		return;
 
-	adjust_range_if_pmd_sharing_possible(vma, start, end);
 	hugetlb_vma_lock_write(vma);
-	if (vma->vm_file)
+	if (vma->vm_file) {
 		i_mmap_lock_write(vma->vm_file->f_mapping);
+		adjust_range_for_shared_pmds(vma, start, end);
+	}
 }
 
 void __hugetlb_zap_end(struct vm_area_struct *vma,
@@ -5401,7 +5490,12 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				start, end);
-	adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
+	/*
+	 * Only expand for PUDs whose PMD table is actually shared. The callers
+	 * hold i_mmap_rwsem and the hugetlb VMA lock for shared mappings, so PMD
+	 * sharing state cannot change before __unmap_hugepage_range().
+	 */
+	adjust_range_for_shared_pmds(vma, &range.start, &range.end);
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
@@ -6943,23 +7037,13 @@ bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end)
 {
-	unsigned long v_start = ALIGN(vma->vm_start, PUD_SIZE),
-		v_end = ALIGN_DOWN(vma->vm_end, PUD_SIZE);
+	unsigned long range_start, range_end;
 
-	/*
-	 * vma needs to span at least one aligned PUD size, and the range
-	 * must be at least partially within in.
-	 */
-	if (!(vma->vm_flags & VM_MAYSHARE) || !(v_end > v_start) ||
-		(*end <= v_start) || (*start >= v_end))
+	if (!pmd_sharing_possible_range(vma, *start, *end,
+					&range_start, &range_end))
 		return;
 
-	/* Extend the range to be PUD aligned for a worst case scenario */
-	if (*start > v_start)
-		*start = ALIGN_DOWN(*start, PUD_SIZE);
-
-	if (*end < v_end)
-		*end = ALIGN(*end, PUD_SIZE);
+	adjust_range_for_pmd_sharing(start, end, range_start, range_end);
 }
 
 /*
-- 
2.20.1
