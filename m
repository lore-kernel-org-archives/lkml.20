Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C8496D4B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406154; cv=none; b=ekXN08JeQ5FUH3qkUm8NHcB80S9fIG+4WP2tsYnrBXtR1fGXg2umSt45rDJu0W8U3ZC/KjzHji/vfGJ7rqcZbbKTt1CCOIM/MOUxnvwpSBSIbYfHhywBG5xD0HpKkUlVMUGL01rwgfvnqE4erWoG8ghvuvTiAOzNIQRKMaCTNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406154; c=relaxed/simple;
	bh=yN6dSbWHE1mq+6AVew9g9RLNAHqkaYJzr7RZ74KIHWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss3x+ja3d5t3FhjcJjEKNTFhyODCsMIqZtVEHghY7Z216nxrQA0rG0XEb8f3hV7RSpy+IspNZ0Jcm0fVdsZLg3WLKk3TV5ggEvRQuUQ4W26yDnIpURL3/G+dD/ZpvNZEkC88DVVE56wD+qgXP24c5dfWdVPhz5SPlc2KyQEJdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgyaUWBU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgyaUWBU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E3F6C2BCFB;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789406154;
	bh=yN6dSbWHE1mq+6AVew9g9RLNAHqkaYJzr7RZ74KIHWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BgyaUWBUP86nLCNiNciq6K/phtuBazyZNdD6+N2ox5BLie1vmKl3ECE/M/7c9+CyX
	 wt6u5nKB1/5ZGkFs0M4WbVD8PRi6LhyiYwa3xTJCTGfsm2Ql4Ecre/hv04MAlvFe4M
	 WFX3F5qTKZ2ut7pWeMPpnl/PbBkn6xdophtZDXmwp1KOe49JBV+mGh7XGiCe8r9umX
	 3pTHRwvpr8GtEsUrwezM4sT8UF81I2zQRIzMhI2DeMPLoO4P9PISGmL1webu5/KQ0X
	 dytPmriYcWS+gL2SGwmXN/l6zWqHfaQVxK1KkTGPUs6LMCTB/vidqpe+lYQ10EA2TO
	 eu1T2qjI1VLEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAFCC88E6F;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 15 Sep 2026 01:14:52 +0800
Subject: [PATCH v5 11/17] mm/huge_memory: move filemap management into the
 file split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-swap-thp-cleanup-v5-11-39878b37dfb0@tencent.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
In-Reply-To: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <kasong@tencent.com>, 
 Kairui Song <ryncsn@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406149; l=6352;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=jPIK+D3oCGVmQgxmsX24DYG8DueEazRAgatVriCZ6wc=;
 b=WJUYaKVqz07jR4vA2mKc6OCjjrfi2Q7DWoeZWfhvoJqEKCgcle1kHNOi80K4B9fZEsJL42ec4
 nuKP6Urqqh4D0Lbc377xZs+MiL6mIQiqCKMl5+R1EnzmNMgcfg1bOp9
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

Only file split needs the filemap and xarray handling and related
variables.  Move them out of __folio_split() into the file helper so
the helper is self-contained, and simplify the parameters.

