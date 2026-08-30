Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C32EBBB7
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066857; cv=none; b=elgYH2UElsyhEBLGHmo9HdBQIHf8/OyIylOGfzOb6I7xydmall+PApz7GFYG8h+/oeYLJiYbZhxryrvNLrJgQKbB2XEp4b405AaHQglqPRxX12VkxL3XBgvhlukVeH6wnHiTXyw8qNZhxjThlkMkCJhDbx2F1sc/2my5CkzOiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066857; c=relaxed/simple;
	bh=iV3sIWrGxvWungLl3IqCNLrET/Em/Bu90IrLBSW4Yxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGyzekMq9VWYXbozBihn9vjf3AMG2QD72bueL/ok3565eJf1n5B8i92VDLqoHAPfjdIvxrS/0mKDKYtzB6EsTsZOnXUPzFIHkbDVAeryVbuQ8R6a6JsKrQnBOy50dCebd5VFF6HPAvjUF5FR2DBZsZ3eP/av99oh7MXfAFrnpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=U18EWI+g; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="U18EWI+g"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-855d2bfae95so2535920b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066853; x=1788671653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gXFO776y6OOEgXqFyZQVNGCJghM1qCvRqbZsaMk0vw=;
        b=U18EWI+gSzFCn8/umrsma+543e5b/Mnro+Vt2VLZTX6qC42XOSOOEss/rKxU6IHlyM
         l5AguLk9SFQcLINwmqB2Sc3UpE1C+hSsnNfR6w1S0iueJ4YltSCIhDxRxLwenS+3iTE5
         dkrExZ0yYrDtBfTxoC5FtnXq5BA+U/ZgsrNNGxF2AK+lOZki0ZM5KhuJVYCLJMQBrlmI
         1Pwin+2I3HEGyqAaPLJlzeGbhbyto63+OdjWvjDoV6ZJmyYCfd2MbTJCc3pNVCfipTdv
         PFCgFjxbtVmRXLjdYO7iUD8PIorAjxZ1Az0gLCcB4wnQROriH9iCrrcGH1+yGrtyYzgG
         SXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066853; x=1788671653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gXFO776y6OOEgXqFyZQVNGCJghM1qCvRqbZsaMk0vw=;
        b=XuYIPe5XfTjsh9zrzETih9f/ld5UnPfq7O4Q64+015cljruilUYIbEqc19j63rK3Eq
         o5Zs+OQzxRtQqHjNSyWM4McOPRprvQgOmloJGOdC139ZSK2seW2oPmiYba/DSF7N32K1
         LTubi5FnAeUTdbSPExd8yPOJWp1g/uTMxTcWXH1BsslKcEAkFSRECMP1KEYhRnZ+MeQr
         BqicnHZ7W0U6O41j0gz8NxNOhcxc74cVFJcJSj1zuKJZ0/RDiXUt2WZHproMZTETu/B3
         pmBjwn7SBIaf6VH3AjIqUGrdEVMrmrp6GqciaJinzx+354lEn3OvfUd8b+FU+FGctDCw
         e8WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXlEOjgK6Cf2ofNN5IMJqRa4Z0yHU2QHacJ9QPN+qfqAPsbmiFcFGH4gyr3AT7z3ekKg5/NcACa9rvwMw=@vger.kernel.org
X-Gm-Message-State: AFuF++mzGs3D6BxIWZWpNPdHpaBDaiRoh8sVFSxVpsrae946gJKU4/lf
	ucN2gIDpznxCW4GH+d3NzD2YT3dtoZCxX2qwBBMsHoRVywObyR2u5M3I5+m7CbmxUv1QGXxpGIl
	3i9FM7c4=
X-Gm-Gg: AR+sD10W/aOSQ/hQG1MtEAhAazmIjYglKiWLDi5DEGf21+AdDYiJPosFL+GKGNfZ+3K
	ccJ4mbWMqmqO/PEA2NuD8t1Y+VuXdklGuVF3205uPzjrF9N1S5pRBpP+KbHtucT3pKrUSH6IegZ
	nymX1+ZWHZj+i00QOwtpsQ80G2W1lAbEmJakhra0zvxpRxSTcnexNNUam3ti5T37uL+Ymu3vksb
	2pFW/MFH6BHycc8aOscHkKLB+E0HDzc4+iYF6cqapOR/JDXYp8atQsV2ALBbwI7iUUi1wqOyTGm
	1Roi+SYysf6OoiEjzVM6rCv4ioa7G2VpQYLQRakBr0qtmS/CfcK637x+K05nOK6b+7HV1uEvzCr
	B+AOmHvf+37/cvwL8HDfZik8sAvjo7fKpGj3pdQ9loBu/oPiTV+qIpuQbs90Mz1ggnZgFLmI6b6
	lq0PVvWKL+by4uKjTAJss3SE7rHuHDOcAHmdF/+YEisSqRUMDLrEEorJYx6a+fazshYYiYmFQ30
	aFoktUAHOodY2LmMJE8pH5Ij6GZ14SIQmU=
