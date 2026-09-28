Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9383644C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563690; cv=none; b=d+qQlNaSMWbkyoeas9JCsHENG2ALeaQB76kUmk/BU1x91eVlZQv5VCfBtudbF8ljc/9vLg9biKTZlaJoNRtYozaWTQucxL+bW88C26JEZWZtRvAQcaMUdJ80XRgUSdibSIaqRXA8uC7xCUCfaaUgKCu0p49MWYHVAanwh9zEMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563690; c=relaxed/simple;
	bh=psgJdYaCx/YhKM/6c6739Z+iUcJI486wg8y00dPXIk8=;
	h=Content-Type:Date:From:To:Subject:Message-Id:Mime-Version:Cc; b=eCFPpiG587g+80NQsaJsxRO6DDkumzXrA7UFizXvEZDZAUsKVy/WBaiEwfUI+n4sri5830s8yopSpU6UujVla9Axv1fTevIr0XqDV4s357XJ/0NL/FoX/l/ZcJYn4NWvi6+tk+DhIy7H5x1PjPU8RaxPxUMPCZlX/5gBpf972BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=l3T+cw5Z; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="l3T+cw5Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790563671; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=c136CmkpMKWU27leu2r2jlfnyev322esjkQHfnDrcXE=;
 b=l3T+cw5ZpclThBxh3QFFvmpFZxTJFLGesK5EFVEk5MjxCR8KmC94rQ4eGmz08xz4u1qzy5
 n5wi3HtgXtvadwLlpJyEhIiiszISFtxmS2jmgyqYtlOXt3Ps64Qonsp4F89dYHiCclcWgg
 Lif+7ZwhPZlSTj9eHK0VK3twN6z0d2c7Hb1NcWG9Yj+M8M7ii2M22vjQaF+sVVN6kUWIqx
 g9vNAy+Q1xkuTCV7F0z2p/Z+KTm6B7/o3AZIGClZpMnlP/oOdRNp5DH2pA3cPmuxMIwiPT
 rgf8PbVxmO67DY77ZG2aPdzfbiB2H2/ZwtFeDq4IIQmxsw4cka9SFpuHu+xleQ==
X-Lms-Return-Path: <lba+26ab9d555+0c852f+vger.kernel.org+lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 10:47:23 +0800
From: "Li Zhe" <lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>
Subject: [PATCH v4] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
Message-Id: <20260928024723.87708-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<aiqi.i7@bytedance.com>, <lizhe.67@bytedance.com>

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
i_mmap_lock_read(), use a 64-bit atomic counter. A zero count is used to
skip the conservative notifier range expansion only after excluding
concurrent PMD sharing with the mapping write lock.

On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
improves P99 QPS stability while punching pages, reducing the QPS
degradation ratio from 7.09% to 1.45%.

Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
v3: https://lore.kernel.org/all/20260924082004.82450-1-lizhe.67@bytedance.com/
v2: https://lore.kernel.org/all/20260922090749.24905-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20260831091023.66581-1-lizhe.67@bytedance.com/

Changelogs:
v3->v4:
- Use atomic64_t for the per-inode PMD-sharing attachment counter as
  suggested by Muchun, avoiding the 32-bit wrap-to-zero case.

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
 include/linux/hugetlb.h | 37 +++++++++++++++++++++++++++++++++++++
 mm/hugetlb.c            | 13 ++++++++++---
 3 files changed, 48 insertions(+), 3 deletions(-)

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
index 16c4c4caa126c..2a227bfbec1e5 100644
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
+	atomic64_t pmd_sharing_count;
+#endif
 };
 
 static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
@@ -516,6 +520,39 @@ static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
 	return container_of(inode, struct hugetlbfs_inode_info, vfs_inode);
 }
 
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+static inline void hugetlbfs_pmd_sharing_init(struct inode *inode)
+{
+	atomic64_set(&HUGETLBFS_I(inode)->pmd_sharing_count, 0);
+}
+
+static inline void hugetlbfs_pmd_sharing_inc(struct inode *inode)
+{
+	atomic64_inc(&HUGETLBFS_I(inode)->pmd_sharing_count);
+}
+
+static inline void hugetlbfs_pmd_sharing_dec(struct inode *inode)
+{
+	atomic64_dec(&HUGETLBFS_I(inode)->pmd_sharing_count);
+}
+
+static inline bool hugetlbfs_pmd_sharing_active(struct inode *inode)
+{
+	return atomic64_read(&HUGETLBFS_I(inode)->pmd_sharing_count) != 0;
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
