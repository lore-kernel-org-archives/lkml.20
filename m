Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71D41D620
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703944; cv=none; b=KmyyPhhnyn1tLfF+Bu+4i2qAbBJaHOs34VA2jRt29jdaqv84cmFZbNmxFdM/oyAVE3NmjbQgZQXFUKTdxsQM9eFjWhExT59B5v37wn13bGfEEVBUgboPCxj0zcUU8gi5thqrA8fNXLiv0E7c+zFM0AoUcCKpjuIMAH+jW6qpjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703944; c=relaxed/simple;
	bh=b2oBfU7aP9091UrlKPtlDFeBleHx1chQgKv6EZAb7Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALSRXkfeWlGSR9rw38IMvHIfm6QfONZe0JqHoNAmEh/SpiPFSlq10R0vLM6bL0+UNgjbDe3a+K8skDf2qgt/6tqay6GreiTRnlTmgo94fzfHgxCkd7ipCxuSQPPfSatq3MQplGM9bbfIJqtVAMjZWCshgjDz2IGbb+VkM8GrBRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mPyApdi2; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mPyApdi2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703934; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=bFNaStZZHo8Umn9+ZoNiZRjr6gBJxuMv0I9V0qtdSoU=;
	b=mPyApdi2SjXJQnrqpiSdkvBttqs4qiDuNNStR9g0lzu/B6TLzymRIl5PsMZO16gPP1h67PoFESDeHs2bFVZqeymTjroRZ3a9wCYL67lTXihyv4GZIgCjziBH2t7As+jRnNSE06Lu3PwDpjBqcA+5gd4o5qfgEodi95aMMXmfD/I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9taoW_1789703932;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9taoW_1789703932 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:52 +0800
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
Subject: [PATCH 06/12] mm: khugepaged: generalize collapse_file() for shmem mTHP support
Date: Fri, 18 Sep 2026 11:58:37 +0800
Message-ID: <14cfc6705c6afc487d1b39c2606d13c93bda07f1.1789701677.git.baolin.wang@linux.alibaba.com>
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

Generalize the order of the collapse_file() function to support future
shmem mTHP collapse.

No functional changes in this patch.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f741dec3acc2..a987d233ec47 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2138,6 +2138,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
  * @file: file that collapse on
  * @start: collapse start address
  * @cc: collapse context and scratchpad
+ * @order: folio order being collapsed to
  *
  * Basic scheme is simple, details are more complex:
  *  - allocate and lock a new huge page;
@@ -2156,16 +2157,18 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
  *    + unlock and free huge page;
  */
 static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
-		struct file *file, pgoff_t start, struct collapse_control *cc)
+		struct file *file, pgoff_t start, struct collapse_control *cc,
+		int order)
 {
-	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
+	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
 	struct address_space *mapping = file->f_mapping;
+	const unsigned long nr_pages = 1UL << order;
 	struct page *dst;
 	struct folio *folio, *tmp, *new_folio;
 	unsigned long new_pfn = -1;
-	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
+	pgoff_t index = 0, end = start + nr_pages;
 	LIST_HEAD(pagelist);
-	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
+	XA_STATE_ORDER(xas, &mapping->i_pages, start, order);
 	enum scan_result result = SCAN_SUCCEED;
 	int nr_none = 0;
 	bool is_shmem = shmem_file(file);
@@ -2174,9 +2177,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem.
 	 */
 	VM_WARN_ON_ONCE(!mapping_pmd_folio_support(mapping));
-	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
+	VM_WARN_ON_ONCE(start & (nr_pages - 1));
 
-	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
+	result = alloc_charge_folio(&new_folio, mm, cc, order);
 	if (result != SCAN_SUCCEED)
 		goto out;
 	new_pfn = folio_pfn(new_folio);
@@ -2514,12 +2517,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	}
 
 	if (is_shmem) {
-		lruvec_stat_mod_folio(new_folio, NR_SHMEM, HPAGE_PMD_NR);
+		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
 		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
 	} else {
 		lruvec_stat_mod_folio(new_folio, NR_FILE_THPS, HPAGE_PMD_NR);
 	}
-	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, HPAGE_PMD_NR);
+	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, nr_pages);
 
 	/*
 	 * Mark new_folio as uptodate before inserting it into the
@@ -2527,14 +2530,14 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	 * unwritten page.
 	 */
 	folio_mark_uptodate(new_folio);
-	folio_ref_add(new_folio, HPAGE_PMD_NR - 1);
+	folio_ref_add(new_folio, nr_pages - 1);
 
 	if (is_shmem)
 		folio_mark_dirty(new_folio);
 	folio_add_lru(new_folio);
 
 	/* Join all the small entries into a single multi-index entry. */
-	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
+	xas_set_order(&xas, start, order);
 	xas_store(&xas, new_folio);
 	WARN_ON_ONCE(xas_error(&xas));
 	xas_unlock_irq(&xas);
@@ -2589,7 +2592,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_put(new_folio);
 out:
 	VM_BUG_ON(!list_empty(&pagelist));
-	trace_mm_khugepaged_collapse_file(mm, new_pfn, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
+	trace_mm_khugepaged_collapse_file(mm, new_pfn, index, addr, is_shmem, file, nr_pages, result);
 	return result;
 }
 
@@ -2796,7 +2799,7 @@ enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE)
 		goto retract;
 retry:
-	result = collapse_file(mm, addr, file, pgoff, cc);
+	result = collapse_file(mm, addr, file, pgoff, cc, HPAGE_PMD_ORDER);
 
 	/* Dirty pages are worth a writeback and one more try, if asked for */
 	if (cc->policy.writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
-- 
2.47.3

