Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227400;
	b=JdYCAHwK9FOcl4sWY7kwcXaIEUiG7QugXzN0WfT0yUOlQoJlaIGuz7+A6HKvFGcJrZ73
	 EQIObSSelOocPNhLEFIPaNxFfy6+se3JRNJPkkuvYmAcB/W1lDtLy4CgM7kPFSJjR0Heq
	 C+TsFCP+EfO/PHkdQGufDsJpr9cD2p+QAzj+JoUkddCzN9li1PExhzFzAb3WbmlgU1iia
	 COKJ03lXpOByS+RkJCXMKfX6raqtMuyo8X6/7cn+BULQpDyasuU4GJl+cF7LGAHqLoPPN
	 P8jeQOhIJyj+kKwLv3SpDu9CEcR8YlcWeYArriVsBzaH6o1OB20Etk229e5+Svz2vtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227400;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=plCEH9+gyrwSswtybTbWFM7xts9szEf9C+4KT3VZf9c=;
	b=1h9Tq4V3/YcRtxb1JmbBXUtP/5+oxfHICkeiQKIVPUead4RL41L89dTbRt6RUxxcVGp8
	 AvvSoOv9yErzD9szT3HAbwx7RQZqVMRVEcjXiFRnadmjmFNXyDuu0FBpzmpJkM1Vt6hQF
	 bH2dEVKw9a9DBXkLljJL9/cCLTHdaoRItsI2C5owUL9bAZf2DvDBpmxzV8qwzgkNcB+kl
	 oJF0v5HS8kUeOGHy3KEuy8diaQ2biQp9Oa2FE9UrCGlHOpUDvloyKffRxWuFbYa7MVgCV
	 qj5N1wV/rtQHXOoCN29l2YJSa+BvrCwBe40j/5mAgtJdFV+iONKhDtwi8Tz6sf859uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5B5606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jNTcZ3HyqzwHY2;
	Mon,  9 Nov 2026 20:29:34 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jNTcZ1NPyzwHY2;
	Mon,  9 Nov 2026 20:29:34 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 32BFD116E2;
	Mon,  9 Nov 2026 20:29:30 +0800 (CST)
Received: from qiuzhiteng-2U-Workstation.hygon.cn (172.25.64.90) by
 cncheex04.Hygon.cn (172.23.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 9 Nov 2026 20:29:33 +0800
From: Zhiteng Qiu <qiuzhiteng@hygon.cn>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>
CC: Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
	<joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
	<gourry@gourry.net>, Alistair Popple <apopple@nvidia.com>, Xin Hao
	<xhao@linux.alibaba.com>, Dave Hansen <dave.hansen@linux.intel.com>, Yuan
 Zhong <zhongyuan@hygon.cn>, Shifei Ge <geshifei@hygon.cn>, Jianyong Wu
	<wujianyong@hygon.cn>, Shijie Huang <huangsj@hygon.cn>, Yibin Liu
	<liuyibin@hygon.cn>, Fengyu Wang <wangfengyu@hygon.cn>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Zhiteng Qiu <qiuzhiteng@hygon.cn>
Subject: [PATCH v3] mm/migrate: don't batch the TLB flush when there is nothing to batch
Date: Mon, 9 Nov 2026 20:29:15 +0800
Message-ID: <20261109122915.2150586-1-qiuzhiteng@hygon.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
References: <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
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

NUMA balancing migrates one folio at a time, but since commit
7e12beb8ca2a ("migrate_pages: batch flushing TLB") it still unmaps
with TTU_BATCH_FLUSH like any other MIGRATE_ASYNC migration.  When the
batch contains one folio mapped only once, there is nothing to batch,
and the batched unmap can leave mm->tlb_flush_batched pending, so the
NUMA scanner's next change_pte_range() can call flush_tlb_mm() before
changing the PTE table.  With migrations running concurrently, that
state keeps being refilled and the scanner ends up flushing the whole
mm for many of the PTE tables it walks.

That slows each scan pass down a lot, and mm->tlb_flush_pending stays
raised for the whole pass.  On x86, a migration that unmaps a
PROT_NONE PTE while mm->tlb_flush_pending is set gets true from
pte_accessible() and needs a flush too; with batching, the resulting
arch_tlbbatch_flush() is a full flush.  The two feed each other.  In
one run, 33% of the migrations overlapped a pass, although passes
covered only 9% of the time.

On a 2-socket, 384-CPU x86 machine without INVLPGB, with v7.3, a
120 GiB anonymous working set on 4 KiB pages and 384 threads (three
balancing on/off pairs per kernel):

                                     v7.3          patched
  throughput loss from balancing     13.0-16.5%    0.5-6.3%
  TLB interrupts per migrated page   202-210       12.7-13.6
  average scanner mmu_gather time    ~90 ms        ~6.7 ms

The mmu_gather times were measured in separate instrumented runs.

So only ask for a batched flush when the rmap walk can meet more than
one PTE, that is, when there is more than one folio in the batch or
the folio is mapped more than once.  Otherwise try_to_migrate_one()
uses ptep_clear_flush() on the one PTE.  PMD-mapped THPs are not
affected, since set_pmd_migration_entry() flushes them regardless of
TTU_BATCH_FLUSH.

Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
---
Changes in v3:
 - Use folio_mapcount() for the check, as Ying suggested.  It counts
   PTEs, so PTE-mapped large folios are still batched when more than
   one PTE remains mapped.  The only difference from v2 is a large
   folio with just one PTE still mapped, which is no longer batched
   either.
 - Cut the changelog down.

Changes in v2:
 - Pass the try_to_migrate() flags directly and use single_folio in
   the VM_WARN_ON_ONCE(), as suggested by Ying.
 - Rewrote the changelog after looking into why b99a342d4f11 does not
   avoid the flush here.

v2: https://lore.kernel.org/r/20261107143456.1590658-1-qiuzhiteng@hygon.cn
v1: https://lore.kernel.org/r/20261106041628.1177963-1-qiuzhiteng@hygon.cn

The table was measured on v7.3 with the check as posted in v2.  v3
only differs for a large folio with a single PTE left mapped.  On
mm-new with v3, one balancing on/off pair gave a 3.2% loss and 13.5
TLB interrupts per migrated page.

I re-ran the tests on v3: mm/migration selftests 6/6, LTP move_pages
and migrate_pages 14/14, and 30 minutes with compaction forced every
30 s without warnings.  Splitting partially mapped 2 MiB THPs during
NUMA migration still gets the batched flush (0.11-0.12 TLB
interrupts per migrated page, same as base), and 64 KiB mTHP and a
MAP_SHARED mapping shared by two processes behave like base.

No Fixes: tag, as this is a performance trade-off that has been there
since v6.3 and nobody has reported it as a regression.  Happy to add
one if you think it should have one.

 mm/migrate.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index cb699ea59d33..011cceadeda9 100644
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
+		enum ttu_flags ttu = 0;
+
+		/*
+		 * Batching only helps if the rmap walk can find more than one
+		 * PTE to clear.  With a single folio mapped once there is
+		 * nothing to merge, and a batched unmap would only leave
+		 * mm->tlb_flush_batched pending, making later page table
+		 * changes in this mm (e.g. NUMA scanning) flush the whole mm.
+		 */
+		if (mode == MIGRATE_ASYNC &&
+		    (!single_folio || folio_mapcount(src) > 1))
+			ttu = TTU_BATCH_FLUSH;
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


