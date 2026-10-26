Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983369;
	b=bI5+40x/l74c/JmT8nULV140f2BxO4MzzJVoD008zZ4rF/ZRk6t9nmdRml5Vkna3Sh1C
	 WTeRRNwdxEFxx6EmyypRYJFiLnDlY/VsuGStjj4wJS3sLo0DJdIkST4d0p1MKD20npaLU
	 L9W1UV4guTs0NjYIvxY2/qdQPO4aohADaNN+Ua2uAoW8AZgdbypTaaqwN+yHMv/BR+6Td
	 JwY5VztpdGBOnE2NS223NZRii2PWQIhSUrQD1m86rQPvhKJETAKif3F5rw3Bg1e6ZA6ej
	 CttkzBHjDORhjk8x8oUAmYRAP6PVm8gug8RF4YWa+psPSsnh9qxONetsMN8B3IfYP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983369;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/jHIZUyy+nrraPKzddPkSGZdeuR1XIOOSkmgtrJ5LEE=;
	b=4Ph7rSEV2pa3fxAJ4ERrbuRqBD/4Xbcr29mI2uHWOCB5IRyjGQhm8YDcGAHwT1jClYvM
	 PX9FXc4ZTdYAqNqytskVY3hBTp4T7AfLbCoif4cJimuELGWjbDdr6Tdad+/zndXrB9TMF
	 Ae/fIaCheC34YTN3pBI/BKTIIhRa17obkEvRrcLSNpAXuWZMkiFaWoGDyRYQZXTGpcQrf
	 jGifrMtvhPSxyAqxWRmRAFE99oyRk/y+R/FP7hAvflsYZ0/m3i3ySW07UNGLTRIXKh8lR
	 E/+vLZY2tSB+Ee+UuldBfLofOFtOWroxl6+fBsKqTM8uLpk3mnSbRNEaZEHMHA4Rc7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CxKku1pJ;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CxKku1pJ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792983366; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/jHIZUyy+nrraPKzddPkSGZdeuR1XIOOSkmgtrJ5LEE=;
	b=CxKku1pJaUgiCojVzOPS8aGejbEosIAcDXHvn0whMlBEYCPl7PP25RkmaeVjDQaTOd7V6SBP0bka3I/kJfmU9bP/1oiFDH7kQReHiebN0/a2uNpUhK8aY+IKkAzTmyed63l5W6d6+RnbHh3Jd/z1GGYpB5mkmu40TeW67j8i7fQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDRaMi9_1792983364;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDRaMi9_1792983364 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:56:05 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH v2 2/2] mm/migrate: refuse to migrate folios containing hwpoisoned pages
Date: Mon, 26 Oct 2026 10:55:52 +0800
Message-ID: <20261026025552.1427901-3-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
References: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Refuse such migrations in the migration core, with three checks:

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

- __migrate_folio() and migrate_huge_page_move_mapping() check
  again after the copy, before the mapping is transferred: the
  debugfs corrupt-pfn injector has no GUP or PTE ordering
  constraint, so it can set the flag while the copy is in
  progress, and only this recheck catches that window.  Failing
  there unwinds exactly like a copy failure.

All checks fail with -EHWPOISON, a permanent failure: the folio
goes back on the LRU with the poison flag intact, for reclaim or
a later memory_failure() to deal with - the same reasoning reclaim
settled on in
commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list").
The hugetlb path gets the same checks: its unmap-to-copy window is
single-folio and much narrower than the batched path, but the
checks cost bit tests.

Measured with the workload above (180-second runs; the count of
abandoned folios varies between runs with the race rate): the
unpatched kernel propagated 698 of 8426 abandoned folios; with the
pre-copy checks alone, 0 of 9711 were propagated.  The post-copy
recheck closes the remaining injector window.

Soft offline is unaffected: it sets the poison marker only after its
own migration has succeeded.  Memory hotplug offlining is
unaffected: it filters poisoned folios out before calling
migrate_pages().  Reclaim is unaffected: poisoned folios go through
its own unmap and skip paths, not migrate_pages().

A check at the copy site was previously proposed by Kaitao Cheng,
for the hugetlb path and for move_to_new_folio(); that discussion
stalled over the remaining race with memory_failure().  The
GUP-reference argument and the measurement above address that
concern for injection paths, and the post-copy recheck here is his
suggestion.

Assisted-by: LLM
Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Link: https://lore.kernel.org/r/20260707090136.52904-1-kaitao.cheng@linux.dev/
---
 mm/migrate.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..208a3991ca06 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -749,6 +749,14 @@ int migrate_huge_page_move_mapping(struct address_space *mapping,
 	if (unlikely(rc))
 		return rc;
 
+	/*
+	 * Recheck after the copy: an injector can set the flag while the
+	 * copy is in progress.  The mapping has not been transferred yet,
+	 * so failing here is the same unwinding as a copy failure.
+	 */
+	if (unlikely(folio_contain_hwpoisoned_page(src)))
+		return -EHWPOISON;
+
 	xas_lock_irq(&xas);
 	if (!folio_ref_freeze(src, expected_count)) {
 		xas_unlock_irq(&xas);
@@ -881,6 +889,14 @@ static int __migrate_folio(struct address_space *mapping, struct folio *dst,
 	if (unlikely(rc))
 		return rc;
 
+	/*
+	 * Recheck after the copy: an injector can set the flag while the
+	 * copy is in progress.  The mapping has not been transferred yet,
+	 * so failing here is the same unwinding as a copy failure.
+	 */
+	if (unlikely(folio_contain_hwpoisoned_page(src)))
+		return -EHWPOISON;
+
 	rc = __folio_migrate_mapping(mapping, dst, src, expected_count);
 	if (rc)
 		return rc;
@@ -1222,6 +1238,15 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	bool locked = false;
 	bool dst_locked = false;
 
+	if (unlikely(folio_contain_hwpoisoned_page(src))) {
+		/*
+		 * Fail permanently before allocating dst: the folio
+		 * goes back on the LRU for a later memory_failure().
+		 */
+		migrate_folio_undo_src(src, 0, NULL, false, ret);
+		return -EHWPOISON;
+	}
+
 	dst = get_new_folio(src, private);
 	if (!dst)
 		return -ENOMEM;
@@ -1376,6 +1401,15 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
+	if (unlikely(folio_contain_hwpoisoned_page(src))) {
+		/*
+		 * Recheck before the copy: a poison can land while the
+		 * batch is still unmapping the rest of its chunk.
+		 */
+		rc = -EHWPOISON;
+		goto out;
+	}
+
 	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		if (rc)
@@ -1521,6 +1555,12 @@ static int unmap_and_move_hugetlb_folio(new_folio_t get_new_folio,
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
 
@@ -1546,8 +1586,13 @@ static int unmap_and_move_hugetlb_folio(new_folio_t get_new_folio,
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

