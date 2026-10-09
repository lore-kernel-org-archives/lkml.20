Received: from mta1.migadu.com (out-143.mta1.migadu.com [95.215.58.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2644C4FF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527769; cv=none; b=QtgRYHE4pNWfxLg0Q22zMJ60X/xozqnyvn7qf/5yxIdAPriFt/RIlLa8UIPH4+shQX8idi+8YMgDe4rphaAuYWjhp1ud8I/4oUMmfP/O2wJU76surzpsiqfVWDEouENNjGZGkj2+yhVWVsV5h+lqptP4pvw3CwelWdrV6dbYN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527769; c=relaxed/simple;
	bh=Lh2LMrtSYDDnCgnAv7ysw9EHYWIC+fUbykvCTSebHms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jWQ+DBtgc/LMjuv6L/TKjrdSRm8A6HxUIy4sw9NjZrzvUYxK1HAyCaXu9teWky5gYdJ6/S+oYDAGeLVQ9neSntAf16ZiYDGJMX1Mj8cK85V9z2SJ36ultpaSgowqAS3Z02nGxJrscqBu4NE7A7ZpHPpjDwzmNdbCNiDwXr2pggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=namjizhP; arc=none smtp.client-ip=95.215.58.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="namjizhP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Lh2LMrtSYDDnCgnAv7ysw9EHYWIC+fUbykvCTSebHms=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791527765; v=1; x=1792132565;
 b=namjizhPyYvj8AmyunUzLnhmSOznkMMx52v0vH2cDMD2zl2bZvwPfDlzgTyXP7aHZH6x2TkB
 84qSrfZMOBc/hCzdQ12u3E7O98vYj1Uo+lOiKHBN2N2CZh91eLR/grg1ukE2aN3fYFL83ReEsYz
 vxUJP3sVSl5kKK3kO9sXCh+E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf8d544524139af5;
	Fri, 09 Oct 2026 06:36:05 +0000
X-Mizu-Trace-ID: bf8d544524139af5
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFC PATCH 2/4] mm/vmalloc: undo partial mappings inside the mapping functions
Date: Fri,  9 Oct 2026 14:36:17 +0800
Message-Id: <20261009063619.112313-3-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009063619.112313-1-hao.ge@linux.dev>
References: <20261009063619.112313-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vmap_pages_range_noflush() and friends can install some PTEs before
failing and leave them mapped, and the kernel callers do not agree on
who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
roll back what they mapped before the failure, while
vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
__vmalloc_area_node() rely on the mapping functions cleaning up and
do not call anything like vunmap_range() themselves. When the same
range is mapped again, the attempt hits the leftovers and fails, with
a BUG() in vmap_pte_range() for huge mappings and a warning on the
small-page path.

After discussing with Suren and Ulad, we decided to put the rollback
into the entry points of the vmap API rather than into every low-level
helper. __vmap_pages_range_noflush() undoes the whole range it was
asked to map when it fails, and vmap_page_range() undoes its range
for the ioremap-style mappings.

The rollback is __vunmap_range_noflush(), it only clears the PTEs,
no TLB flush, nothing has touched these mappings.
vmap_pages_range_noflush() drops the KMSAN metadata when the data
mapping fails, and an empty range bails out with -EINVAL now, which
used to BUG_ON() on the small-page path and map nothing at all on
the huge-page one.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Suggested-by: Uladyslau Rezki <urezki@gmail.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index db669103dc66..e1b376f57dd2 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
+	if (err)
+		__vunmap_range_noflush(addr, end);
+
 	return err;
 }
 
@@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned long start = addr;
+	int err = 0;
+
+	if (WARN_ON_ONCE(addr >= end))
+		return -EINVAL;
 
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
-
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+			page_shift == PAGE_SHIFT) {
+		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
+	} else {
+		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
 					page_to_phys(pages[i]), prot,
 					page_shift);
-		if (err)
-			return err;
+			if (err)
+				break;
 
-		addr += 1UL << page_shift;
+			addr += 1UL << page_shift;
+		}
 	}
 
-	return 0;
+	/* Undo the PTEs installed before the failure. */
+	if (err)
+		__vunmap_range_noflush(start, end);
+
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -715,7 +726,16 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (ret)
 		return ret;
-	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+
+	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+	/*
+	 * The page tables undo themselves on failure. Tear down the
+	 * metadata that was fully set up before the mapping failed.
+	 */
+	if (ret)
+		kmsan_vunmap_range_noflush(addr, end);
+
+	return ret;
 }
 
 static int __vmap_pages_range(unsigned long addr, unsigned long end,
-- 
2.25.1

