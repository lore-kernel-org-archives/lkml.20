Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E58496D25
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406154; cv=none; b=pyN8eeR2v2o9wuGLH5bKxXzANQSONWGdorO0sHwJzGvG6dX/ZmP5oD/mNd9CG94U02OrxjChsT4Ex9VmYwnW9HOzphZSw9jq0VJn2Z1ZXFyn7xKcN8LsYuh/NkXQGhEeOHRgaIk/WKhb+fHS4W5G20Ask9kFVbZ7nMZ+QvVNr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406154; c=relaxed/simple;
	bh=DcJOrA+hy4AdWGH1eeNmetKcf0DNfdUW2VhTqnlEoAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGvwN28O/xd0SSWOB+OuOMXFwXdw/g7GXkXl8aCSd+V5ycYex8oXIL2Y7HCfkCorfY5PXbi/O2Qi/p0KdATukcHjyfGF55cnzBVcXyv2dI1pJLEY4GlAZc/hq7cpdEFrymTwp6VzxDyX2oN6Y7IMCGG+6o31U5n+ZEkPYWGU6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ed7ob6Bd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ed7ob6Bd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4558FC2BCFA;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789406154;
	bh=DcJOrA+hy4AdWGH1eeNmetKcf0DNfdUW2VhTqnlEoAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ed7ob6BdrjtG37mDev4F19RRa2aPP/yEYcOoqVcUtJFXct6gd/F9OgEOA4GtBjruu
	 RTTXyGCSQpmzCPTTyoF3zk58iiA5IgvFq4gJR2MjTjon9nW85Ro8QfSR945EgoVCLr
	 f6koUwzwNabGoj/8uucvuHcV8KqTiuZ+pAbwBZOg6bScPBlltTHkC5dDn7M8vfzDGv
	 /4Ar+DvC4SzzYKnhTIHwmT9gq/mxKMH07ro8udr+CqgmriK9yu1nEiQ1ldtLs+xRbT
	 j8NycgUs9CxHlq744VdLReq4jMvqa/+qC+YKTRiLmIOm3sC8jmaikHDUARj3u6IGlJ
	 cTniMJRPJe9Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B0BC88E79;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 15 Sep 2026 01:14:50 +0800
Subject: [PATCH v5 09/17] mm/huge_memory: rename remap_page() to
 remap_anon_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406149; l=3127;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=ExS3iXqpo6EWOs0c9NJj+fgN8aW+sshu/TIwyTi4/5Q=;
 b=Y9+nNMHYhV9nhxAXbvADVASdUNcBZtc1OtdH8YWUKSGPhLNd8GhGs8EA+UdTwNypv2ZjEdP5e
 kG/KWg5Q5svCci6svRnAHXzSF2FUH7jMNCkRnQrjceueAUdlJWjA0yO
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

remap_page() now only has one caller, __folio_freeze_split_anon(),
and is only ever called for anon folios: unmap_folio() currently
leaves file folios unmapped after the split, so they need no
remapping.

Rename it to remap_anon_folio() to make that explicit, and add a
VM_WARN_ON_FOLIO() documenting it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1749905ade6a..77bf68c9b9af 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3552,7 +3552,7 @@ static void unmap_folio(struct folio *folio)
 	/*
 	 * Anon pages need migration entries to preserve them, but file
 	 * pages can simply be left unmapped, then faulted back on demand.
-	 * If that is ever changed (perhaps for mlock), update remap_page().
+	 * If that is ever changed (perhaps for mlock), update remap_anon_folio().
 	 */
 	if (folio_test_anon(folio))
 		try_to_migrate(folio, ttu_flags);
@@ -3637,10 +3637,17 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
 }
 
-static void remap_page(struct folio *folio, unsigned long nr, int flags)
+static void remap_anon_folio(struct folio *folio, unsigned long nr, int flags)
 {
 	int i = 0;
 
+	/*
+	 * unmap_folio() installs migration entries only for anon folios,
+	 * so currently only anon folios need to be remapped. File folios
+	 * stay unmapped after the split and are faulted back on demand.
+	 */
+	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+
 	for (;;) {
 		remove_migration_ptes(folio, folio, TTU_RMAP_LOCKED | flags);
 		i += folio_nr_pages(folio);
@@ -3724,7 +3731,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		 *
 		 * Note that for mapped sub-pages of an anonymous THP,
 		 * PG_anon_exclusive has been cleared in unmap_folio() and is stored in
-		 * the migration entry instead from where remap_page() will restore it.
+		 * the migration entry instead from where remap_anon_folio() will restore it.
 		 * We can still have PG_anon_exclusive set on effectively unmapped and
 		 * unreferenced sub-pages of an anonymous THP: we can simply drop
 		 * PG_anon_exclusive (-> PG_mappedtodisk) for these here.
@@ -4084,7 +4091,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	if (need_remap) {
 		if (!ret && !folio_is_device_private(folio))
 			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
-		remap_page(folio, 1 << old_order, ttu_flags);
+		remap_anon_folio(folio, 1 << old_order, ttu_flags);
 	}
 
 	return ret;
@@ -4206,7 +4213,7 @@ static int __folio_freeze_split_file(struct folio *folio,
 fail:
 	/*
 	 * If we want to use try_to_migrate() on file in unmap_folio,
-	 * remember to add remap_page() and adapt it.
+	 * remember to add remap_anon_folio() and adapt it.
 	 */
 	xas_unlock_irq(xas);
 	if (nr_shmem_dropped)

-- 
2.55.0


