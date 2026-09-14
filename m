Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EB8497B68
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406155; cv=none; b=S+P+cxjQcE1nhHuNNw6Pkknd0Y4Llee+1UdCQrJVUY1zBsTDcN93V0EeExLiDtQNcOqJXIAgsMBP7/lqZ8lxiYsHTJwSF64+1xCZPXHoWsFET9iHEV3ldKwgf85KyuqJH3b6Ed8YY1L/w1TNInfeKsiHToCBO4Lru10SWvhz6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406155; c=relaxed/simple;
	bh=TThUiSzv0IeiGg3Zm+rPoMl7tKqpff6Xjqe3H1+p5es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtVGaVpdVWyANfEj9KND2Z+cqef4uc1UJKV6pG3YaY858hDMRQxDJE/1iLBRY1840DZ+LfDoAyJicsegCPJ8rq1NZQE1gYHSfa7TWslUg3I+WAA4YftEOpgju1Y0V0CYrTlF+re4tV2RXDDWec01l0zBnv35dqHvUnc8KySEWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjDeKl8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjDeKl8y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB7E0C2BCFA;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789406154;
	bh=TThUiSzv0IeiGg3Zm+rPoMl7tKqpff6Xjqe3H1+p5es=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjDeKl8yMLVTIdXAyHBkwlQjVv9zIGksMNFtdT8NaxO4V6eJKlW2fMVjubAU/U8Ka
	 CI2NhegFvkjBQP+Z0Ri2/Dcnw2cp8MBUS7TXxzBueHY72hm/MO9LEyubZQ0djEvYNq
	 UxSdXqML2scEI+ArkErU7e9lPQaYMOa5GM9n802SvyREFca+Ul+etRj8TJ1LwnXR+A
	 co8hZ8CJ/knh+ZEAXssC5eNSuWonfkylg8G4eDLmLMWH6jjrD8NO9ZIjOuY2jkLdFl
	 fVsFof/2zDdNsEFQH5x+tdO3hGZYzbasqv69SuxGwPImO9kxPTZ7RwIaIIsWphHelc
	 mSQf378SVeJbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5444C88E6F;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 15 Sep 2026 01:14:55 +0800
Subject: [PATCH v5 14/17] mm/huge_memory: drop the unused do_lru argument
 of the file split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-swap-thp-cleanup-v5-14-39878b37dfb0@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406149; l=2493;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=m/gjZObWp8hCab6M96EKaw8DHAEZ6xi7L6smiR7GbzY=;
 b=rnXVgY74a30UHXc+wyXVoP6EU8ZLn0d/jeMbScPXNNuqGMhKenNKy3TiLHdK9+2njQQvoFhc9
 nEGmzGkbcZZDqomGRYto19YmQIXqwIwaqH18VCglN9jyhtOIWHTo6tD
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

The only caller of __folio_freeze_split_file() always passes do_lru as
true, so the argument and the branches gated on it are dead code.
Drop it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 169832e2a866..b134acfe1542 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4134,8 +4134,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 
 static int __folio_freeze_split_file(struct folio *folio,
 		unsigned int new_order, struct page *split_at,
-		bool do_lru, struct list_head *list,
-		enum split_type split_type)
+		struct list_head *list, enum split_type split_type)
 {
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
@@ -4229,9 +4228,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	}
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
-	if (do_lru)
-		lruvec = folio_lruvec_lock(folio);
-
+	lruvec = folio_lruvec_lock(folio);
 	ret = __split_frozen_folio(folio, new_order, split_at, &xas,
 				   mapping, split_type);
 
@@ -4253,8 +4250,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 		folio_ref_unfreeze(new_folio,
 				   folio_cache_ref_count(new_folio) + 1);
 
-		if (do_lru)
-			lru_add_split_folio(folio, new_folio, lruvec, list);
+		lru_add_split_folio(folio, new_folio, lruvec, list);
 
 		/* Add the new folio to the page cache. */
 		if (new_folio->index < end) {
@@ -4280,9 +4276,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 * and its caller can see stale page cache entries.
 	 */
 	folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
-
-	if (do_lru)
-		lruvec_unlock(lruvec);
+	lruvec_unlock(lruvec);
 fail:
 	/*
 	 * If we want to use try_to_migrate() on file in unmap_folio,
@@ -4362,7 +4356,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 						true, list, split_type);
 	else
 		ret = __folio_freeze_split_file(folio, new_order, split_at,
-						true, list, split_type);
+						list, split_type);
 
 	/*
 	 * Unlock all after-split folios except the one containing

-- 
2.55.0


