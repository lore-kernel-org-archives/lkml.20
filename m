Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422F527599
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068110; cv=none; b=Ao+gOeD7bOogKgjoVGmVwnzNZnAnVViogt6tsMJiv0JmJusn/+cnOPvpwNlNMiIhv9FVVQWLn3MKM8xk7OMqbZUOntVPnE4Qm7HFJ9J8tq1lSF/3l+P4NHtHO3Gf/2EiH8oomHsXHYMdRDsFMBmiS5QBqEITy7c6dHr47MuZNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068110; c=relaxed/simple;
	bh=Z5cChD2qcf7SKc+B5CIy+kWqB70rvU/M1atPmI5mdZk=;
	h=Message-Id:To:Cc:Mime-Version:Date:From:Subject:Content-Type; b=ZhKqsn5lsGJdHSL0nZNDKHb377+4WLj/nx1XfdcCQeDbpgGYtAyO9S5wLKY5ZkJ8TmaEvhaoKreDMGU67D8NuUZr90pN/DomGOPEsjXbtRqoKjUWoEWWZEUkmlkYhy7+wwnWTja4fXUCILRx0SAHFOM8muCiWITtLvLHQ7r3qP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ifVQQpA5; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ifVQQpA5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790068102; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=f43TmgQRALeNk9ZBHseTt/FnXdw6N5ADxp4C+n/kWzM=;
 b=ifVQQpA5ocE2AhjwzK2WTk1pMKo+np7D2KD+ln6paixFSGUBQjexUfSUp7E/lsYv6oxBfu
 ylgMAohOSmrdvVUqaW20Qa3iI7Y7PI/HxQ+qq6yIsNKDmY49svCnL6rqgt+NCz9N2YsWIY
 PWoC3lUu5HidQEFKaVjdb5W4QrbMzBhDuB8xzYkCqiCs8GO6Svv54jg7/u0MflcF8Q1KWi
 c0qQdla6dFr27rqP0Thwp2gqrtRVgX2IC1n16UxJADeLitPIj6ZCqmrKlpCDuTXZUhnQZU
 Tk7yoGIkXFparE0zat4O0x4BYR+m/OX7l8u8/s2qRoZTtxw2CE7nPfSBhv5rKg==
Message-Id: <20260922090749.24905-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.45.2
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>
Cc: <aiqi.i7@bytedance.com>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ab24581+b6711f+vger.kernel.org+lizhe.67@bytedance.com>
Date: Tue, 22 Sep 2026 17:07:49 +0800
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH v2] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
PMD sharing is possible. That is only needed when huge_pmd_unshare()
actually detaches a shared PMD page table, because clearing the PUD
invalidates the whole PUD-sized virtual address range.

For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
a shared mapping can pass the "PMD sharing is possible" range test in
adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file has
never actually had any shared PMD page tables. KVM then receives a 1G
invalidation for a 2M operation and zaps unrelated secondary mappings,
so the guest has to fault them back in.

Avoid this by remembering, per hugetlbfs inode, whether PMD sharing was
ever established for the file. Set the flag when huge_pmd_share()
successfully populates a shared PMD table. For the hugetlb unmap paths,
skip the conservative PUD-sized notifier expansion while the file has
never seen PMD sharing.

The state is intentionally sticky and file-wide. Once PMD sharing has
ever happened for the file, the unmap paths keep the existing
conservative expansion. This avoids the no-sharing case without adding a
page-table walk to every unmap.

On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
improves P99 QPS stability while punching pages, reducing the QPS
degradation ratio from 7.09% to 1.45%.

Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
v1: https://lore.kernel.org/all/20260831091023.66581-1-lizhe.67@bytedance.com/

ChangeLogs:
- Rework the implementation based on David's suggestion: remember
  whether PMD sharing ever happened for a hugetlbfs file, and skip the
  conservative notifier range expansion while it has not. This avoids
  the per-unmap page-table walk.

 fs/hugetlbfs/inode.c    |  3 +++
 include/linux/hugetlb.h | 24 ++++++++++++++++++++++++
 mm/hugetlb.c            | 11 ++++++++---
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7611a84..1e24b8d 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -921,6 +921,9 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb,
 		simple_inode_init_ts(inode);
 		info->resv_map = resv_map;
 		info->seals = F_SEAL_SEAL;
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+		info->pmd_sharing_seen = false;
+#endif
 		switch (mode & S_IFMT) {
 		default:
 			init_special_inode(inode, mode, dev);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 16c4c4c..8f1f899 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -509,6 +509,9 @@ struct hugetlbfs_inode_info {
 	struct inode vfs_inode;
 	struct resv_map *resv_map;
 	unsigned int seals;
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+	bool pmd_sharing_seen;
+#endif
 };
 
 static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
@@ -516,6 +519,27 @@ static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode *inode)
 	return container_of(inode, struct hugetlbfs_inode_info, vfs_inode);
 }
 
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+static inline void hugetlbfs_set_pmd_sharing_seen(struct inode *inode)
+{
+	HUGETLBFS_I(inode)->pmd_sharing_seen = true;
+}
+
+static inline bool hugetlbfs_pmd_sharing_seen(struct inode *inode)
+{
+	return HUGETLBFS_I(inode)->pmd_sharing_seen;
+}
+#else
+static inline void hugetlbfs_set_pmd_sharing_seen(struct inode *inode)
+{
+}
+
+static inline bool hugetlbfs_pmd_sharing_seen(struct inode *inode)
+{
+	return false;
+}
+#endif
+
 extern const struct vm_operations_struct hugetlb_vm_ops;
 struct file *hugetlb_file_setup(const char *name, size_t size, vma_flags_t acct,
 				int creat_flags, int page_size_log);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7857728..e370960 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5359,10 +5359,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *vma,
 	if (!vma->vm_file)	/* hugetlbfs_file_mmap error */
 		return;
 
-	adjust_range_if_pmd_sharing_possible(vma, start, end);
 	hugetlb_vma_lock_write(vma);
-	if (vma->vm_file)
+	if (vma->vm_file) {
 		i_mmap_lock_write(vma->vm_file->f_mapping);
+		if (hugetlbfs_pmd_sharing_seen(file_inode(vma->vm_file)))
+			adjust_range_if_pmd_sharing_possible(vma, start, end);
+	}
 }
 
 void __hugetlb_zap_end(struct vm_area_struct *vma,
@@ -5401,7 +5403,9 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				start, end);
-	adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
+	if (hugetlbfs_pmd_sharing_seen(file_inode(vma->vm_file)))
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
@@ -7004,6 +7008,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud_none(*pud)) {
 		pud_populate(mm, pud,
 				(pmd_t *)((unsigned long)spte & PAGE_MASK));
+		hugetlbfs_set_pmd_sharing_seen(mapping->host);
 		mm_inc_nr_pmds(mm);
 	} else {
 		ptdesc_pmd_pts_dec(virt_to_ptdesc(spte));
-- 
2.45.2
