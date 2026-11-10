Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309924;
	b=OjkZOo6U1SX5+ir6uuzv8k8fV0+PtuAO901LfXNdYfytJJVSY5rnRJJBCZ/EFUrFRef5
	 jFgC2e4oECX0A/idAXNCLG3SJ1QAaiHU9PV5HtjcIn5PomVD8mQGUsLxDFuxGf6sXAuAk
	 iSMEn6+qNLsluEyOSHGYCP4PfkHWDruT3pC9UNYjKRbZqkqEVFgrQ6YfGTxahE9/n+4Pa
	 TtTQqGCLeo9fG7q/jk8xHjf84XMD07HScsJVK5eVxyvpA0DYRGhmoPgZScGbrLmgcwUlz
	 SxqH2ALgVO+wg/RSA7EFnpKzHt5zvv50/1TEupbCqcKGyTnGnCJSqlgWakzVsMDCqig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309924;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cGuw/QaT9bXrIXgqPHG9JcolkC+qxMvqtKQSI6lWxKs=;
	b=Nfszn+gowXsbRwuiGhFeXSGol+AdaOvu0BOYf0E0Zqu3I7Irjk9lSj74w8XWnBcgOGSi
	 nHP0Bfoa9uiCBkXSGn9hdhNbArmHrV8+ah6OcrFuYtFg1iUjLmqbEl3A3pV3lQKAWuGYB
	 yb8a5l1oUdcLFuogXdZJ2V1UHC7zLO+MmxLJq+QavKpErTe/i+2211WB1RfLTU83/r5rh
	 w4y+6LUaAWuchU4FfPuzJBfGNrq+xcfCX12TSY6VxvN37OovDypROgGEinu7Xwll75r1j
	 5XBlDilV2oKRn02quXWvNVAOYktjZrtgwFcjPyiRKvKJoY2ze1hgiePLB8j15CsNe2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uq3f2l4y;
	arc=none smtp.remote-ip=91.218.175.204
Received: from mta0.migadu.com (out-204.mta0.migadu.com [91.218.175.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701F60A260E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7701F60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uq3f2l4y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7uxwHQYlw6xfNJkuwND6/NfRHibmOvz7JrhIzprdUuo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309921; v=1; x=1794914721;
 b=Uq3f2l4yOnPG4DNtYm2a7NFv6SC3iiADTT18McqX6BcrQY2YUHEpFf6QX6a4e4J/2TbZ8wyO
 cQbfNZ0C6SE2mdetwGjybNq6teb4MswAeWTsAEAnHB62FJciToJ/lqQBMvn3/JTeuEhhtYO85Zg
 xdwY54TaLr6jygscq5y/4j1M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e708897efeb614eb;
	Tue, 10 Nov 2026 11:25:18 +0000
X-Mizu-Trace-ID: e708897efeb614eb
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v4 7/9] mm/vmalloc: undo partial mappings inside the mapping functions
Date: Tue, 10 Nov 2026 19:25:44 +0800
Message-Id: <20261110112546.261415-8-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
References: <20261110112546.261415-1-hao.ge@linux.dev>
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

The vmap entry points may install some PTEs and then fail, leaving a
partial mapping behind.

The callers do not agree on who cleans it up. pcpu_map_pages() and
kmsan_ioremap_page_range() roll back what they mapped, while
vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
__vmalloc_area_node() expect a clean range from the mapping function.
For them the leftovers stay mapped, and the next attempt to map the
same range trips the WARN_ON(!pte_none()) in vmap_pages_pte_range().
A leftover huge pmd is even worse. During the retry, vmap_try_huge_pmd()
calls pmd_free_pte_page() on it, and the x86 implementation cannot
tell a leaf entry from a page table and frees the mapped page.

After discussing with Suren and Ulad, we decided to put the rollback
into the entry points of the vmap API rather than into every
low-level helper. __vmap_pages_range_noflush() undoes the whole range
it was asked to map when it fails, and vmap_page_range() undoes its
range for the ioremap-style mappings.

The rollback is __vunmap_range_noflush(), which only clears the PTEs.
No TLB flush is needed, nothing has touched the mapping yet.
vmap_pages_range_noflush() also drops the KMSAN metadata of the
failed mapping.

The undo walk skips its cond_resched() when the caller's gfp mask
cannot block. __vmalloc() with GFP_ATOMIC or GFP_NOWAIT can run in
atomic context, where cond_resched() cannot schedule.
__vunmap_range_noflush() takes a can_resched argument for that, which
the sleepable callers pass as true.

Suggested-by: Uladyslau Rezki <urezki@gmail.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 include/linux/kmsan.h |  8 ++++--
 mm/kmsan/hooks.c      | 18 ++++++++-----
 mm/kmsan/shadow.c     |  7 ++---
 mm/vmalloc.c          | 61 +++++++++++++++++++++++++++++++++----------
 mm/vmalloc.h          |  6 +++--
 5 files changed, 72 insertions(+), 28 deletions(-)

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
index 3f98056f8c7e..d1986f68eab4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -372,8 +372,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
-	if (!err)
+	if (err) {
+		/* Callers are ioremap and arch setup code, always sleepable. */
+		__vunmap_range_noflush(addr, end, true);
+	} else {
 		flush_cache_vmap(addr, end);
+	}
 
 	return err;
 }
@@ -429,7 +433,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 }
 
 static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
-			     pgtbl_mod_mask *mask)
+			     pgtbl_mod_mask *mask, bool can_resched)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -451,12 +455,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
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
@@ -476,12 +482,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
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
@@ -496,7 +502,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 
 		if (p4d_none_or_clear_bad(p4d))
 			continue;
-		vunmap_pud_range(p4d, addr, next, mask);
+		vunmap_pud_range(p4d, addr, next, mask, can_resched);
 	} while (p4d++, addr = next, addr != end);
 }
 
@@ -512,7 +518,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
  *
  * This is an internal function only. Do not use outside mm/.
  */
-void __vunmap_range_noflush(unsigned long start, unsigned long end)
+void __vunmap_range_noflush(unsigned long start, unsigned long end,
+			    bool can_resched)
 {
 	unsigned long next;
 	pgd_t *pgd;
@@ -529,7 +536,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 			mask |= PGTBL_PGD_MODIFIED;
 		if (pgd_none_or_clear_bad(pgd))
 			continue;
-		vunmap_p4d_range(pgd, addr, next, &mask);
+		vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
 	} while (pgd++, addr = next, addr != end);
 
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
@@ -538,8 +545,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 
 void vunmap_range_noflush(unsigned long start, unsigned long end)
 {
-	kmsan_vunmap_range_noflush(start, end);
-	__vunmap_range_noflush(start, end);
+	/* The unmap paths are sleepable, keep the resched point. */
+	kmsan_vunmap_range_noflush(start, end, true);
+	__vunmap_range_noflush(start, end, true);
 }
 
 /**
@@ -727,18 +735,32 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
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
+	int err;
+
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
 		page_shift = PAGE_SHIFT;
 
-	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
+	err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
+
+	/* Undo the PTEs installed before the failure. */
+	if (err)
+		__vunmap_range_noflush(addr, end,
+				       gfpflags_allow_blocking(gfp_mask));
+
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -750,7 +772,18 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
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

