Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A805221DE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804736; cv=none; b=EP7uatcp0whegpPfgMpTE9018KhRRVRYSAAGG3hdzHa6g2CtETArehKxn2pp64kQeY12Ft81NLgmVo4L/9JLbZeUvyHLG/8Lu7h/bvSwk5CVOrq2r8pL5x9JQEc2Zh2fFf/0JsbC6S4YwaXdjdfvqA1uJArhjhQSIedJThOYbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804736; c=relaxed/simple;
	bh=gfvvUIk/at6UwTcWzvjabNbGGeRmaBR57SeASlJRRMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJTTkOLW66unckgSZkWtMuSFs+Es4M8h/6sMpEj440zPP/6ePKzXryLoptgoMf1zsfjpic8jifhrAwHl28VLnx4Rg5Iin75hODCCJUnNSE5P9hS3I4iXW9LFwnV2yFPUGf+zg0OU+Yl6P0fbBY/8OwYJTBcm7r0Bonk+84OMwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvVcwGnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvVcwGnK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59D2CC2BCC7;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804736;
	bh=gfvvUIk/at6UwTcWzvjabNbGGeRmaBR57SeASlJRRMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IvVcwGnKAwohWi8jVjvQefQ+/Q6stoBvaLk4rXyFAb9hU6QoxU7FI/5+IWDJtIe48
	 2QjaPMOEZt5FbOJ0E6GVI5vB+Xay3X0okJuEcg0mBvOgCxNmMrdjVgofIaAZawJmob
	 P8gUaJwUIITBFeiUJH/UNDx/3Lp40hO+hRLwjV7fR+J2trRTUyOPWF05p1C/KJJCcg
	 j7u3W0s2SCBD5HoHx0QcbXtNMMm3DCQavULni9S2VPTAWwdQneBqZ/gaW/IXHjcBDT
	 XHjn90qqarJDzH73FPzPWluIyn3BtAYNwUEbNMN48oA0ZDRz7BeGlpaZmbH2tSqzQW
	 dcPw8XqnqhXsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437C6C79F99;
	Mon,  7 Sep 2026 18:12:16 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 08 Sep 2026 02:12:12 +0800
Subject: [PATCH v4 08/17] mm/huge_memory: move unmap and remap into the
 split helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-swap-thp-cleanup-v4-8-b532a3f20e71@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=3718;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=8rla4SJJrgTvzsnT4YVMcceDfbNPfTApzzjzHoKnAbE=;
 b=Z+m1XqtvYJ1c2EZdBoxY+IfPRPPJ6im1EtJt+NZENHRGR/MgPaiFx2721x3Qd59KKT4y/T4TP
 pODORevDxB8BeXsMdRBlxQxNitPBxqEtgb7p/VQel8vOSRKaTA2sS9D
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
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 47ccf2326cfe..7d7ce0726c19 100644
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
@@ -3995,14 +3992,21 @@ static int __folio_freeze_split_anon(struct folio *folio,
 	struct swap_cluster_info *ci = NULL;
 	struct folio *new_folio, *next;
 	int old_order = folio_order(folio);
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
@@ -4055,7 +4059,13 @@ static int __folio_freeze_split_anon(struct folio *folio,
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
@@ -4087,6 +4097,8 @@ static int __folio_freeze_split_file(struct folio *folio,
 	if (shmem_mapping(mapping))
 		end = shmem_fallocend(mapping->host, end);
 
+	unmap_folio(folio);
+
 	xas_lock_irq(xas);
 
 	/*
@@ -4171,8 +4183,11 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 	if (do_lru)
 		lruvec_unlock(lruvec);
-
 fail:
+	/*
+	 * If we want to use try_to_migrate() on file in unmap_folio,
+	 * remember to add remap_page() and adapt it.
+	 */
 	xas_unlock_irq(xas);
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
@@ -4212,7 +4227,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	struct anon_vma *anon_vma = NULL;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
-	enum ttu_flags ttu_flags = 0;
 	int ret;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
@@ -4300,8 +4314,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	unmap_folio(folio);
-
 	if (is_anon)
 		ret = __folio_freeze_split_anon(folio, new_order, split_at,
 						true, list, split_type);
@@ -4309,11 +4321,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
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


