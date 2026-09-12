Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8235AC1E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201585; cv=none; b=mdmhBnYp6/6002OYsYkUAzPeMvfJEZpi64A4dJ3lj+GBsuNhFbDJI/fjSkPbnzfSCLtxEjUqppYA54O3evk/YAOH9L0LFaaeyCEXHkNjnuqNgftdvlCn+dMaE6egQwtbXkYwWZfXVkCV1tl9Q9Lc7VgvoAXxtMp4Q/Sa0GrRFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201585; c=relaxed/simple;
	bh=01E7MTFBXBA9FD67qbSGieQEP4bz4k4o8tXOVDhTb/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUmDgfar65HADQap/CKzLDgcUsZWJenKMzJukh/632SW+fRSug3GK45gf1jdMMpRj7Q0Fn7yGjVV+OTzTJj9X5UZ6bkd7xj/Qlmes6BkRAaj7Sg9P+Ufl/yVTW/AJG3LHq/Y0Ld0ghTIDrWiDnR7t1DQkNPcnr9flS72/gWJUDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ISqqJMZc; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ISqqJMZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yn
	cf0PxijlZoQpU9WpOljLbavmoG2PB3EBdY+B+ayfA=; b=ISqqJMZcXy0NipoBmQ
	DGy+LrADHOcT2G5d3Giav/XLw7t9GyjKbu8FlOV0xqA3zVQFcEWdW/cildYiwUnh
	YTY1sTDIiCu4d94LimVip3iwJte2sei5ZfwxWTq8G7YAXW9/itMbazDCUDSI1ULp
	n6m3SUEhuJr+nBhKAsZ0lzUEY=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnr7FODKVqmfMoSQ--.44660S5;
	Sat, 12 Sep 2026 16:24:50 +0800 (CST)
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
Subject: [PATCH RFC 3/3] mm/ksm: scan VMAs with per-VMA locks
Date: Sat, 12 Sep 2026 16:24:07 +0800
Message-ID: <20260912082407.75875-4-xialonglong2025@163.com>
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
X-CM-TRANSID:PigvCgDnr7FODKVqmfMoSQ--.44660S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrW8KFW3Xw48ZFy8GF4rXwb_yoW7Ww15pF
	ZrJa98Wr45Cw4fXFZ3XF48CrWagw4vga1UJr43Cwna9wnxtrsxuF4rKayUAF98Crn3Xa4a
	vr4jyFnxCF1avaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9yCXUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xMbFGqlDFOSjwAA3m

From: Longlong Xia <xialonglong@kylinos.cn>

KSM currently holds mm->mmap_lock while scanning the VMAs of an mm. Use
lock_next_vma() and walk_page_range_vma() to acquire each VMA's read lock
and release it after finding a candidate page, allowing unrelated VMA
updates to proceed while ksmd scans.

Pin mm_users for the duration of the lockless VMA traversal to keep page
tables alive, and retain the mmap-lock scan as a fallback when a VMA lock
cannot be acquired or per-VMA locking is disabled. Allocation failures
preserve the existing early-stop semantics. This reduces mmap_lock
contention for workloads with concurrent address-space updates while
preserving existing scan semantics.