X-Received: by 2002:a05:6a21:7e84:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3d5d787403dmr293487637.8.1788066853425;
        Sat, 29 Aug 2026 22:14:13 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:13 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 4/6] mm/damon: support flush-assisted access bit clearing for monitoring
Date: Sat, 29 Aug 2026 22:14:05 -0700
Message-ID: <20260830051407.50008-5-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DAMON's access sampling clears the accessed bit of the sampled page and
re-reads it one sampling interval later.  The clearing uses the
non-flushing primitives, deliberately trading accuracy for low
overhead: cached TLB translations survive the clearing, and accesses
through such cached translations do not perform page table walks, hence
do not set the accessed bit again.  The bit therefore re-arms at the
TLB-refill rate rather than the actual access rate.

For most setups this is a good trade-off, since TLB pressure re-walks
hot pages frequently anyway.  It breaks down when translations are
long-lived, most prominently on virtualization hosts backing guest
memory with 1 GiB hugetlb pages: covering hundreds of GiB takes only
hundreds of TLB entries, translations essentially never get evicted,
and secondary MMU (e.g. KVM/EPT) accessed bits cleared via
mmu_notifier_clear_young() are rarely set again.  Measurements on a
1 TiB host showed the reported access fraction pinned at the TLB-refill
rate: a guest workload continuously accessing 842 GiB was
indistinguishable from an idle guest.

Add an 'aging_flush' monitoring context option, default off.  When set,
the sampling primitives pair the accessed bit clearing with
mmu_notifier_clear_flush_young(), so secondary MMUs invalidate their
cached translations and the next guest access must re-walk and re-set
the accessed bit, making the sampled young state reflect the actual
access rate.

The flush covers secondary MMU TLBs only, uniformly across the PTE,
PMD and hugetlb paths.  Primary MMU TLB young-flushing is deliberately
not added: x86 already implements ptep_clear_flush_young() without a
flush on the grounds that primary-TLB accessed-bit staleness is not
worth the flush cost, and the observability target here is secondary
MMU (guest) access state.

The cost is secondary TLB invalidations during the sampling prepare
pass.  KVM coalesces flush requests issued in a burst (pending-request
deduping), so a prepare pass over all regions results in roughly one
guest TLB flush per pass, and hosts whose guests are backed by huge
pages have small TLB working sets that are cheap to re-fill -- exactly
the hosts that need this option.  Measured on a 1 TiB host with a
176-vCPU guest: ~240 flush calls/sec at auto-tuned intervals,
bounding worst-case aggregate overhead below 0.1%.

DAMOS filter paths keep the non-flushing behavior unconditionally.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 include/linux/damon.h |  2 ++
 mm/damon/core.c       |  2 ++
 mm/damon/ops-common.c | 40 ++++++++++++++++++++++++++++------------
 mm/damon/ops-common.h | 12 +++++++-----
 mm/damon/paddr.c      |  7 ++++---
 mm/damon/vaddr.c      | 19 +++++++++++--------
 6 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..7fc438677dd8 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -848,6 +848,7 @@ struct damon_attrs {
  * including damon_call() and damos_walk().
  *
  * @addr_unit:	Scale factor for core to ops address conversion.
+ * @aging_flush:	Flush TLBs when clearing access bits for sampling.
  * @min_region_sz:	Minimum region size.
  * @pause:	Pause kdamond main loop.
  */
@@ -899,6 +900,7 @@ struct damon_ctx {
 
 /* public: */
 	unsigned long addr_unit;
+	bool aging_flush;
 	unsigned long min_region_sz;
 	bool pause;
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..46d6ec3dbffa 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -859,6 +859,7 @@ struct damon_ctx *damon_new_ctx(void)
 	INIT_LIST_HEAD(&ctx->probes);
 
 	ctx->addr_unit = 1;
+	ctx->aging_flush = false;
 	ctx->min_region_sz = DAMON_MIN_REGION_SZ;
 
 	INIT_LIST_HEAD(&ctx->adaptive_targets);
@@ -1800,6 +1801,7 @@ static int __damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src)
 	if (err)
 		return err;
 	dst->addr_unit = src->addr_unit;
+	dst->aging_flush = src->aging_flush;
 	dst->min_region_sz = src->min_region_sz;
 
 	dst->maybe_corrupted = false;
diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index ece101d34684..5c2cd13b9b05 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -63,7 +63,8 @@ struct folio *damon_get_folio_incl_hugetlb(unsigned long pfn)
 	return __damon_get_folio(pfn, true);
 }
 
