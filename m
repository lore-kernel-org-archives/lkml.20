Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F93F3290
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703941; cv=none; b=uRE8vc0V79lvJXrHjEac/VdoAKX4QKnoAGCqOFYc3DGdDYBQwLw+D9jntBQdIPFDu5CHdMwEJjDfzIxbf93d47e6eK+iICW2Y74b7Lc08gcK5a52/0ekPflUHQL4mMMJfYlfGDlYzU4DNGujVysYXr7+V/hF+cGadPmPOzbw7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703941; c=relaxed/simple;
	bh=BJPDHa+AFDXkXkBgKnPY0PrNRd1+OCRsjpbumQYFstM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyVHcd/iuRhRgR/GHuI44V+drNpWmlompP5NV6GMGaysOOUb+s/3qT3QgAe+ME+J0SLgIAfBmdkRKnvzvlxoLFtefVPgcxTZL+TW3AQltMsEhni50slXILJ+bSH0mSKn73tgWN5J1vnZyOXuu4rvwS0j2Xnbl3MYeMcZ0ySpDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Wu2wlHG1; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Wu2wlHG1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703931; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Uublj1o5v+asXNyk+Uqq0+npYGJId5+xW/omcnk5atg=;
	b=Wu2wlHG1pjm3PuuhtoRfiBMBkknnALUyiANiy1j/AMwxlSlCCOKcaNaoFmTsW70xBXIxA2dx2XmoZHTpgeWQoSBjlUj6niWqt7gfssFHJOQsS9txREuEuuvJPOWdiIShMXx18xNMgwIfkHZrReZLmtkSbgmMCSys54yzx4N0WKc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9o3b4_1789703930;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9o3b4_1789703930 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:50 +0800
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
Subject: [PATCH 04/12] mm: khugepaged: move cc->scan_file and cc->scan_pgoff assignment into collapse_scan_file()
Date: Fri, 18 Sep 2026 11:58:35 +0800
Message-ID: <6c444420195c6a46072fd02553fe468715041753.1789701677.git.baolin.wang@linux.alibaba.com>
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

Move the assignment of cc->scan_file and cc->scan_pgoff into collapse_scan_file().
This simplifies the parameter passing to collapse_scan_file() and cleans up
the code in preparation for the upcoming shmem mTHP collapse support.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f81ecaaa4890..249ee91a66f2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2586,14 +2586,15 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	return result;
 }
 
-static enum scan_result collapse_scan_file(struct mm_struct *mm,
-		unsigned long addr, struct file *file, pgoff_t start,
-		struct collapse_control *cc)
+static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
+		unsigned long addr, struct collapse_control *cc)
 {
 	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
+	struct file *file = vma->vm_file;
 	struct folio *folio = NULL;
 	struct address_space *mapping = file->f_mapping;
+	pgoff_t start = linear_page_index(vma, addr);
 	XA_STATE(xas, &mapping->i_pages, start);
 	int present, swap;
 	int node = NUMA_NO_NODE;
@@ -2689,7 +2690,21 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 	}
 
-	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap,
+	/*
+	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
+	 * the PMD folio, and retracting the PTE table is the run's job.
+	 */
+	if (result == SCAN_SUCCEED || result == SCAN_PTE_MAPPED_HUGEPAGE) {
+		/*
+		 * A file collapse works on the page cache and never sees a
+		 * VMA, so take what it needs from this one while it is still
+		 * here.
+		 */
+		cc->scan_file = get_file(file);
+		cc->scan_pgoff = start;
+	}
+
+	trace_mm_khugepaged_scan_file(vma->vm_mm, failed_pfn, file, present, swap,
 				      result);
 	return result;
 }
@@ -2737,9 +2752,6 @@ enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 		unsigned long addr, struct collapse_control *cc,
 		unsigned long orders)
 {
-	enum scan_result result;
-	pgoff_t pgoff;
-
 	mmap_assert_locked(vma->vm_mm);
 	/* Whatever the last scan found has to have been run by now */
 	collapse_put_scan_file(cc);
@@ -2747,22 +2759,7 @@ enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	if (vma_is_anonymous(vma))
 		return collapse_scan_anon_pmd(vma, addr, cc, orders);
 
-	pgoff = linear_page_index(vma, addr);
-	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
-	/*
-	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
-	 * the PMD folio, and retracting the PTE table is the run's job.
-	 */
-	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
-		return result;
-
-	/*
-	 * A file collapse works on the page cache and never sees a VMA, so take
-	 * what it needs from this one while it is still here.
-	 */
-	cc->scan_file = get_file(vma->vm_file);
-	cc->scan_pgoff = pgoff;
-	return result;
+	return collapse_scan_file(vma, addr, cc);
 }
 
 /*
-- 
2.47.3

