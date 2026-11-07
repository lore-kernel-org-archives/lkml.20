Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062131;
	b=mwOg73q+9ootD7LqQUBK9DNucze3TythDE+tOr1zY61ylSbpJ7V31Fv7MiZGBQlBN1U0
	 qSlRurUNOAQ5xFMMfsG6iyDF6iIM79Q22ExQuTKyEqDUn0OIiD374gvSIKj2IrWieyiwz
	 KhV0LVywopvJJ3GeNt++RLScV8cONbIaKlGbo5y8yXPWeYLk9d16AsDML0MZC+ArtY0JN
	 kKs6jf+psdFTpjFxmVYP39uSKVBNg5NGKOEMOgcOJZa8OgQa7Pc+3U42FXgjW2sZr3R9X
	 bREu9N+oYUxLU6hlq6vZvPSeNhvERGjRIfTHBBbYF1bPuEiWmB4Gs/2lIojHDJMXw+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062131;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8Monub+sAWAIj0De1AUv3Jkhw76yavegNMNIgX/9Bcw=;
	b=3iJRtevcVZUfdv5ivVL4/QztF8Y3/eW6+64VrVSvb9Xxhu3HM/4rpFjW23sf/znDf21f
	 efKGQnd8mwRuRxj4f5XB0AXyY5tV7bM8P7qtKosGWeth0HRQ05PbwI5H9Gv4SnJQAbiAy
	 9JCAmyMXBrgedmQJmJxDaLRRdkO7ZqtEUaWz/FXDBqtpXM1oQdJ8BWaiCR+IMSonaD1Vu
	 88n8/fUHI04fLPQdZRDPk5HujAmCHuGv4ZIsE/NO+1n4U8Y61UQLPu9qIQsvGO8ei4dxk
	 7/pB/K8TrhbZFlAJSMsNI4q7CmiKz5J72SpZ97fDfKYhsCAf14NMzt07zJG4pMlAWMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDD660A5BE6
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDD660A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jMJVR4qwkz96bn0;
	Sat,  7 Nov 2026 22:35:11 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jMJVP0zsMz96bmW;
	Sat,  7 Nov 2026 22:35:09 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id E42EF774B;
	Sat,  7 Nov 2026 22:35:08 +0800 (CST)
