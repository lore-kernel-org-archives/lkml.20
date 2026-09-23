Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DDB47728E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199164; cv=none; b=eUwvwoh3pLW2MKu0OVMusY2A1Kvl2ifworvnL0SHC1iabZKNN1am6PeOo3yjyavUELOBaLK8PXslObRrahzs9u7gGiDJ4Xrplgnuaw8QDamBXq2vgEEmiZzIFxyMvyuEb6jDLPUnYCi6V8xTxrx1yIpaDt7EOZNNqafrFSewHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199164; c=relaxed/simple;
	bh=sOp8u6+5I5kr8seW5fU3M5ogXFq82vrw4VOqm9lx8z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlmXloP2UReyWv2MtEo9pGXoe7+Q4099vXYvYUHVbzHQUy8d5+HrzSK2jRM/xTHWhX6FF/v7xav9d6+UqZjCXDOnyG93GJr0EgTA1zf5/KOoPrQU9SDTX3G1d3l3vLa1jOdogZo478FWZL6x9b9aD7gtQG4/uUeCp7153UdrjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9Y8ZvQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9Y8ZvQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09362C2BCB8;
	Wed, 23 Sep 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790199164;
	bh=sOp8u6+5I5kr8seW5fU3M5ogXFq82vrw4VOqm9lx8z0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U9Y8ZvQ3t8OG3KjhwXTUtRrGU1BzTZNinBYYaxRN14jp88gBZArAUQUavuUKo9WMx
	 oJOFNChjLUsyzXhp9X+J1lwsMq5RyKBzcEkxF1NUMYFtzPNNBavbB9fZf98sKTGtDx
	 quTZW7p+WIVhDkxZ6Pmr+kX9kSc6ufChnRCEhkQbr9jhnPFnhSgMU/HH5s/zrltIRh
	 KleDfi5yd11JLF5Z+Laphc3f54S0viePX9PTApED2TZpWgJZgex3gZLxIZ9qZdEbtw
	 OHGznJZE61MncNjUTP/c0xwdqbTSvmk/wsQHnb3Eu85QC+6R4TGAeg+tSbWgHaEAEU
	 XAHkc0qyYwgvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E31C98313;
	Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 23 Sep 2026 23:32:45 +0200
Subject: [PATCH v6 14/17] mm/huge_memory: drop the unused do_lru argument
 of the file split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-swap-thp-cleanup-v6-14-ba1b4ba72c6f@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790199160; l=2467;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=xmffsm1SQoen6wnNoHnLCjDOebcsOHMJxuynkP1cNFQ=;
 b=BWZ2N3ClOOOgEbeQScIyuu2ZTz7UVZMZ8G6SWaNqCCOoFcNJmQX5pBttoyawp/k/M9HGCp/vi
 jNP0aNEeJsqB6/OPrJVBTzDozEblsDSMu5XdCvGraqT2eWMQjfnj20a
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
index 8d43ee243b27..86583bf1b148 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4136,8 +4136,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 
 static int __folio_freeze_split_file(struct folio *folio,
 		unsigned int new_order, struct page *split_at,
-		bool do_lru, struct list_head *list,
-		enum split_type split_type)
+		struct list_head *list, enum split_type split_type)
 {
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
@@ -4231,9 +4230,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	}
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
-	if (do_lru)
-		lruvec = folio_lruvec_lock(folio);
-
+	lruvec = folio_lruvec_lock(folio);
 	ret = __split_frozen_folio(folio, new_order, split_at, &xas,
 				   mapping, split_type);
 
@@ -4255,8 +4252,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 		folio_ref_unfreeze(new_folio,
 				   folio_cache_ref_count(new_folio) + 1);
 
-		if (do_lru)
-			lru_add_split_folio(folio, new_folio, lruvec, list);
+		lru_add_split_folio(folio, new_folio, lruvec, list);
 
 		/* Add the new folio to the page cache. */
 		if (new_folio->index < end) {
@@ -4282,9 +4278,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 	 * and its caller can see stale page cache entries.
 	 */
 	folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
-
-	if (do_lru)
-		lruvec_unlock(lruvec);
+	lruvec_unlock(lruvec);
 fail:
 	xas_unlock_irq(&xas);
 fail_mmap_unlock:
@@ -4360,7 +4354,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 						true, list, split_type);
 	else
 		ret = __folio_freeze_split_file(folio, new_order, split_at,
-						true, list, split_type);
+						list, split_type);
 
 	/*
 	 * Unlock all after-split folios except the one containing

-- 
2.55.0


