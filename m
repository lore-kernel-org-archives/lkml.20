Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550763A874A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623046; cv=none; b=ulA0m0SuYuMFq4E2ibFDsO5Xp29XHTLW83CMHpb2FJakkposVSF53fizbgLIOoxQ0WB8blfWl16znUqKHcbh1BkGuW/KRGIQjdyPjoqgHTdDD4OE0o+6HlYyt15zibFa7opD6jBdd+vZkwuX/pSSk40RmxEG4P8r3aIhpU4PAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623046; c=relaxed/simple;
	bh=nxcc+X5rXpZz7j+4HigRc/Xt8kSFUwFf7kdydb8URt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dR13ujRCopDMthxfH6Hrs/BLzLNJED8+saMj2lFr3iCCjuXqXHxyd7HknnG+k6QYRLvIZalIAvxwrB66f0WDDRLCT0sIHc+wAZmhSwioWMIZqPiP42jKn7SbNYaZW1K8+F7CyuGHiVCkKWy8C2wXNoNcHbuCF3J7IOTMYstKKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baNJi4IQ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baNJi4IQ"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so337108a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623045; x=1790227845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJbFWtXzdjoxqLLRP1e19uuFJMa1NhU30c4WN8jSX0Q=;
        b=baNJi4IQWggydvmZ8lFJ0Y/IbqPiMccYptMpybHVIcNapekYPe2N17WCqQcdx/RbO3
         qL6xvNVQyqzhxeBvAY6mX7Y6Nh+gHsNKdKdjsO7Q8/fogsKRG9PUqXmnXzjcXRCcY8mM
         do3hWITe1u7wCkbn17DyJzXKR+XkTKiht7hisxsL1uXBvcpQo8L1cDPugUkbr7tww/Qd
         SseLMl9LfmVSJ0bHl4oLOcDR+nWHQxcgCagxlLn1SSeMNHIB17YIiM4qPxceL5t7yTyD
         s3Xy3vkI5y2jG9mP6pwbmHAKs2YS8BxUZKnLRS7KhxEfqA/LRna6wT2OM2er8u4btFL1
         2ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623045; x=1790227845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJbFWtXzdjoxqLLRP1e19uuFJMa1NhU30c4WN8jSX0Q=;
        b=xGI6uiNpe2tklHOk8QpH+dWJKsdxs9D3KZ6OG94PM7ImYr8zYKG7HMI1gDXUGVXmW+
         HIZxm5lxcR1WB0aI000iEjMIhYKa9NtZjfqT5dcxiCU6n+Xds0kXL53YKd1Tn313TbTI
         987eMJSp/WfwPl2mH1/p9QPXG1j7JRvza2qmlPvT9aXKMQwEvpqk5CNnTqOPcM+p4NML
         nsTr6e0eQ86fX1A44hM4MTV3jJuZqcuBPTaKcb6NzZZ1v0pFJMK2hv7VFLJR39ucutlr
         wUWElE0UgTNUn4twJowXKfIE1NtiOgu1mI8sSnHqj83UlvBVlhBlEgQDqyasxZJePEZ8
         qftw==
X-Forwarded-Encrypted: i=1; AKwUvByMEi9I3U4pdnkbHlft6CB+sAgv5KNbzZcXCjXDrPePnIB3gZr/ECAYh2M1o5a4eP/Van4to7hzKXJ58MU=@vger.kernel.org
X-Gm-Message-State: AFuF++n5n+H8jPjx3T60eU+BPETazl8yqKxZmmzubOSv/yvAsMH75WOo
	0CykFxoIXiChJWHNf+bGpWM/nwdDDUUdmfJ6qvl4w7U53Zcmuv/sP3OL
X-Gm-Gg: AYBFou3l5ruA0JIn83swj5Q1NrDR3uEXG4pmSmoLNH9hpJ9YH5SLdi/oO5YLi6Eiwy+
	HtVx5Ulm9696/rZWhbTdizjLVzYOQFe+OjFl8VCXa++ilTnH2VZY5fD6XC9JX3gOWJR2dAC0sYf
	0D1gb3YuY1l/ywLJIrpuv7mGvonnJ198bstcvyzUABu6IVv1fliPbOVdW9Wl9hRVq7DnGmreseD
	BcDftUhDxQji07jzEoXHvMzzq5vSOE252i3w7Mbj7Bg11Y8BlCBPoba6dracQPSsRv/RtMEr5dJ
	3z0FQkOJ7GiKYEbkvFQVO9L3izFlPOy7/c4Aulw7KNrcsygT5eucLjk4xWXlol1BA+NRDcJigpi
	oVvpVPhSxZQ6A7PwScSv7XGpiFbRZoxUq2zgOy2KtidadpvlsYfQ0rQQHgv9Iz/TGsYXMRRcj1P
	BtzO47A9hqnbwsIKtjF8M/SzRzz6ONDkmXqSARopYv7j7pFCPM/m71K3ZIz+zjGAD3+OzX0hNNg
	zEaBy5QrjC9eV6G4fOg3U3K57w=
X-Received: by 2002:a17:90b:4d07:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e1e2ee113mr11267726a91.9.1789623044645;
        Wed, 16 Sep 2026 22:30:44 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:44 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Thu, 17 Sep 2026 13:29:32 +0800
Message-Id: <20260917052933.188679-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
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
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ed868afd8194d..bce2d2c09f546 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3540,6 +3540,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
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
+			get_vmap_batch_order(pages + i, prot, nr_pages - i);
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
@@ -3583,8 +3662,7 @@ void *vmap(struct page **pages, unsigned int count,
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

