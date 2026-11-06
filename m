Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005813;
	b=4h7gzdgQP09ulgJQM5CjaArowwnvKf1dlpq8X8KzA6wLXEEfsjQhau9+Qb1gg3PmkRmP
	 kGippAU1eDNGIManzFZ59WnZdhoTD/McGwQtnCJwOPofFfJSoCkWMDVncrPU6OGYbG0Ia
	 nMKwoGgyaIsO24+dtSWwWmgwObhD74GCtK3j3tk6sDHuPl7s9zcPfYKvgFWbB6+Ixp5Rw
	 m38F+BSFMXN0lc94VgncaE6hKler7FHKoopprK6U41bDogGKbJYrfBv2cnTGleATLC4Pm
	 2GaUQVOjuOx/psnBS2kjtMdeds11t0H3wfV7v/ORbX5fKm3z1AaHr2OH/KvOlCu/1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005813;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=rEjQMrO5ewCoTXLRmyADdnQOxAz7KvPx22hj0G2OEWE=;
	b=iUNrJ7k1+PIxh8eanxOy0E3I2egh0Xn1y8CDyMY2caTea0lD+sLj8uzL89csoU7E0q70
	 iJAMT6OqFCKpp732PBW+vHjV7uIxNiOl1O7sVinLafQCXpAxanDV1m1cueYVMCSq6ZrP7
	 Fb9rRMBxP/g89IjCwzXjxXgpwzFXlEr9kQkINsAtXw/p+gaAc+/qE0INUZdTmwycf8gMk
	 /A5djvdST1aGDm3PM3u4nYqb6u/CdT4liqOPSQin+nwcW4cBk74wCyRTC1VXQ1qmyhH3Y
	 +CU/0WWpFk9am/mrbM1p8gr0IOe4+RUlqZPk2tB8B5O/RLAzu8DyD2+V1v/FbGXF93A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cnwRAsDb;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077B606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E077B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cnwRAsDb
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225651euoutp01218ef25aeb8df2f7cb98433cf1023eea~llse9djNG1319913199euoutp01G
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106225651euoutp01218ef25aeb8df2f7cb98433cf1023eea~llse9djNG1319913199euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005811;
	bh=rEjQMrO5ewCoTXLRmyADdnQOxAz7KvPx22hj0G2OEWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cnwRAsDbfQodfRV+dGuyCLgl/KPD1Qb7rVPFOIwDyscaEbVw04KOuTNzy7FZsQRJb
	 vhqq3s2G8htcNxWo5BAjyrro6JMsbahD5hB541L7OOsO+52gcm1hw7s1DTuQcMIK1t
	 zDIZs8FBmVL7SFRN2o2FOyBPa0qX3yBjwoTcma50=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106225650eucas1p1ad152cf3818ff46576dca66fd621fd88~llsd8zuvu0802308023eucas1p1k;
	Fri,  6 Nov 2026 22:56:50 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225649eusmtip239656e1f8ac679e08020682c261bdc3f~llsdKFY8d2228922289eusmtip2R;
	Fri,  6 Nov 2026 22:56:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH/RFC 2/7] xtensa: handle highmem pages in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:22 +0100
Message-ID: <20261106225628.215319-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106225628.215319-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225650eucas1p1ad152cf3818ff46576dca66fd621fd88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225650eucas1p1ad152cf3818ff46576dca66fd621fd88
X-EPHeader: CA
X-CMS-RootMailID: 20261106225650eucas1p1ad152cf3818ff46576dca66fd621fd88
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225650eucas1p1ad152cf3818ff46576dca66fd621fd88@eucas1p1.samsung.com>

arch_dma_prep_coherent() performs the cache maintenance on the address
returned by page_address(). xtensa with CONFIG_HIGHMEM uses
HASHED_PAGE_VIRTUAL, so page_address() returns NULL for a highmem page
that is not kmapped, and the cache operation then works on the virtual
range starting at 0 instead of the buffer, leaving any dirty cache lines
of the buffer in place.

Highmem pages do reach this function: dma_alloc_contiguous() can return
a highmem CMA page, which dma_direct_alloc() handles by forcing the remap
path and calling arch_dma_prep_coherent() on that page before creating
the uncached mapping.

Fix this by reusing do_cache_op(), which the arch_sync_dma_for_*() hooks
already use and which maps highmem pages one page at a time with
kmap_atomic(). For lowmem pages it does a single cache operation over
the whole range, so the behaviour is unchanged there. A small wrapper
is needed because __flush_invalidate_dcache_range() is a macro on cores
with a write-through data cache.

Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/xtensa/kernel/pci-dma.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index e1c00ec37eed..41467a1ba068 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -80,9 +80,19 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 	}
 }
 
+/*
+ * __flush_invalidate_dcache_range() may be a macro on cores with a
+ * write-through data cache, so it cannot be passed to do_cache_op().
+ */
+static void flush_invalidate_dcache_range(unsigned long start,
+					  unsigned long size)
+{
+	__flush_invalidate_dcache_range(start, size);
+}
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	__flush_invalidate_dcache_range((unsigned long)page_address(page), size);
+	do_cache_op(page_to_phys(page), size, flush_invalidate_dcache_range);
 }
 
 /*
-- 
2.43.0

