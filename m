Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799595;
	b=r1cyn2ribp6XaMsAevj43TMdArr9JXadETLOvgN4fAWQCUXmiHcLQ8K7d0QYF9VjPmOv
	 BkAz7yOz5L6+NBB6x6Ak8XLiRaE+OkiHlrGhYZe9SC7Vee92KGjFPK6KCjhWrsNkd7c8W
	 2DzYZv08Pbya0eOIDGLMFtaS46etUVFEHaP9aTuKIXvDwDBJtK91EpukAOdEnlgoNKC+U
	 olOAr9OgIa81P5ZO2fhWguih9jlf5KIAwET5Hgz/bU1dCjfCIYq2RQ422XNvdIdXjXk4K
	 /VosU0um0g3cySEhnBftoO3K6EYyvIhx9XgGDNTssj10AJiLu6gkdC8mFT3kyKwDmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799595;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:DKIM-Signature;
	bh=IkhbWLUwIsHVA5qbkZd1FvDfizz0mbHSzrjJWS7856E=;
	b=FREhNVXUtPJOP//C0St3ho0AbfSBWlnzDnraZyfKVSXiB4dgkSnnpOfPtGqgcqHfQCsn
	 iZBzMXQmPd7QQ55hjjaJ/xLJxev496sgro54LSBvppLzH9GTTvX4GBIgztZsqNWKOnYji
	 keF1qR5yi/tafAXXDKgCpuvRuQ6UXVl+7FhAYdg3zBiJsnRnhfopOmp6e5gaYdiqQjwhP
	 sw5k2ZTmWKNEn638xjcJzfcxK1vF4TKdlGKNV1d6pk1b31uroB9gOwR6oOgPbgm3V5y9Z
	 ZwP+olpqvoxHfMXRL3I/kqlqM2/xmgFUhyuLC2EkhPOFUgyApGlxUIKhsyzhfHt7sIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=DEGrKpZp;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 71EA7606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EA7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=DEGrKpZp
X-MD-Sfrom: zhangyili01@baidu.com
X-MD-SrcIP: 172.31.51.15
From: Yili Zhang <zhangyili01@baidu.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <akpm@linux-foundation.org>
CC: <david@kernel.org>, <kas@kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <rppt@kernel.org>, Yili Zhang
	<zhangyili01@baidu.com>
Subject: [PATCH] mm/hugetlb: do not invoke the OOM killer when optimizing vmemmap
Date: Wed, 4 Nov 2026 21:39:38 +0800
Message-ID: <20261104133938.50974-1-zhangyili01@baidu.com>
X-Mailer: git-send-email 2.55.0
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
X-ClientProxiedBy: bjkjy-exc12.internal.baidu.com (172.31.51.12) To
 BJKJY-Exc19.internal.baidu.com (172.31.51.15)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1793799589;
	bh=IkhbWLUwIsHVA5qbkZd1FvDfizz0mbHSzrjJWS7856E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=DEGrKpZpvg+dC+n6PNW5iuA3y2vQTBc2UI/ca3IWigfKjgN6kEOaypSOh2vAfkb95
	 IlKnFbauvomSKB3e7iSq9xTg/En2KSi/Hw4tJYkCxmcoc+O4ndhpj6io8dT/aav2eK
	 9hxuMMAdLvbrj25g6/8uwEV59uIM5a8XujpN3Vjg1MFYeuR8jN5TK36EJ7g3vx7VRx
	 tzPsI2urySU2AKgzVhQh60nXCWdft7M89zQb+LmYmOqAoqT+g04iUkm8KmlfWB+eq0
	 QB4v5ziuWaFR9JBf4b8kh550dto7exx3qUiVc8GYMy/TuaMh1visMBS0ayeoGTlEMz
	 TOXb1ff+Je2DA==

Boot-time hugepage allocation is designed to drain all free memory and
let the vmemmap optimization reclaim vmemmap pages, so that more
hugepages can be allocated afterwards:
hugetlb_pages_alloc_boot_node() flushes the folios accumulated so far
once si_mem_available() drops to zero, and hugetlb_pages_alloc_boot()
keeps retrying as long as progress is being made.  The allocation is
parallelized with padata and runs on many threads at once.

The page that will back the new head struct page of a folio being
optimized is allocated with a bare GFP_KERNEL mask in
__hugetlb_vmemmap_optimize_folio():

	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);

Once the workers have consumed all free memory, this allocation enters
the OOM path.  During boot-time allocation, at the do_one_initcall()
stage, there are no user processes yet, so out_of_memory() finds
nothing to kill and panics:

  Out of memory and no killable processes...
  Kernel panic - not syncing: System is deadlocked on memory
  CPU: 74 UID: 0 PID: 1 Comm: swapper/0
  Call Trace:
    vpanic+0x32f/0x360
    panic+0x57/0x60
    out_of_memory+0x581/0x590
    __alloc_pages_slowpath.constprop.115+0x97d/0xed0
    __alloc_frozen_pages_noprof+0x303/0x330
    __alloc_pages_noprof+0xa/0x20
    __hugetlb_vmemmap_optimize_folio+0xa3/0x210
    __hugetlb_vmemmap_optimize_folios+0x190/0x230
    prep_and_add_allocated_folios+0x16/0x90
    hugetlb_pages_alloc_boot_node+0x152/0x180
    padata_mt_helper+0x5b/0xb0
    padata_do_multithreaded+0x294/0x3a0
    hugetlb_hstate_alloc_pages+0x2e1/0x3b0
    hugetlb_init+0x3b5/0x640
    do_one_initcall+0x49/0x200

Optimizing the vmemmap is best-effort by design: on allocation failure,
__hugetlb_vmemmap_optimize_folios() frees the vmemmap pages reclaimed
from the folios it has processed so far and retries once, and folios
that still cannot be optimized are put into the pool unoptimized by
prep_and_add_allocated_folios().  The worst outcome of a failure is a
higher vmemmap overhead and, as a consequence, fewer hugepages being
allocated (along with a warning) - waking up the OOM killer is never
the right thing to do here.  Note that the same code also runs for
runtime hugepage allocations, where an OOM invocation may kill an
unrelated process instead of failing the optimization gracefully.

The head page is a vmemmap page, and every other vmemmap page
allocation involved is prepared to fail gracefully:
vmemmap_alloc_block() - which vmemmap_shared_tail_page() also uses
to allocate the shared tail vmemmap pages - uses
GFP_KERNEL|__GFP_RETRY_MAYFAIL|__GFP_NOWARN, and
alloc_vmemmap_page_list() uses GFP_KERNEL|__GFP_RETRY_MAYFAIL.

Align it with the other vmemmap page allocations by using the same mask
that vmemmap_alloc_block() uses for vmemmap pages, so that a failure
returns -ENOMEM to the caller instead of going through the OOM path.

This was observed on a 384-CPU machine with ~1.5TiB of RAM booting
with a hugepages= reservation close to the total memory size and
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y, where the boot
panicked intermittently, depending on how the parallel allocation
workers interleaved.

Fixes: c0b495b91a47b ("mm/hugetlb: refactor code around vmemmap_walk")
Signed-off-by: Yili Zhang <zhangyili01@baidu.com>
---
 mm/hugetlb_vmemmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..3a759b930ed9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -499,6 +499,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 {
 	unsigned long vmemmap_start, vmemmap_end;
 	struct page *vmemmap_head, *vmemmap_tail;
+	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -525,7 +526,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
+	vmemmap_head = alloc_pages_node(nid, gfp_mask, 0);
 	if (!vmemmap_head) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.27.0

