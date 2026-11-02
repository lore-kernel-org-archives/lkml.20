Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590029;
	b=mhXesVA74+7swdxtuj542l22HF1VBs+gS9ifIeR+QjRq+3Pbbzt4SNg7m6xC4VZdJPfU
	 z9hPaP3wOkEswoV8jgwRj6Z2gCvgOwhSrxoxKikloA4MnIkHNVUmLtxwgCs8neLtDf0Xd
	 kgVI5xHx54FUJqhbH96gOndHkWmkcBQuUQ3XuCSgPgnkKDbxP6ckCQplYV25QnMnWxgWX
	 4PACneOfIPlQSMncsss0JG7cWJGPVZA1xGNTBxURfOBfbFqprSF2brKiIDjjjzkiHkY8o
	 bF+TACj2SKJUsVR9K1fEvmmj6//+VWHVFUeXICcCs4pCl8elXyOYaMcUdWv68yy9v7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VRYuw1luqS/ww3kCs9ZujMYb2eCvCkQYnqlhruelWuM=;
	b=doOtBfOP7NlcJTaXg+3Taze/8yF8MbeNPJglP7Qf/OIQ7+c51LZnkQ506Rbb7WDk7Bzf
	 fVsWNbfg8ZNKrUbE4rcRD+gDd1XXidWzRLrylsW1FmyrI7jf4gt8/4uHd44EZJxY8IvAT
	 coJv7sLcZlUDx2Y6pbjqDlFAavNFgtZU7BwaRIY9pyIGg09ICNIBAYBfXKWYdDwkYfMlu
	 URG+3WfVsOByHDEFIeqtUrZOT/PD4IQcNrizZeHyZayA5BJx7Z/p4meRGUE6/0O2fYZ8B
	 H6vNk6D9iiC3aUWQo165teQj5wGPNQe90lab/zSovjDFcPuMzRaXugVzBAQHnp2Onlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hVBqUD8I;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B8606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hVBqUD8I
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1783623a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590028; x=1794194828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRYuw1luqS/ww3kCs9ZujMYb2eCvCkQYnqlhruelWuM=;
        b=hVBqUD8IDdLqiISl5y+oO9VLqEehmtJXz4VOGJIhK9/2cN0mWt6UFvUSCkiBV/BDbO
         9mAiGgW2C2HuqWDNtzhPXKvKTb7X2frWiEeCYs/GV1wGCIJyno682rWDSxM/z5Ybk6Hj
         03sl81tvBg7/3/dldwfq8g7GApoiTZUyFt05e1VClKAXrfc1+vgMX1hmHkR+/n1oLjm7
         ELatb1z8a5cwUrpGcfquRvu5+HvHJVaGsBuC6Re1B8aJkXR3yZWg0j+Rf473dHeecIwt
         Xlg/8FwgbVLrFuwhk5wJG+wZoqMkTjoKfHblDelKf8CcqRKLXxgbCkBG84+i2Ht/nyyE
         w9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590028; x=1794194828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRYuw1luqS/ww3kCs9ZujMYb2eCvCkQYnqlhruelWuM=;
        b=lnFq/eUJ6EvtT6zngbV7/XlSqfoyqHfAktLrne1zSKFOS0yaSt8nNUBChXNdNga5t5
         Dl4E7xPWwQ7pw0SPOgxetd6lYM+H0j2KcATMXyMleYoHAHvYuHsXFdjybj7fmoBCzv0w
         RVcXtOEKae5cxxwCR/ky31xTmXBjnFtNk7vMP3RJouBRucgwQz6BX1y4xu4RapInM5F3
         yDv6RRNaIBWdDI8sEDd0Udvdot9ILYbVfwYWrhbi4RTkeF1axY1uqrBYHbi9r7lbPj8P
         EcNVTsL1LHkS9Nox/vEKJf37vEpwqRcBYWRPnmusRRcJTZDX9Zg44eMJ++2/QhkvygNG
         j2Cg==
