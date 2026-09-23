Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB847887E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199164; cv=none; b=NjiA9/JHbx+MPAvaQsTQNJTis5MffMXXWcoRsxH1NcZC8iQAczN3955CxZClexek3Q3vXmI+goPRrlPrgFms5WKRyQU1iA8NQNNFfuIP14J30GmuO6yU5+bZOQD+xqmNTHasNdUbc0qxHdzS89elYdTrnPCaxvmNDGMGRTP+qZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199164; c=relaxed/simple;
	bh=VCcgX9Zt0Ud9YgxqYFqd3Iy4Vbv14vrCAHPv6HfCCTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdxJTjOpqigx9gcw+cMV0IJaaUEW2F1bhreic08CuhzMO1pYQRaoAA5b2r06+sx8vf0Biwn8HiSmnq+KAW3rM/63eomgp2FOQy0nSyvZqX+A8hPIprN9BS2rGW2Nzwf2wJIWbdyRYFiwKOpTfQpC2hHhW0HokqDTuETO1WBKA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxAeVBrR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxAeVBrR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 686D5C2BCF5;
	Wed, 23 Sep 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790199164;
	bh=VCcgX9Zt0Ud9YgxqYFqd3Iy4Vbv14vrCAHPv6HfCCTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YxAeVBrRanLAGfXVedme9BHiS2iAavj3ObSVBg6J8RXgs4wOE5zNKgxlGhbYEZNLW
	 j0rfVwXgZGSZlqoFJuKG/YA6nm8wi2Xs95muRvOZ4d3zCH8wFoUZHZhldMCUws5wEX
	 H1jfzNSwYpqYYTiag7kWS9hhUvtIP8t1imTfmxD+Q6tCrHLIWpcrSHUiYGDJtdFHQJ
	 hFbDbYNPxNJAuXgvdiBl73oK/1eeyEg6eT5ZxEVrSOL93VhwbheqUIEVPqjw0g6y7u
	 6YGDOIG88dS9BFbgqMZgVUil1tNE6cg1GZBfYvtmJf1LxmvOJZd50TOHp3uVJBI3GZ
	 m7C71j20OD6Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52973C9830D;
	Wed, 23 Sep 2026 21:32:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 23 Sep 2026 23:32:48 +0200
Subject: [PATCH v6 17/17] mm/huge_memory: drop the redundant mapping
 argument of __split_frozen_folio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-swap-thp-cleanup-v6-17-ba1b4ba72c6f@tencent.com>
References: <20260923-swap-thp-cleanup-v6-0-ba1b4ba72c6f@tencent.com>
In-Reply-To: <20260923-swap-thp-cleanup-v6-0-ba1b4ba72c6f@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790199160; l=2842;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=oJuA6piE3d7PEesJP/+7GrdrNMc/XlosPlQGEaGrc3Y=;
 b=qsTJuWfxYYH4Yerg2qYGzB6xSXXLGUpTM1l3XsXyLjIutCI2Os1FniHyi8KQqPuloo8hkH7zF
 4bHfDxkVElLCEJtHufe36HFJzFEk2gsuIO21CqpgJmP7yRZRyk7wCmT
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

The mapping parameter only served as a non-NULL check to detect
whether page cache entries need updating.  The xa_state pointer
conveys exactly the same information: the anon split helper passes
NULL and the file split helper passes &xas, which is non-NULL iff
the folio is in the page cache.

Use the xas pointer instead and drop the parameter, along with its
kerneldoc entry.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d31c1d3d1f8e..16b142de5008 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3833,7 +3833,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
  * @split_at: in buddy allocator like split, the folio containing @split_at
  *            will be split until its order becomes @new_order.
  * @xas: xa_state pointing to folio->mapping->i_pages and locked by caller
- * @mapping: @folio->mapping
  * @split_type: if the split is uniform or not (buddy allocator like split)
  *
  *
@@ -3866,7 +3865,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
  */
 static int __split_frozen_folio(struct folio *folio, int new_order,
 		struct page *split_at, struct xa_state *xas,
-		struct address_space *mapping, enum split_type split_type)
+		enum split_type split_type)
 {
 	const bool is_anon = folio_test_anon(folio);
 	int old_order = folio_order(folio);
@@ -3890,7 +3889,7 @@ static int __split_frozen_folio(struct folio *folio, int new_order,
 		if (is_anon && split_order == 1)
 			continue;
 
-		if (mapping) {
+		if (xas) {
 			/*
 			 * uniform split has xas_split_alloc() called before
 			 * irq is disabled to allocate enough memory, whereas
@@ -4089,8 +4088,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	if (do_lru)
 		lruvec = folio_lruvec_lock(folio);
 
-	ret = __split_frozen_folio(folio, new_order, split_at, NULL,
-				   NULL, split_type);
+	ret = __split_frozen_folio(folio, new_order, split_at, NULL, split_type);
 
 	/*
 	 * Unfreeze the after-split folios and put them back to the right
@@ -4226,8 +4224,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
 	lruvec = folio_lruvec_lock(folio);
-	ret = __split_frozen_folio(folio, new_order, split_at, &xas,
-				   mapping, split_type);
+	ret = __split_frozen_folio(folio, new_order, split_at, &xas, split_type);
 
 	/*
 	 * Unfreeze after-split folios and put them back to the right

-- 
2.55.0


