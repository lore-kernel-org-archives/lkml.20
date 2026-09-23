Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36644766B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199164; cv=none; b=R9sC7pAB5GDCCNnaE2OMsE42KFrnMRCCTab4Ojh4UjsbyHpLhYMDtPNSwG9PN8+kLWLBFwMn25kOJEi/IRaT5tfc3djL8wk34SogTboOFgsXSP4vNf5Yq7qj4a1idNn74cWcl69zAAdDMMe7zCBG6P+c1X4dluxkBvuB6/sB+Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199164; c=relaxed/simple;
	bh=G6lzysDx7CRWXFJdUsrK5RErF2sIGfTamezuD6h7XWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvU7hopbncC5I2Jq7rVrWR4hB+qzB8TRBM/MqKzMo8w/dRv/XPAiZlxZyEbmtH0OUkBLEBBwubO5m56SM7NPbg+2btvnYtzip4Zjyy5KKt5Tx/VROD5HdHgGkkkX2A+QPN8OIe3ZAL9CIm4ebXBi3yGvgmC+RFcIq8fDo1MogG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4RrsQ8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4RrsQ8w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F31C2BCFA;
	Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790199163;
	bh=G6lzysDx7CRWXFJdUsrK5RErF2sIGfTamezuD6h7XWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L4RrsQ8wCChdTjex3TrlsGudelzPqwIV3UjNqe+KE9EP1qMjvdkb9j8ybccP5VMCe
	 GW1Dq3/7j+stFXqG+2rX6D/5l+R5AqCOLSRwCnY1M9xEv9fnAtGDya6HhnjJbT234c
	 SRIc2YS44WmrrEWveozkHCD8TDRv7kixxBKQ4zH58/q4Mlary/DuzQNpSOhS3+etXw
	 7vitEDUpJGbRQotXu6f2TNt4ig5oOMKFVUbKqn328Fu0gr9/GUCuC87HqGg7zOguDD
	 5PlDEzXTRr5CQJ90ZsyZLsnpD23Ks4Rb2f9zHCmKyprw0hjjyFS97wnoiIrhfr7ZRR
	 TFwnjc51LpxiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDEC98312;
	Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 23 Sep 2026 23:32:43 +0200
Subject: [PATCH v6 12/17] mm/huge_memory: move anon_vma handling into the
 anon split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-swap-thp-cleanup-v6-12-ba1b4ba72c6f@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790199160; l=5852;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=LJ+5qeAIckMWthAZegpdl6LRllp3JqAkUk0Cnq/gqes=;
 b=qnfjZNR9a2xlXxe0wVn/8SYFjU6JKiNDw8GL2w4GPXE6B/0t3thsDsK7G474P2HAB1uwXJDJl
 3bonPrBDXeWDMvoWV+UDBd9CwDxKjoLK8i4C9TU39HmFZDct4GVCDVV
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

Only anon split needs the anon_vma, and it only needs it to unmap and
remap.  Move the folio_get_anon_vma()/anon_vma_lock_write() pair out of
__folio_split() into the anon helper next to the folio_mapped()
check that already gates unmap_folio().

This makes the anon_vma conditional on folio_mapped(), which is a
behaviour change but should be fine.  folio_get_anon_vma() returns
NULL whenever !folio_mapped(), so an anon folio with
folio_mapcount() == 0 used to get -EBUSY from split_huge_page() and is
now split instead.  A realistic case is a THP that has been fully
swapped out and is still in the swap cache: swap PTEs do not contribute
mapcount, so it is !folio_mapped() but still alive.

That should be safe and right to have because:

- folio_ref_freeze() below still rejects a folio that picked up any
  reference, a mapping or a GUP pin, in the meantime.

- A parallel split is excluded by the folio lock.  The anon_vma
  write lock was added to serialize split in commit 062f1af2170a
  ("mm: thp: acquire the anon_vma rwsem for write during split"), when
  split_huge_page() did not hold the folio lock throughout. commit
  e9b61f19858a ("thp: reintroduce split_huge_page()") later made the
  folio lock a caller requirement and added the folio_ref_freeze()
  scheme, so that has been covered ever since.

