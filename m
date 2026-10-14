Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32298569F26
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002634; cv=none; b=OFczyGVBTC4xTNYnTLRqulu+4rXrm4tjEurhS6Smt+Ys9Dw+gwkOgM6BNTTDSMw2jKnVCMS7WhVZ6TDVCRlOCCJa9AnKkGBmbBCsNBAkV8Buyt2Hha70pVpxdoN2kagDVAhNx6e+kADlQG+OWbVRnFg/vMFn+omrY6OEWlHIwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002634; c=relaxed/simple;
	bh=Of5GzeDaT49m27wll1J732O9ywIaw/o8HdwLxuaUiF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb8fb8mGy1pema5iq/GFgZVeKTfCNfISShU6mvQjm2adiwt6vb55LV0SXY7BuQxZSBf8HIaXsq5QwrBPDn6ReDO3PsDaHmNG94pf2oWAM52jPAwcdfxRs8NA75T1aOFHrbTG0eywi7baLj0nO6lc2OO1Vd/5zYa7twyFyMLU3YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nANANuuV; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nANANuuV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e6eb77f0bso60848485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002632; x=1792607432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z7efmS/WkGms6FvbaOcZAe3VwQpzr0tTSUWGVsu8Kk=;
        b=nANANuuVIxot6ySeClDPAeIvIGfQdy3gAaBkOqbIfpSO1eXtEKZf4BVxIka+v0BTkd
         2rNzNdSfFafCNeSr/S2PytwgH+luVo1lpFO7ga66C9a4hgM42G1Ji+CkYzgbWalD02DJ
         /Z3p4lhCcOPn3prDzlTY6BIcOYSA74Evm+y+IkgAkXD4n9e7/EpQkW3Lwk84OXJarsZe
         WEcP5j8/+r/j4AqdOmLeqz5d9mnBjl8QnNltNs5WL2I7rmkNb8TuNDs88Eix8K//6fNY
         S2egqPUSWN0TqP6eHM4vCidSIEEAjpvv2duXTKHUY4FFfnVRcjq8LS0ZNdwAdHU8tPIe
         bAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002632; x=1792607432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/z7efmS/WkGms6FvbaOcZAe3VwQpzr0tTSUWGVsu8Kk=;
        b=tkUMW9B1aWX2vvyQGzZUYLC0FSMQV50QvtfVVlLXDR5okLMTa0padKZBLj/OonVXWE
         K7zSqh/EKogCSdzrM+YUFOZAzA3Q74gJMB7dYONH9AiBPsnRmmH0IvM8jvteuYvS44ND
         Syb2VIc3FXc4bbkM9rKLIC2CXL6rJyJl9XEWIjA1VzKYXwEdMHIDM0kmEIkd+aZ39fQX
         1aQ87ar48pL+4lOqfpi6+IGyiCOmXgaJIK31NEuRX4Jyb+SySdbsu4aA3Lx3/WaJg+5v
         IBWoyXQ0BMr0AVTGKV1qS9giFcfiIj79FtdyU5RX3Z5Vi6RF9+ploPyLkwdwkQX+9Ruw
         fFIg==
X-Gm-Message-State: AFq9FYJcX1/qg2rPFxuyejSJODpCa8prOmpZCh8VP7sgfZyECW2dUsY0
	UVLtlGoCDPzjTGlj8NNeIpawxNAfkaVZPeIDK/4OwIhRzf3f/IiPJIHrD8t1LUzFn9M=
X-Gm-Gg: AYBFou2aDnhJ0rqoYqo5xf+4oP8ENHHvkfBVkLekm9j9U+ZvaLVQWLAJNRrqOB6/7CU
	DJAx745Q9qzihPuXCGtDFUm/aX4cprcICyC/6/aWbo3nhWdeQDp0PMsx/SXcSU7osYPdNsx14GH
	bob9+sgrohm8PZC8dXfb+3JalpHpXU16tfJN+ogJVDUpsr+t8I91/Is8L7ePpX7PVuBO2byDdns
	H8PFUfMS0hZCSj2cqmx4Ejj+scmnMHqamC2edTM9NnoDgltjVd+0XJNC+aYLU/4lBzCnYK+i1Qo
	SLMNi241OgnZrNswbyvwNXhLj+9UkyjPS/gn2XrdI7x33NBgAnoy31NesTO3PdeUBOB1ILPyu3I
	OoHFSXi4xf0GezqaFDIKimxOFTBVbFvbeohPK6AMdK8J68v4qLcgliifccs3mWEvGD4cTapC5Z0
	XhKB/mVBqRiPDgQjXmAudtMLiFSBqHcWqUwANl9I/Lkdj18kw76uXD5Zl+vHJFlQFldjYsbu+c7
	KRFXWBm7GQFx28cM52wb5vjJQSyyxf9ByFRUVTr5Rx876+aJe+b80iUx+2E
X-Received: by 2002:a05:620a:890d:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93ebd1b7bf1mr2679860385a.28.1792002629963;
        Wed, 14 Oct 2026 11:30:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:29 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 02/10] mm/madvise: factor shared LRU folio handling
