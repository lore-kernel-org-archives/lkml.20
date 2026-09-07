Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F85221EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804737; cv=none; b=bF0vjxI1Ky6Wya2qw7HLhKjLvEkpTdj/5xYfJmNEPXDtzlVhQtmfDxcik7cwgChnmFcKdLZt+kFwJOvaW5e6iM/paFMC5CKY6uKYzbcVjJY7YUrlL4lAzs2c00picUzYK3DiOgR79Xxy/5us9nxxbJya/CqcY8CFUxQgsZ2SK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804737; c=relaxed/simple;
	bh=LirXvJJX0Y/6Fo5sXUix83AOPmuYDoroUD8pSAtNyj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVIaZt2v32sJiRLHZ0hrHWRo8/LzKL4NlbigeWXOk/aQqeFSpGNArLve4LWWR4HeFU6BMlmW+hsvDgvnPW+1Xjq6mzk2F2IkTImcg7pCQP3liKgXlPrQrP+BpU7JlTvJVQvsK9Q4mbty0jbp+PcVJ7ZxItVo66+2yI6N+k/Frh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgOTHUlX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgOTHUlX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5796C2BD01;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804736;
	bh=LirXvJJX0Y/6Fo5sXUix83AOPmuYDoroUD8pSAtNyj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QgOTHUlX0OwjqVlEVvoWBbOdTBNWxKz0jkjh5UA6t3TmSY4Z8Ai2LAFlhkpYxg+DV
	 HbHktoBEk9AyN01vgsxxxxSxrwlwBCeH+iD864Rp+D302iNQlbLrbO9wat3JzlCQI3
	 aMNMvf9fn2UbBj9dk3aLxexJU0Oj77+X25p/hmTLaH2OH2sejNV41V9eCWKQLiRe8w
	 MOmaNj0VKRYmIecePX0jdCWXD/CrTOSsSH4PjLaO3lE7P2DqiCb4EjCfWEL/KkG8nT
	 HjqK/ywP5OnoKptuX7lBN8QUdOgY71avmfHaZyz1lWUxsdAA1L/VIU0i1a9QL/nof0
	 OFWVxhGw0Sq6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1795C79F99;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:17 +0800
Subject: [PATCH v4 13/17] mm/huge_memory: move memcg switch into the file
 split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-13-b532a3f20e71@tencent.com>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
In-Reply-To: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=3655;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=uIbn+TS0iIeP9vFYqPvx1IGgAoImfhKW84wopAEDXo4=;
 b=VZnf3gSCQZgZbn1iZTc2hUb/vK13UG9e9hi8wvd77ElBa98VWNojeQ7JlQMREeFcR8EnJ7om9
 /E6JMsBGRdlAc1zXWgKxvjQWVvdanDEgVWQVm4KHeLzleFEL4pTBT97
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
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 53614b875794..ccd48cd5f94b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4113,6 +4113,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
+	struct mem_cgroup *memcg, *old_memcg;
 	struct folio *new_folio, *next;
 	int nr_shmem_dropped = 0;
 	unsigned int min_order;
@@ -4125,9 +4126,18 @@ static int __folio_freeze_split_file(struct folio *folio,
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
 
@@ -4263,6 +4273,9 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 */
 	i_mmap_unlock_read(mapping);
 fail_free:
+	/* Restore the previously active memcg */
+	set_active_memcg(old_memcg);
+	mem_cgroup_put(memcg);
 	xas_destroy(&xas);
 	return ret;
 }
@@ -4294,7 +4307,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 {
 	struct folio *end_folio = folio_next(folio);
 	bool is_anon = folio_test_anon(folio);
-	struct mem_cgroup *memcg, *old_memcg;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
 	int ret;
@@ -4304,27 +4316,20 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
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
@@ -4351,10 +4356,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
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


