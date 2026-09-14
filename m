Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12A496D36
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406154; cv=none; b=V6hGz9xAD6txz5f5fffR/yRUXP8w1d3kmUv6Zq3iIq4wy+Gi371ZkBgrOd/WEqby3HwlmLz8QIyZ3VbC7Hwt7AWkSUZ+kUMJVpnmceyyEbvSXO0pb7HGl7ykpSD7WhlM42lk0Fep3VTb9krGhVN32WS65IZpbfuuCuHjH+5cXRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406154; c=relaxed/simple;
	bh=XXmFu8FHxp+9q0wq8evTBl08FOOinwleYwb02Vqvh8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCG/MNkuT6E53/sLxpxHZ3cmcokNZcwJbtfZ+6SaBKn6dbP9oll9JojH3v26o0QrBesrR9UiDuvuRhTEIvcFtUTheDWg/Qh05PyuTfhFFUw/QM2c2EH45RygZifxWzhqYo/W5xOdQcoSaRyMHZpPLFYiYYsRZ4G+DDweYQZ5D6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hau6a+Ux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hau6a+Ux"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BC3FC2BCFF;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789406154;
	bh=XXmFu8FHxp+9q0wq8evTBl08FOOinwleYwb02Vqvh8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hau6a+UxEHuh7Utut+giSkDOd/tl6AStxx++hPJqNL3YyNLC9NVRWGGboJoqUkZ33
	 Lv3cm8vTFMTyLZgOMns5//blIRuxsmM9f0MUvQXMKqeyb4AAIPlIIrCJsM6ZYjsJyG
	 XXlWxQsfM3uRLTPtIRLswK3dXDhE1GewK5OwfGETMw5bjTjuElSYhnvqsJlHOVuZM5
	 ElKEEYOp8kgif894YCujkdPD8SL+6zqshKEVr01E5kPbocTqgZtqNLsofa80Ysxzo6
	 MroXN+7I4xyaatuRdc+z5IyLW2oku/vjQuhBX1XmZJjvt8SZyPxCINRWP0tIDIP3ip
	 NZPCnjh4Et7kA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F79C88E73;
	Mon, 14 Sep 2026 17:15:54 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Tue, 15 Sep 2026 01:14:48 +0800
Subject: [PATCH v5 07/17] mm/huge_memory: move EOF trimming into the file
 split helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-swap-thp-cleanup-v5-7-39878b37dfb0@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789406149; l=4114;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=Ts7bWTM2eMacGjQUWD5NIu7YG58EfZYRRZU/elImP5I=;
 b=vrfo2CDuxED+xLqydKpyoRBo7l5Fjn42gdwXH3C3ECxIr3CfRa3G1kpC+7HTZ8AW5SaXirZ3j
 z03Qj9W9sWSDi5TLZB7e8xwv+WCGq66Nfl5ni651f8fOrmh8l9KIfFp
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Kairui Song <kasong@tencent.com>

Instead of receiving @end and @nr_shmem_dropped from the caller, the
file split helper now computes the EOF boundary and trims pages beyond
it itself, as this is only needed for file split.  This drops the
redundant parameter passing and sanity check.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/huge_memory.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d0e2f1801d6f..5ba3bcdfc42d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4083,16 +4083,29 @@ static int __folio_freeze_split_file(struct folio *folio,
 		unsigned int new_order, struct page *split_at,
 		struct xa_state *xas, struct address_space *mapping,
 		bool do_lru, struct list_head *list,
-		enum split_type split_type, pgoff_t end, int *nr_shmem_dropped)
+		enum split_type split_type)
 {
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
+	int nr_shmem_dropped = 0;
 	struct lruvec *lruvec;
+	pgoff_t end;
 	int ret;
 
 	/* Currently device private folios can only back anonymous memory. */
 	VM_WARN_ON_ONCE_FOLIO(folio_is_device_private(folio), folio);
 
+	/*
+	 * The loop below may need to trim off pages beyond
+	 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
+	 * seqlock, which cannot be nested inside the page tree lock.
+	 * So note end now: i_size itself may be changed at any moment,
+	 * but folio lock is good enough to serialize the trimming.
+	 */
+	end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
+	if (shmem_mapping(mapping))
+		end = shmem_fallocend(mapping->host, end);
+
 	xas_lock_irq(xas);
 
 	/*
@@ -4157,10 +4170,9 @@ static int __folio_freeze_split_file(struct folio *folio,
 			continue;
 		}
 
-		VM_WARN_ON_ONCE(!nr_shmem_dropped);
 		/* Drop folio beyond EOF: ->index >= end */
-		if (shmem_mapping(mapping) && nr_shmem_dropped)
-			*nr_shmem_dropped += nr_pages;
+		if (shmem_mapping(mapping))
+			nr_shmem_dropped += nr_pages;
 		else if (folio_test_clear_dirty(new_folio))
 			folio_account_cleaned(
 				new_folio, inode_to_wb(mapping->host));
@@ -4181,6 +4193,8 @@ static int __folio_freeze_split_file(struct folio *folio,
 
 fail:
 	xas_unlock_irq(xas);
+	if (nr_shmem_dropped)
+		shmem_uncharge(mapping->host, nr_shmem_dropped);
 	return ret;
 }
 
@@ -4217,9 +4231,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	struct anon_vma *anon_vma = NULL;
 	int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
-	int nr_shmem_dropped = 0;
 	enum ttu_flags ttu_flags = 0;
-	pgoff_t end = 0;
 	int ret;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
@@ -4296,17 +4308,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		anon_vma = NULL;
 		i_mmap_lock_read(mapping);
-
-		/*
-		 * __split_frozen_folio() may need to trim off pages beyond
-		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
-		 * seqlock, which cannot be nested inside the page tree lock.
-		 * So note end now: i_size itself may be changed at any moment,
-		 * but folio lock is good enough to serialize the trimming.
-		 */
-		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
-		if (shmem_mapping(mapping))
-			end = shmem_fallocend(mapping->host, end);
 	}
 
 	/*
@@ -4325,11 +4326,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 						true, list, split_type);
 	else
 		ret = __folio_freeze_split_file(folio, new_order, split_at, &xas, mapping,
-						true, list, split_type, end,
-						&nr_shmem_dropped);
-
-	if (nr_shmem_dropped)
-		shmem_uncharge(mapping->host, nr_shmem_dropped);
+						true, list, split_type);
 
 	if (!ret && is_anon && !folio_is_device_private(folio))
 		ttu_flags = TTU_USE_SHARED_ZEROPAGE;

-- 
2.55.0


