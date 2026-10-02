Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443FE30D3E5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904335; cv=none; b=ZRShf3l1zuF4t3g/9ZtkX8ib5GS9B1HzaCGu7tpZc7PcDIw3IjRgJQR/ouOad8N2wWus1lgbYAtajGJrNoXaz5hJALb73myYfBmigeh9+BzkleeKfYt8Q2R5ti5qHSxx6hSWatrx47QBSVxM6FRWki8ZMy0e8eNVK3Ygf5hcmgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904335; c=relaxed/simple;
	bh=4CjT8ufJpcqztcTZxIF9G3YU/1gY4Ai/30qtfASr6ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMARLjGhjBydJDhExZHXG2/x6JSchY2NTQIkz1TCkJW1zwWncmL7teb+YbiOn/84YulLca8878+hCrKUzO/eu++TbehtwcB4+jyBVSCmeZ5OIT+hMwUItzXrNq7+16odlByS+T/xUdndFqZD/7q1Jqp1KUlkqzhFBzxvhdT/F50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUlLjRuo; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUlLjRuo"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so3098268eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904333; x=1791509133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPgFvdEmNg2LQpD8kOy9w7TP6bBLZB6pMvT63vXQ9SY=;
        b=aUlLjRuo7Xhz9SEYay4l30DfF61++4mGnRM1qbbNLQneeXevSbYirkHDBkf19bubTb
         D496AyIR/AWDKkrwGqA5jBfLhKj0aKXmSkDHN7m/XKtBWbq2AyQVrqciRV6Su8nFq41b
         iEa3w441wtMd5c3yVlnFixSuDoQ5VkBnq8nUJIKkHcUC6ZHH8sTrDi5wehCDkKJwVJq8
         nbyOhwd+0PPwo8vXgO3tvgMllkZGVnTWUD64B3gJd9aWOkIkNolMem4C6xzAZDXD8z30
         VoVTSpC4jLcuaDgBsvdGiA0HQZVuStArNfGntuuCdf0eUg3PJGV1SUmGBIsEB5+H2jcU
         sQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904333; x=1791509133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPgFvdEmNg2LQpD8kOy9w7TP6bBLZB6pMvT63vXQ9SY=;
        b=jBB3Y8jBDI0QvKt8pAlg0bharrgYy61Lw6N0ncV9LnIbEqKZ7J/o/BzIliF/LIaxLs
         6G3UX0wziWFCNY/xTqgEZKK2WuJBDlx7Ge+djWeBhAx5gGfQwbZ+m6PwL8PXhl9RmU5s
         JHuvNKFJzNEQ9E2TCvfeFhH4NnHyAqvIYtJsC9rSh4n2Mbz9wvFUryaOEjRx5xtsy6P5
         Z1+8zQMRUKLyi6dFPiMD0BTSvZI7kJXN7KDr8RsaOOv0mrpjmj4U/wPKFyKf2GouE3Jh
         MlscNlAbg2RDKX/oecQ4GmnWxBFVMrmKsV48gcHVVlX5A+FbjcgpmCLUCDNbKf2WDWlj
         Iknw==
X-Forwarded-Encrypted: i=1; AKwUvBzzvNgDmobSsnle2I24/nLQ7MWEoM/Wt/rf7FmQBFnzA9m8Ih+0JzEfoVhqYJp0D7FxHxjetbxFqMzXnJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS4PIRXrwyDzvejGB9S6N3V+VPW0UM+LplntNrNVIjxwvplG0p
	HSwalE//QEaEqEEw/nSvX8YimrJCiCvitBT3HpVe3f3n1Eyqo1azljC+
X-Gm-Gg: AYBFou1cDNMHj4p2hKwapCiWsnt+uukSH05JCgR7j79d4Dmigg6fzbUnNYrdG/l5lVL
	jMAhKaGm2cJMCru3aBtt0aKHqyv2uu/TS3vMthljGmZRnCGXnWE7YrGte0XST7s7SFnZbcZKKWG
	XR5y1HpbGgGRe50jNKMCkhgIXorUY624OgzBlhmOnxn6AwK2gGHSK++kLrSKmvZfEFdg/ie7HsK
	PnxkF4IYN91Ob2YltJZE4xyB9P95uSe/OVXdY4LJxTuiD1eFsTeT7jWGe0grSoi5A8+H87TIIPj
	3OHlytazSMnTwuR0AukMgBcfENI8eXt7Zx8duxLwYy3Mx5LRMlfzyuMV4blUGjQQde4eRq8wxCp
	wBTRamqyROADwD1Rsjoj1POGOUbG7ogwK5GjOLo4anChovG/SYZfSSTnYBff6aAgAxVSFWDqOtM
	ehjG2VnBZrgSy5EkfF07rhWLd2Y8yKTfc+P+t/gdhBrnBfEBpfyIt+JmBlq2h0/4EhaA==
