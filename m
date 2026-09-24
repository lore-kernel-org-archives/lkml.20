Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7A3B14BB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238057; cv=none; b=q5dy+Sa/T/vJ8mJWL1nIOSJJVv9iUn8inGtKSAz2UpKNlpeJiW1Mo7sY9A3rXI16pOCdxpjhpYf4DczuhvVEmrwT4LlNT5mkNrr5WZa9XgdsAu5BofhCo8rytSWy+9l7nS+E2BFLNNazS0isSvf4sQ1nwUnYJdPLxHh6YsMEinY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238057; c=relaxed/simple;
	bh=ePiwKF8HMsRFKbuM/TpVsNDvpsdY3atQCuchOBQe9V4=;
	h=Date:Message-Id:Mime-Version:Cc:Subject:Content-Type:To:From; b=BMzptf1LJDz90d1cH+KIIdNAYYI2XOYc6cCmcRIqodeuvx92Dy9aXImdE8GLhUIbdIp+ahR+d/u2klE5gvOojA49MjCaQnbVAvbvabpPkqu5EjTZz8liPEF430Xzai2BcAoPsyhoWAHgk922VoYaOE8cgJpPCeXhv9XF0pC2p7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HkAZ1EeR; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HkAZ1EeR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790238036; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zxzIZ5mEDu53hBL9tVtFRMsrCTu/a/cXLKfvDqCdxFU=;
 b=HkAZ1EeR4cpXqDPkdzdzbveAI2E1qYCNsgnDMYDI81oTkgFbut6bUp7ydSjfWwFmAOhZWu
 8fRwwvoI0mFb82oqPmhgRFzvQ9AXje3QJxGSiKYJWcdszzWrAmj+ieMDwcCoSZLGYXa7A1
 RvJDHxpNcWjsqFdA7F1FPYjmFJEvkQKtIrZy3xyP7W8iPfHMQZt7CC6+ti9NZlXcd/1+hO
 0oygHrHEj041sW8ufpBlPLWtuhpqdPDo4616tvR5pjmmUgzYWeg7hd7dQq15xz1s2vnpV8
 8H5Bhc2tFo92Nin0emWQEwNWbAhmBlHIhU3ckurKRRq5hkQPEZerZDUtg6Nc/Q==
Content-Transfer-Encoding: 7bit
Date: Thu, 24 Sep 2026 16:20:04 +0800
Message-Id: <20260924082004.82450-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2
X-Lms-Return-Path: <lba+26ab4dd53+d1d9da+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<aiqi.i7@bytedance.com>, <lizhe.67@bytedance.com>
Subject: [PATCH v3] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>
From: "Li Zhe" <lizhe.67@bytedance.com>

Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
PMD sharing is possible. That is only needed when huge_pmd_unshare()
actually detaches a shared PMD page table, because clearing the PUD
invalidates the whole PUD-sized virtual address range.

For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
a shared mapping can pass the "PMD sharing is possible" range test in
adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file does
not currently have any shared PMD page tables. KVM then receives a 1G
invalidation for a 2M operation and zaps unrelated secondary mappings,
so the guest has to fault them back in.

Avoid this by tracking active PMD-sharing attachments per hugetlbfs
inode. The count is incremented only after huge_pmd_share() successfully
installs a shared PMD table, and decremented when __huge_pmd_unshare()
actually detaches one. Since huge_pmd_share() can run concurrently under
i_mmap_lock_read(), use atomic operations for the count. A zero count is
used to skip the conservative notifier range expansion only after
excluding concurrent PMD sharing with the mapping write lock.

On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
improves P99 QPS stability while punching pages, reducing the QPS
degradation ratio from 7.09% to 1.45%.

Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
v2: https://lore.kernel.org/all/20260922090749.24905-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20260831091023.66581-1-lizhe.67@bytedance.com/

ChangeLogs:
v2->v3:
- Rework the sticky state based on Andrew's feedback: use a per-inode
  counter of active PMD-sharing attachments, so files can return to the
  no-active-sharing state after PMD sharing ends.

v1->v2:
- Rework the implementation based on David's suggestion: remember
  whether PMD sharing ever happened for a hugetlbfs file, and skip the
  conservative notifier range expansion while it has not. This avoids
  the per-unmap page-table walk.

 fs/hugetlbfs/inode.c    |  1 +
 include/linux/hugetlb.h | 43 +++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb.c            | 13 ++++++++++---
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7611a8470ea26..78e27ce0a6f63 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -921,6 +921,7 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb,
 		simple_inode_init_ts(inode);
 		info->resv_map = resv_map;
 		info->seals = F_SEAL_SEAL;
