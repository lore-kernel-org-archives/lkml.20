Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035C4A5ED0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485888; cv=none; b=mBqo843M3k0epCasTIAAMDoPPuvvrMjXNsjpesCLtzViDU9/jMOrGdWMFZucZmlqLrPA2V7Z66MFGP4pqsZxFX7+t35+N9gSvu7KayJiytWzP2erlQ8nQGZP+5jBS4qqodRStK0nwaTmswzf2DwPuneAZ0PI18fiTAhQyyhQjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485888; c=relaxed/simple;
	bh=oiWpryU94UrJ+uF/zSlZU6f5uT1S+DU65ym4mT9dP4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhM8wLiMTtm/Y9PqjnUz6r1RZAAbBtWb6cq+jr/2dirFgJ2pSR+vpHxbP4YCS6Veq185bP+UNopiCBDF2u/OG7DvgdeQ3z0hLeiOVYW8smjoKb7wyccGYcZP9oslASodyNgRigWD5iHidEK407uoWJNmO8Yi4SuZqduaJNjMm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RRHRd0NT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RRHRd0NT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xu
	5Nis9Fy2g0jTkf2lh9NOxXBZCd0nEic7P0WemrVuw=; b=RRHRd0NTVaD+w5oNbI
	CUDrJxEGXYIpd3Sdv/4Wy0hWN7eOpoqjW7JO86FAiwKKamvtKuuOv7gGKi8wUiKB
	Mvo+GhjM7/E3v2Fgmh+v64W/ETTAqPYj4yeMlg/wQ5UMBzOc2SkPCVA/GEhW8cVM
	/AgKFvoht248hcYg0wBaXQU5o=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHvVwYY6lqm28iAw--.18968S3;
	Tue, 15 Sep 2026 23:24:09 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] mm/ksm: take the ksm folio in try_to_merge_one_page()
Date: Tue, 15 Sep 2026 23:23:48 +0800
Message-ID: <20260915152351.7955-2-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915152351.7955-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
 <20260915152351.7955-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHvVwYY6lqm28iAw--.18968S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF48AryfZFy5JF48Cw17Jrb_yoW5Cr1UpF
	Z2kasrCrW7JFWruryxAr4qyr1ak3sxtay0yF13J3y3Aa43t340kFyfKa4rArW3XrWrCa1f
	tw4UAF1jgay5AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzwZcUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+Bnj3GqpYxl+CwAA3S

From: Longlong Xia <xialonglong@kylinos.cn>

Pass the order-0 KSM or zero-page target as a folio, preserving NULL
for the initial KSM upgrade. Keep the source as struct page because
it may be a tail page of a large folio that is split before merging.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 4a4347e9ce39..10fcae7132b1 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1556,20 +1556,20 @@ static int replace_page(struct vm_area_struct *vma, struct folio *folio,
 /*
  * try_to_merge_one_page - take two pages and merge them into one
  * @vma: the vma that holds the pte pointing to page
- * @page: the PageAnon page that we want to replace with kpage
- * @kpage: the KSM page that we want to map instead of page,
- *         or NULL the first time when we want to use page as kpage.
+ * @page: the PageAnon page that we want to replace with kfolio
+ * @kfolio: the ksm folio that we want to map instead of page,
+ *          or NULL the first time when we want to use page as ksm page.
  *
  * This function returns 0 if the pages were merged, -EFAULT otherwise.
  */
 static int try_to_merge_one_page(struct vm_area_struct *vma,
-				 struct page *page, struct page *kpage)
+				 struct page *page, struct folio *kfolio)
 {
 	struct folio *folio = page_folio(page);
 	pte_t orig_pte = __pte(0);
 	int err = -EFAULT;
 
-	if (page == kpage)			/* ksm page forked */
+	if (kfolio && page == &kfolio->page)	/* ksm page forked */
 		return 0;
 
 	if (!folio_test_anon(folio))
@@ -1597,7 +1597,7 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
 	 * case, we need to lock and check page_count is not raised.
 	 */
 	if (write_protect_page(vma, folio, &orig_pte) == 0) {
-		if (!kpage) {
+		if (!kfolio) {
 			/*
 			 * While we hold folio lock, upgrade folio from
 			 * anon to a NULL stable_node with the KSM flag set:
@@ -1612,9 +1612,8 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
 			if (!folio_test_dirty(folio))
 				folio_mark_dirty(folio);
 			err = 0;
-		} else if (pages_identical(page, kpage))
-			err = replace_page(vma, folio, page_folio(kpage),
-					   orig_pte);
+		} else if (pages_identical(page, &kfolio->page))
+			err = replace_page(vma, folio, kfolio, orig_pte);
 	}
 
 out_unlock:
@@ -1644,7 +1643,8 @@ static int try_to_merge_with_zero_page(struct ksm_rmap_item *rmap_item,
 		mmap_read_lock(mm);
 		vma = find_mergeable_vma(mm, rmap_item->address);
 		if (vma) {
-			err = try_to_merge_one_page(vma, page, zero_page);
+			err = try_to_merge_one_page(vma, page,
+						     page_folio(zero_page));
 			trace_ksm_merge_one_page(page_to_pfn(zero_page),
 						 rmap_item, mm, err);
 		} else {
@@ -1678,7 +1678,7 @@ static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
 	if (!vma)
 		goto out;
 
-	err = try_to_merge_one_page(vma, page, kpage);
+	err = try_to_merge_one_page(vma, page, page_folio(kpage));
 	if (err)
 		goto out;
 
-- 
2.43.0

