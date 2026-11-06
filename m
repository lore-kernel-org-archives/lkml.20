Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938626;
	b=xLveX0I87NehKSTgeBSCskCxVIFTx/qTVaICrCg6tEhCXz8J9iTKhAmma95N9ZFK5wS0
	 hFrL4MBURE13PWPsc7di7UURIZWUpsZxtXym/RcGXMl1QnP1myjZEAIBZCg8BlBCPCTWb
	 fWyXUk+DsSckdVrRlCxG9rm8pOzbFJFj61S78I6qbaS5T5DUrCd2d3M8YiXf2FoYifuZ2
	 8QqwJ0LgkVJpzF/azWEYns4Bnh5BAFCN4xLs8td9M4LyauuWSNmMFXSdwP0xUvG2yzssR
	 YPiSqGWrGk1ei3fgIX3R7JXVdWEUJrDpNtKL6rvB0bsUdCKzplBiu90Edpn+N1VCOTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938626;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=+7h44Ealm8F6r3GvegvUhK6yyPzSxh+/wV8eDBiBA7I=;
	b=DyGPj3zYTMed79XtFWmLOpeGjd49dEAbrSBTShr2CDKfBWO0EbWBSq7CujHAyo8PZ6tH
	 qlgAe2lat/u143IQavvd9zTp/+V5RRYVx0EfuwhwAirfnHW/+ThUWtNX8M7HHmsMLhMam
	 gz/vCSj5JoQwP5LiFxWCHfrA8eM26Btqzz6npTMgp6s8AM4sioKTgxLsVKwxyE+TUhR9q
	 3Kf0oK96wVBNfaDPh5SjXEILsZY5YRCw34N6NkoeHw4Z42cdFPdX94bXD43gduLFCqQNb
	 TsVlaTnlnHrP+d7n8FSyOt3khJH4EFTFRbcafmvtXCm7ruy2xEo1w3wVhPJjQfcBuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62379606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62379606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLQqD42rzz2tcQf;
	Fri,  6 Nov 2026 12:16:40 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLQqD2D0fz2tcQf;
	Fri,  6 Nov 2026 12:16:40 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id DF15016E7;
	Fri,  6 Nov 2026 12:16:31 +0800 (CST)
