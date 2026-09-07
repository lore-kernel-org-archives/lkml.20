Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C15521222
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804737; cv=none; b=RI1imcEqUsSh5DXUaV2gHqof/0q9wWacG3Zu7Vn+MbaihRc4N9NhmWUJcBpfTT8LFi1DeSVQHP4UpTXZTpWndmoNG3p1fpOuQO0BfwKPL7JYKJ+scN+hscrnhMfmbtlNYcOSAY1fR4gWJYn3SMQrwqS/MLOoTW7Fzbp3cD86OZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804737; c=relaxed/simple;
	bh=0nJtL0HsBIYjbUStq8DzcAyHgpyDmq6mW315bcuSuCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGf8OaFvJcGuZH9Thj2OdjTniFyycJ2BJNtL6sDom4pGoMHfS6+BW7PPnUITG+dCuhEicKs413s09Uqec5/NQ4qTJzcn6k+yEPfd5o3W+uekntAki0TbW6R/Fb+ZqveFqJaeWFX4GEwIdreKyjYhCR2lMZWgZPE5bbhb2Hzl79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8ii1J5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8ii1J5/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BFACC32781;
	Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804737;
	bh=0nJtL0HsBIYjbUStq8DzcAyHgpyDmq6mW315bcuSuCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B8ii1J5/fJ+qtUENkB7cyl/EiK9fgmt22pky/q4HHuldn+iOimziFLHfOPDcKlwIl
	 Cr+6x5EA73NIUdHWnYBnhszVurFiFj+PyiIMVF9gE2Dwjs/FTyJuz7sIgv9Sfs4bk1
	 CO0p/QeIphf06vEVn64Dm1sqEOZMiQX80zDH4MVWBfyZs0C1L6ee63YaRuWT757alx
	 Ofh8/ksBbRd0Sv9sv5tHcgUWM7c628N78n8yBa2/FQ0yvQLoP0qAJ8sAG+WeZjprkM
	 T1rqcHT1StrPl6+GacTOMzpR4iX+SH+epn2h+AAWKd66CuDSu/9kWJeCENgr/iD2iZ
	 NSXL5g/Uw6yDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42527C79FA0;
	Mon,  7 Sep 2026 18:12:17 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:21 +0800
Subject: [PATCH v4 17/17] mm/huge_memory: drop the redundant mapping
 argument of __split_frozen_folio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-17-b532a3f20e71@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=2734;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=vXuKEkPerU0mVuyMXFabT1MLxtzu5nqSMfp99jol81c=;
 b=3aA2jvBV2hPX09DX5zvAVmx/EHcJ3O6BlLizYXiIsnWUZ+jlp7qpv7EedEDJW5NntP7knvECk
 8I+n6jWz3rkDRLxVROakXQpH3rAis/tqHiQvJPb9ETi64L45JeNJre8
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
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 661b1c747c33..c98756bcc5ec 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3825,7 +3825,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
  * @split_at: in buddy allocator like split, the folio containing @split_at
  *            will be split until its order becomes @new_order.
  * @xas: xa_state pointing to folio->mapping->i_pages and locked by caller
- * @mapping: @folio->mapping
  * @split_type: if the split is uniform or not (buddy allocator like split)
  *
  *
@@ -3858,7 +3857,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
  */
 static int __split_frozen_folio(struct folio *folio, int new_order,
 		struct page *split_at, struct xa_state *xas,
-		struct address_space *mapping, enum split_type split_type)
+		enum split_type split_type)
 {
 	const bool is_anon = folio_test_anon(folio);
 	int old_order = folio_order(folio);
@@ -3882,7 +3881,7 @@ static int __split_frozen_folio(struct folio *folio, int new_order,
 		if (is_anon && split_order == 1)
 			continue;
 
-		if (mapping) {
+		if (xas) {
 			/*
 			 * uniform split has xas_split_alloc() called before
 			 * irq is disabled to allocate enough memory, whereas
@@ -4060,8 +4059,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	if (do_lru)
 		lruvec = folio_lruvec_lock(folio);
 
-	ret = __split_frozen_folio(folio, new_order, split_at, NULL,
-				   NULL, split_type);
+	ret = __split_frozen_folio(folio, new_order, split_at, NULL, split_type);
 
 	/*
 	 * Unfreeze the after-split folios and put them back to the right
@@ -4197,8 +4195,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
 	lruvec = folio_lruvec_lock(folio);
-	ret = __split_frozen_folio(folio, new_order, split_at, &xas,
-				   mapping, split_type);
+	ret = __split_frozen_folio(folio, new_order, split_at, &xas, split_type);
 
 	/*
 	 * Unfreeze after-split folios and put them back to the right

-- 
2.55.0


