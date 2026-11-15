Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739098;
	b=R6Mg0cZqAxQLzSjCd0UTTWM4oYsFix2FaDS9QOXdHbXCMAfMOfiwwoN/oC7J4/SKi2Ny
	 qA6B1X9g24nxtQo++O3UfUUhFKlMTwV0I2FJqcBqfLDknG9im78kJbDZ1si65bP6XQDr8
	 XtuKeeLFrwgCOYfaOk/Dp8ZQQ19zgPDMMhTChM/u/n910ePYfeQZzgwrB6Oew58WxhJr4
	 V43tYYPnHpZMI4AfnpfO+8z0ZMM62X/O59dNwuMTRLTIW5/K4EbfbJsZbxfeqtghYZDI4
	 7mc5x2S0ZwCpcYuN2yXHl/b59q8FV6kMv/TJsIXQ6Wq5vy4SKJHpMYyI9cW/95o578Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
	b=b7X3RrfjxHrhtHPs458YW9nqQaxHOqVl23mYb5V1JpGtYIDOL25wwt6vZUvsKveU8uIX
	 fB2RtyyZKaFqoiCW7si0/Pa3ErTVqON9lCo4e6OuTn/X6j/ATlGPUHy/o+2BVNueaBapt
	 f69Aw63qm/dq1y6WkWbuvpy+gWidzwXOICpanfH1ocUYXJ8gZJk55froff97ItdmJgpmG
	 Hq00wci5wMeOEyvIJpfSK0B3xny+MI0755QoJQnU4lzLjZMaGo6+koz0Wf2FmacGclA0e
	 r1YpQWCDHGqios+V3nWjEwokM2kyFmtNuwpYh80fnGVciYS5dAXh0wORrYBB+Ty0FIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvHXUks;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA0606A337
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BA0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvHXUks
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so26038211fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739096; x=1795343896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
        b=yIvHXUksCtGG93KMJYaPLmlW6MYv5D2vIXzEzLKh9XBN03bnBZq1lHdFB/K4PjTsTz
         l4Unt4Wbj+1BMBe0pMpriGardCoa8T9zfNuyaUcpShMwctWjggRrWDWFn11bL4vwvoib
         utDQ52Z5rN/fg/AefmoebuJbO5dJI0C/qD6kZiNO446FBdoV9sIWEBuzVo8Xo4KckBoW
         BtYtEZ+YHb50ujKda7C7dC1gVolAZwJ4Hf7zHzNdqI+Ar5iag33spyfSCDhT8ut8cuqP
         NaK31BPd3g2xAXtgQ8wM8wcgiHNLqw/9eQlz7uY7eJqjZQZj7Y0xDODj/slODqj2fRGr
         1L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739096; x=1795343896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
        b=zE9dwtgJYt0k/3d+IRFGaZpc7z4pTokxJJPYI3lq6LSaWUyHdnjxLHOdEYGuQsRvjV
         kbi7UWIVTFBqMpeiPtTczLupOuCc1597oOm40jGFG0GIHu0xA22OCfR4hnTSiuWfWeqr
         bKHVAQnQB6AkGDsRqxKf1H7pBNJfUUU6ghzBsX9JeYOyH0BYcQzFEidNkxHqFPcWnTUP
         u/bHcnIzT5/mHytcN16R2h29GUK46iUoOhoUU4m9njYml7xvna07JRnkZHtF9d4X/dZr
         ZJpKDzjJh1Tr7DenRhS5KnPYhN2z82V3Ru3Pud5b9k0zzXn7SHX4M7Hh26PD9uQ60U+w
         nE/g==
X-Forwarded-Encrypted: i=1; AL+hErGN5LbmLsVYTyagjuHu6t4Z5ZqZcV1awclYLI6tVX5Boj5k3b2uYbm+zcqlxORZ+9BdcKL33ZASnRAdatw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YrBDa4leXqieakNaf+Ii+li67Bd52QKY+A9hzjiCTA0yScRE4
	U/3gATG8zXoiSBKOFkka90qGlPxXM9XJXl3xyghJAsrOK269kP5M8bD0P4F6V/t2
