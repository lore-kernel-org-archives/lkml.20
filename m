Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE53C5DC3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597738; cv=none; b=JGfrrm5iPVgM/YnTQaUKO7YNHKmLsvKJBd6mnwLWSab8/B9BKzKYLCAxO8u+qzkPYhwWerC1SaL27ZF7DF5dBcABYzXW8Hzzr9N0EYKKrzvv0IR3RJKusipJcINrrU+y2pbBpoB79e5P6aFV8yqLAsHATJZl1RmNDN6JmkkAVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597738; c=relaxed/simple;
	bh=9j6NYG0hkRG6PdUmh1zEaxVWk06YE1JQZ514CGCZKkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMq+A8XItIF/yVgfOw8VshtDittGlgM5omEpKf2Bw2YL2GzGmdwwmtkK1D/uJRR9ud7umTLzSfb4wwrM+GOu68JRI6wgSR+PuUUnVc+UIf4vIJwl/sZTv+pMZ3yBybc1/r6hg3VFzsmjuCTeD+eappCUwn0YkmcFKr77qns4e5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJnKMGXg; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJnKMGXg"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2102833a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597735; x=1789202535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VobeyYxIxVOojjPHLkwwdR8KDg6vnqQTELSH5lLU28=;
        b=kJnKMGXgQXUk3UznzxtffWTr1ihEsZvnCJfKOpn0M7Nfa20sf4NkfsNBDMZr04QhR5
         P4F8Dd8Q+s0EN0msLAWO0w9+XV1C1Ur+sPyVVohe2P6pNxX2Ou5XHikPy6n1B9mEe+3R
         9fny0b70X2PeV2xMFOSIov0qKVinXnIedCfSpf4g6rs7Cq91K0+EWSlwTMZhXn/Zmmpy
         Urxax1maoB+gzR8QBM5a4AqREzACx109kRmCspfvOU2ZM4skxiadO+j1ZGCbxK6aa+PZ
         Bsz9rL8RvsD7VQhHd0Ha2Ex3ZOVoTmomA2h6PaSvh+5JmT0gnr/LTXE0lobisgzfNhEM
         C80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597735; x=1789202535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VobeyYxIxVOojjPHLkwwdR8KDg6vnqQTELSH5lLU28=;
        b=sw06ZwdAfn/TyyA5//nd1bNskllBy7SojcvqhR6dzTJyUFcbF1z98SRsYrxrQfhgs/
         7iGgvo2i6DDdFuYs29VaptL+//56PyDG+3kofC4N31raLEEjdrspn0AgNvJeOCa0ljMs
         YcZ4aDIN5e59+TtmwrJvazVRiBPaHdXn9OpZZuW4ZYcc77Clivyfo/o1LcUjFlB63SpI
         K3FEVI80Mm9G7lX1fRFGflZGgBE/XbSZLGDwe/gBEzCnF24Bht9pEMoQGOsLqoRz1Ewj
         qlfYEOlbcwiNQiIBFWoLh05Wfh3C3R2uqpi2+A2DeFooLI4zOS0WNL5GlJPuBx0a/o/L
         5boQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjMBUOwuPP9PoH+T5ZvLbW18cItFvv1BJeFYuKKdbn5tosNkV+goiIm3Da9i2NtwcIMj8qWHIMOoD+G0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kbOvhwN1U7DGCiYSADEAq9cCQeTY3np44dwyU+uTRlEX43DV2x
	coNl6S/GnZ2xv5upwpOVu1xwD5peY/4/Ji+VFbb5ifOj3rEmmdObyYI=
