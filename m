Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39644746A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199163; cv=none; b=l+pTglRfBSeySnRovqVrx9UnF3njq9mzZ8itJAH4+E8We/N+NYU/ske2Pi1hzEs8W4wcjMdp3KYlMS2HwHgwXVJWikLEv+FqeoBegq64i9hMjpDLDmMq7qM0hgp2EFpbjpx+dLkS+VZ7tvwVtLlktnm7zdeOXBbJksAXpdqmLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199163; c=relaxed/simple;
	bh=cBInc2Y150gnR9QShVRFXkTGJvi1jKLY1kMb8gVdedk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGCsMwh2nuci+TRZhm10Lnqv11oA6Xdli0jSAb7rWF/gLZUi0tCwkFPXc7Hveqq1Ru7jW31CcsoG/tbYHnLa/QWAqvMGZ7arjryFZy0HQJ4YzeU5JahYVjhewD3IADx0LnqsSSocDzbqZtxMX8bcM5iJ5AhxQdWKhanIVT+81PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXhznrxP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXhznrxP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79EB7C2BCFF;
	Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790199163;
	bh=cBInc2Y150gnR9QShVRFXkTGJvi1jKLY1kMb8gVdedk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZXhznrxPcf2EstKnav+Pa3DT7m31Go+xL3r5SL3BQBI4zv27ActRYMFiHs0dNP3cZ
	 xfj2BtdiwGLa/ppCC/SRKujeCXImEXws+q8CRtAQsO4PWmcTI+PJcB0huqugQ5nu+t
	 xkwzZU0mFjb0NXumMxDItUfq52YnPJnItGYmPXRDce7hk/eV6Nv34IxMpp9rN6c4c7
	 E81F1kHF/JQPffVdRMmVWMdhI9HNjk9Zp4cSOuD3Gmyb43DinchPrCyNzDL9Lx6YJh
	 xF6Nti8agQnvRzAr8lDwdvfFfXI1uVHdX8ZTAuIwO3g433FDUL+PROlGTw4dL/xpr9
	 vQPL3CplyeXzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D5CC98312;
	Wed, 23 Sep 2026 21:32:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 23 Sep 2026 23:32:39 +0200
Subject: [PATCH v6 08/17] mm/huge_memory: move unmap and remap into the
 split helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-swap-thp-cleanup-v6-8-ba1b4ba72c6f@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790199160; l=3700;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=bG37iOhPck6tDgOBAYXQonkZfp1LV5/lDeTBdSogHrU=;
 b=8K1WXT22OIwKUAR2XaU3sTnYjG39/waxHTBKElGxAkw++akKW5L/02mUG2pKRHVLdsftyZjOA
 cog7IfhNcd+DQDhBoo/MyGV4KGyGgowBxJoahQDy6No6z8kLowN2raZ
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

To prepare for further cleanup, move the unmap/remap handling from
__folio_split() into the split helpers.  Only anon folios need to
be remapped, so remap_page() is now only called for anon splits and
the anon check in remap_page() is redundant and can be removed.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 625e7987ff40..7ee9eb2e1e93 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3640,9 +3640,6 @@ static void remap_page(struct folio *folio, unsigned long nr, int flags)
 {
 	int i = 0;
 
-	/* If unmap_folio() uses try_to_migrate() on file, remove this check */
-	if (!folio_test_anon(folio))
-		return;
 	for (;;) {
 		remove_migration_ptes(folio, folio, TTU_RMAP_LOCKED | flags);
 		i += folio_nr_pages(folio);
@@ -4016,15 +4013,23 @@ static int __folio_freeze_split_anon(struct folio *folio,
 {
 	struct folio *end_folio = folio_next(folio);
 	struct swap_cluster_info *ci = NULL;
+	const int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
+	enum ttu_flags ttu_flags = 0;
 	struct lruvec *lruvec;
+	bool need_remap = false;
 	int ret = 0;
 
+	if (folio_mapped(folio)) {
+		need_remap = true;
+		unmap_folio(folio);
+	}
+
 	local_irq_disable();
 
 	if (!folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
-		local_irq_enable();
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto out_no_split;
 	}
 
 	/* Take off the deferred split queue while frozen and memcg set */
@@ -4073,7 +4078,13 @@ static int __folio_freeze_split_anon(struct folio *folio,
 		lruvec_unlock(lruvec);
 	if (ci)
 		swap_cluster_unlock(ci);
+out_no_split:
 	local_irq_enable();
+	if (need_remap) {
+		if (!ret && !folio_is_device_private(folio))
+			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
+		remap_page(folio, 1 << old_order, ttu_flags);
+	}
 
 	return ret;
 }
@@ -4105,6 +4116,8 @@ static int __folio_freeze_split_file(struct folio *folio,
 	if (shmem_mapping(mapping))
 		end = shmem_fallocend(mapping->host, end);
 
+	unmap_folio(folio);
+
 	xas_lock_irq(xas);
 
 	/*
@@ -4189,7 +4202,6 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 	if (do_lru)
 		lruvec_unlock(lruvec);
-
 fail:
 	xas_unlock_irq(xas);
 	if (nr_shmem_dropped)
@@ -4230,7 +4242,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	struct anon_vma *anon_vma = NULL;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
-	enum ttu_flags ttu_flags = 0;
 	int ret;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
@@ -4318,8 +4329,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	unmap_folio(folio);
-
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
@@ -4327,11 +4336,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		ret = __folio_freeze_split_file(folio, new_order, split_at, &xas, mapping,
 						true, list, split_type);
 
-	if (!ret && is_anon && !folio_is_device_private(folio))
-		ttu_flags = TTU_USE_SHARED_ZEROPAGE;
-
-	remap_page(folio, 1 << old_order, ttu_flags);
-
 	/*
 	 * Drop the mapping while the inode is still pinned. @folio stays
 	 * locked and present in the page cache until the loop below, so

-- 
2.55.0


