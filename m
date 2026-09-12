Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E037B407
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201587; cv=none; b=D24gKgtlanAgsC6WR4mHgVMdeibEllsgP0GFDqnDmr2UuAsrTKiOuhAmgOy6VJ8bhwOlWgYA88zElMqmJY1pPljWrXnmITGybWltbcCpZok/yGN0s0SR/uR9wwh++qhKg23xb2P9+tnEjmAWhd2fHTmtdg9ZqpauobuYSw3xHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201587; c=relaxed/simple;
	bh=PUCPMn+73ZfH0uCHvI5sdQ84aDEztubs7amQmnJNj+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ty/tzG8O8ka+d4xEwqhjckCsgjnH5A04vvyfG+4zN1TdPeXQDuX9g5n8P/Z4y/3eBuj2AMzI9NK6mfzbAR49m+t2ex9AHNzuVEYUdgDFuHOxmaezKq3ifaOWfhqjjIpwUdMFfQkIDw+tN5Pgv05578qLO7s+qf9rKyLQSq+Eh+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mZ8qcMQ0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mZ8qcMQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fY
	YZoGWdlGWHi1GqFofODMAvVspXQpVNRnI7u63JZdA=; b=mZ8qcMQ0jNua/wD0a2
	R5+bUyUTNUp77BIOXdh3ftCnuPvuOYstV0lvDqiAuvWUINtT/j36FGVtXK12uPq2
	UvG0+ZU3l4GcQw4Lh1f0Df5nwZlcZ5GTlQ2UjjO7CQlIP2P3yAf6M//MA9O7SEZj
	GTD8sG8BhEqw6XsepLNtEcMVQ=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnr7FODKVqmfMoSQ--.44660S4;
	Sat, 12 Sep 2026 16:24:49 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	chengming.zhou@linux.dev,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	harry@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nico.pache@linux.dev,
	peterz@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH RFC 2/3] mm/ksm: use the VMA lock when looking up mergeable pages
Date: Sat, 12 Sep 2026 16:24:06 +0800
Message-ID: <20260912082407.75875-3-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912082407.75875-1-xialonglong2025@163.com>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
 <20260912082407.75875-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDnr7FODKVqmfMoSQ--.44660S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxArW8Gr4kWr4xZFWUCw4kZwb_yoWrGw48pF
	WfKas8KrWakr43u34fAr4qyr4Ygwn2gayUAFy3Ja1avw1rtF43GayfJa48JFy5GrWxG3Zx
	Ar4jyFn3Canrt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j92-nUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xEbFGqlDFGSgwAA3q

From: Longlong Xia <xialonglong@kylinos.cn>

get_mergeable_page() currently takes mm->mmap_lock for every unstable-tree
lookup, so KSM is serialized with layout changes to unrelated VMAs. Try
lock_vma_under_rcu() while holding an mm_users reference and walk the page
tables under that VMA's read lock. Retain the mmap read-lock path as a
fallback when the VMA cannot be locked or per-VMA locking is disabled.

Extend folio_walk_start() to verify a VMA read lock and keep the mm_users
reference across the walk, since a VMA lock alone does not prevent
exit_mmap() from freeing page tables. Drop the reference before waiting for
mmap_lock on the fallback path so an exiting mm is not delayed.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/ksm.c | 64 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 49d48d1e0998..aee1a1b49b1b 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -811,21 +811,20 @@ static void break_cow(struct ksm_rmap_item *rmap_item)
 	mmap_read_unlock(mm);
 }
 
-static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
+/*
+ * Get the page that @addr maps in @vma, with an elevated reference, or NULL
+ * when the address no longer maps an anon page.  The caller must hold a lock
+ * that stabilizes @vma: either the mmap read lock, or the vma read lock
+ * together with an mm_users reference.
+ */
+static struct page *__get_mergeable_page(struct vm_area_struct *vma,
+					 unsigned long addr, folio_walk_flags_t flags)
 {
-	struct mm_struct *mm = rmap_item->mm;
-	unsigned long addr = rmap_item->address;
-	struct vm_area_struct *vma;
-	struct page *page = NULL;
 	struct folio_walk fw;
+	struct page *page = NULL;
 	struct folio *folio;
 
-	mmap_read_lock(mm);
-	vma = find_mergeable_vma(mm, addr);
-	if (!vma)
-		goto out;
-
-	folio = folio_walk_start(&fw, vma, addr, 0);
+	folio = folio_walk_start(&fw, vma, addr, flags);
 	if (folio) {
 		if (!folio_is_zone_device(folio) &&
 		    folio_test_anon(folio)) {
@@ -834,11 +833,52 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
 		}
 		folio_walk_end(&fw, vma);
 	}
-out:
 	if (page) {
 		flush_anon_page(vma, page, addr);
 		flush_dcache_page(page);
 	}
+	return page;
+}
+
+static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
+{
+	struct mm_struct *mm = rmap_item->mm;
+	unsigned long addr = rmap_item->address;
+	struct vm_area_struct *vma;
+	struct page *page = NULL;
+
+	/*
+	 * Try the vma lock before the mmap lock, so that ksmd does not queue
+	 * behind a writer that changes the address space layout anywhere in
+	 * this mm: the vma lock only contends with modification of this very
+	 * vma.  Pin mm_users for the walk: exit_mmap() frees the page tables
+	 * under the mmap lock alone, so a vma read lock cannot keep it away,
+	 * but an mm_users reference can; the pin also stands in for the
+	 * ksm_test_exit() check of find_mergeable_vma() on this path.  Drop
+	 * it again before waiting for the mmap lock below, so that an exiting
+	 * mm is not delayed by us.
+	 */
+	if (IS_ENABLED(CONFIG_PER_VMA_LOCK) && mmget_not_zero(mm)) {
+		vma = lock_vma_under_rcu(mm, addr);
+		if (vma) {
+			if ((vma->vm_flags & VM_MERGEABLE) && vma->anon_vma)
+				page = __get_mergeable_page(vma, addr, FW_VMA_LOCKED);
+			vma_end_read(vma);
+			mmput_async(mm);
+			return page;
+		}
+		mmput_async(mm);
+	}
+
+	/*
+	 * The vma is being modified, or CONFIG_PER_VMA_LOCK is off: take the
+	 * mmap read lock as before.  We are prepared to wait rather than skip
+	 * this page, so a contended mm only slows down its own merging.
+	 */
+	mmap_read_lock(mm);
+	vma = find_mergeable_vma(mm, addr);
+	if (vma)
+		page = __get_mergeable_page(vma, addr, 0);
 	mmap_read_unlock(mm);
 	return page;
 }
-- 
2.43.0