X-Gm-Gg: AYBFou0MV5wRPJvqHA604luY5WxYVbrL1jn0DdXf/VDdD3OfGAXvka3hB1YO2Trr4PO
	/5XBysQGecJmzeYpZi0ELrXBmemQPXQIovGUMgKmj+5qFYZx3O9mzSdIkc5Wr8QJecytY/SIpuF
	kpHza/clkFHUm4ayp+iG5z5LkIlm+UZU3R41oqVO3NATp1GViyyH6oWF+Ck4cZhV7DsBddcehsZ
	KzdNKgJ+//vQo1K4Vw3RoK6mVAe24toDOs+TEHIIb5eizk9OU+lXSALFHjr0nGIIJTvsDWjm+bf
	2iCzAV8XN7cozjDC12eVaf+UtQYeQZ0NYlzy8LOG0gmSE3WEm++QCyK9JPYLYhhp+LecA0y0mmx
	vEJOuCmCMHxLadJ+ZGLIbYobuLNLg+UKZ/iUWerGU5xajNtSCR4ErI7/hsNTzU4tFlEXP164z1J
	MejI/mxG/bIItuwW/gHdU3f74+0rJsadwqpMlrS3y0jZL+vXayyEERlsqWsOtTbD52hpRi6Hy96
	Ol2tajysIoB+w==
X-Received: by 2002:a17:90b:4d91:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39b27c42b89mr7855112a91.4.1788597735226;
        Sat, 05 Sep 2026 01:42:15 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm9079660a91.2.2026.09.05.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:42:14 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Chanho Park <chanho61.park@samsung.com>,
	Bumyong Lee <bumyong.lee@samsung.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] swiotlb: use the adjusted address for the highmem page lookup
Date: Sat,  5 Sep 2026 17:42:10 +0900
Message-ID: <20260905084210.148255-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

swiotlb_bounce() reads the page frame number from the slot's recorded
orig_addr, then advances orig_addr by tlb_offset to reach the address
the caller asked about. The highmem branch mixes the two: the offset
within the page comes from the adjusted address, the page from the value
before it.

Once the adjustment crosses a page boundary the pair no longer describes
one location, and the whole copy lands one page below the intended one
for a positive tlb_offset, one above for a negative one. DMA_FROM_DEVICE
writes the device data over the wrong page and leaves the intended one
stale, DMA_TO_DEVICE feeds the device from a page the mapping may not
cover. Partial syncs through dma_sync_single_range_for_*() are what make
tlb_offset non-zero.

The branch test is picked the same way, so a slot recorded in lowmem can
be adjusted into highmem and the lowmem path then hands a highmem
address to phys_to_virt().

Take both from orig_addr once it is final and keep pfn in the branch
that uses it. PhysHighMem() asks the question straight from the address,
as dma-debug already does.

Fixes: 5f89468e2f06 ("swiotlb: manipulate orig_addr when tlb_addr has offset")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Reproduced under QEMU (qemu-system-arm -M virt, 2G) with a 32-bit ARM
kernel built from multi_v7_defconfig plus CONFIG_ARM_LPAE=y and
CONFIG_HIGHMEM=y, which brings in CONFIG_SWIOTLB, booted with
swiotlb=force. A test module maps two highmem pages at page offset 3840,
writes a pattern into the bounce buffer 500 bytes in and calls
dma_sync_single_range_for_cpu() over that range, so that 3840 + 500
crosses into the second page:

  before: swbug: pages pfn=700d4 highmem=1
          swbug: orig phys=700d4f00 (page off 3840)
          swbug: RESULT page0_off=244 page1_off=-1
  after:  swbug: RESULT page0_off=-1 page1_off=244

The pattern lands one page below its intended location without the
change and in the right place with it.

 kernel/dma/swiotlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ded7016a46a7..aa2f1c4588b9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1019,7 +1019,6 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
-	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
 	int tlb_offset;
 
@@ -1052,7 +1051,8 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 		size = alloc_size;
 	}
 
-	if (PageHighMem(pfn_to_page(pfn))) {
+	if (PhysHighMem(orig_addr)) {
+		unsigned long pfn = PFN_DOWN(orig_addr);
 		unsigned int offset = orig_addr & ~PAGE_MASK;
 		struct page *page;
 		unsigned int sz = 0;
-- 
2.53.0

