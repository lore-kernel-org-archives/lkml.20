Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005813;
	b=vyLdbSGHqeciiFFY1jPXNvhhLhJpveV6bMtZU6gYPUPoA6mSpKl/S569j3LRzc+M94YT
	 +vf+i3v8MciaTkJJsRrKB1d6A0keERR3ywTSx+7hQ9s33bbBUXbRkE7ifQMZtwzkcdmDB
	 tJp8V6k5B3EGy8FfJkTJgdJ4MupDnj8SGdl9y0MoTvckjFp4Zv40TZ+ISyoDqhqobAq4j
	 lJ4i6ikv9htL1sLF8cU74YEJ/T06qj1ng1t0K85QWkG05MYjm2j7hixAqmpmen12LbM6P
	 vtoNhd2eljZ+4XS1diRfFcgfa2HLIRqffTEkAJ4RGc4nhufGkMXuuZw+juMRU7u4YKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005813;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IJCShxZcd5Lye/mgdSMJcV5l3GYpCC0DWWah+SYwQXc=;
	b=awmRRYyv8ymM+8BOlQVqfq1lMVhdVRB8nK+8uqlRHNTYgzFkYf4MFe41nf+e8iobE1iL
	 OSogQ/Z32mQ8byWmCkG8Ev0ww+gNUm5JTQrb2zY+EuFVvuVSS+8EKm2JpWQWX0n41m2m4
	 DPYJnPFed6rY9E4FtHtMRBoDvzGe0FfFeYb55brC3n/5xcqqyHCfQxiA10DjdBdwQoN3A
	 kxsjXILALjUyDCa9scOQgqQZg2T9ub0bKTHZ2f0Y9NE8aNWg9CGe7o29ePSLJVqyHnGIL
	 shurrCCMyRA2p+gBKcrPG15u7CaCKbjSQbNTbsK6T0Mim2gMeww2J54Uc03T+z0Vgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hs91eL7m;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72701606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72701606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hs91eL7m
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225649euoutp02081d9507cf18349fb9f5479529c0dcc1~llsdtJdgh0400204002euoutp02D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106225649euoutp02081d9507cf18349fb9f5479529c0dcc1~llsdtJdgh0400204002euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005809;
	bh=IJCShxZcd5Lye/mgdSMJcV5l3GYpCC0DWWah+SYwQXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hs91eL7mUpYnQeSAfRDH1Oq+s2tCrEuouC64XdTIwtASMPJBU1vza7uF0dRcjQG6l
	 q8P1PvEVI+KgJm8jIxpVYUtLd4PJWoFnMXODmdxhf/iAuu483uETIfBkdaposYWl//
	 td4bhQPxPNEGWQY5o4h/JjtfT26PjiqLggJxx2lE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e~llsdEb1b41955019550eucas1p2q;
	Fri,  6 Nov 2026 22:56:49 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225648eusmtip2ae191027336406180fa85101917bad82~llscVidfA2228922289eusmtip2Q;
	Fri,  6 Nov 2026 22:56:48 +0000 (GMT)
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
Subject: [PATCH/RFC 1/7] xtensa: write back dirty lines in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:21 +0100
Message-ID: <20261106225628.215319-2-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
X-EPHeader: CA
X-CMS-RootMailID: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e@eucas1p2.samsung.com>

arch_dma_prep_coherent() is expected to remove any dirty cache lines
covering the buffer, so that they are neither lost nor evicted later on
top of data written through the uncached alias or by the device.
xtensa implements it with __invalidate_dcache_range(), which uses the
DHI instruction and discards dirty lines without writing them back.

This loses data written through the cached kernel mapping right before
the call. dma_direct_alloc() zeroes the buffer with memset() on the
cached linear mapping and only then calls arch_dma_prep_coherent() and
switches to the KSEG bypass alias via arch_dma_set_uncached(). On cores
with a write-back data cache the zeroes still sitting in the cache are
dropped, and dma_alloc_coherent() returns a buffer with stale content.
The same applies to dma_direct_alloc_no_mapping(), which allocates the
pages with __GFP_ZERO before calling arch_dma_prep_coherent().

Use __flush_invalidate_dcache_range() (DHWBI) instead, which writes the
dirty lines back before invalidating them. On cores with a write-through
data cache it maps to __invalidate_dcache_range(), so nothing changes
there.

Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/xtensa/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 94955caa4488..e1c00ec37eed 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -82,7 +82,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	__invalidate_dcache_range((unsigned long)page_address(page), size);
+	__flush_invalidate_dcache_range((unsigned long)page_address(page), size);
 }
 
 /*
-- 
2.43.0