Received: from qiuzhiteng-2U-Workstation.hygon.cn (172.25.64.90) by
 cncheex04.Hygon.cn (172.23.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 7 Nov 2026 22:35:09 +0800
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
Subject: [PATCH v2] mm/migrate: don't batch the TLB flush when there is nothing to batch
Date: Sat, 7 Nov 2026 22:34:55 +0800
Message-ID: <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
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
through migrate_misplaced_folio().  For such a call there is nothing to
batch, but the batched path still has two side effects:

 - Each batched unmap bumps mm->tlb_flush_batched, and only
   flush_tlb_batched_pending() marks it flushed.  While NUMA balancing
   keeps migrating, the scanner's change_pte_range() therefore does a
   flush_tlb_mm() for every PTE table it changes, which makes the scan
   much slower.

 - The PTE being migrated is PROT_NONE, which normally needs no flush
   (b99a342d4f11).  But pte_accessible() treats PROT_NONE as accessible
   while mm->tlb_flush_pending is raised (on x86, arm64 and riscv),
   and it is raised for the whole, now much longer, scan.  On x86,
   each migration that overlaps a scan then does a full
   arch_tlbbatch_flush() to every CPU in mm_cpumask().

One pass on an unpatched kernel:

  CPU A (task_numa_work)          CPU B..N (workload threads)
  ----------------------          ---------------------------
  tlb_gather_mmu()
    tlb_flush_pending++
  change_pte_range(table 1)
    PTEs -> PROT_NONE
                                  access page in table 1
                                  do_numa_page()
                                   migrate_misplaced_folio()
                                    try_to_migrate_one()
                                     PROT_NONE, but pending set:
                                     pte_accessible() == true
                                     tlb_flush_batched++
                                    try_to_unmap_flush()
                                     full flush, IPI to ~380 CPUs
  change_pte_range(table 2)
    flush_tlb_batched_pending()
      pending != flushed:
      flush_tlb_mm(), IPI to ~380 CPUs
    PTEs -> PROT_NONE
                                  (same for pages in table 2)
  ... 128 PTE tables, ~0.7 ms each ...
  tlb_finish_mmu()                    pass took ~90 ms, not ~7 ms
    tlb_flush_pending--

The scan period is long, but the passes are not independent of the
faults: passes cover only 9-12% of wall time, yet 33-42% of the
hint-fault migrations overlap one (two separate runs).  60% of those
are for pages in the chunk being scanned, nearly all the rest for
pages scanned one or two passes earlier.  The scan creates the faults
that then overlap it.

On a 2-socket, 384-CPU x86 server without INVLPGB, a 4 KiB-page,
memory-heavy multithreaded workload takes about 200 TLB shootdown
interrupts per page migrated by NUMA balancing, and balancing costs it
13-16% of its throughput.  With bpftrace on that workload, the scanner
did about 11,600 full flushes in 55 s, its average mmu_gather took
about 90 ms (6.7 ms with this patch), and 42% of the migrations saw
tlb_flush_pending set (3.5% with this patch).  All NUMA balancing
tunables were at their defaults (scan_delay_ms 1000,
scan_period_min_ms 1000, scan_period_max_ms 60000, scan_size_mb 256).

Skip the batched flush only when the batch cannot merge anything: the
folio is the only one in this migrate_pages_batch() call, it is not a
large folio, and it is mapped only once.  The rmap walk then meets at
most one PTE, and ptep_clear_flush() invalidates just that page
without touching mm->tlb_flush_batched.  Everything else keeps the
batched flush, including PTE-mapped large folios, folios mapped more
than once, and the batch of sub-folios produced when a partially
mapped large folio is split during migration.

PMD-mapped THPs already invalidate their mappings through
set_pmd_migration_entry(), independently of TTU_BATCH_FLUSH, so their
flush behaviour is unchanged.  arm64 has the same pte_accessible()
rule, but its flushes are broadcast TLBIs rather than IPIs; the effect
there has not been measured.

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
Changes in v2:
 - Pass the try_to_migrate() flags directly and use single_folio in
   the VM_WARN_ON_ONCE(), as suggested by Ying.  No functional change.
 - Rewrote the changelog after measuring why b99a342d4f11 does not
   avoid the flush here (see the discussion on v1:
   https://lore.kernel.org/r/20261106041628.1177963-1-qiuzhiteng@hygon.cn).

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

 mm/migrate.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index cb699ea59d33..c2131169317d 100644
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
@@ -1344,7 +1344,19 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		/* Establish migration ptes */
 		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
 			       !folio_test_ksm(src) && !anon_vma, src);
-		try_to_migrate(src, mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0);
+		enum ttu_flags ttu = mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0;
+
+		/*
+		 * Batching only pays off when the rmap walk can meet more than
+		 * one PTE.  A lone order-0 folio with a single mapping has
+		 * exactly one: batching it gains nothing, and it leaves
+		 * mm->tlb_flush_batched pending, so later page table changes
+		 * in this mm (e.g. NUMA scanning) flush the whole mm.
+		 */
+		if (single_folio && !folio_test_large(src) &&
+		    !folio_maybe_mapped_shared(src))
+			ttu &= ~TTU_BATCH_FLUSH;
+		try_to_migrate(src, ttu);
 		old_folio_state |= FOLIO_WAS_MAPPED;
 	}
 
@@ -1835,9 +1847,10 @@ static int migrate_pages_batch(struct list_head *from,
 	LIST_HEAD(unmap_folios);
 	LIST_HEAD(dst_folios);
 	bool nosplit = (reason == MR_NUMA_MISPLACED);
+	bool single_folio = list_is_singular(from);
 
 	VM_WARN_ON_ONCE(mode != MIGRATE_ASYNC &&
-			!list_empty(from) && !list_is_singular(from));
+			!list_empty(from) && !single_folio);
 
 	for (pass = 0; pass < nr_pass && retry; pass++) {
 		retry = 0;
@@ -1925,7 +1938,8 @@ static int migrate_pages_batch(struct list_head *from,
 			}
 
 			rc = migrate_folio_unmap(get_new_folio, put_new_folio,
-					private, folio, &dst, mode, ret_folios);
+					private, folio, &dst, mode, single_folio,
+					ret_folios);
 			/*
 			 * The rules are:
 			 *	0: folio will be put on unmap_folios list,

base-commit: 56b90edee105e976d4870b9a048e6965dc0eac56
-- 
2.51.0


