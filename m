Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021C4A2A69
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485886; cv=none; b=E2DNnfglRtuz031aD1EYWqMANXnO8dz7VOREKaK2NeLzXc7D6Dw7fpV+ZGEa4+IY+1gpuU00OvPQOf5muEDw3D2dBL7sGNJsMRoYCKV9vXASuSXaiisY/HCPTdCVcnMGJVx6spVPkz+GPeGzofqF+upY4aBs/G+5Y0I/vNuHDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485886; c=relaxed/simple;
	bh=llE7/CRfzd+RhyPof+DZ3xxy0Q7IvQN+tCCAcBbq3lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtAzcnCgcEPmcbG/cRjfCyUHdKr3c0JqFAFvurZmy3cXZpa2SzS+uQ5n0bhSMAcrQtLsc1s8aEZo3ajyNTBx6/Q1fS0LI9TNU65qP+JEnrmz/hYwU8+xLJlq2IxDvZJnJe7h3qhSWqPb0Xv2UL4bSJjhYcpQXhu1t9uBS4WC4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gk1a+vrr; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gk1a+vrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lu
	i8iyV3DDVNmQm8D65uj/p2PuGVb76pdc3dJpjd7Y8=; b=gk1a+vrrTtfPHmd209
	6hFGKDVUc5e5Yne0GLxPkE+vYFabklkvn/0wuW7dUyPBOEezHOKXv+CFTKr/igQX
	iV4g5yRt8tEIUt3YeI1WLWICJJnwHpjRVOAdqkEqEdkLB1d5vdoGMtGPJ6oEIDCG
	WMRmfm8ScH4vAeQ2Iw2RPDBUI=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHvVwYY6lqm28iAw--.18968S4;
	Tue, 15 Sep 2026 23:24:09 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] mm/ksm: take the ksm folio in try_to_merge_with_ksm_page()
Date: Tue, 15 Sep 2026 23:23:49 +0800
Message-ID: <20260915152351.7955-3-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wDHvVwYY6lqm28iAw--.18968S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1rCrW3Wr4rKF45uFyUWrg_yoW5urWkpa
	n7KayUCr47Xr45ur18Ar4qkw4YvryDtayxAFW5GwsIvFnFqry2yF4SyFy8Ar1FgrWrCwna
	kr4UAF15Za98A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDPE-UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+Bnj3GqpYxl+GAAA3B

From: Longlong Xia <xialonglong@kylinos.cn>

Pass the KSM target as a folio and rename the helper accordingly.
Preserve NULL for the initial upgrade of the source page to KSM.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 10fcae7132b1..937d1ffea4cc 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1661,13 +1661,13 @@ static int try_to_merge_with_zero_page(struct ksm_rmap_item *rmap_item,
 }
 
 /*
- * try_to_merge_with_ksm_page - like try_to_merge_two_pages,
- * but no new kernel page is allocated: kpage must already be a ksm page.
+ * try_to_merge_with_ksm_folio - like try_to_merge_two_pages,
+ * but no new kernel page is allocated: kfolio must already be a ksm page.
  *
  * This function returns 0 if the pages were merged, -EFAULT otherwise.
  */
-static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
-				      struct page *page, struct page *kpage)
+static int try_to_merge_with_ksm_folio(struct ksm_rmap_item *rmap_item,
+				      struct page *page, struct folio *kfolio)
 {
 	struct mm_struct *mm = rmap_item->mm;
 	struct vm_area_struct *vma;
@@ -1678,7 +1678,7 @@ static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
 	if (!vma)
 		goto out;
 
-	err = try_to_merge_one_page(vma, page, page_folio(kpage));
+	err = try_to_merge_one_page(vma, page, kfolio);
 	if (err)
 		goto out;
 
@@ -1697,8 +1697,9 @@ static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
 	get_anon_vma(vma->anon_vma);
 out:
 	mmap_read_unlock(mm);
-	trace_ksm_merge_with_ksm_page(kpage, page_to_pfn(kpage ? kpage : page),
-				rmap_item, mm, err);
+	trace_ksm_merge_with_ksm_page(kfolio ? &kfolio->page : NULL,
+				      kfolio ? folio_pfn(kfolio) : page_to_pfn(page),
+				      rmap_item, mm, err);
 	return err;
 }
 
@@ -1710,7 +1711,7 @@ static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
  * pages into one ksm page, NULL otherwise.
  *
  * Note that this function upgrades page to ksm page: if one of the pages
- * is already a ksm page, try_to_merge_with_ksm_page should be used.
+ * is already a ksm page, try_to_merge_with_ksm_folio should be used.
  */
 static struct folio *try_to_merge_two_pages(struct ksm_rmap_item *rmap_item,
 					   struct page *page,
@@ -1719,10 +1720,10 @@ static struct folio *try_to_merge_two_pages(struct ksm_rmap_item *rmap_item,
 {
 	int err;
 
-	err = try_to_merge_with_ksm_page(rmap_item, page, NULL);
+	err = try_to_merge_with_ksm_folio(rmap_item, page, NULL);
 	if (!err) {
-		err = try_to_merge_with_ksm_page(tree_rmap_item,
-							tree_page, page);
+		err = try_to_merge_with_ksm_folio(tree_rmap_item,
+						 tree_page, page_folio(page));
 		/*
 		 * If that fails, we have a ksm page with only one pte
 		 * pointing to it: so break it.
@@ -2411,7 +2412,7 @@ static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item *rmap_ite
 		if (kfolio == ERR_PTR(-EBUSY))
 			return;
 
-		err = try_to_merge_with_ksm_page(rmap_item, page, &kfolio->page);
+		err = try_to_merge_with_ksm_folio(rmap_item, page, kfolio);
 		if (!err) {
 			/*
 			 * The page was successfully merged:
-- 
2.43.0