X-Forwarded-Encrypted: i=1; AKwUvBx01kr917lhNFZBIIFsUCicUl/RGMM1vHPyoAbi8euVie+/tT22Ars+ZPJHRzfdYHbkrvE1kxqoWs/AiOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LXriYqk01pLE1nCGpRx7yIGoHdG9o+tC16qMt7tSYRWrbmobM
	noIlpsYxhlJvFprSHMCwKLWMpYBvSMtnrusT5AOdjSuAv5forNeoprYOvN3VYofyDt0=
X-Gm-Gg: AYBFou0ET4Puh4qZOhvzO7lIhWI3kGC3+vMw1JQyLR6uWbvI23zW6Tw3AYzbhbulTx5
	SigItMxDNz9wemASwhLqrufI2aoAwKEPm901118Dxsxe9nGWTcyGZzgixLC9mEwAgHoScBG3AEM
	hHCZJLrVn3SR5lKyMT2ylpH6ykP9CRcOGY36ZlxgTPBwNneTZZqGLLZf8nQ5zqBbRAzpfNLCGsr
	FRUWnSDJu4X+iO1neZNFBUSPAdABnNuelXK/H1AMCZRvOpt9jOKMzznnDs58Qm0XlEvVdGFWOOv
	EtanHKaDNKcKS/37TyyMja98DCSQ2V2O9MlaU2ciWCt2jA7qHcJvjltbRjosZLea/mznxUte0+p
	ECXrOm4b/ESitXygDofyz1WWwGALVvYMRDkqceACcDdOIDl+3Fd59+PShdybofwoM0/l/byTzVY
	WANp8yt1aJ2/d9SD6/X4RD1T4ovwxKVwISP14upjdjztFtopK3iAstuwHGgiv8xJHIbxW55iwSH
	bEdQX7UlKHyOQPhtysRaZ3hrK9hJdyUZ+M1hU135YlPLxX8lyKVFd4kbUeX2iXEFrOp0cDmGHMJ
	htix3gmEdRT2WQCbHDU5pKclS7xi6YBIY6ex8kuAPOQI/+qOsnfLLzHnz+mtgoMsCVS4nik=
X-Received: by 2002:a17:90b:562d:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3ae898385a1mr7245105a91.39.1793590028314;
        Sun, 01 Nov 2026 19:27:08 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:27:07 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented
Date: Mon,  2 Nov 2026 11:25:25 +0800
Message-ID: <20261102032525.3597743-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
operation, but the current interface exposes a raw address range and
hardcodes deferred TLB flushing.  This splits the common mechanism
across layers and couples it to the HugeTLB batching policy.

Make the folio the unit of PTE conversion and let callers select the TLB
flush policy through the folio-oriented interface.  This keeps
HugeTLB-specific eligibility and batching outside the common operation.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 370e604c8056..c04f53f708d2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -300,20 +300,26 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
 }
 
 /**
- * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
- *                      backing PMDs of the directmap into PTEs
- * @start:     start address of the vmemmap virtual address range that we want
- *             to remap.
- * @end:       end address of the vmemmap virtual address range that we want to
- *             remap.
+ * vmemmap_pteify_folio - convert the vmemmap backing of a folio to PTE mappings
+ * @folio:	folio whose vmemmap range should be converted to PTE mappings.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Convert mappings covering @folio's vmemmap into PTE mappings. If TLB flushing
+ * is skipped, the caller must flush TLBs after all pteify operations are complete
+ * before remapping the folio's vmemmap pages.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_split(unsigned long start, unsigned long end)
+static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 {
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= NULL,
-		.flags		= VMEMMAP_DEFER_TLB_FLUSH,
+		.flags		= flags,
 	};
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
+
+	if (!vmemmap_optimizable_order(folio_order(folio)))
+		return -EOPNOTSUPP;
 
 	return vmemmap_remap_range(start, end, &walk);
 }
@@ -532,21 +538,13 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
+static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *folio,
+					unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	/*
-	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end]
-	 */
-	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
+	return vmemmap_pteify_folio(folio, flags);
 }
 
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
@@ -571,7 +569,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 
 		nr_to_optimize++;
 
-		ret = hugetlb_vmemmap_split_folio(h, folio);
+		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
-- 
2.54.0

