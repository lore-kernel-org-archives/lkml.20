Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011E496D5C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406154; cv=none; b=dF3wj6R9ZkRpHiTN2eqSMcwoh/b7OaM0sjjimqTTeAgbzEl2Je8YNoRul7gzJVMGls2KHNOLgV3W4rF0DSMhIadNN5EapH5zAdqUgXw15/XT8FO3e7gIfHo+5A2/JLLMs5jMIYvHtpTrbBABF28YDr0n9pVPTgP7SdJi3hDY7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406154; c=relaxed/simple;
	bh=/cN+FBCH4SnvUOXkF/Q8DuRZ83YkXTNFzJp9ZpEBNks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/YbKZTOnL4qFH4hoemp6ZSl2KCDuO0JZZ1zdSJScUXhhVgFPUTghOEtrLJ7pJ8T9zvpLsRHS0tnfPjktvoxfax2KgA+sqU7KOGd8AQsTfHNdrHzSoLorrIjzbZuVoQUj0uSsxnDRV8/AEFW9oLP+od+VzpB2QpYkUjmaYXTGIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfXxAFVL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfXxAFVL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B23FEC2BCB8;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789406154;
	bh=/cN+FBCH4SnvUOXkF/Q8DuRZ83YkXTNFzJp9ZpEBNks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IfXxAFVLtNGRO0IBfGROsaWcVBt/uq1e62lhZhlnYUTN95XMzT9qnwxo/5Q9KtwQi
	 lUAMCDJDa2Dij6wrwt3+BG7J+LGANarcgvlrIvUQQHL5qfIBW+vcSCfG/r5esMMLGy
	 AByMHxAnO0MLi+OMx+Sab4a5AQRNvxtc+WYXS+qujBLErG4UQTZTWdH0TizA1PQL/l
	 Esj6JttQBzsd9YAXAF2Q0n1UuI8DKVSRUWBZDXlk+//okJmTxkm8SxWyE+khZJpjan
	 scv38hCY8PePzHyiWD72It9+fDCTR+WzQUbWNCiWODZP8Oud1eJ8pSAe87ai0I7vMS
	 TCfkIdDquZTZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23E8C88E78;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 15 Sep 2026 01:14:54 +0800
Subject: [PATCH v5 13/17] mm/huge_memory: move memcg switch into the file
 split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-swap-thp-cleanup-v5-13-39878b37dfb0@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406149; l=3709;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=cmwyWDJZVe1UvzzNSicYdeAQ1Ie6761/rX/pYHb2eu4=;
 b=oOZsXsWV809p10fdYi+5NGL+uJfyRilYaw5kkrwFnSewNLF7giO6F61RSFENYbBJxk0dJI/zE
 mNb0H2jt/+hC6Jrk10LJOWm+/Tqv9YKH7qc8fIM4brbqWOGk5LJyOFo
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

The xarray node allocations in __folio_freeze_split_file() need
to be charged to the folio's memcg, so move the memcg switch from
__folio_split() into the helper.

The anon split helper and the after-split folio freeing perform no
chargeable allocations, so no memcg handling is left in __folio_split().
Rename its out_no_memcg label to out.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a4c2e38f4a6d..169832e2a866 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4140,6 +4140,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
+	struct mem_cgroup *memcg, *old_memcg;
 	struct folio *new_folio, *next;
 	int nr_shmem_dropped = 0;
 	unsigned int min_order;
@@ -4152,9 +4153,18 @@ static int __folio_freeze_split_file(struct folio *folio,
 	if (new_order < min_order)
 		return -EINVAL;
 
+	/*
+	 * Switch to folio's memcg as xarray node allocation can happen and
+	 * needs to charge to it.
+	 */
+	memcg = get_mem_cgroup_from_folio(folio);
+	old_memcg = set_active_memcg(memcg);
+
 	gfp = current_gfp_context(mapping_gfp_mask(mapping) & GFP_RECLAIM_MASK);
-	if (!filemap_release_folio(folio, gfp))
-		return -EBUSY;
+	if (!filemap_release_folio(folio, gfp)) {
+		ret = -EBUSY;
+		goto fail_free;
+	}
 
 	mapping_set_update(&xas, mapping);
 
@@ -4290,6 +4300,9 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 */
 	i_mmap_unlock_read(mapping);
 fail_free:
+	/* Restore the previously active memcg */
+	set_active_memcg(old_memcg);
+	mem_cgroup_put(memcg);
 	xas_destroy(&xas);
 	return ret;
 }
@@ -4321,7 +4334,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 {
 	struct folio *end_folio = folio_next(folio);
 	bool is_anon = folio_test_anon(folio);
-	struct mem_cgroup *memcg, *old_memcg;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
 	int ret;
@@ -4331,27 +4343,20 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 	if (folio != page_folio(split_at) || folio != page_folio(lock_at)) {
 		ret = -EINVAL;
-		goto out_no_memcg;
+		goto out;
 	}
 
 	if (new_order >= old_order) {
 		ret = -EINVAL;
-		goto out_no_memcg;
+		goto out;
 	}
 
 	ret = folio_check_splittable(folio, new_order, split_type);
 	if (ret) {
 		VM_WARN_ONCE(ret == -EINVAL, "Tried to split an unsplittable folio");
-		goto out_no_memcg;
+		goto out;
 	}
 
-	/*
-	 * switch to folio's memcg as xarray node allocation can happen and
-	 * needs to charge to it.
-	 */
-	memcg = get_mem_cgroup_from_folio(folio);
-	old_memcg = set_active_memcg(memcg);
-
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
@@ -4378,10 +4383,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		free_folio_and_swap_cache(new_folio);
 	}
 
-	/* restore to caller's old_memcg */
-	set_active_memcg(old_memcg);
-	mem_cgroup_put(memcg);
-out_no_memcg:
+out:
 	if (is_pmd_order(old_order))
 		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
 	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);

-- 
2.55.0


