Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451755;
	b=NK/ZvLGZ2SzO+buQYqCzMEEMoFToVu93gbQqlq5ZKTVHm+lwdVV2WWLA6pd9CfzOxeSv
	 htABhpAALAFqNTULDKYsB0C6zy+du9AEQAH6vzddDSYg1G/RsxzTtc99t8TL3AS4ox/Re
	 9wtTzfTyNiorH32FKDJNY4KH6U8x8tQYgOYwdC867qPJyB5bAfiJ2ka26bMO0bN2X/Xat
	 0QlsjlOFgZ6t0GgM37nqp3+Ey1ZSumU7fOg5kYO2CEjF5UaxUs1PePatuRJONidv7B7I5
	 jM923kr1mf+NIPTRHRi5fJfRO1bCxImV0a4bbUy6hed8Aqm0Q7/0mRs+q82Dkx8PcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451755;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=3jxx6XwLUZhN+7SC2e3PbpaWgo2qbe+sSwZpVT16d+w=;
	b=kkkoRMZtU1vnpIT6QoArrhgLaUuApRU/01B5uYgtX4bV1C66lY/7SeYbtl2oszMurMEt
	 6gaLUpXEltnTIbimzHpgG5SZI7au1d7qUroShqb6D6Y8JulIQUtDKaLVICdU9g5qEXcn/
	 SagSNHABcFYYRe47wKD4A4bmbZSh5z9qtTUeKb/rCNxW3WpNTaY7E9Q0MR4SNyiEZNJUR
	 rpv8JJNkYpG1EzKg5rNMjJVzIGUO6OYcg8bubl8Y9KMi0nIQIIXkTG6VSeTo/X7chNsj4
	 ixwQLGX4ZeYnjmkxTlNNTrkcV4g68XOVCW9zKWnV1Cbs3FvKUg7QieBFm5m0gRbK+sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D17606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9faca40ede4311f19a56ed5b684f684d-20261112
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1f9e1992-d73e-4b86-959b-ef39861e5e9d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:8,RULE:Release_Ham,ACTION
	:release,TS:18
X-CID-INFO: VERSION:1.3.19,REQID:1f9e1992-d73e-4b86-959b-ef39861e5e9d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:8,RULE:Release_Ham,ACTION:r
	elease,TS:18
X-CID-META: VersionHash:7db8b62,CLOUDID:13ee854e5e4b08c93db70135f9bf0105,BulkI
	D:261104235446MKEMRFZO,BulkQuantity:10,SF:17|19|64|66|78|80|81|82|83|102|1
	27|153|817|841|865|898,TC:nil,Content:-10|-8|-5|14|50|99,EDM:-3,IP:-2,URL:
	0,File:nil,RT:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,
	TF_CID_SPAM_FCD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9faca40ede4311f19a56ed5b684f684d-20261112