No functional change.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 102 ++++++++++++++++++++++++-------------------------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 859aefda7356..8fc1dd5b8354 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4107,16 +4107,42 @@ static int __folio_freeze_split_anon(struct folio *folio,
 
 static int __folio_freeze_split_file(struct folio *folio,
 		unsigned int new_order, struct page *split_at,
-		struct xa_state *xas, struct address_space *mapping,
 		bool do_lru, struct list_head *list,
 		enum split_type split_type)
 {
+	struct address_space *mapping = folio->mapping;
+	XA_STATE(xas, &mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
 	int nr_shmem_dropped = 0;
+	unsigned int min_order;
 	struct lruvec *lruvec;
 	pgoff_t end;
-	int ret;
+	gfp_t gfp;
+	int ret = 0;
+
+	min_order = mapping_min_folio_order(mapping);
+	if (new_order < min_order)
+		return -EINVAL;
+
+	gfp = current_gfp_context(mapping_gfp_mask(mapping) & GFP_RECLAIM_MASK);
+	if (!filemap_release_folio(folio, gfp))
+		return -EBUSY;
+
+	mapping_set_update(&xas, mapping);
+
+	if (split_type == SPLIT_TYPE_UNIFORM) {
+		int old_order = folio_order(folio);
+
+		xas_set_order(&xas, folio->index, new_order);
+		xas_split_alloc(&xas, folio, old_order, gfp);
+		if (xas_error(&xas)) {
+			ret = xas_error(&xas);
+			goto fail_free;
+		}
+	}
+
+	i_mmap_lock_read(mapping);
 
 	/* Currently device private folios can only back anonymous memory. */
 	VM_WARN_ON_ONCE_FOLIO(folio_is_device_private(folio), folio);
@@ -4134,15 +4160,15 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 	ret = unmap_folio(folio);
 	if (ret)
-		return ret;
+		goto fail_mmap_unlock;
 
-	xas_lock_irq(xas);
+	xas_lock_irq(&xas);
 
 	/*
 	 * Check if the folio is present in page cache.
 	 * We assume all tail are present too, if folio is there.
 	 */
-	if (xas_load(xas) != folio) {
+	if (xas_load(&xas) != folio) {
 		ret = -EAGAIN;
 		goto fail;
 	}
@@ -4169,7 +4195,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	if (do_lru)
 		lruvec = folio_lruvec_lock(folio);
 
-	ret = __split_frozen_folio(folio, new_order, split_at, xas,
+	ret = __split_frozen_folio(folio, new_order, split_at, &xas,
 				   mapping, split_type);
 
 	/*
@@ -4225,9 +4251,19 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 * If we want to use try_to_migrate() on file in unmap_folio,
 	 * remember to add remap_anon_folio() and adapt it.
 	 */
-	xas_unlock_irq(xas);
+	xas_unlock_irq(&xas);
+fail_mmap_unlock:
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
+	/*
+	 * Drop the mapping while the inode is still pinned. @folio stays
+	 * locked and present in the page cache, so eviction cannot free
+	 * the inode yet, nothing past this point may touch the inode or
+	 * the mapping.
+	 */
+	i_mmap_unlock_read(mapping);
+fail_free:
+	xas_destroy(&xas);
 	return ret;
 }
 
@@ -4256,11 +4292,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
 		struct list_head *list, enum split_type split_type)
 {
-	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
 	bool is_anon = folio_test_anon(folio);
 	struct mem_cgroup *memcg, *old_memcg;
-	struct address_space *mapping = NULL;
 	struct anon_vma *anon_vma = NULL;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
@@ -4307,60 +4341,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 			goto out;
 		}
 		anon_vma_lock_write(anon_vma);
-		mapping = NULL;
-	} else {
-		unsigned int min_order;
-		gfp_t gfp;
-
-		mapping = folio->mapping;
-		min_order = mapping_min_folio_order(mapping);
-		if (new_order < min_order) {
-			ret = -EINVAL;
-			goto out;
-		}
-
-		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
-							GFP_RECLAIM_MASK);
-
-		if (!filemap_release_folio(folio, gfp)) {
-			ret = -EBUSY;
-			goto out;
-		}
-
-		mapping_set_update(&xas, mapping);
-
-		if (split_type == SPLIT_TYPE_UNIFORM) {
-			xas_set_order(&xas, folio->index, new_order);
-			xas_split_alloc(&xas, folio, old_order, gfp);
-			if (xas_error(&xas)) {
-				ret = xas_error(&xas);
-				goto out;
-			}
-		}
-
-		anon_vma = NULL;
-		i_mmap_lock_read(mapping);
 	}
 
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
 	else
-		ret = __folio_freeze_split_file(folio, new_order, split_at, &xas, mapping,
+		ret = __folio_freeze_split_file(folio, new_order, split_at,
 						true, list, split_type);
 
-	/*
-	 * Drop the mapping while the inode is still pinned. @folio stays
-	 * locked and present in the page cache until the loop below, so
-	 * eviction cannot free the inode yet; @lock_at is not enough, it may
-	 * be a tail beyond EOF that the split already dropped from the page
-	 * cache. Nothing past this point may touch the inode or the mapping.
-	 */
-	if (mapping) {
-		i_mmap_unlock_read(mapping);
-		mapping = NULL;
-	}
-
 	/*
 	 * Unlock all after-split folios except the one containing
 	 * @lock_at page. If @folio is not split, it will be kept locked.
@@ -4384,14 +4373,11 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		anon_vma_unlock_write(anon_vma);
 		put_anon_vma(anon_vma);
 	}
-	if (mapping)
-		i_mmap_unlock_read(mapping);
 out:
 	/* restore to caller's old_memcg */
 	set_active_memcg(old_memcg);
 	mem_cgroup_put(memcg);
 out_no_memcg:
-	xas_destroy(&xas);
 	if (is_pmd_order(old_order))
 		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
 	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);

-- 
2.55.0


