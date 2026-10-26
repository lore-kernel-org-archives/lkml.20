Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001799;
	b=ZG6UV4BcgOQV8QMFy+S7d5pEB0pHc2J42yAjved5t/wqTm5ED4MIe9f3NbXdAb/6rxMh
	 PsYKARnqd6SEAkTOG6lWCMcb/nlCujR9JkNxNFB9lcFn6k2GYc+0J5swV38Wj4l3y0rdF
	 xJmT0ztW0ydjJkR+Dq+fMmtO+jh7hgWRRtq88fMxlb82m8EXhFaOG1Egl4lMb31v6J7Nb
	 9jP97ymJpMr/Ds3AJ3ZZx1dxh4TJt6Db/kgIc5WeRapVR1Et/244ZYsgqnfXxXocahBHZ
	 JxFB9So6iwYf6hbqgvZ+BKK3Gk7mqj9jU69em4uBP1QllSAtge0b8T2xvC8SK0+UWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001799;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y9wS3/gWaQp9kjc3hKHm53xveP7gjRevkeXaGyCVguk=;
	b=sN5KDgq2VvvtzKe9wR0iCD5sybLlOpy7WJ7azUPuVz56pKRG8z/b7tT+DsIo0nPBi6Ws
	 I64FMnEm+TS07o7EoOEpTZAE0iOuCOTdqBdlFSP048aHgoiMXNDZxE7tf6DST3XdwVlxt
	 EZQaEjjLnA97O7EICJqKmK4LcrK0KGcJ/1uvJ56rm2fFkqIuMHsn6gPJe9UoZKW2Nksdm
	 B5UkCpP7quUwzOYMslaaVgXkvTPUQoif6WMmCA+FsjQJeJM3Bslz3T7daFMhCgPBF+qA9
	 prkOTnKR78DpTQd6zz/RrT7jyepI+kE8YVNzSl8miJgQBRYDLRxQ0QvlcrgZ7bynVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R1YQ8cqa;
	arc=none smtp.remote-ip=95.215.58.69
Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0AC606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R1YQ8cqa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pcribSAkBtRGTCouzEO2asYhob8vbcfBvar96N2+DuE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001796; v=1; x=1793606596;
 b=R1YQ8cqalFKQiLrTz5GSCokRNuZX8zK0hp8uAS0yED83IATUefKuZmXVuSK/y27XL2mlfbVN
 VOPeYa6h8BtbK0hn+Q6x3YO+CYLhzn/PAV2nCsTCIA1mqPQ1QFzcIuKE2O16XXZhO7KRPvqnhpQ
 95fCv9W03V4OfKMUEc1A8wxw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id db03739f07850567;
	Mon, 26 Oct 2026 08:03:16 +0000
X-Mizu-Trace-ID: db03739f07850567
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 08/10] mm/vmalloc: undo partial mappings inside the mapping functions
Date: Mon, 26 Oct 2026 16:03:27 +0800
Message-Id: <20261026080329.140244-9-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

The vmap entry points can install some PTEs, then fail and leave the
partial mapping behind.

The callers do not agree on who cleans it up. pcpu_map_pages() and
kmsan_ioremap_page_range() roll back what they mapped, while
vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
__vmalloc_area_node() expect a clean range from the mapping function.
For them the leftovers stay mapped, and the next attempt to map the
same range fails, with a BUG() in vmap_pte_range() for huge mappings
and a warning on the small-page path.

After discussing with Suren and Ulad, we decided to put the rollback
into the entry points of the vmap API rather than into every low-level
helper. __vmap_pages_range_noflush() undoes the whole range it was
asked to map when it fails, and vmap_page_range() undoes its range
for the ioremap-style mappings.

The rollback is __vunmap_range_noflush(), which only clears the PTEs.
No TLB flush is needed, nothing has touched the mapping yet.
vmap_pages_range_noflush() also drops the KMSAN metadata of the failed
mapping.

The undo walk skips its cond_resched() when the caller's gfp mask
cannot block: __vmalloc() with GFP_ATOMIC or GFP_NOWAIT can run in
atomic context, where cond_resched() cannot schedule and its
__might_resched() annotation fires on CONFIG_DEBUG_ATOMIC_SLEEP
builds. __vunmap_range_noflush() takes a can_resched argument for
that, which the sleepable callers pass as true.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Suggested-by: Uladyslau Rezki <urezki@gmail.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 include/linux/kmsan.h |  8 +++--
 mm/kmsan/hooks.c      | 18 ++++++----
 mm/kmsan/shadow.c     |  7 ++--
 mm/vmalloc.c          | 78 ++++++++++++++++++++++++++++++-------------
 mm/vmalloc.h          |  6 ++--
 5 files changed, 79 insertions(+), 38 deletions(-)

diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 7da9fd506b39..0016c032d1e7 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush(unsigned long start,
  * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
  * @start: start of vunmapped range.
  * @end:   end of vunmapped range.
+ * @can_resched: whether the unmap walk may call cond_resched(); pass
+ * false from atomic context.
  *
  * KMSAN unmaps the contiguous metadata ranges created by
  * kmsan_map_kernel_range_noflush().
  */
-void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end);
+void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
+				bool can_resched);
 
 /**
  * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_range() call.
@@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_range_noflush(
 }
 
 static inline void kmsan_vunmap_range_noflush(unsigned long start,
-					      unsigned long end)
+					      unsigned long end,
+					      bool can_resched)
 {
 }
 
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 107f66841274..0cd1edaa1120 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -136,13 +136,16 @@ static unsigned long vmalloc_origin(unsigned long addr)
 						 KMSAN_META_ORIGIN);
 }
 
-void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
+void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
+				bool can_resched)
 {
 	if (!kmsan_enabled)
 		return;
 
-	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
-	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
+	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end),
+			       can_resched);
+	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end),
+			       can_resched);
 	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
 }
@@ -171,8 +174,9 @@ static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
 		if (origin)
 			__free_pages(origin, KMSAN_IOREMAP_META_ORDER);
 	}
-	__vunmap_range_noflush(shadow_start, shadow_end);
-	__vunmap_range_noflush(origin_start, origin_end);
+	/* ioremap metadata mappings are always GFP_KERNEL, so resched is safe. */
+	__vunmap_range_noflush(shadow_start, shadow_end, true);
+	__vunmap_range_noflush(origin_start, origin_end, true);
 	flush_tlb_kernel_range(shadow_start, shadow_end);
 	flush_tlb_kernel_range(origin_start, origin_end);
 }
@@ -207,7 +211,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 		mapped = __vmap_pages_range_noflush(
 			vmalloc_shadow(start + off),
 			vmalloc_shadow(start + off + PAGE_SIZE), prot, &shadow,
-			PAGE_SHIFT);
+			PAGE_SHIFT, gfp_mask);
 		if (mapped) {
 			err = mapped;
 			goto ret;
@@ -217,7 +221,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 		mapped = __vmap_pages_range_noflush(
 			vmalloc_origin(start + off),
 			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
-			PAGE_SHIFT);
+			PAGE_SHIFT, gfp_mask);
 		if (mapped) {
 			err = mapped;
 			goto ret;
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 2166086d3dc3..452760a333e4 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 	origin_end = vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
 	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
-					    s_pages, page_shift);
+					    s_pages, page_shift, gfp_mask);
 	kmsan_leave_runtime();
 	if (mapped) {
 		err = mapped;
@@ -255,12 +255,13 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 	}
 	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
-					    o_pages, page_shift);
+					    o_pages, page_shift, gfp_mask);
 	kmsan_leave_runtime();
 	if (mapped) {
 		/* Undo the shadow mapping set up above. */
 		kmsan_enter_runtime();
-		__vunmap_range_noflush(shadow_start, shadow_end);
+		__vunmap_range_noflush(shadow_start, shadow_end,
+				       gfpflags_allow_blocking(gfp_mask));
 		kmsan_leave_runtime();
 		err = mapped;
 		goto ret;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 96e15d6cfc6d..2b68f7263d53 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -362,8 +362,11 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
-	if (err)
+	if (err) {
+		/* Callers are ioremap and arch setup code, always sleepable. */
+		__vunmap_range_noflush(addr, end, true);
 		return err;
+	}
 
 	flush_cache_vmap(addr, end);
 	return 0;
@@ -426,7 +429,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 }
 
 static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
-			     pgtbl_mod_mask *mask)
+			     pgtbl_mod_mask *mask, bool can_resched)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -448,12 +451,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			continue;
 		vunmap_pte_range(pmd, addr, next, mask);
 
-		cond_resched();
+		/* The undo path may run in atomic context. */
+		if (can_resched)
+			cond_resched();
 	} while (pmd++, addr = next, addr != end);
 }
 
 static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
-			     pgtbl_mod_mask *mask)
+			     pgtbl_mod_mask *mask, bool can_resched)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -473,12 +478,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		}
 		if (pud_none_or_clear_bad(pud))
 			continue;