X-User: husong@kylinos.cn
Received: from ctao-book [(114.244.3.119)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1998482028; Thu, 12 Nov 2026 10:49:04 +0800
From: Song Hu <husong@kylinos.cn>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	apopple@nvidia.com,
	byungchul@sk.com,
	gourry@gourry.net,
	husong@kylinos.cn,
	joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	matthew.brost@intel.com,
	ridong.chen@linux.dev,
	shivankg@amd.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
Date: Thu, 12 Nov 2026 10:48:55 +0800
Message-ID: <20261112024855.424402-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <67275d3d-cc60-406c-a088-298b948d7577@kernel.org>
References: <67275d3d-cc60-406c-a088-298b948d7577@kernel.org>
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

> On 11/10/26 04:09, Zi Yan wrote:
> > On Tue Nov 3, 2026 at 11:43 PM EST, Song Hu wrote:
> >> NR_FILE_PAGES lives on both the node and the memcg plane for page
> >> cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
> >> it to the folio's node and memcg, while __swap_cache_add_folio() and
> >> __swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
> >> the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
> >> carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
> >> memcg file accounting when swapped out, and anon folios never had any.
> >>
> >> The cross-zone arm of __folio_migrate_mapping() moves NR_FILE_PAGES on
> >> both planes unconditionally.  For swapcache folios the memcg plane is
> >> empty, so migrating one misaccounts it: the destination accrues
> >> nr_pages that were never accounted there while the source counter
> >> underflows.  The wrong counts persist until the memcg is destroyed,
> >> but the aggregate in memory.stat stays correct, so the drift is easy
> >> to miss.  NUMA balancing, migratepages, compaction and memory hotplug
> >> can all migrate such folios.
> > 
> > It would be better to simplify the above like Joshua suggested.
> > 
> >>
> >> Reproducer, on a 2-node QEMU guest with cgroup v2:
> >>
> >>   1. create a cgroup with memory.max = 50M and swap enabled;
> >>   2. memset 128M of anonymous memory in it, so reclaim swaps most of
> >>      it out;
> >>   3. fork to raise the swap entry refcount, then fault the memory
> >>      back in, so the resident folios are swapcache ones;
> >>   4. migrate_pages(pid, node0 -> node1).
> >>
> >> "file" row of memory.numa_stat (bytes) after step 4:
> >>
> >>                     without this patch      with this patch
> >>                       N0          N1          N0          N1
> >>                      0 (*)  51691520         0           0
> >>
> >>   (*) the source counter has gone negative; negative values read as 0.
> >>
> >> Keep moving the node plane via mod_node_page_state() and skip only
> >> the empty memcg plane, mirroring the swapcache exclusion the NR_SHMEM
> >> handling in the same block already applies.  It accompanies
> >> commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node migration")
> >> and commit c5eef2e03618 ("mm/migrate: move NR_KERNEL_FILE_PAGES on cross-node migration").
> >>
> >> Fixes: 0d1c20722ab3 ("mm: memcontrol: switch to native NR_FILE_PAGES and NR_SHMEM counters")
> >> Signed-off-by: Song Hu <husong@kylinos.cn>
> >> ---
> >>  mm/migrate.c | 16 ++++++++++++++--
> >>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/migrate.c b/mm/migrate.c
> >> index 28a8d7734735..bc60f6587d1b 100644
> >> --- a/mm/migrate.c
> >> +++ b/mm/migrate.c
> >> @@ -690,8 +690,20 @@ static int __folio_migrate_mapping(struct address_space *mapping,
> >>  		old_lruvec = mem_cgroup_lruvec(memcg, oldzone->zone_pgdat);
> >>  		new_lruvec = mem_cgroup_lruvec(memcg, newzone->zone_pgdat);
> >>  
> >> -		mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> >> -		mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> >> +		/*
> >> +		 * Swapcache folios carry NR_FILE_PAGES on the node plane
> >> +		 * only (their memcg footprint is NR_SWAPCACHE, see
> >> +		 * swap_state.c), so move only the node plane for them.
> >> +		 */
> >> +		if (folio_test_swapcache(folio)) {
> >> +			mod_node_page_state(oldzone->zone_pgdat, NR_FILE_PAGES,
> >> +					    -nr);
> >> +			mod_node_page_state(newzone->zone_pgdat, NR_FILE_PAGES,
> >> +					    nr);
> >> +		} else {
> >> +			mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> >> +			mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> >> +		}
> > 
> > Like Joshua said in another email, it will be more readable if
> > NR_SWAPCACHE updates can be moved into the then branch above.
>
> Can one of you write me the updated patch description? Thanks1

Sure. Here's an updated commit message incorporating Joshua's
suggestion to describe the accounting model first and then explain why
migration gets it wrong.

mm/migrate: don't move memcg NR_FILE_PAGES for swapcache

NR_FILE_PAGES is accounted on both the node and memcg planes for page
cache folios.  Swapcache folios are the exception: they keep
NR_FILE_PAGES only on the node plane, while their memcg accounting is
tracked as NR_SWAPCACHE.

The cross-zone path in __folio_migrate_mapping() currently migrates
NR_FILE_PAGES through mod_lruvec_state(), which updates both planes.
This is correct for normal page cache, but wrong for swapcache folios
because there is no memcg NR_FILE_PAGES state to move.  As a result,
migration incorrectly increments the destination memcg counter and
decrements the source one, leaving the per-memcg accounting incorrect
until the memcg is destroyed.

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

Fix it by updating the node accounting directly for swapcache folios
while leaving the nonexistent memcg NR_FILE_PAGES state untouched.
Non-swapcache folios continue to use mod_lruvec_state(), preserving
the existing behaviour.  This mirrors the existing swapcache handling
for NR_SHMEM in the same block.  It accompanies
commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node
migration") and commit c5eef2e03618 ("mm/migrate: move
NR_KERNEL_FILE_PAGES on cross-node migration").

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Song Hu <husong@kylinos.cn>

Thanks to Joshua and Zi for the helpful reviews.

Thanks,
Song
