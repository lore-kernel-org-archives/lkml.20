Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEC43551D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540738; cv=none; b=AYo7WXNkGBX7Icm/WKisOE+3CoJX/zmv18y+doxHI4sS4l+9ZMuIOC4RbReYrUETLwuIiPY2Yva4FfqETjh/s28p70uI49lobBZS5+OoI6qdPxey573pH3cOeasDolqfKbMq85uHFR1vgiM8RpSThYhaBpSMf3WcHODbPts6Ws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540738; c=relaxed/simple;
	bh=ayHUt8x58wRGpa6ocTjf0pXEloKLIkIpD44oA6VFlCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kg4efqQFWsLXUM5NwrtyLO+Zw2Z+zb3imxZUmJVzvDT/X0jdmPB5gU8fayHnRAZgZLpAi3kd8ZjZqpj6t9T+kW++ALlohg93iPpZLcexZwBer0lfOdoY49cne1ttDgixyOcLS2+D6aGTvHYiJQIYhXzpGbbP7edGRuqQs+BrmIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=B87EFUsA; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="B87EFUsA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791540733; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zBSbv2B6IsoFMLLUq2oPWczzDmUPwVCu6gZEUUWAPbU=;
	b=B87EFUsAFPor30siFVbvjY8khhf8OwDsonfUR/PTmX+U4DOP1bZLkqFsw7I0xZKqopOxUUvW6CsutcybXgbnXTCfT5eXWsiW+S/N9T9IjlU/wCt7Qj78/ibVktN2jpRleGg14CESofruy7gg95KKDrblPFTMMJYPmWA/Y+rYfZc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XCT5qzQ_1791540731;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCT5qzQ_1791540731 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 18:12:11 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	jack@suse.cz,
	pfalcato@suse.de,
	ayushr@modal.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: memory: fix truncation removing mapped folios
Date: Fri,  9 Oct 2026 18:12:03 +0800
Message-ID: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ayush reported an issue that shmem/tmpfs folios are still mapped when
truncating them on production:
"
BUG: Bad page cache in process ...  pfn:...
page dumped because: still mapped when deleted
"

I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
branch, and I got the following crash info. From the dump message, we can
see that truncate_inode_folio() is really trying to remove mapped folios,
which is incorrect.

"
[  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
index:0x3880 pfn:0x191647
[  189.171995] memcg:ffff0000cc073d40
[  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
[  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
.......
[  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
[  189.172026] ------------[ cut here ]------------
[  189.172027] kernel BUG at mm/filemap.c:155!
[  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
.......
[  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
7.3.0-rc4+ #277 PREEMPT(lazy)
.......
[  189.183986] Call trace:
[  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
[  189.184391]  __filemap_remove_folio+0x34/0x160
[  189.184633]  filemap_remove_folio+0x4c/0xb0
[  189.184859]  truncate_inode_folio+0x34/0x58
[  189.185087]  shmem_undo_range+0x220/0x658
[  189.185308]  shmem_fallocate+0x2f0/0x470
[  189.185527]  vfs_fallocate+0x128/0x328
......
[  189.187078]  el0t_64_sync+0x184/0x188
"

After analysis, I believe the race exists between truncation and MADV_DONTNEED,
and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
MADV_DONTNEED synchronously releases the pagetable page before calling
tlb_flush_rmaps(), this could cause another thread's truncation to skip
zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
as non-zero. A possible race scenario is as follows:

CPU 0                           CPU 1
shmem_fallocate                 madvise_dontneed_single_vma
  unmap_mapping_range            .......
  ......
  (filemap_map_pages() remap folios)
				  zap_pte_range
  truncate_inode_folio		    zap_empty_pte_table(pmd clear)
    unmap_mapping_folio
    ......
      zap_pmd_range (saw pmd none, skip)

  filemap_remove_folio
    BUG_ON(folio_mapped)
                                    tlb_flush_rmaps(remove rmaps)

To fix this issue, we should move the pmd clear operation (via zap_empty_pte_table())
to after tlb_flush_rmaps() and add a smp_wmb() memory barrier, so that when
we find a pmd_none() while unmapping a folio without holding the PTL, the
folio's mappings are guaranteed to have been removed via tlb_flush_rmaps().

[1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
Reported-by: Ayush Ranjan <ayushr@modal.com>
Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/memory.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 1f5d5f7d39cd..0272217ad7b0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		}
 	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
 
+	add_mm_rss_vec(mm, rss);
+	lazy_mmu_mode_disable();
+
+	/* Do the actual TLB flush before dropping ptl */
+	if (force_flush) {
+		tlb_flush_mmu_tlbonly(tlb);
+		tlb_flush_rmaps(tlb, vma);
+	}
+
 	/*
 	 * Fast path: try to hold the pmd lock and unmap the PTE page.
 	 *
@@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 	 * to ensure they are still none, thereby preventing the pte entries
 	 * from being repopulated by another thread.
 	 */
-	if (can_reclaim_pt && direct_reclaim && addr == end)
+	if (can_reclaim_pt && direct_reclaim && addr == end) {
+		/* rmap changes need to be observed before e.g PTEs get zapped. */
+		smp_wmb();
 		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
-
-	add_mm_rss_vec(mm, rss);
-	lazy_mmu_mode_disable();
-
-	/* Do the actual TLB flush before dropping ptl */
-	if (force_flush) {
-		tlb_flush_mmu_tlbonly(tlb);
-		tlb_flush_rmaps(tlb, vma);
 	}
 	pte_unmap_unlock(start_pte, ptl);
 
-- 
2.47.3