-void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr)
+void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr,
+		bool flush)
 {
 	pte_t pteval = ptep_get(pte);
 	struct folio *folio;
@@ -86,7 +87,12 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
 	 */
 	if (likely(pte_present(pteval)))
 		young |= ptep_test_and_clear_young(vma, addr, pte);
-	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	if (flush)
+		young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr,
+				addr + PAGE_SIZE);
+	else
+		young |= mmu_notifier_clear_young(vma->vm_mm, addr,
+				addr + PAGE_SIZE);
 	if (young)
 		folio_set_young(folio);
 
@@ -94,7 +100,8 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
 	folio_put(folio);
 }
 
-void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr)
+void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr,
+		bool flush)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	pmd_t pmdval = pmdp_get(pmd);
@@ -113,7 +120,12 @@ void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr
 
 	if (likely(pmd_present(pmdval)))
 		young |= pmdp_test_and_clear_young(vma, addr, pmd);
-	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + HPAGE_PMD_SIZE);
+	if (flush)
+		young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr,
+				addr + HPAGE_PMD_SIZE);
+	else
+		young |= mmu_notifier_clear_young(vma->vm_mm, addr,
+				addr + HPAGE_PMD_SIZE);
 	if (young)
 		folio_set_young(folio);
 
@@ -124,7 +136,7 @@ void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr
 
 #ifdef CONFIG_HUGETLB_PAGE
 void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
-		struct vm_area_struct *vma, unsigned long addr)
+		struct vm_area_struct *vma, unsigned long addr, bool flush)
 {
 	bool referenced = false;
 	pte_t entry = huge_ptep_get(mm, addr, pte);
@@ -139,8 +151,10 @@ void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 		set_huge_pte_at(mm, addr, pte, entry, psize);
 	}
 
-	if (mmu_notifier_clear_young(mm, addr,
-				     addr + huge_page_size(hstate_vma(vma))))
+	if (flush ? mmu_notifier_clear_flush_young(mm, addr,
+				addr + huge_page_size(hstate_vma(vma))) :
+			mmu_notifier_clear_young(mm, addr,
+				addr + huge_page_size(hstate_vma(vma))))
 		referenced = true;
 
 	if (referenced)
@@ -212,6 +226,7 @@ int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 static bool damon_folio_mkold_one(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr, void *arg)
 {
+	bool flush = *(bool *)arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
 
 	while (page_vma_mapped_walk(&pvmw)) {
@@ -224,19 +239,20 @@ static bool damon_folio_mkold_one(struct folio *folio,
 			 */
 			if (folio_test_hugetlb(folio))
 				damon_hugetlb_mkold(pvmw.pte, vma->vm_mm, vma,
-						addr);
+						addr, flush);
 			else
-				damon_ptep_mkold(pvmw.pte, vma, addr);
+				damon_ptep_mkold(pvmw.pte, vma, addr, flush);
 		} else {
-			damon_pmdp_mkold(pvmw.pmd, vma, addr);
+			damon_pmdp_mkold(pvmw.pmd, vma, addr, flush);
 		}
 	}
 	return true;
 }
 
-void damon_folio_mkold(struct folio *folio)
+void damon_folio_mkold(struct folio *folio, bool flush)
 {
 	struct rmap_walk_control rwc = {
+		.arg = &flush,
 		.rmap_one = damon_folio_mkold_one,
 		.anon_lock = folio_lock_anon_vma_read,
 	};
@@ -377,7 +393,7 @@ bool damos_folio_filter_match(struct damos_filter *filter, struct folio *folio)
 	case DAMOS_FILTER_TYPE_YOUNG:
 		matched = damon_folio_young(folio);
 		if (matched)
-			damon_folio_mkold(folio);
+			damon_folio_mkold(folio, false);
 		break;
 	case DAMOS_FILTER_TYPE_HUGEPAGE_SIZE:
 		folio_sz = folio_size(folio);
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 68d7de49c87a..df7ef025bc1a 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -8,18 +8,20 @@
 struct folio *damon_get_folio(unsigned long pfn);
 struct folio *damon_get_folio_incl_hugetlb(unsigned long pfn);
 
-void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr);
-void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr);
+void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr,
+		bool flush);
+void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr,
+		bool flush);
 #ifdef CONFIG_HUGETLB_PAGE
 void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