Date: Wed, 14 Oct 2026 14:30:16 -0400
Message-ID: <20261014183024.2075709-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014183024.2075709-1-gourry@gourry.net>
References: <20261014183024.2075709-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The huge-PMD and PTE paths duplicate folio filtering, reference clearing,
deactivation and pageout isolation. Keeping both copies synchronized
obscures the page-table-specific control flow.

Factor the common filtering and LRU operation into helpers. Keep the
lock-before-reference sequence visible at each split site because an early
reference can prevent split_folio() from succeeding.

Also rename pageout_anon_only_filter to pageout_anon_only to match the
helper's parameter, and drop redundant parentheses from the file pageout
check in madvise_pageout().

No functional change intended.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 94 ++++++++++++++++++++++++++--------------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index f15cac3faf61..b0ce4ececba0 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -360,6 +360,43 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
+static void madvise_lru_folio(struct folio *folio, bool pageout,
+		struct list_head *folio_list)
+{
+	/*
+	 * Reclaim keeps a recently referenced folio, so clear its references
+	 * before deactivating or reclaiming it. As a side effect, idle page
+	 * tracking misses those accesses.
+	 */
+	folio_clear_referenced(folio);
+	folio_test_clear_young(folio);
+	if (folio_test_active(folio))
+		folio_set_workingset(folio);
+
+	if (!pageout) {
+		folio_deactivate(folio);
+		return;
+	}
+
+	if (!folio_isolate_lru(folio))
+		return;
+	if (folio_test_unevictable(folio))
+		folio_putback_lru(folio);
+	else
+		list_add(&folio->lru, folio_list);
+}
+
+/*
+ * Do not interfere with other mappings of the folio, and skip file folios
+ * when only anonymous folios may be paged out.
+ */
+static bool madvise_lru_folio_is_filtered(struct folio *folio,
+		bool pageout_anon_only)
+{
+	return folio_maybe_mapped_shared(folio) ||
+	       (pageout_anon_only && !folio_test_anon(folio));
+}
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -372,15 +409,14 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	spinlock_t *ptl;
 	struct folio *folio = NULL;
 	LIST_HEAD(folio_list);
-	bool pageout_anon_only_filter;
 	unsigned int batch_count = 0;
+	bool pageout_anon_only;
 	int nr;
 
 	if (fatal_signal_pending(current))
 		return -EINTR;
-
-	pageout_anon_only_filter = pageout && !vma_is_anonymous(vma) &&
-					!can_do_file_pageout(vma);
+	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
+			    !can_do_file_pageout(vma);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	if (pmd_trans_huge(*pmd)) {
@@ -406,11 +442,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		if (folio_is_zone_device(folio))
 			goto huge_unlock;
 
-		/* Do not interfere with other mappings of this folio */
-		if (folio_maybe_mapped_shared(folio))
-			goto huge_unlock;
-
-		if (pageout_anon_only_filter && !folio_test_anon(folio))
+		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
 			goto huge_unlock;
 
 		if (next - addr != HPAGE_PMD_SIZE) {
@@ -433,19 +465,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 		}
 
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
-		if (pageout) {
-			if (folio_isolate_lru(folio)) {
-				if (folio_test_unevictable(folio))
-					folio_putback_lru(folio);
-				else
-					list_add(&folio->lru, &folio_list);
-			}
-		} else
-			folio_deactivate(folio);
+		madvise_lru_folio(folio, pageout, &folio_list);
 huge_unlock:
 		spin_unlock(ptl);
 		if (pageout)
@@ -499,9 +519,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			if (nr < folio_nr_pages(folio)) {
 				int err;
 
-				if (folio_maybe_mapped_shared(folio))
-					continue;
-				if (pageout_anon_only_filter && !folio_test_anon(folio))
+				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
 					continue;
 				if (!folio_trylock(folio))
 					continue;
@@ -534,7 +552,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		    folio_mapcount(folio) != folio_nr_pages(folio))
 			continue;
 
-		if (pageout_anon_only_filter && !folio_test_anon(folio))
+		if (pageout_anon_only && !folio_test_anon(folio))
 			continue;
 
 		if (!pageout && pte_young(ptent)) {
@@ -543,25 +561,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			tlb_remove_tlb_entries(tlb, pte, nr, addr);
 		}
 
-		/*
-		 * We are deactivating a folio for accelerating reclaiming.
-		 * VM couldn't reclaim the folio unless we clear PG_young.
-		 * As a side effect, it makes confuse idle-page tracking
-		 * because they will miss recent referenced history.
-		 */
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
-		if (pageout) {
-			if (folio_isolate_lru(folio)) {
-				if (folio_test_unevictable(folio))
-					folio_putback_lru(folio);
-				else
-					list_add(&folio->lru, &folio_list);
-			}
-		} else
-			folio_deactivate(folio);
+		madvise_lru_folio(folio, pageout, &folio_list);
 	}
 
 out:
@@ -648,8 +648,8 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 	 * owner nor write capable of the file. We allow private file mappings
 	 * further to pageout dirty anon pages.
 	 */
-	if (!vma_is_anonymous(vma) && (!can_do_file_pageout(vma) &&
-				(vma->vm_flags & VM_MAYSHARE)))
+	if (!vma_is_anonymous(vma) && !can_do_file_pageout(vma) &&
+	    (vma->vm_flags & VM_MAYSHARE))
 		return 0;
 
 	lru_add_drain();
-- 
2.56.0