- Unmapped path is already exercised by folio_split_unmapped(),
  and the swap cache split already runs well for a partially
  swapped-out mapped THP.

- A !folio_mapped() folio cannot become mapped meanwhile: mapping it
  requires the folio lock.

For mapped folios the anon_vma write lock is now released before
__folio_split() unlocks the after-split sub-folios, where previously it
was held across that loop; that window is harmless as the sub-folios
stay folio-locked and referenced until it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 57 +++++++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 24073f75e87b..62e2879cd3b4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4032,16 +4032,37 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	struct swap_cluster_info *ci = NULL;
 	const int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
+	struct anon_vma *anon_vma = NULL;
 	enum ttu_flags ttu_flags = 0;
 	struct lruvec *lruvec;
-	bool need_remap = false;
 	int ret = 0;
 
+	/*
+	 * Unmap/remap needs the anon_vma, so we first take a reference on
+	 * it to prevent it from disappearing, and lock it for write here,
+	 * letting unmap_folio() walk the rmap with TTU_RMAP_LOCKED.
+	 *
+	 * folio_mapped() is not stable here, but it can only change in
+	 * one direction while the folio is locked. The mapcount can drop
+	 * to zero at any time, zap_pte_range() takes no folio lock. It
+	 * cannot go up: swapin, migration and uffd move all lock the folio
+	 * before mapping it, and fork only copies PTEs that already exist.
+	 *
+	 * So if we see the folio mapped, the worst case is an empty rmap
+	 * walk. If we see it unmapped, it stays unmapped and needs neither
+	 * the reference nor the lock. Anything else needs a reference
+	 * first and folio_ref_freeze() below catches it.
+	 *
+	 * Note that entirely swapped-out THPs are unmapped but can be split.
+	 */
 	if (folio_mapped(folio)) {
-		need_remap = true;
+		anon_vma = folio_get_anon_vma(folio);
+		if (!anon_vma)
+			return -EBUSY;
+		anon_vma_lock_write(anon_vma);
 		ret = unmap_folio(folio);
 		if (ret)
-			return ret;
+			goto out_unlock;
 	}
 
 	local_irq_disable();
@@ -4099,11 +4120,16 @@ static int __folio_freeze_split_anon(struct folio *folio,
 		swap_cluster_unlock(ci);
 out_no_split:
 	local_irq_enable();
-	if (need_remap) {
+	if (anon_vma) {
 		if (!ret && !folio_is_device_private(folio))
 			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
 		remap_anon_folio(folio, 1 << old_order, ttu_flags);
 	}
+out_unlock:
+	if (anon_vma) {
+		anon_vma_unlock_write(anon_vma);
+		put_anon_vma(anon_vma);
+	}
 
 	return ret;
 }
@@ -4294,7 +4320,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	struct folio *end_folio = folio_next(folio);
 	bool is_anon = folio_test_anon(folio);
 	struct mem_cgroup *memcg, *old_memcg;
-	struct anon_vma *anon_vma = NULL;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
 	int ret;
@@ -4325,23 +4350,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	memcg = get_mem_cgroup_from_folio(folio);
 	old_memcg = set_active_memcg(memcg);
 
-	if (is_anon) {
-		/*
-		 * The caller does not necessarily hold an mmap_lock that would
-		 * prevent the anon_vma disappearing so we first we take a
-		 * reference to it and then lock the anon_vma for write. This
-		 * is similar to folio_lock_anon_vma_read except the write lock
-		 * is taken to serialise against parallel split or collapse
-		 * operations.
-		 */
-		anon_vma = folio_get_anon_vma(folio);
-		if (!anon_vma) {
-			ret = -EBUSY;
-			goto out;
-		}
-		anon_vma_lock_write(anon_vma);
-	}
-
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
@@ -4368,11 +4376,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		free_folio_and_swap_cache(new_folio);
 	}
 
-	if (anon_vma) {
-		anon_vma_unlock_write(anon_vma);
-		put_anon_vma(anon_vma);
-	}
-out:
 	/* restore to caller's old_memcg */
 	set_active_memcg(old_memcg);
 	mem_cgroup_put(memcg);

-- 
2.55.0