X-Gm-Gg: AYBFou127sRhzh8yw1E4CgOP1FQck6jVvqOuXxH7YAbZN/K0+/xVIr17hJMD9+HaHor
	GKwQ9y2J4JwxLy9Nb098zQ90fn8F2bgUgyD9e8maBQ96xlnUgpkBqlYgrnjq73mhN7rIL6LpazP
	HNAZb0dRh5dwCfvZcv0IftOnzGpxY5sGqf7WdVH0F/U8Yuj2wqcthvw7dVahtzPTiDemw2sbxPv
	eRaMST057SR96sH1p69us56f1CsxOlAEjFkNGK5GRF5j/HR4dD4/f5r5YDksbO2jSndFjjzbhW7
	4IQCAGMTZjjWYfdm+NhrxbfE0IVoUlkh7haNNCCJCP3Sc3dV85Kqs21TkZNU+6Eb5kBt7Bb80SV
	UyMPqjIukae6rYLngdAcgBLsLLxwFDtGRKxqHIXLI7y6BslqpoDqpa9XtsDzIQZ//AGh5DoUoOT
	g3zQR0/qwOYeQIG6krD0cTiHQt8W9d4WjF+GMn1gVW09AsODvkaVI2i4+KwfUmbrsloV0GjZioN
	d8KxRDNMiCaGDjZzLK+SfV6ElpettmbpFsPw38pobGLCIjdlGrg8IZ0X/JEPphvyPMdeOdJMpsI
	bs5RXOIUlNR4wG6yY+1POvcfiy+1tRBsJJr2xnNnhIHy2IFMGrsChOad61ZurfxwIwaCLzs=
X-Received: by 2002:a05:651c:983:b0:3a3:749e:319d with SMTP id 38308e7fff4ca-3ae2b508d40mr20659161fa.17.1794739095852;
        Sun, 15 Nov 2026 02:38:15 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:15 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Sun, 15 Nov 2026 11:37:43 +0100
Message-ID: <20261115103809.1288167-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115103809.1288167-1-linmag7@gmail.com>
References: <20261115103809.1288167-1-linmag7@gmail.com>
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

Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
machine has initialized its DMA windows. Prefer top-down placement
below the direct-map and usable RAM limits. Skip the default reservation
when no direct-map window exists. Explicit cma= ranges retain their
generic override semantics; top-down placement is a preference, not a
hard lower bound excluding the first 16 MiB.

Use dma_alloc_contiguous(), which rejects non-blocking callers, before
falling back to alloc_pages_exact(). Pair both paths with
dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
return the same unsuitable CMA pages. Retain zeroing for CMA memory.

Round the size up to a page boundary in both allocation and free. CMA
allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwise
allocate too few pages and overrun the allocation during zeroing. Keep
the mapping and unmapping lengths consistent with the aligned size.

With CONFIG_DMA_CMA=y, the default CMA_SIZE_MBYTES setting reserves
16 MiB without a cma= argument. cma=0 disables the default area.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 3c6ce35d704f..6cd205a991f6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6ccb2d230326..cddc1f3af209 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -30,6 +30,7 @@ config ALPHA
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_DMA_CONTIGUOUS
 	select HAVE_GUP_FAST
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..19aa5c05de2b 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
+	size = PAGE_ALIGN(size);
 	gfp &= ~GFP_DMA;
 
 try_again:
-	cpu_addr = (void *)__get_free_pages(gfp | __GFP_ZERO, order);
+	/* A low-memory retry must not return the same unsuitable CMA pages. */
+	page = (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
+	if (page)
+		cpu_addr = page_address(page);
+	else
+		cpu_addr = alloc_pages_exact(size, gfp | __GFP_ZERO);
 	if (! cpu_addr) {
-		printk(KERN_INFO "pci_alloc_consistent: "
-		       "get_free_pages failed from %ps\n",
+		pr_info("pci_alloc_consistent: allocation failed from %ps\n",
 			__builtin_return_address(0));
 		/* ??? Really atomic allocation?  Otherwise we could play
 		   with vmalloc and sg if we can't find contiguous memory.  */
@@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
 		/* The address doesn't fit required mask and we
@@ -452,8 +457,10 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
+
+	size = PAGE_ALIGN(size);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f21a7c8f5213..f40a87b30a7c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -31,6 +31,7 @@
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
@@ -584,6 +585,20 @@ setup_arch(char **cmdline_p)
 	jump_label_init();
 	parse_early_param();
 
+	/*
+	 * Prefer higher memory within the direct-map window, rather than
+	 * consuming scarce low memory with a bottom-up CMA reservation.
+	 * Explicit cma= ranges retain the generic command-line semantics.
+	 */
+	if (__direct_map_size) {
+		bool bottom_up = memblock_bottom_up();
+
+		memblock_set_bottom_up(false);
+		dma_contiguous_reserve(min_t(phys_addr_t, __direct_map_size,
+					     PFN_PHYS(max_low_pfn)));
+		memblock_set_bottom_up(bottom_up);
+	}
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0

