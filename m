Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E324582F3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593110; cv=none; b=OXBhs1k8FlFb3ws3YgX6kKX3KJvr/xKOa+Dhorw1u/ZyuJFE4dejmF73MkBp4S+JwDq/kEU4OQkfiYOoEVbxfp0byF7iw7AP/tOMUVBOPfuDaaPxNccnA0EgoYIbLjfd/jO3TXg93wBwJK3bhSzrnPqzkBWtck1almJA5RioVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593110; c=relaxed/simple;
	bh=GTKk0JqP9tTJGRaeWAM06t8Yy9fA63ANG6NVmJKdoEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3Qtlw9ir3J2L3TPljmIIY8aFluqhvMjeZe8MnLV2mJCd17YYVK/8zxtpyX4YZAp/nXno0WIJOwm/umBoLx24/XkyECfGfbK9s5guGnqiRtB05fdXzhHsTLvgU8u0Z/MwAIe2jrSBY8NQfpwmyPnD1aalRSAPjKlMRgN8/6r0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xtez447v; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xtez447v"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790593105; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=DcmXusX46ZnjGCZm2P00Q/fqv8H94b2EYQaPdurCD7I=;
	b=xtez447vZrnYRmmK6COYYgvhB72IoJhblAngHz8QchpBN2QuVYORQgwKzz9+1k8g3r7/ARBN9TOdpitetbHZVimWR/OIgepHXvenPaT8lSiUAO0xj7mCMhyyf5ErcXhUNs8vFRwAtfmNdSra9aTqYvSzKN3SfXnb7YN1jVHgcGI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XBma21L_1790593102;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XBma21L_1790593102 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 18:58:23 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: xiangzao@linux.alibaba.com,
	david@kernel.org,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	ying.huang@linux.alibaba.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	kaitao.cheng@linux.dev,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm/migrate: refuse to migrate folios containing hwpoisoned pages
Date: Mon, 28 Sep 2026 18:58:05 +0800
Message-ID: <20260928105805.1215770-3-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All callers of migrate_pages() without their own poison handling -
move_pages(2), mbind(), NUMA balancing, alloc_contig_range() (CMA)
and long-term GUP - can race memory_failure() the same way compaction
does (see patch 1): the migration isolates a folio and clears
PG_lru, memory_failure() sets PG_hwpoison, then fails to pin it and
gives up with MF_IGNORED, and the pending migration copies the
corrupted data into a fresh folio that carries no poison marker;
the userspace mapping ends up silently serving the corrupted copy
with no SIGBUS.

This was reproduced on v7.3-rc4-75-g62f4c998b297: an order-0 stress
workload running madvise(MADV_HWPOISON) concurrently with
move_pages() left the poison flag set on 8426 abandoned folios in
a 180-second run, identified via /proc/kpageflags; 698 of them
were subsequently migrated, and in every case the address then
served the copied corrupted data with no SIGBUS.

Refuse such migrations in the migration core, with two checks:

- migrate_folio_unmap() checks at entry, so a folio that is already
  poisoned when the batch reaches it fails immediately, without
  allocating a destination folio or unmapping it.

- migrate_folio_move() checks again immediately before the copy,
  because migrate_pages_batch() unmaps a whole chunk of folios
  before copying any of them, so a poison can land in between.  A
  GUP-based path such as madvise(MADV_HWPOISON) takes its
  reference while the folio is still mapped, i.e. before the
  unmap, and memory_failure() sets PG_hwpoison before releasing
  that reference, so a racing poison is visible by the time
  migration reaches the copy, unless the injecting thread is
  delayed between taking the reference and setting the flag.  A
  hardware MCE can likewise land in the final instructions
  between the check and the copy; on x86_64 folio_mc_copy()
  additionally catches real-DRAM corruption at copy time.

Both checks fail with -EHWPOISON rather than -EAGAIN: -EAGAIN would
leave the folio on the migration list and retry into the same check,
while -EHWPOISON is a permanent failure, so the folio is put back on
the LRU with the poison flag intact, for reclaim or a later
memory_failure() to deal with - the same reasoning reclaim settled
on in
commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list").
The hugetlb path gets the same two checks for symmetry and defense
in depth: its unmap-to-copy window is single-folio and much narrower
than the batched path, but the checks cost two bit tests.

Measured with the workload above (180-second runs; the count of
abandoned folios varies between runs with the race rate): the
unpatched kernel propagated 698 of 8426 abandoned folios; with
this patch, 0 of 9711 were propagated.

Soft offline is unaffected: it sets the poison marker only after its
own migration has succeeded.  Memory hotplug offlining is
unaffected: it filters poisoned folios out before calling
migrate_pages().  Reclaim is unaffected: poisoned folios go through
its own unmap and skip paths, not migrate_pages().

A check at the copy site was previously proposed by Kaitao
Cheng, for the hugetlb path and for move_to_new_folio(); that
discussion stalled over the remaining race with memory_failure().
The GUP-reference argument and the measurement above answer
that concern for injection paths.

Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Link: https://lore.kernel.org/r/20260707090136.52904-1-kaitao.cheng@linux.dev/
---
 mm/migrate.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..bdfd490dd8e8 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1222,6 +1222,18 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	bool locked = false;
 	bool dst_locked = false;
 
+	if (unlikely(folio_contain_hwpoisoned_page(src))) {
+		/*
+		 * The copy would propagate the corrupted data into a
+		 * fresh folio with no poison marker.  Fail permanently
+		 * so the folio is put back on the LRU for reclaim or a
+		 * later memory_failure(); it was not unmapped yet, so
+		 * there is nothing to restore.
+		 */
+		migrate_folio_undo_src(src, 0, NULL, false, ret);
+		return -EHWPOISON;
+	}
+
 	dst = get_new_folio(src, private);
 	if (!dst)
 		return -ENOMEM;
@@ -1376,6 +1388,20 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
+	if (unlikely(folio_contain_hwpoisoned_page(src))) {
+		/*
+		 * Recheck before the copy: a poison can land while the
+		 * batch is still unmapping the rest of its chunk.  A
+		 * GUP-based path takes its reference before the unmap,
+		 * and memory_failure() sets PG_hwpoison before
+		 * releasing it, so a racing poison is visible by now;
+		 * a hardware MCE can still land in the final
+		 * instructions.
+		 */
+		rc = -EHWPOISON;
+		goto out;
+	}
+
 	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		if (rc)
@@ -1521,6 +1547,12 @@ static int unmap_and_move_hugetlb_folio(new_folio_t get_new_folio,
 		goto out_unlock;
 	}
 
+	if (unlikely(folio_contain_hwpoisoned_page(src))) {
+		/* Same reasoning as in migrate_folio_unmap(). */
+		rc = -EHWPOISON;
+		goto out_unlock;
+	}
+
 	if (folio_test_anon(src))
 		anon_vma = folio_get_anon_vma(src);
 
@@ -1546,8 +1578,13 @@ static int unmap_and_move_hugetlb_folio(new_folio_t get_new_folio,
 		was_mapped = 1;
 	}
 
-	if (!folio_mapped(src))
-		rc = move_to_new_folio(dst, src, mode);
+	if (!folio_mapped(src)) {
+		/* Same reasoning as in migrate_folio_move(). */
+		if (unlikely(folio_contain_hwpoisoned_page(src)))
+			rc = -EHWPOISON;
+		else
+			rc = move_to_new_folio(dst, src, mode);
+	}
 
 	if (was_mapped)
 		remove_migration_ptes(src, !rc ? dst : src, ttu);
-- 
2.43.7