X-Received: by 2002:a05:7300:828b:b0:34b:354b:79b9 with SMTP id 5a478bee46e88-34f15086754mr1109729eec.12.1790904333162;
        Thu, 01 Oct 2026 18:25:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f984e4sm1837223eec.17.2026.10.01.18.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:25:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 09:25:26 +0800
Subject: [PATCH v2 1/2] mm/migrate: walk runs of consecutive pages in
 do_pages_stat_array()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bug-mm-move-pages-stat-batch-v2-1-f73b5d20519f@gmail.com>
References: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
In-Reply-To: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

move_pages() with a NULL node list reports the node of each page. RDMA
and KV-cache transfer engines use it to find where large registered
buffers live, querying every 4K page of buffers that span hundreds of
gigabytes.

do_pages_stat_array() looks up the VMA and walks the page tables from
the top for every address, taking and dropping the PTE lock each time.
That costs about 105 ns per page, so a 16 GiB buffer takes 486 ms.

Callers almost always pass consecutive addresses. Group them into runs
and walk each run with walk_page_range(), which looks up each VMA and
PTE table once and answers every page under it while holding the lock.
Report pages as folio_walk_start() with FW_ZEROPAGE found them: the node
of a normal folio, -EFAULT for the zero page or an address outside any
VMA, and -ENOENT otherwise. Handle PUD and hugetlb leaves in their own
callbacks so that the walk never splits them.

On 7.3-rc5 in a 16-vCPU VM, querying every page of a populated 4 GiB
buffer:

                before    after
  4K pages      105 ns    31.9 ns
  THP           90 ns     23.1 ns

Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/migrate.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 162 insertions(+), 26 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa7..f4d8bfb9b7b4a 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2451,44 +2451,180 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 	return err;
 }
 
