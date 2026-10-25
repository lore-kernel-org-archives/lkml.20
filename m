Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926152;
	b=ChkoVEYzUCnMGqkX+zUK+RrsJ+Ne6LwSUJD5dD5kPoosZjSQ3rSI+FVlIp0I1jAxssGW
	 kUawsXvK6ENe2L1/MctCD9pKWCZPKpDz7gLM4VF8UGbHZAjAiJ19bf9oAMBVUnQwJ4J2m
	 JWmU9hnrs8W2htjfkTrRRg//TWqN1kwh5za8b5ebq6HhO8t/GLQXjqis1G1bLGW7d5YGV
	 AhEsIqCROFi6X3sPdkCjfB3x0Ju4BSEODsiQDNRWWKkrEZqIiNRrpAe4wggH8YBhORatv
	 h8uWlWL81NzY7fvIZDy3BGg7uCZCk/44dvWk1iR/KR7tGJqMEzLyD554WYOTCnggrgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926152;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DUTntMFLiq6jmDgNXYwkRzUguppo4y+O9jg4Bo5aZxs=;
	b=1/1UpK2OzIiwHgvffwn5XbPNZA633KwwWTDgtOb2U4hT9KazqqDv+rNrWl5GQGHlnl49
	 QwrEX49TG8rWKmJDm7wR12iKvk8OkwOdGWkfPFTC8wvCtsYt3HhqpCLUEly8LqIvK5EON
	 3DtXwGfuMswbZSqmOavqfqPtjdN/d1aghZAtaZbYND8WF4z0Lm4ML4SGUA2076vH/g3Hy
	 V00BYHaR4qexhNCckICYVPFh7GYA0pQn/4C2O3l2+V8w7pAE/uPf3NrqvUd1HlwxZ6caE
	 tgQLFTKXiTGpKjri/YWYt37d8qlbRmtRivH+db/KIF7D3WkdbIpoKVpY80ebxLUwDmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hOcLwRLc;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387A606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C387A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hOcLwRLc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X/BOrxpdGVtIrlELLb4mt5982rZ+vUeqKfafd5dzS9g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792926148; v=1; x=1793530948;
 b=hOcLwRLcAvZjzFQCrySkN+65wjIEWd16wddHMsGgnzIfcURCjbZTW9pLQwNtVMfnOpyrleUK
 1+wzIAGYxolq7EBcoB/g2qA9lwzaQO8dSRg51uU1UwI07vxdwFkj5KrOw/xUtQ4udRX7bV3SdZq
 b+vdjwhbSYMTlZrkMbQK+zBA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eab13870e0a3ee80;
	Sun, 25 Oct 2026 11:02:28 +0000
X-Mizu-Trace-ID: eab13870e0a3ee80
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
Date: Sun, 25 Oct 2026 19:02:09 +0800
Message-Id: <20261025110209.4105994-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

When a page cache folio is migrated to another node,
__folio_migrate_mapping() moves the per-node and per-memcg counters
that are keyed off the folio's node: NR_FILE_PAGES, NR_SHMEM,
NR_SHMEM_THPS, NR_SWAPCACHE and NR_FILE_DIRTY.  NR_FILE_THPS is not
moved, although __filemap_add_folio() charges it to the source node and
filemap_unaccount_folio() takes it off whatever node the folio lives on
when it is removed.

Commit 0b52c420350e ("mm: fix shmem THP counters on migration") added
the NR_SHMEM_THPS case but not its file-backed counterpart.  Now that
ext4, xfs, btrfs and erofs can all have PMD-sized page cache folios,
migrating them via NUMA balancing, mbind(), migratepages, demotion or
memory offlining leaks FileHugePages on the source node and underflows
it on the destination, in both /sys/devices/system/node/nodeN/meminfo
and memory.numa_stat.  The global value is unaffected, which is why this
went unnoticed.

Reproducer, on a 2-node QEMU guest with THP set to "always":

  1. read a 256M ext4 file through a MADV_HUGEPAGE mapping while bound
     to node 0, so its page cache is 128 PMD-sized folios on node 0;
  2. move the mapping to node 1 with mbind(MPOL_MF_MOVE);
  3. unmap the file and drop its page cache.

nr_file_hugepages in /sys/devices/system/node/nodeN/vmstat after each
step (in units of PMD-sized folios):

                    without this patch     with this patch
                     node0     node1       node0     node1
  1. cached           128         0         128         0
  2. migrated         128         0           0       128
  3. dropped          128         0 (*)       0         0

  (*) the counter has underflowed to -128; negative values read as 0.

Without the patch the 128 folios stay accounted to node 0 forever, and
every further round adds another 128.  The same happens to the per-memcg
per-node counter: after step 3, memory.stat of the cgroup shows
"file_thp 0", while memory.numa_stat still shows
"file_thp N0=268435456 N1=0".  With the patch both are 0.

Move NR_FILE_THPS together with NR_FILE_PAGES, using the same condition
filemap_unaccount_folio() uses to take it off, so that THPs in the swap
cache are left alone.

Fixes: d68eccad3706 ("mm/filemap: Allow large folios to be added to the page cache")
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
Note: prepared with help from an LLM-based assistant (Kiro, claude-opus-5.5).

 mm/migrate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f..d55f576a2579 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -700,6 +700,10 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 				mod_lruvec_state(old_lruvec, NR_SHMEM_THPS, -nr);
 				mod_lruvec_state(new_lruvec, NR_SHMEM_THPS, nr);
 			}
+		} else if (!folio_test_swapbacked(folio) &&
+			   folio_test_pmd_mappable(folio)) {
+			mod_lruvec_state(old_lruvec, NR_FILE_THPS, -nr);
+			mod_lruvec_state(new_lruvec, NR_FILE_THPS, nr);
 		}
 #ifdef CONFIG_SWAP
 		if (folio_test_swapcache(folio)) {

base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