-		struct vm_area_struct *vma, unsigned long addr);
+		struct vm_area_struct *vma, unsigned long addr, bool flush);
 #else
 static inline void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
-		struct vm_area_struct *vma, unsigned long addr)
+		struct vm_area_struct *vma, unsigned long addr, bool flush)
 {
 }
 #endif	/* CONFIG_HUGETLB_PAGE */
-void damon_folio_mkold(struct folio *folio);
+void damon_folio_mkold(struct folio *folio, bool flush);
 bool damon_folio_young(struct folio *folio);
 
 int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 09d418b2874b..f2aaa82325d1 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -35,14 +35,14 @@ static unsigned long damon_pa_core_addr(
 	return pa / addr_unit;
 }
 
-static void damon_pa_mkold(phys_addr_t paddr)
+static void damon_pa_mkold(phys_addr_t paddr, bool flush)
 {
 	struct folio *folio = damon_get_folio_incl_hugetlb(PHYS_PFN(paddr));
 
 	if (!folio)
 		return;
 
-	damon_folio_mkold(folio);
+	damon_folio_mkold(folio, flush);
 	folio_put(folio);
 }
 
@@ -51,7 +51,8 @@ static void __damon_pa_prepare_access_check(struct damon_region *r,
 {
 	r->sampling_addr = damon_rand(ctx, r->ar.start, r->ar.end);
 
-	damon_pa_mkold(damon_pa_phys_addr(r->sampling_addr, ctx->addr_unit));
+	damon_pa_mkold(damon_pa_phys_addr(r->sampling_addr, ctx->addr_unit),
+			ctx->aging_flush);
 }
 
 static void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 15379d984689..7c11022bb664 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -276,7 +276,8 @@ static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
 		pmd_t pmde = pmdp_get(pmd);
 
 		if (pmd_present(pmde))
-			damon_pmdp_mkold(pmd, walk->vma, addr);
+			damon_pmdp_mkold(pmd, walk->vma, addr,
+					*(bool *)walk->private);
 		spin_unlock(ptl);
 		return 0;
 	}
@@ -286,7 +287,7 @@ static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
 		return 0;
 	if (!pte_present(ptep_get(pte)))
 		goto out;
-	damon_ptep_mkold(pte, walk->vma, addr);
+	damon_ptep_mkold(pte, walk->vma, addr, *(bool *)walk->private);
 out:
 	pte_unmap_unlock(pte, ptl);
 	return 0;
@@ -306,7 +307,8 @@ static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	if (!pte_present(entry))
 		goto out;
 
-	damon_hugetlb_mkold(pte, walk->mm, walk->vma, addr);
+	damon_hugetlb_mkold(pte, walk->mm, walk->vma, addr,
+			    *(bool *)walk->private);
 
 out:
 	spin_unlock(ptl);
@@ -316,14 +318,15 @@ static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
 #define damon_mkold_hugetlb_entry NULL
 #endif /* CONFIG_HUGETLB_PAGE */
 
-static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
+static void damon_va_mkold(struct mm_struct *mm, unsigned long addr,
+		bool flush)
 {
 	struct mm_walk_ops damon_mkold_ops = {
 		.pmd_entry = damon_mkold_pmd_entry,
 		.hugetlb_entry = damon_mkold_hugetlb_entry,
 	};
 
-	damon_va_walk_page_range(mm, addr, addr + 1, &damon_mkold_ops, NULL);
+	damon_va_walk_page_range(mm, addr, addr + 1, &damon_mkold_ops, &flush);
 }
 
 /*
@@ -336,7 +339,7 @@ static void __damon_va_prepare_access_check(struct mm_struct *mm,
 {
 	r->sampling_addr = damon_rand(ctx, r->ar.start, r->ar.end);
 
-	damon_va_mkold(mm, r->sampling_addr);
+	damon_va_mkold(mm, r->sampling_addr, ctx->aging_flush);
 }
 
 static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
@@ -508,9 +511,9 @@ static bool damos_va_filter_young_match(struct damos_filter *filter,
 		mmu_notifier_test_young(vma->vm_mm, addr);
 
 	if (young && ptep)
-		damon_ptep_mkold(ptep, vma, addr);
+		damon_ptep_mkold(ptep, vma, addr, false);
 	else if (young && pmdp)
-		damon_pmdp_mkold(pmdp, vma, addr);
+		damon_pmdp_mkold(pmdp, vma, addr, false);
 
 	return young == filter->matching;
 }
-- 
2.54.0