+		hugetlbfs_pmd_sharing_init(inode);
 		switch (mode & S_IFMT) {
 		default:
 			init_special_inode(inode, mode, dev);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 16c4c4caa126c..6b4f92b7f7ae4 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -12,6 +12,7 @@
 #include <linux/page_ref.h>
 #include <linux/list.h>
 #include <linux/kref.h>
+#include <linux/atomic.h>
 #include <linux/pgtable.h>
 #include <linux/gfp.h>
 #include <linux/userfaultfd_k.h>
@@ -509,6 +510,9 @@ struct hugetlbfs_inode_info {
 	struct inode vfs_inode;
 	struct resv_map *resv_map;
 	unsigned int seals;
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+	atomic_t pmd_sharing_count;
+#endif
 };
 
 static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
@@ -516,6 +520,45 @@ static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
 	return container_of(inode, struct hugetlbfs_inode_info, vfs_inode);
 }
 
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+static inline void hugetlbfs_pmd_sharing_init(struct inode *inode)
+{
+	atomic_set(&HUGETLBFS_I(inode)->pmd_sharing_count, 0);
+}
+
+static inline void hugetlbfs_pmd_sharing_inc(struct inode *inode)
+{
+	atomic_inc(&HUGETLBFS_I(inode)->pmd_sharing_count);
+}
+
+static inline void hugetlbfs_pmd_sharing_dec(struct inode *inode)
+{
+	atomic_dec(&HUGETLBFS_I(inode)->pmd_sharing_count);
+}
+
+/*
+ * A 32-bit counter can theoretically wrap, but doing so would require
+ * billions of active PMD-sharing attachments to the same inode and is not
+ * expected in practice. Treat any non-zero value as active so a wrapped
+ * negative value still takes the conservative notifier range.
+ */
+static inline bool hugetlbfs_pmd_sharing_active(struct inode *inode)
+{
+	return atomic_read(&HUGETLBFS_I(inode)->pmd_sharing_count) != 0;
+}
+#else
+static inline void hugetlbfs_pmd_sharing_init(struct inode *inode) {}
+
+static inline void hugetlbfs_pmd_sharing_inc(struct inode *inode) {}
+
+static inline void hugetlbfs_pmd_sharing_dec(struct inode *inode) {}
+
+static inline bool hugetlbfs_pmd_sharing_active(struct inode *inode)
+{
+	return false;
+}
+#endif
+
 extern const struct vm_operations_struct hugetlb_vm_ops;
 struct file *hugetlb_file_setup(const char *name, size_t size, vma_flags_t acct,
 				int creat_flags, int page_size_log);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6c..cb27c06d1f7a7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5361,10 +5361,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *vma,
 	if (!vma->vm_file)	/* hugetlbfs_file_mmap error */
 		return;
 
-	adjust_range_if_pmd_sharing_possible(vma, start, end);
 	hugetlb_vma_lock_write(vma);
-	if (vma->vm_file)
+	if (vma->vm_file) {
 		i_mmap_lock_write(vma->vm_file->f_mapping);
+		if (hugetlbfs_pmd_sharing_active(file_inode(vma->vm_file)))
+			adjust_range_if_pmd_sharing_possible(vma, start, end);
+	}
 }
 
 void __hugetlb_zap_end(struct vm_area_struct *vma,
@@ -5403,7 +5405,10 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				start, end);
-	adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
+	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
+	if (hugetlbfs_pmd_sharing_active(file_inode(vma->vm_file)))
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
@@ -7006,6 +7011,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud_none(*pud)) {
 		pud_populate(mm, pud,
 				(pmd_t *)((unsigned long)spte & PAGE_MASK));
+		hugetlbfs_pmd_sharing_inc(file_inode(vma->vm_file));
 		mm_inc_nr_pmds(mm);
 	} else {
 		ptdesc_pmd_pts_dec(virt_to_ptdesc(spte));
@@ -7037,6 +7043,7 @@ static int __huge_pmd_unshare(struct mmu_gather *tlb,
 	pud_clear(pud);
 
 	tlb_unshare_pmd_ptdesc(tlb, virt_to_ptdesc(ptep), addr);
+	hugetlbfs_pmd_sharing_dec(file_inode(vma->vm_file));
 
 	mm_dec_nr_pmds(mm);
 	return 1;
-- 
2.20.1