+struct pages_stat_walk {
+	unsigned long start;
+	int *status;
+};
+
+static void pages_stat_set(struct pages_stat_walk *psw, unsigned long addr,
+			   unsigned long end, int stat)
+{
+	int *status = psw->status + ((addr - psw->start) >> PAGE_SHIFT);
+
+	/* end wraps to 0 for the last page of the address space */
+	for (; addr != end; addr += PAGE_SIZE)
+		*status++ = stat;
+}
+
+static int folio_stat(struct folio *folio)
+{
+	if (is_zero_folio(folio) || is_huge_zero_folio(folio))
+		return -EFAULT;
+	if (folio_is_zone_device(folio))
+		return -ENOENT;
+	return folio_nid(folio);
+}
+
+/* Report pages the same way folio_walk_start() with FW_ZEROPAGE finds them. */
+static int pages_stat_pud_entry(pud_t *pudp, unsigned long addr,
+				unsigned long end, struct mm_walk *walk)
+{
+	struct page *page;
+	spinlock_t *ptl;
+	pud_t pud;
+	int stat;
+
+	if (!IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES))
+		return 0;
+	pud = pudp_get(pudp);
+	if (pud_present(pud) && !pud_leaf(pud))
+		return 0;
+
+	ptl = pud_lock(walk->mm, pudp);
+	pud = pudp_get(pudp);
+	if (pud_present(pud) && !pud_leaf(pud)) {
+		spin_unlock(ptl);
+		return 0;
+	}
+	stat = -ENOENT;
+	if (pud_present(pud)) {
+		page = vm_normal_page_pud(walk->vma, addr, pud);
+		if (page)
+			stat = folio_stat(page_folio(page));
+	}
+	pages_stat_set(walk->private, addr, end, stat);
+	spin_unlock(ptl);
+	walk->action = ACTION_CONTINUE;
+	return 0;
+}
+
+static int pages_stat_pmd_entry(pmd_t *pmdp, unsigned long addr,
+				unsigned long end, struct mm_walk *walk)
+{
+	struct vm_area_struct *vma = walk->vma;
+	struct page *page;
+	spinlock_t *ptl;
+	pte_t *ptep;
+	pmd_t pmd;
+	int stat;
+
+	pmd = pmdp_get_lockless(pmdp);
+	if (IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES) &&
+	    (!pmd_present(pmd) || pmd_leaf(pmd))) {
+		ptl = pmd_lock(walk->mm, pmdp);
+		pmd = pmdp_get(pmdp);
+		if (pmd_present(pmd) && !pmd_leaf(pmd)) {
+			spin_unlock(ptl);
+			goto pte_table;
+		}
+		stat = -ENOENT;
+		if (pmd_present(pmd)) {
+			page = vm_normal_page_pmd(vma, addr, pmd);
+			if (page)
+				stat = folio_stat(page_folio(page));
+			else if (is_huge_zero_pmd(pmd))
+				stat = -EFAULT;
+		}
+		pages_stat_set(walk->private, addr, end, stat);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+pte_table:
+	ptep = pte_offset_map_lock(walk->mm, pmdp, addr, &ptl);
+	if (!ptep) {
+		walk->action = ACTION_AGAIN;
+		return 0;
+	}
+	for (; addr < end; addr += PAGE_SIZE, ptep++) {
+		pte_t pte = ptep_get(ptep);
+
+		stat = -ENOENT;
+		if (pte_present(pte)) {
+			page = vm_normal_page(vma, addr, pte);
+			if (page)
+				stat = folio_stat(page_folio(page));
+			else if (is_zero_pfn(pte_pfn(pte)))
+				stat = -EFAULT;
+		}
+		pages_stat_set(walk->private, addr, addr + PAGE_SIZE, stat);
+	}
+	pte_unmap_unlock(ptep - 1, ptl);
+	return 0;
+}
+
+static int pages_stat_hugetlb_entry(pte_t *ptep, unsigned long hmask,
+				    unsigned long addr, unsigned long end,
+				    struct mm_walk *walk)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	spinlock_t *ptl;
+	pte_t pte;
+	int stat = -ENOENT;
+
+	ptl = huge_pte_lock(hstate_vma(walk->vma), walk->mm, ptep);
+	pte = huge_ptep_get(walk->mm, addr, ptep);
+	if (pte_present(pte))
+		stat = folio_stat(pfn_folio(pte_pfn(pte)));
+	pages_stat_set(walk->private, addr, end, stat);
+	spin_unlock(ptl);
+#endif
+	return 0;
+}
+
+static int pages_stat_pte_hole(unsigned long addr, unsigned long end,
+			       int depth, struct mm_walk *walk)
+{
+	/* No VMA at all is -EFAULT, a VMA without the page is -ENOENT */
+	pages_stat_set(walk->private, addr, end, walk->vma ? -ENOENT : -EFAULT);
+	return 0;
+}
+
+static const struct mm_walk_ops pages_stat_walk_ops = {
+	.pud_entry	= pages_stat_pud_entry,
+	.pmd_entry	= pages_stat_pmd_entry,
+	.hugetlb_entry	= pages_stat_hugetlb_entry,
+	.pte_hole	= pages_stat_pte_hole,
+	.walk_lock	= PGWALK_RDLOCK,
+};
+
 /*
  * Determine the nodes of an array of pages and store it in an array of status.
  */
 static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 				const void __user **pages, int *status)
 {
-	unsigned long i;
+	unsigned long i, n;
 
 	mmap_read_lock(mm);
 
-	for (i = 0; i < nr_pages; i++) {
-		unsigned long addr = (unsigned long)(*pages);
-		struct vm_area_struct *vma;
-		struct folio_walk fw;
-		struct folio *folio;
-		int err = -EFAULT;
+	for (i = 0; i < nr_pages; i += n) {
+		unsigned long addr = (unsigned long)pages[i] & PAGE_MASK;
+		struct pages_stat_walk psw = {
+			.start = addr,
+			.status = status + i,
+		};
 
-		vma = vma_lookup(mm, addr);
-		if (!vma)
-			goto set_status;
+		/* Walk runs of consecutive pages in one go */
+		for (n = 1; i + n < nr_pages; n++) {
+			unsigned long next = (unsigned long)pages[i + n] & PAGE_MASK;
 
-		folio = folio_walk_start(&fw, vma, addr, FW_ZEROPAGE);
-		if (folio) {
-			if (is_zero_folio(folio) || is_huge_zero_folio(folio))
-				err = -EFAULT;
-			else if (folio_is_zone_device(folio))
-				err = -ENOENT;
-			else
-				err = folio_nid(folio);
-			folio_walk_end(&fw, vma);
-		} else {
-			err = -ENOENT;
+			if (next != addr + n * PAGE_SIZE || next < addr)
+				break;
 		}
-set_status:
-		*status = err;
-
-		pages++;
-		status++;
+		if (walk_page_range(mm, addr, addr + n * PAGE_SIZE,
+				    &pages_stat_walk_ops, &psw))
+			pages_stat_set(&psw, addr, addr + n * PAGE_SIZE, -EFAULT);
 	}
 
 	mmap_read_unlock(mm);

-- 
2.43.0

