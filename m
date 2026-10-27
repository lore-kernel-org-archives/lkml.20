Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075555;
	b=PhZvtnvnTLSf4d+BnwcqXiwGWwTd6hrN1FLZml3ET/5WRPLH98psPvn6LWAtPYB7kCGY
	 I1dxAwk9vPsZ/AGyhibkh5o99RrtydMIkLDeW3Xr7nS6/SJFtwaDHydGd6isrJqtv9Gjc
	 aZ2jK++yk96lNYXlY3AQtPmjdPkscnPaJn1PmQdPfY+jCPgMxluFv15KaQbHoP726cP0B
	 EAtz3g/imUbFxQm598wLzX180pTp+WAmFjWFwss77xWHTn0GkqiymCwzLwkrzbQzrhJve
	 MkfUGasxT7y4BxWNC2WYYbVzH8qj0MFOcPdrOdJwUcL1gmyinXaJmIlEBN4metlVKFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075555;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2ND1QfRhZdF2pJbYoRVTOMDw2ymU46dc6kpoYJ7tzKI=;
	b=IVvmEja0uhwwBKaordD0Xk6X0DpHZlT+8a6UVJnLa7VtrmScqM8cBg6mMTyyC5b19ldH
	 38bQt8lBOynI1LEMJD1WMi+JGIfL6vu9tuxIvymuF6X903kBAR6TUuv0NuzKwhae6DOvx
	 M1SNJRk2MYYDJHYxvIB+1Bdn1Bi0uwmh1AY73X6AjRULGW08joqETRAl5KsGTQxmLf7kS
	 OeZpq9OF8dbR/15xxWo25rdqIAWUmRmtktRdzg5Tih4YG+lAU8yIVfNZK5JkAwEguh1ib
	 oM0M87VgC8doXXQW0C+859RBDnsKJfu+rSAigsxFBKNdkv9979hIaisPfY4c+JbZVUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.98
Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E32F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wNnZLpM737A1LQh3vzOkr5Ug8cYkUYuQ4aBQwWDDyhI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793075551; v=1; x=1793680351;
 b=YgSp1vpeZSpbihhKZuDfRAd0siFBwwfzMHG4036HqsfxcmaXXMANdlZvaSFIPGbVdjFjLq0y
 YDQuWLLWDSENb5//B8qCJ8aYtml7A2zrmRoSbU4rwVUe9zjmSW4Hz8qHYes4YGXww+VN9qPrza/
 T8hVoojbMllFBBHZD7JiREDI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f40ffff1fc2cc39b;
	Tue, 27 Oct 2026 04:32:31 +0000
X-Mizu-Trace-ID: f40ffff1fc2cc39b
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
	Boris Burkov <boris@bur.io>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Shivank Garg <shivankg@amd.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on cross-node migration
Date: Tue, 27 Oct 2026 12:32:14 +0800
Message-Id: <20261027043214.2248986-1-ridong.chen@linux.dev>
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

NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
being removed.

__folio_migrate_mapping() does not move it when such a folio is
migrated to another node, so the source node keeps the count forever
and the destination node underflows once the folio is freed.  btree
folios are migratable through btree_migrate_folio(), so demotion,
DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
all hit this.

Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
all CPUs, node1 is a CPU-less slower node described via HMAT) and
/sys/kernel/mm/numa/demotion_enabled set:

  1. mount a btrfs and create 20000 empty files, so that btree folios
     are cached on node0;
  2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
     them to node1;
  3. umount and drop caches.

nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
each step:

                  without this patch     with this patch
                   node0     node1       node0     node1
  1. cached         1868         0        1868         0
  2. demoted        1868         0          36      1832
  3. dropped        1832         0 (*)       0         0

  (*) the counter has underflowed to -1832; negative values read as 0.

The global value in /proc/vmstat is 0 after step 3 in both cases.

Move it together with the other node-keyed page cache counters.  It is
a node-only counter, so use the node accessor, matching how it is
accounted elsewhere.  Interrupts are disabled here, as for the zone
counters below.

This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
for the same function.

Fixes: e3a9ac4e866e ("mm: add vmstat for kernel_file pages")
Suggested-by: Shivank Garg <shivankg@amd.com>
Assisted-by: LLM
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 99e3026e3126..f829c5017c96 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -705,6 +705,12 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 			mod_lruvec_state(old_lruvec, NR_FILE_THPS, -nr);
 			mod_lruvec_state(new_lruvec, NR_FILE_THPS, nr);
 		}
+		if (test_bit(AS_KERNEL_FILE, &mapping->flags)) {
+			__mod_node_page_state(oldzone->zone_pgdat,
+					      NR_KERNEL_FILE_PAGES, -nr);
+			__mod_node_page_state(newzone->zone_pgdat,
+					      NR_KERNEL_FILE_PAGES, nr);
+		}
 #ifdef CONFIG_SWAP
 		if (folio_test_swapcache(folio)) {
 			mod_lruvec_state(old_lruvec, NR_SWAPCACHE, -nr);
-- 
2.34.1

