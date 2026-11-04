Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793767421;
	b=BI9/t6AnIt1qDRsQPTeywxruyHGuGMFtedXyFcWwu6XhjjuzHqb+5eT+qzGW8BV7Bw3Q
	 DKu6Bi9x6mRqgwIzNVopLh7vU52BUPMtp9tvz8q3WEbZ7l5er9XA2YIs/witDw8Ej/0jS
	 glaz4EFHBDPHnlCg33fSeUSJa9owKPBFD8Udw/iCu7ubThkAhFEudCok+viJLd/2PSgOW
	 KlbWU0RI2crZjkHzUIqhfre9CT2dFia8Z9r9mONkx4t/i0x/0DzDQ2i+6zgzBszdeGaOk
	 O4mvf4T7AT+OthXDaS63KJxkX+D5MR5YHYUXW43Wc2F3Q4e6T2TDBf3mtqYm6QiqMKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767421;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0XUH0gtcoBkKHqosi+5P+/MTmOyV/YGt88UhPIW631g=;
	b=LkaRnEu3rJO4Sk9EYZocYEC2edu84bxIpJbV1IEcl19+o8bB4YGXrAMyyZ2ksdjBTMfg
	 7k/OTnk1Pq/GOjQZsVMHDy6C3YzVfP27EYCSUiZRY9MFoufQoPRBe9/C4XgJiwBF4p+DF
	 zCTyIUBafrsUTWvr4rYL9rVtCTNzVnm12/exe3KI+owVphNKzsZX+x8llCvrKt18QWMf9
	 kFI2yusIv3bvc6Bk8q8otXcIEEvOz41hmU4ONQBLOqxbN4OKonB+PZe1QuTm/62WIwvwH
	 rqV7XeOEiqwD5iD/K2cMyr52PJpQDLS2fRYgJy8AN7gShWc12DddR7sB5VPCf9UFk6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5432B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 458b71ced80a11f19a56ed5b684f684d-20261104
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3bee2e0e-85ff-4d58-b4e0-87a722846bee,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.19,REQID:3bee2e0e-85ff-4d58-b4e0-87a722846bee,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:7db8b62,CLOUDID:405f2c5e7313ce50f402ddafb8778941,BulkI
	D:261104124328VBS4EI1E,BulkQuantity:0,SF:17|19|38|66|78|102|127|153|865|89
	8,TC:nil,Content:0|15|50|99,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 458b71ced80a11f19a56ed5b684f684d-20261104
X-User: husong@kylinos.cn
Received: from ctao-book [(114.244.3.119)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1016848686; Wed, 04 Nov 2026 12:43:25 +0800
From: Song Hu <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	willy@infradead.org,
	shivankg@amd.com,
	ridong.chen@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
Date: Wed,  4 Nov 2026 12:43:12 +0800
Message-ID: <20261104044313.2099309-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.53.0
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

NR_FILE_PAGES lives on both the node and the memcg plane for page
cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
it to the folio's node and memcg, while __swap_cache_add_folio() and
__swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
memcg file accounting when swapped out, and anon folios never had any.

The cross-zone arm of __folio_migrate_mapping() moves NR_FILE_PAGES on
both planes unconditionally.  For swapcache folios the memcg plane is
empty, so migrating one misaccounts it: the destination accrues
nr_pages that were never accounted there while the source counter
underflows.  The wrong counts persist until the memcg is destroyed,
but the aggregate in memory.stat stays correct, so the drift is easy
to miss.  NUMA balancing, migratepages, compaction and memory hotplug
can all migrate such folios.

Reproducer, on a 2-node QEMU guest with cgroup v2:

  1. create a cgroup with memory.max = 50M and swap enabled;
  2. memset 128M of anonymous memory in it, so reclaim swaps most of
     it out;
  3. fork to raise the swap entry refcount, then fault the memory
     back in, so the resident folios are swapcache ones;
  4. migrate_pages(pid, node0 -> node1).

"file" row of memory.numa_stat (bytes) after step 4:

                    without this patch      with this patch
                      N0          N1          N0          N1
                     0 (*)  51691520         0           0

  (*) the source counter has gone negative; negative values read as 0.

Keep moving the node plane via mod_node_page_state() and skip only
the empty memcg plane, mirroring the swapcache exclusion the NR_SHMEM
handling in the same block already applies.  It accompanies
commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node migration")
and commit c5eef2e03618 ("mm/migrate: move NR_KERNEL_FILE_PAGES on cross-node migration").

Fixes: 0d1c20722ab3 ("mm: memcontrol: switch to native NR_FILE_PAGES and NR_SHMEM counters")
Signed-off-by: Song Hu <husong@kylinos.cn>
---
 mm/migrate.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735..bc60f6587d1b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -690,8 +690,20 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 		old_lruvec = mem_cgroup_lruvec(memcg, oldzone->zone_pgdat);
 		new_lruvec = mem_cgroup_lruvec(memcg, newzone->zone_pgdat);
 
-		mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
-		mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
+		/*
+		 * Swapcache folios carry NR_FILE_PAGES on the node plane
+		 * only (their memcg footprint is NR_SWAPCACHE, see
+		 * swap_state.c), so move only the node plane for them.
+		 */
+		if (folio_test_swapcache(folio)) {
+			mod_node_page_state(oldzone->zone_pgdat, NR_FILE_PAGES,
+					    -nr);
+			mod_node_page_state(newzone->zone_pgdat, NR_FILE_PAGES,
+					    nr);
+		} else {
+			mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
+			mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
+		}
 		if (folio_test_swapbacked(folio) && !folio_test_swapcache(folio)) {
 			mod_lruvec_state(old_lruvec, NR_SHMEM, -nr);
 			mod_lruvec_state(new_lruvec, NR_SHMEM, nr);
-- 
2.53.0

