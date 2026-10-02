Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DE47A87C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932251; cv=none; b=YB3IiVTPFMKTlC8a2YzQH2w1Fiz/tE2gmxn81P/2JYIBojX3cAWV2IhIhaJP5xOE9XotkP6kYAri42tWWX2wQ/oQLjeEUBZGQqBGXNKYFPz35HQ2TEDwTlHlh5pHUTSGTvlzOwQNBtafQ/tjGXSVsGi9CRJpLL8da5Lw8cjWKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932251; c=relaxed/simple;
	bh=jBOrdZOv+VBMaEupBAem1FPPLUwnedQGeq1fkBaCwzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzGXx1Vwi0t3Qpzy7Y27LYsuhjFNJ8TYDZzJJOenL9xwsI+EtxLhcIYabZ/HMLaRKqm4FylGXcP3fYtEQVkxkZgvn18wYLUIniaebehFwKwG1l3Mlc1w3KsNM0FnX4XNwfbxo98aQDRTg11G4iSQAAnQBI2QxYTVNUkX/Jlof0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIn6U7wN; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIn6U7wN"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso18761085ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932249; x=1791537049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SdFF897J19vB9gXlitk0PJAT4sCzBncom/C0yG9+Zg=;
        b=PIn6U7wNk8u6+rEIB7elenlu3wZ5u2BACtHIEpOI8g7GVAA47nAFhAbk9xudi33D1U
         EelvAd/vvg3l/shoW0VJFb3azy6nxbjjnLbibboB9D1afuBuwcWAwJJXdDQQND4CCCxF
         yGbzcJY4wu3FWezCosXQ+JX1UuY/9pINxmFikleOlw97B0RdBO5ItrXQ20mnGUH+kxum
         ErecQaYjPnIxhOSGP9JvfFpGDh4ULd/PD6M1T9gcfhIFwuDlZwDXVv1DZxKzfSKZUaPw
         KbBDC2G3PDMJsTpjuifhHOQ4dGAiX8w0OVDyBjBJJsfIX4qJgNrvYPoqYjGDQpzb0Pe7
         Tdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932249; x=1791537049;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SdFF897J19vB9gXlitk0PJAT4sCzBncom/C0yG9+Zg=;
        b=iFesdMKPsIdOxw4x94KVSdAabVbstmUVkJc4+hV7UMSrSs2d/CnW8W2xOP4Ar0CY5C
         nzpxyik1wVOqrY1zrstAxiz57/vkG80pONpUUfNQ/xL6ziA8fVM9Z9tSF94r1oRG9XEK
         WnKWHB6T8X8SK8Nuep3QWFoWHRzSgYiHq2Aagqly4fFuGnH5sLgc9cN55Sy9X1PAJ/Bj
         YRIukUdbm0fpvpgi+QvnEC3nc06jGDjJe1E6gRU38JveflloD67FaEz49pCcyIZncA/A
         J0Vddfm+WX0T+VDiL89lsfcwodyKJ+xhTtdZQzUHuTpBzq5ICjnqMJvUaa44LwJwky0C
         b//g==
X-Forwarded-Encrypted: i=1; AKwUvBwYUO90txjenvd1vjBis481wPnIT6i6a9izw/8Bk0eVarKh1AreUGNO6h0J2o6dGHR+HD1qS/1dIPRL9f4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUJUaMsY68VVGD4n0gMhtlVp1w2n5E3FRe0Xe656xxGYQ+C+9x
	tjm8pcPTpdDhAnBCVAcOKmFglr8dEbCvZV0OanhCfblcF51ic3AdfcE+
X-Gm-Gg: AYBFou0uaBXhB+6UFZire7mUbunr8ehHit0ybyYSJU9SfTGdy6O3boYobFwSqeGuD52
	DRVGEgQBB3QW2PDmLG+RHaC16dfRNPV84zgE+fHWZT+NH7gIf7TFll7NpoXP9ti6ipeUnfFFiJM
	VUAtBmmIoJDhMjcXND2oLGb5exGvTE9vV3QTy/uBz8KlXbgtYlnTRZ9aeVzbBCurx+XyH3vIPQV
	5VnFATjfVNYgUrkGJCLie20q+/unwZFsa7wD4CBes1gEnT69p1xDIR8IeccHS/N7zFadLOMDE+7
	bGNwBT7W8JMGn1B5PxYO2H9B6XDDTYNzf7Rza4b/F0cLiqnZGzIZT7qUJZi8lEPDy6MHak/SR4V
	X31xtQgG/tPDAHhLjn4L5bCxiFE6JxS3Fx8BGeBZ1gFdLzCeNlfDhls7gWaf7EpBte1gJyVrxSA
	SJS2oCAopQfUzhS4RPfJIQRxPEeuoWtMDWTKRKZrJUoM74/8otEgW9Hhq6oFd+5640p3ZR3zKcj
	DvdlRJA4XhY61BwkdAhMw==
X-Received: by 2002:a17:903:b87:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2e49b821f87mr17258575ad.61.1790932248559;
        Fri, 02 Oct 2026 02:10:48 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:48 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v10 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Fri,  2 Oct 2026 17:09:46 +0800
Message-Id: <20261002090947.869220-10-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

In many cases, the pages passed to vmap() may include high-order
pages. For example, the systemheap often allocates pages in descending
order: order 8, then 4, then 0. Currently, vmap() iterates over every
page individually—even pages inside a high-order block are handled
one by one.

This patch detects physically contiguous pages (regardless of whether
they are compound or non-compound) by scanning with
num_pages_contiguous(), and maps them as a single contiguous block
whenever possible. The mapping order is determined by taking the
minimum of the contiguous page count and the pfn alignment, allowing
graceful degradation when pfn alignment is less than the contiguous
range.

Pages with the same page_shift are coalesced and mapped via
vmap_pages_range_noflush_walk() to avoid page table rewalk.

As users typically allocate memory in descending orders (e.g.
8 → 4 → 0), once an order-0 page is encountered, we stop scanning
for contiguous pages since subsequent pages are likely order-0 as well.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index aae6141aaebf5..4acd1ec27604b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_mapping_order(struct page **pages,
+		pgprot_t prot, unsigned int nr_pages)
+{
+	unsigned long pfn;
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	/* Limit nr_pages by pfn alignment */
+	pfn = page_to_pfn(*pages);
+	if (pfn > 0)
+		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
+
+	nr_contig = num_pages_contiguous(pages, nr_pages);
+	if (nr_contig < 2)
+		return 0;
+
+	order = ilog2(nr_contig);
+
+	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
+		return 0;
+
+	return order;
+}
+
+static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, batch_idx = 0;
+	unsigned long batch_start = addr, batch_end = addr;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+					     PAGE_SHIFT, GFP_KERNEL);
+
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < nr_pages; ) {
+		unsigned int shift = PAGE_SHIFT +
+			get_vmap_mapping_order(pages + i, prot, nr_pages - i);
+
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
+					prot, pages + batch_idx, prev_shift);
+			if (err)
+				goto out;
+			prev_shift = shift;
+			batch_start = batch_end;
+			batch_idx = i;
+		}
+
+		/*
+		 * Once we fail to batch pages, we expect to fail batching
+		 * for all remaining pages, so just give up.
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
+
+		batch_end += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (batch_start < end)
+		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
+				pages + batch_idx, prev_shift);
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1