-		vunmap_pmd_range(pud, addr, next, mask);
+		vunmap_pmd_range(pud, addr, next, mask, can_resched);
 	} while (pud++, addr = next, addr != end);
 }
 
 static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
-			     pgtbl_mod_mask *mask)
+			     pgtbl_mod_mask *mask, bool can_resched)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -493,7 +498,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 
 		if (p4d_none_or_clear_bad(p4d))
 			continue;
-		vunmap_pud_range(p4d, addr, next, mask);
+		vunmap_pud_range(p4d, addr, next, mask, can_resched);
 	} while (p4d++, addr = next, addr != end);
 }
 
@@ -509,7 +514,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
  *
  * This is an internal function only. Do not use outside mm/.
  */
-void __vunmap_range_noflush(unsigned long start, unsigned long end)
+void __vunmap_range_noflush(unsigned long start, unsigned long end,
+			    bool can_resched)
 {
 	unsigned long next;
 	pgd_t *pgd;
@@ -524,7 +530,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 			mask |= PGTBL_PGD_MODIFIED;
 		if (pgd_none_or_clear_bad(pgd))
 			continue;
-		vunmap_p4d_range(pgd, addr, next, &mask);
+		vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
 	} while (pgd++, addr = next, addr != end);
 
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
@@ -533,8 +539,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 
 void vunmap_range_noflush(unsigned long start, unsigned long end)
 {
-	kmsan_vunmap_range_noflush(start, end);
-	__vunmap_range_noflush(start, end);
+	/* The unmap paths are sleepable, keep the resched point. */
+	kmsan_vunmap_range_noflush(start, end, true);
+	__vunmap_range_noflush(start, end, true);
 }
 
 /**
@@ -694,12 +701,19 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
  * The caller is responsible for calling flush_cache_vmap() after this
  * function returns successfully and before the addresses are accessed.
  *
+ * On failure the mapping is torn down before returning, so a retry
+ * sees a clean range. When @gfp_mask cannot block, the teardown
+ * skips cond_resched(), it may run in atomic context.
+ *
  * This is an internal function only. Do not use outside mm/.
  */
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages, unsigned int page_shift)
+		pgprot_t prot, struct page **pages, unsigned int page_shift,
+		gfp_t gfp_mask)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned long start = addr;
+	int err = 0;
 
 	if (WARN_ON_ONCE(addr >= end))
 		return -EINVAL;
@@ -711,22 +725,27 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
-
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+			page_shift == PAGE_SHIFT) {
+		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
+	} else {
+		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+			err = vmap_range_noflush(addr,
+					addr + (1UL << page_shift),
 					page_to_phys(pages[i]), prot,
 					page_shift);
-		if (err)
-			return err;
+			if (err)
+				break;
 
-		addr += 1UL << page_shift;
+			addr += 1UL << page_shift;
+		}
 	}
 
-	return 0;
+	/* Undo the PTEs installed before the failure. */
+	if (err)
+		__vunmap_range_noflush(start, end,
+				       gfpflags_allow_blocking(gfp_mask));
+
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -738,7 +757,18 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (ret)
 		return ret;
-	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+
+	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
+					 gfp_mask);
+	/*
+	 * The page tables undo themselves on failure. Tear down the
+	 * metadata that was fully set up before the mapping failed.
+	 */
+	if (ret)
+		kmsan_vunmap_range_noflush(addr, end,
+					   gfpflags_allow_blocking(gfp_mask));
+
+	return ret;
 }
 
 static int __vmap_pages_range(unsigned long addr, unsigned long end,
diff --git a/mm/vmalloc.h b/mm/vmalloc.h
index d8372a4f65c4..9ea28845f713 100644
--- a/mm/vmalloc.h
+++ b/mm/vmalloc.h
@@ -40,10 +40,12 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
 
 int __must_check __vmap_pages_range_noflush(unsigned long addr,
 		unsigned long end, pgprot_t prot,
-		struct page **pages, unsigned int page_shift);
+		struct page **pages, unsigned int page_shift,
+		gfp_t gfp_mask);
 
 void vunmap_range_noflush(unsigned long start, unsigned long end);
 
-void __vunmap_range_noflush(unsigned long start, unsigned long end);
+void __vunmap_range_noflush(unsigned long start, unsigned long end,
+			    bool can_resched);
 
 #endif /* __MM_VMALLOC_H */
-- 
2.25.1