Received: from qiuzhiteng-2U-Workstation.hygon.cn (172.25.64.90) by
 cncheex04.Hygon.cn (172.23.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 6 Nov 2026 12:16:40 +0800
From: Zhiteng Qiu <qiuzhiteng@hygon.cn>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>
CC: Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
	<joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
	<gourry@gourry.net>, Alistair Popple <apopple@nvidia.com>, Xin Hao
	<xhao@linux.alibaba.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Zhiteng Qiu
	<qiuzhiteng@hygon.cn>
Subject: [PATCH] mm/migrate: don't batch the TLB flush when there is nothing to batch
Date: Fri, 6 Nov 2026 12:16:28 +0800
Message-ID: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
X-Mailer: git-send-email 2.51.0
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
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Since commit 7e12beb8ca2a ("migrate_pages: batch flushing TLB"), every
MIGRATE_ASYNC migration unmaps with TTU_BATCH_FLUSH.  That includes NUMA
balancing and memory-tiering promotion, which migrate one folio per call
through migrate_misplaced_folio().  For an order-0 folio with a single
mapping the batch holds one PTE and there is nothing to merge, but the
flush still changes: on x86, arch_tlbbatch_flush() sends a full TLB
flush to every CPU in mm_cpumask() instead of invalidating that one page.

On a 2-socket, 384-CPU x86 server without INVLPGB, a 4 KiB-page,
memory-heavy multithreaded workload takes about 200 TLB shootdown
interrupts per page migrated by NUMA balancing (v5.15 on the same machine
takes about 11), and balancing costs it 13-16% of its throughput.

Skip the batched flush only when the batch cannot merge anything: the
folio is the only one in this migrate_pages_batch() call, it is not a
large folio, and it is mapped only once.  The rmap walk then meets at
most one PTE, and ptep_clear_flush() invalidates just that page.
Everything else keeps the batched flush, including PTE-mapped large
folios, folios mapped more than once, and the batch of sub-folios
produced when a partially mapped large folio is split during migration.

PMD-mapped THPs already invalidate their mappings through
set_pmd_migration_entry(), independently of TTU_BATCH_FLUSH, so their
flush behaviour is unchanged.  On arm64 the batched path only defers the
final DSB, so a one-PTE batch should cost about the same either way.

migrate_folio_unmap() cannot see how many folios its caller is
migrating, so migrate_pages_batch() passes that down.

Measured on v7.3: 120 GiB anonymous working set, 384 threads, 180 s per
run, three A/B pairs (numa_balancing on vs. off, same boot) per kernel.

                                    v7.3            patched
  throughput loss from balancing   13.0-16.5%      0.5-6.3%
  kernel cycles per hinting PTE    1.18-1.22M      0.28-0.31M
  TLB interrupts / migrated page   202-210         12.7-13.6

Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
---
Notes:

An earlier version decided on reason == MR_NUMA_MISPLACED.  That also
dropped batching for the split sub-folio batch mentioned above.  In a
test that splits partially mapped 2 MiB THPs during NUMA migration, the
earlier version raised TLB interrupts per migrated page from 0.13 to
16.1; this version keeps them at 0.11.  For 64 KiB mTHP and for a
MAP_SHARED mapping used by two processes, this version behaves like the
base kernel (TLB interrupts per migrated page: mTHP 2.2-2.7 patched vs.
2.6-3.3 base; shared 31.3-31.5 vs. 31.2-31.7).

The earlier version behaves the same as this one for order-0, private,
single-mapped memory.  These results were measured with it:
 - 192 CPUs (SMT off, 192 threads, 4 pairs): balancing loss
   3.1-14.7% patched vs. 7.4-54.3% base.
 - Memory first-touched on the remote socket, threads on the local
   socket (6 runs per kernel): no regression in time to convergence or
   in throughput after convergence.
 - 2 MiB THP (2 pairs): no difference, as expected for PMD-mapped
   folios.
 - A 30-minute run with compaction forced every 30 s: no warnings.

With this version, tools/testing/selftests/mm/migration passes 6/6
(including the THP and hugetlb cases), the LTP move_pages and
migrate_pages cases pass 14/14, and the scenario tests above saw no data
mismatches.

There is no Fixes: tag.  This changes a performance trade-off in code
that has been there since v6.4, and nobody has reported it as a
regression.  Please add one if you see it that way.
---
 mm/migrate.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 953af633ec..0f3404c3d7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1222,7 +1222,7 @@ static void migrate_folio_done(struct folio *src,
 static int migrate_folio_unmap(new_folio_t get_new_folio,
 		free_folio_t put_new_folio, unsigned long private,
 		struct folio *src, struct folio **dstp, enum migrate_mode mode,
-		struct list_head *ret)
+		bool single_folio, struct list_head *ret)
 {
 	struct folio *dst;
 	int rc = -EAGAIN;
@@ -1344,7 +1344,18 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		/* Establish migration ptes */
 		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
 			       !folio_test_ksm(src) && !anon_vma, src);
-		try_to_migrate(src, mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0);
+		/*
+		 * Batching only pays off when the rmap walk can meet more than
+		 * one PTE.  A lone order-0 folio with a single mapping has
+		 * exactly one, and on x86 the batched flush turns that one-page
+		 * invalidation into a full flush of mm_cpumask().
+		 */
+		bool batch_flush = mode == MIGRATE_ASYNC;
+
+		if (single_folio && !folio_test_large(src) &&
+		    !folio_maybe_mapped_shared(src))
+			batch_flush = false;
+		try_to_migrate(src, batch_flush ? TTU_BATCH_FLUSH : 0);
 		old_folio_state |= FOLIO_WAS_MAPPED;
 	}
 
@@ -1835,6 +1846,7 @@ static int migrate_pages_batch(struct list_head *from,
 	LIST_HEAD(unmap_folios);
 	LIST_HEAD(dst_folios);
 	bool nosplit = (reason == MR_NUMA_MISPLACED);
+	bool single_folio = list_is_singular(from);
 
 	VM_WARN_ON_ONCE(mode != MIGRATE_ASYNC &&
 			!list_empty(from) && !list_is_singular(from));
@@ -1925,7 +1937,8 @@ static int migrate_pages_batch(struct list_head *from,
 			}
 
 			rc = migrate_folio_unmap(get_new_folio, put_new_folio,
-					private, folio, &dst, mode, ret_folios);
+					private, folio, &dst, mode, single_folio,
+					ret_folios);
 			/*
 			 * The rules are:
 			 *	0: folio will be put on unmap_folios list,

base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.51.0


