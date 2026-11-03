Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701095;
	b=QaPUV07CkHZlnTRN34KZjQb37c+B39yl4utgZKpdABpaLKvivOvy2dLKXBjRcHs2XKYK
	 r+XR2+DpNsrp1iRGb9cQJPq8Ujk/H/wRmex7nvG/prst29eqbcSqJecgEmPIuNsylLg7R
	 nKiFoJjmudBgmZKvBx6pCpojRENtASE0hJMyzxgcK/FxgBgAqocYBGxulnt5R0ogBySIj
	 bsFaTk83QJFUB9yZArtz/f2KjdNLdbWwYbcraXt8tk+230/+08Vn3jxQgzGV6QaRQawF8
	 +8iW9qrAHVU2pC41HHPIUDqfFknP2RAP5HbJBprVL49r96Rydoyn/trzjVT08ElH/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=;
	b=pkp+UGIr1OGYyHY5Pq6Ce7HeRAQ6r8vtoptcH2YoCMHhZ/9MtgD6ON08x6ZpmN0qsg5Q
	 Gm/Fkqoi55UEpSg6biYuqO9MEjKq2+FPLP26ro0tl38xG/GItEn+G7MrgEyKRvO/YxFcF
	 3m42JM0etS1B+Vwzt+8fDCF1Vv1P0DkTRRtMqp1uJaXHTSlHhiEIiR801MckI72zif777
	 7SYh+TZ+yaeEG9ePq8FznAVLmUNF8rDH5ZhXBfRZ3K5btxbGpvQdoTzEKe7QDDL6WLU0T
	 3sqn/ZHzCbOtc4iNMcl9qSm3ccUgRynpAc6A07pez+MpriHgz9J9wj2x5SwpW/DH71Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePc3p25m;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD92606A834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD92606A834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePc3p25m
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so6561569eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701094; x=1794305894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=;
        b=ePc3p25mDMUdgTuXKCdB1egnL2FxSvpa9PnQnM5k214D99tG2FIZLD2+hV9hDyf3pW
         za+LncYoDRS1oDLi8Gw5acBjqCw1vA1ir82unwyh4rr8H07Z4CEcJCn2V5+5HECYNyF0
         otDdMjWCO1M8UtQzdx+eN8DQdO78EEqqgEVSTUtcFs+8MrHSgfA5okVHuPLm7Wf0L4I+
         XqcO7QB8GLr3J7zbuqPzfPBMCuNE6zpCmf6+E0q5sZoOjfgl3l++SWo0JhpUhG6mwUrP
         d1AnmcX5el+96DeOr6dN6a9u528EDs0Fc9UuUwU5xYGtB1ktUjnIiOo7vLSHce+RduLR
         f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701094; x=1794305894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=;
        b=SWH2TbmciarJ6ovUTzFpi7y2VA7/A/cXUnM0uKwa/Ko0AWnbcEe7FcwftALcUY6TV3
         Es0SpW8WR8JOvqYwnicJTsDNzwVje/zsHmgwc3QUeJmWaII/jm8YIEa6sMDfGLc5g+ex
         ncXDhvuBa1K2ersSor3KhpiF2LhbUKrU7TSb9y6uZjBE1wMgX0NQaC7CFS1ens5HN0iM
         +d5/4a0eOPOy01g0mieYnWGyCeesdeONGxh2jGr5GYT9Tw822ri8ecWn025mq6BScUiO
         pDL/gNhHVBkgsfCxd/b51dIpfNihwSn9pd9w+NRupGL2CsIPichZAOFOodqGcPKacwZ7
         EbBQ==
X-Forwarded-Encrypted: i=1; AKwUvByCT6mWLZnpzbdCD4ZNbCpot/tkeg1FRIQvHHY96AHKqHbPO/A6zgppqzNj1jrK5XRP0RpVQj/Kle2VNWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4TOrx/QqR3XjojcuvvMkc9LpNsppeggS/h+fBll4eD4xZGjGf
	9LYAqF5nhvj42eBd0C1OtoNUdo3opi5K9QQeP4XwlDvgTkHLXN9trNPO
X-Gm-Gg: AYBFou1RXVk7Y9q6DPox/LnzQoohp2jjIbtpV3xZ15HyZ1hT3rp2aiTd3gkFJ+ReR/6
	L14rCcP9in+5VRRYkNf9u1RIKcp4P4VzD45fMlR3e6urzVVbP3n+7Cu56PlpHSFSijW6TJ4g5b+
	On0o53KPG8QeBnmEilMR6X61Uw2SChyxHZAsEQ8osXocxP00nogbEKbKL6w3jmCDvpnmQEV6eRd
	xkDsENjerYK6+bTHIHAQuEjq/n3F/WjnTxjoy3uhFNLLkGsHS6WrEdrs8Pw2YD+gafoa4k7yOs4
	+BpoJZ735o/AeKh3BD19dxDXKrY8VpBLB86xdEstYnBdd7Wm+lX9YnF47Rmtmw3V3UNsPB+R2a+
	kqmtJA9LZ6bIwtFolD90nuTaYszmjZJnWm9ecBW23t93QImZifGEpWUg/7PTQ4JXFLmpRo7c418
	pfjRhaBGD+PP/PK1zt8o4KP6wVNDRhs4TzhRLk6GuB4RqBuguWbkv4pongHSD3cz7YsMGxACEFf
	+FvzH0UokLJaUElM8Ay3l1A7S/PpYUZuXdIrKQxG84chNzJOi4r4jJPxGBd2qLWwYJDi+KEl/ra
	N7ajv7krXvFcQ2UsrxDpswfoX0NKqw==
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr806355eec.25.1793701094017;
        Tue, 03 Nov 2026 02:18:14 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:13 -0800 (PST)
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
Subject: [PATCH v11 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Tue,  3 Nov 2026 18:16:57 +0800
Message-Id: <20261103101658.766905-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Sashiko review: flagged a potential NULL pointer dereference -- with
HUGE_VMAP enabled, a NULL entry in the pages array reaches
page_to_pfn()/num_pages_contiguous() in get_vmap_mapping_order() before
the WARN_ON(!page) safeguard in vmap_pages_pte_range() runs.

This is not a bug: vmap()'s contract requires the caller to pass an
array of valid pages. The WARN_ON(!page) is a defensive sanity check,
not part of the API contract -- passing NULL pages has always been a
caller bug. get_vmap_mapping_order() runs on the same pages array that
vmap() received, so a caller passing NULL pages is already broken
regardless of whether we batch.

 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ee2c1ec4ff1f..42b3addd20f9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3613,6 +3613,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
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
@@ -3656,8 +3735,7 @@ void *vmap(struct page **pages, unsigned int count,
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

