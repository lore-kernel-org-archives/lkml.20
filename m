Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650032;
	b=1xzbO8sJWqIBvqElRhWQtBP2jvZ4PPs9APee4oLGSTyCrCa5totIUE1wHKp/bDF635o6
	 v2fF28M6hnNL4LEURw7KriAhmHkb/G7DI4KlNZ4a8WwNB35DOR4ZuRIFjWu9jxTukj3F1
	 VrUgOo5vHOHiis2GZjlKWdhD1CTKmLI+4Si1E1lAMM43MxfGuC4jDqD2f1KOs9wrwEoX0
	 jU6ZERZTD76FoWfxAAGss+RIfJeT//Sp6lpmN9yQQBi8BMylAfU7Mwp3ECKKH8lPA1LAW
	 TNhfunIvRGjjXt/mVFlfZwOEd37RXAHrCsM67zgPP5QWBBb7IjzIBuXUAWuatGOGniQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
	b=oPvf/J+PlFocIUP1o4pfKgWLdSwckl858iAODfkgGJBmOmCcBnsg9N+5B9fxS6J1QidS
	 BLbUl6y3sXfN5VOB5NJIZBSucrRrgISkwvRODIX+o9AmN4+ekES1daj2LsejyreJwGaEG
	 sD5FkaQzT9WZGuVtZurl+p9z0TklLFlP6Du4pit84HOARwoMcyelqIL+PzG5b5BqcHNJX
	 1mdjng9DmMCijlgE4eVWlLMe3fmfkFFlL+6LmwxMZ7lXPVhb8AEq38rW9S5jYzo0/wBqu
	 6bnEf/0IOAOAyS6Y6bhscE2F1/Rkd+jTqrsWD+lwzjTZSSODHSVnE4TDsxwW7K8q2OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmQwx9u8;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141A606A887
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2141A606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmQwx9u8
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so125528066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650030; x=1795254830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
        b=QmQwx9u8VwfkfsPjvQH3ZBNfSoRCW6ijA6pQhNGzam5Ezu2UvkhYs/il4ycOUWrEmy
         Ypc3nu0MEbVlEgpj7fT0dG9ktAO+OUfqkLNTgAIw/y6yg4I2ey7pTpTdXIG4y+4xD3vW
         2zL5c84XXp3/74Z87/nZtoNIcV1XpN3o3CqBdQkiZ4gTk23yMrLzukiJjV4w8qzDHh5+
         xySZsA0RrUOqIa6F2pDotLsTwnJbesym1VE26ntd45qPeFkA1uRZDTG43NwkHn7yO3yK
         zoKaib0ZLUHrUiy5kqPD0ztA4GM0RwK28GSIhFVvkTC/Ses1KbASsVI0da4BAdy6aNs8
         lC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650030; x=1795254830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
        b=bRHaQ4GPpoWj56HYyDaX54E4plEpXU3+K5+lLKDTe3egP2QHOdxM/VGGxQ5R/2Ph/8
         D3gCpZjEzjKXFCzIM0L2+fsrDxAvkvQKWpm6DwwHZiJLUfTZSQnuvuFgkFj72cDlErIO
         Ze4OBxg/ZvD0FlKO83Z+aySFM9fDDNzF2kz3AOEfP1sPnjfLQwF0Cgdz29T15wXyiEzL
         ggapVc15w9dLwCfwScJ9/ZfD39vSEGUB8CaVCHgku5F4irCt8zITpTHk6HenHdOkiuCU
         7u7RBwqUantKvw+3btwJeCGivD6WjzgOSdI5pJNBVTZxrUMUF3cTLuRlIFtFk3SwltiO
         tRqw==
X-Forwarded-Encrypted: i=1; AL+hErHfcMdWVP8kI6B6hFb8lb+WENEcD/rLIYQ5Hov5Ih3dJuFsYp45zcKlIbW755ISKqXc24Iefhg9sDUZfmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qg57twuuVEgalNo7OuPotAGyXVrpx1JYBcO42EWYRfNQUBz6l
	7bWTTtWl0RoY/0fKw4OhJYAwjesi5vaoPkAPPz2sDvPlBw4Fbtd/ROvS
X-Gm-Gg: AYBFou0bb/2bAGzndwiDkH7+WA6If/2/nrZsZsZ1KKB8qWjCFOgzq4cLKyycqBmVSOb
	uk3TWdLYKm8MWnsHN60ek1GTvZsgnvv97qJrAQpw018sNyC5/EWyekYlODOk0QhA6+U8FYjI87t
	NKO6pbiMUjT6RRqEZXynLtGgDjb7MSQAg4CwqsRtyKJ294YV/bpG18m8ISDiqfREfusY7d6H65x
	nvox5ZkV+r/ibS9aLHVRyhSndfaxkaf04XyY63JoaGSm590fEkMmPUqNXeL2TmLRu5PROFQveG2
	QJxNQXwBKFlH9xtFbBLz9I3wsUQIELFSRNOmZPfyoSswZWQcwMBzO4En6p/xsz5c/Xkj2nG5sfB
	nYQXgpsGq1djUxEyAY7euPgEukWXljxSa25mnCC2k25vSABo5A9fL6cbYDvjyFQQMb86pxrm8M1
	RudgE0oTwz6hLi//6dmRWoWNSuh2Gt+QJ52/tKKM8K1dT7QkiPD6+gSor/NsXjmf1/iN+0jtG6k
	Pp4apJjiRE5v6exlo9uN1VuMh9uYOjZr5GgEBqF8GoDIrTKqe3MddLV8YIEN9gPLnJAMIyPFTzx
	btwRxH1DZZast8KGttrSpJEobdfZ8dJVW4Uw0+hYWLBNW2adt8V+y1cWwXg1jtguO0RfAz4=
X-Received: by 2002:a17:906:4fd0:b0:c31:e958:408c with SMTP id a640c23a62f3a-c5096410456mr443648666b.38.1794650030384;
        Sat, 14 Nov 2026 01:53:50 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:49 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Sat, 14 Nov 2026 10:53:17 +0100
Message-ID: <20261114095335.1283016-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114095335.1283016-1-linmag7@gmail.com>
References: <20261114095335.1283016-1-linmag7@gmail.com>
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

With CONFIG_DMA_CMA=y, the default CMA_SIZE_MBYTES setting reserves
16 MiB without a cma= argument. cma=0 disables the default area.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../features/io/dma-contiguous/arch-support.txt   |  2 +-
 arch/alpha/Kconfig                                |  1 +
 arch/alpha/kernel/pci_iommu.c                     | 13 +++++++++----
 arch/alpha/kernel/setup.c                         | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 5 deletions(-)

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
index 955b6ca61627..0337bcef26cb 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -408,12 +408,17 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
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
 		printk(KERN_INFO "pci_alloc_consistent: "
 		       "get_free_pages failed from %ps\n",
@@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
 		/* The address doesn't fit required mask and we
@@ -453,7 +458,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index c7b7ebcc47b6..0cd94c9023c1 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
@@ -582,6 +583,20 @@ setup_arch(char **cmdline_p)
 	/* Parse early options before reserving memory for DMA CMA. */
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

