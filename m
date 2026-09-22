Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC42530DEA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121525; cv=none; b=nrcABKULKJtJsMKOQZ2BctO6IfBL/1KLvvC5vov0EHsJInEVmWGG+jxOx7qJfzXSpIBU7p+uvBAhm9nOXrP/CDjorbnamYBP2JtulOe/aQnXPeuk3WnMMNudyEwCuzy8WHqUApKyA6qR7Gu3VsWv6W8VgPiNVWUlLDegq/xL4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121525; c=relaxed/simple;
	bh=Z+b3w7hN29ny0n+lgoibjklp6h6u1gN7hC/nkJ+vNU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is12o8ZmmqU1MLjbO5de5SQ9Xsimy+KFy2OCOhh3QC33VErx+fk14HM8vLYioKg32HTHGxFRfTIoHdKkHZW9NiSBJNF56Cn63+2H4p7sfNPtblPAReBS86s1sRwTfT3ktIzwYqBTIuTFQw+j+DKCK4yxehYg0zo3Lv/v+QCOdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=h4a7kRms; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="h4a7kRms"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so4353641cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121519; x=1790726319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oNw9RPMr3V+/qUjJEYCXBc3lvf+tyCPjegYTQeEM3I=;
        b=h4a7kRms1pVwjzo/b9JB0U2KBFZevFmriKnNg9xWLUdLS4HzGrr7Hgq5DEYfM0CBtt
         ja1SI+7RiMU4DIxB9uFwo/rMyh78MRAwQlyFo2daQwwO+qsGgvYTrmplIRg2ogP6/oWh
         haOg5p534kDxTnhIiO0k+u37KE6dRuj31PJ5zwsEnsfz1+QTqX7S1H6pL+eDqKE8fqms
         eQHjfkpN2/C9RPQKwPAzzyKlEQ5F/Azhn9PgtX6UBmlaU0NJXQCqjLuzPcgJZtLbOebY
         SyDZdD6mfvMjznc5VvZxNrYF3adzn56iSpuTK6+dijswNE5ggT5Zv3lbONkUntKrvaI3
         yVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121519; x=1790726319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oNw9RPMr3V+/qUjJEYCXBc3lvf+tyCPjegYTQeEM3I=;
        b=PrjmpupJKxoFyG0p7JdftTWIftgxQTZ3YTMgTixvNiufPriDBGmL6tlYjZ+0T8BSZO
         UJBG5pIWeO3GB3KjoDP+2uuqgaqJw4X9cwvfdSSqQF+sM/sUPn7A/OvihlcXv3KRbubY
         zRbgMbdQq+fyviaFL6yxRkAZMF8MgUTdpJQWy30m/FlghSKSiWYZHGgVuyzW/0Ef1aoS
         KejBGVY5WJzSATqsD2euqeQ1IcDPunIiDuTazTTX2H14m5E9bdWQJOgq3D1Wp5IJjuur
         D28+acE3uBhyMUQTIwXorLQzYpJ8cicxeZfdeqFAFAYpFHyQHTZb++hd3GwG2hPbyi8+
         NElg==
X-Gm-Message-State: AFuF++mim/fRaQsdnq2IwVMjdAy2/xgwPGdPTKXDPpLkK2sReKiCgzER
	VGYXzh2vfXqVyIqJbsCioFb6/nd3Jb3lOE2dDpL+GkeR2eb6RixfHLYV/ql6Gn0naeA=
X-Gm-Gg: AYBFou0bC8kP9HIXlBdjjb+9yE+NZp+XGl6RXwirEuwU6085UUycIedGGK67jPmV2ly
	t8W6vL5JsOBsa1kL7fFY2KO98UlEhFQv1KU7iACy+4HmgI297uf9qQD3YhKZRo/ULdW92DHdqtz
	3HSanN3Vhj3+qI/OAU+tD4t074i8yk2pUO8wS9BJ+qeaL/iDk0/iRjbPxkYW90je/NzcmC0dNRO
	UtwPPh6iGVnMk25G4YvRhY5HBCLQ9tN9eVYzYxUbOq0CcGwGsuE4QTpqWSL1bGpykvXWeCgNNeb
	/2Tzde66fxZ9ugJY484pXZFaIZZUQTh/BonhozK7wDEUYoxoYZgNyH1oimvkar+mgfdwqS4mUnX
	IexGPMXosvXknnPBzfF7roB0tUXVD8OtDefILocFN6WHOjdSrsEa8DBJr9fQb3Lfr174WsiG8Ra
	uojyHFeL5u9Dg2LdEsYPeuesF0XimfX5WAFWKNOa70aKz1LfLGroNO2YyjBRzjaztNYgLkatxxN
	Q/kZF5soAgWnufJCyjDIOfHtha2454cl7vGsWRP9AY9iPcxoWpqEwjet+u80Dz355Im7+0=
X-Received: by 2002:a05:622a:305:b0:530:f77a:89aa with SMTP id d75a77b69052e-532eacb0064mr19428811cf.30.1790121519361;
        Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 03/10] mm/madvise: factor shared LRU folio handling
Date: Tue, 22 Sep 2026 19:58:23 -0400
Message-ID: <20260922235830.2350770-4-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
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

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 90 +++++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 83d54ab385da8..c345fef23f15d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -361,6 +361,39 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
+static inline void
+madvise_lru_folio(struct folio *folio, bool pageout,
+		struct list_head *folio_list)
+{
+	/*
+	 * Clear references before deactivating or reclaiming the folio. This can
+	 * make idle-page tracking miss recent accesses.
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
@@ -373,15 +406,14 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
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
+				       !can_do_file_pageout(vma);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	if (pmd_trans_huge(*pmd)) {
@@ -407,11 +439,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
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
@@ -437,19 +465,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
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
@@ -502,9 +518,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			if (nr < folio_nr_pages(folio)) {
 				int err;
 
-				if (folio_maybe_mapped_shared(folio))
-					continue;
-				if (pageout_anon_only_filter && !folio_test_anon(folio))
+				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
 					continue;
 				if (!folio_trylock(folio))
 					continue;
@@ -537,7 +551,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		    folio_mapcount(folio) != folio_nr_pages(folio))
 			continue;
 
-		if (pageout_anon_only_filter && !folio_test_anon(folio))
+		if (pageout_anon_only && !folio_test_anon(folio))
 			continue;
 
 		if (!pageout && pte_young(ptent)) {
@@ -546,25 +560,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
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
@@ -651,8 +647,8 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
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
2.53.0-Meta