When the per-VMA scan completes without finding a candidate, remember the
complete traversal and revalidate the mmap-lock sequence before entering
the fallback. If the address space is unchanged, skip the duplicate VMA
walk; if a VMA writer raced with the traversal, restart the fallback walk.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/ksm.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/mm/ksm.c b/mm/ksm.c
index aee1a1b49b1b..2c0b2adb83d4 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2647,6 +2647,98 @@ static struct mm_walk_ops ksm_next_page_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
+#ifdef CONFIG_PER_VMA_LOCK
+static const struct mm_walk_ops ksm_next_page_vma_ops = {
+	.pmd_entry = ksm_next_page_pmd_entry,
+	.walk_lock = PGWALK_VMA_RDLOCK_VERIFY,
+};
+
+/* Return true when a candidate was processed, including allocation failure. */
+static bool scan_get_next_rmap_item_vma(struct ksm_mm_slot *mm_slot,
+		struct page **page, struct ksm_rmap_item **result,
+		bool *complete, unsigned int *mm_wr_seq)
+{
+	struct mm_struct *mm = mm_slot->slot.mm;
+	unsigned long address = ksm_scan.address;
+	struct vm_area_struct *vma;
+	struct vma_iterator vmi;
+	bool done = false;
+	bool mmap_unlocked;
+
+	if (!mmget_not_zero(mm))
+		return false;
+
+	mmap_unlocked = mmap_lock_speculate_try_begin(mm, mm_wr_seq);
+
+	for (;;) {
+		rcu_read_lock();
+		vma_iter_init(&vmi, mm, address);
+		vma = lock_next_vma(mm, &vmi, address);
+		rcu_read_unlock();
+		if (IS_ERR_OR_NULL(vma))
+			break;
+
+		address = vma->vm_end;
+		if (!(vma->vm_flags & VM_MERGEABLE))
+			goto next_vma;
+		if (ksm_scan.address < vma->vm_start)
+			ksm_scan.address = vma->vm_start;
+		if (!vma->anon_vma)
+			ksm_scan.address = vma->vm_end;
+
+		while (ksm_scan.address < vma->vm_end) {
+			struct ksm_next_page_arg arg;
+			struct ksm_rmap_item *rmap_item;
+			int found;
+
+			found = walk_page_range_vma(vma, ksm_scan.address,
+					vma->vm_end, &ksm_next_page_vma_ops, &arg);
+			if (found <= 0) {
+				VM_WARN_ON_ONCE(found < 0);
+				ksm_scan.address = vma->vm_end;
+				break;
+			}
+
+			ksm_scan.address = arg.addr;
+			flush_anon_page(vma, arg.page, arg.addr);
+			flush_dcache_page(arg.page);
+			rmap_item = get_next_rmap_item(mm_slot,
+					ksm_scan.rmap_list, arg.addr);
+			if (rmap_item) {
+				ksm_scan.rmap_list = &rmap_item->rmap_list;
+				if (should_skip_rmap_item(arg.folio, rmap_item)) {
+					folio_put(arg.folio);
+					ksm_scan.address += PAGE_SIZE;
+					cond_resched();
+					continue;
+				}
+				ksm_scan.address += PAGE_SIZE;
+				*page = arg.page;
+			} else {
+				folio_put(arg.folio);
+			}
+			*result = rmap_item;
+			done = true;
+			vma_end_read(vma);
+			goto out;
+		}
+next_vma:
+		/*
+		 * Don't advance ksm_scan.address for VMAs the mmap-lock loop
+		 * skips with a plain continue: the cursor has to stay 0 when
+		 * this mm holds no VM_MERGEABLE vma, so the fallback walk can
+		 * remove the mm from the scan list at the end of the pass.
+		 */
+		vma_end_read(vma);
+		cond_resched();
+	}
+	*complete = mmap_unlocked && !vma;
+out:
+	mmput_async(mm);
+	return done;
+}
+#endif
+
 static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 {
 	struct mm_struct *mm;
@@ -2655,6 +2747,9 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	struct vm_area_struct *vma;
 	struct ksm_rmap_item *rmap_item;
 	struct vma_iterator vmi;
+	bool skip_vma_scan = false;
+	bool vma_scan_complete = false;
+	unsigned int mm_wr_seq;
 	int nid;
 
 	if (list_empty(&ksm_mm_head.slot.mm_node))
@@ -2719,12 +2814,23 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 
 	slot = &mm_slot->slot;
 	mm = slot->mm;
+#ifdef CONFIG_PER_VMA_LOCK
+	rmap_item = NULL;
+	if (scan_get_next_rmap_item_vma(mm_slot, page, &rmap_item,
+			&vma_scan_complete, &mm_wr_seq))
+		return rmap_item;
+#endif
+	/* Recheck the end of the scan under mmap_lock before removing the mm. */
 	vma_iter_init(&vmi, mm, ksm_scan.address);
 
 	mmap_read_lock(mm);
+	if (vma_scan_complete && !mmap_lock_speculate_retry(mm, mm_wr_seq))
+		skip_vma_scan = true;
 	if (ksm_test_exit(mm))
 		goto no_vmas;
 
+	if (skip_vma_scan)
+		goto scan_cleanup;
 	for_each_vma(vmi, vma) {
 		if (!(vma->vm_flags & VM_MERGEABLE))
 			continue;
@@ -2785,6 +2891,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		}
 	}
 
+scan_cleanup:
 	if (ksm_test_exit(mm)) {
 no_vmas:
 		ksm_scan.address = 0;
-- 
2.43.0

