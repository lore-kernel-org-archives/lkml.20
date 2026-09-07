Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87B523781
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804737; cv=none; b=YYziLzBt2V2Z2iqI1SXz6SN/a5184gq4lEacziPrSBqnSjp81O7TJx/ifNshwvRsgJdUvC3bSXlQc1njjo0qlxQ5uAAR70mkyGEnhj5+aXrypWL1SWSh36LGFNSbl/zD9tF+wy3aqNh60CrhyslI1U34QZkMKDHBED1xC5R9fVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804737; c=relaxed/simple;
	bh=CKnadc+7pWXJlgz4J8xzzvddy/Ve8PJlE6DTq8avhuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJ/oJ/5Luc1OLy8f+FBrqdhCwSBHnJv50XhmF0dB3aCmegMUP48mLgGZfdJyEL6GX5bTJAzQDCUJufkhQk9QQZJxdOlGF7lOkQey9ZHNkQOMGIGcLFRLCqihF5fZ2BDEe5nqOvPsQGhyMWwCFPwQ09c/xHNWjQSzxuwgr0CQgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg9LUZlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg9LUZlo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D7ACC2BD01;
	Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804737;
	bh=CKnadc+7pWXJlgz4J8xzzvddy/Ve8PJlE6DTq8avhuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pg9LUZlohuQ3KwhtKtfYnhOTWDqL0C9cHdWVObXskUDJonNpsGphwSFI9DV96SVma
	 mi/zgru98Z674Ak08rySE6ghTLnOvbDdtrfoFObjwe7bX9U0aNEwrVLtwpy9W8InxS
	 eEtjnSCOoct3xMdJr/mjTILWXeOKsydV5ej5tDySUu04mA64JlUbxfBiDNad2QbqfA
	 S8wqFiB8ounwkKbN/qIDR7ZwporiTWUnlAVq0Ph06J2IcpDryY4k+cXTWXF0Js3nJH
	 lgBh/HFpRO7dLHqbl8y+B/gfqlqcmv0xj1Qj1sWfJq/tNO/O7/cP8bs10ZnZV9x1r0
	 foesTlInjm26w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27046C79FAA;
	Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:20 +0800
Subject: [PATCH v4 16/17] mm/huge_memory: count only swap cache refs in
 anon folio split
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-16-b532a3f20e71@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=4303;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=x2XvuBUmjQ9RNkNardz/nbyUAIqiAzW7DbxwXCBxFbw=;
 b=0Gsh+74RbR9mPQw8kiFGdkSNC+du48fBuP6BSEuvvogqBLljdob48chw7eBIYhZ2o7By15fSR
 +JdLUcoRtWQBC2dRnrWTaaESvHKWcD1NTESkgxQ6SsuNAZdHCnkXlus
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

Only __folio_freeze_split_anon() sees anon folios and swap cache folios
now. The file split helper only handles page cache folios, which hold
exactly folio_nr_pages() references.

Rename folio_cache_ref_count() to folio_swapcache_ref_count() and drop
the anon check so the helper counts what its name says. The file split
helper now uses folio_nr_pages() directly.

No feature change.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f2862556d715..661b1c747c33 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3989,10 +3989,10 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
 	return 0;
 }
 
-/* Number of folio references from the pagecache or the swapcache. */
-static unsigned int folio_cache_ref_count(const struct folio *folio)
+/* Number of folio references from the swapcache. */
+static unsigned int folio_swapcache_ref_count(const struct folio *folio)
 {
-	if (folio_test_anon(folio) && !folio_test_swapcache(folio))
+	if (!folio_test_swapcache(folio))
 		return 0;
 	return folio_nr_pages(folio);
 }
@@ -4034,7 +4034,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 
 	local_irq_disable();
 
-	if (!folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
+	if (!folio_ref_freeze(folio, folio_swapcache_ref_count(folio) + 1)) {
 		ret = -EAGAIN;
 		goto out_no_split;
 	}
@@ -4075,7 +4075,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 		next = folio_next(new_folio);
 		zone_device_private_split_cb(folio, new_folio);
 		folio_ref_unfreeze(new_folio,
-				   folio_cache_ref_count(new_folio) + 1);
+				   folio_swapcache_ref_count(new_folio) + 1);
 		if (do_lru)
 			lru_add_split_folio(folio, new_folio, lruvec, list);
 		if (ci)
@@ -4083,7 +4083,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	}
 
 	zone_device_private_split_cb(folio, NULL);
-	folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
+	folio_ref_unfreeze(folio, folio_swapcache_ref_count(folio) + 1);
 
 	if (do_lru)
 		lruvec_unlock(lruvec);
@@ -4112,6 +4112,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
+	long old_nr_pages = folio_nr_pages(folio);
 	struct mem_cgroup *memcg, *old_memcg;
 	struct folio *new_folio, *next;
 	int nr_shmem_dropped = 0;
@@ -4182,22 +4183,16 @@ static int __folio_freeze_split_file(struct folio *folio,
 		goto fail;
 	}
 
-	if (!folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
+	if (!folio_ref_freeze(folio, old_nr_pages + 1)) {
 		ret = -EAGAIN;
 		goto fail;
 	}
 
-	if (folio_test_pmd_mappable(folio) &&
-	    new_order < HPAGE_PMD_ORDER) {
-		int nr = folio_nr_pages(folio);
-
-		if (folio_test_swapbacked(folio)) {
-			lruvec_stat_mod_folio(folio,
-					      NR_SHMEM_THPS, -nr);
-		} else {
-			lruvec_stat_mod_folio(folio,
-					      NR_FILE_THPS, -nr);
-		}
+	if (folio_test_pmd_mappable(folio) && new_order < HPAGE_PMD_ORDER) {
+		if (folio_test_swapbacked(folio))
+			lruvec_stat_mod_folio(folio, NR_SHMEM_THPS, -old_nr_pages);
+		else
+			lruvec_stat_mod_folio(folio, NR_FILE_THPS, -old_nr_pages);
 	}
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
@@ -4221,7 +4216,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 		next = folio_next(new_folio);
 
 		folio_ref_unfreeze(new_folio,
-				   folio_cache_ref_count(new_folio) + 1);
+				   folio_nr_pages(new_folio) + 1);
 
 		lru_add_split_folio(folio, new_folio, lruvec, list);
 
@@ -4248,7 +4243,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 * Otherwise, a parallel folio_try_get() can grab @folio
 	 * and its caller can see stale page cache entries.
 	 */
-	folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
+	folio_ref_unfreeze(folio, folio_nr_pages(folio) + 1);
 	lruvec_unlock(lruvec);
 fail:
 	/*

-- 
2.55.0


