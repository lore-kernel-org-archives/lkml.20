Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395306;
	b=g1wWzkvuWtjDfGqScfOZ1nymM5/7tbfxbI0rseOwzivJYJ70Hx+7/TKtME7qvih7yQrD
	 JT0WJNd+iK60EhzYUE6uKRQt4Iuq6m5+gLf01mAySj4BZf4mLwTXDOpcCW1OuWLV3nIoL
	 guDGk35ARhGi2CfV9nsVgI9/iE42z60jRQFb8/ZgIT6nw4GYirpllUgFeojt2J4k+6MLv
	 m3M1ZuUeJFV43LV01c1XT2jqhHzt1ScVfwv3/OCYahYVv4tKsH3Oo9UC7gvylP/rN/hGf
	 0J50cxUq7aDJoFo47qIj3c0Su2o/b9Famy4xbvZkCgtbfgj4glI8XRVEstujIM+mx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
	b=cv06Yi3gutU6Hy9TdoMUT8S5uw/WKJpYcOPU3nvtg3Cw2QsnLyFGDEalnW7GjNLSFrUO
	 UtpPQti4ostLptVYu1VkVhHE2fqo8xF5Td+wYAt1hbO2c7ZpIlH/jRWQO1Ry87aaQjI8p
	 r2kSu4cSjnSpWcwpUqWIpt5Q+ejCY+NU8B8EPe7xPDOURnxjxk8QWwOD1Z+w+9ymDbqG6
	 l9nVse3DjOGUzmjZUvWQiJBWA26bbvgSZ02KEeTWL//xyYP5HNKlYkxEB0HlvyUlaGrfR
	 fKCvnkLRAnPqVFI/W+6YsIIw2GhNtvmzVaqxJDFf/dDqvouDoDCUn4LUv4nmiC/eD4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="h6Y+E/uc";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6460A261B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B6460A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h6Y+E/uc
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b8b3cd61a5so17935475e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395305; x=1795000105; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
        b=h6Y+E/ucqc3EVmLa8QhSV93ACXecZTrA0nYIpydYrLi9qsrTMisfAbXuCJm3Kwxnk+
         wNaoEJBy/T+3h2dmiRaPtkz27Pe3cFcRUJ08SSFI6SKkLhwSyh7zhiWc/+1GvJzhcjQl
         MqNj5gxXml1ALp1+MHppFvFpk0/hqA07SaAHojSDlk0E2vhyP9VL6hQdw/O0GJq8EaBz
         Gve4dNJ1oGWiVEPFEw2+5QP++UqpRsQvR/jrPGUgnnxgMSyVP4LVIQPsSli5aZkcgy7r
         y0s3SjHPy1J2lgNj8b0F2523j1GKVmrQPJDWbrpGmfqKxyk6u/kAfmXk64EeR+fAtRZh
         i/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395305; x=1795000105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
        b=L4rste3TqI9XpQ7CdIBFeDBJ+l4Uqplfm/yiwTsKbNusGLez4Ua6mgSpl2W41ErmTX
         93mfmObIiYBtWFEyQryN7fd9PvAYKqlpQolBaOeqYWa+75nEQrlruaZWy7HTqafln1j8
         WYvtq01ndDqYqfccvGSEYPXkcYiSF+kn+mAoEHUbBcPq2TQwM9rwtRQwYerxI72/wzZh
         Q4wgCAAkGH32DyYjLgsdRU2Sb0RcF/j1kVds4gVxxCDJR8Z0h0zmk/JpMqYsbOrIDSOk
         fOzpvLQmpCKwq/nZYfYEUL7iSHM69ZzEQMZvi+7y8OS1Di5Q8S9IGOh05P7K4xm8UoEl
         4Efg==
X-Forwarded-Encrypted: i=1; AL+hErGIa62Ud/Zx9jy2ROgP6xQbV3qTYmeXDdYo12llu74EJMxOi2yWSPMNIZyumIEsqtSQuKpox01Ggaq2WQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ja85VdVoprUHsfsYZpOV9s/femv/aaHFZDlyaN4ky7JV/S96v
	iNEHmz0QW75eAAHpXAT+oAua0SzToH2CbuuCUWlamWRMUGkJVQb1+UwUShCdiTN5wci1fw0hpoC
	JGegCf8XeXegCiUJYb49CPQ==
X-Received: from wman16.prod.google.com ([2002:a05:600c:6c50:b0:4a1:e44e:ffd0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c08b:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4ba49288bdemr21813875e9.9.1794395304668;
 Wed, 11 Nov 2026 03:08:24 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:32 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-3-vdonnefort@google.com>
Subject: [PATCH v3 2/8] arm64: Add support for MEMBLOCK_PTEMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

With the MEMBLOCK_PTEMAP flag, force a PTE-level mapping. This also
disables contiguous PTEs to make sure any page from the memblock can be
safely unmapped from the linear map.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/mm/mmu.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..a4cafafa1d82 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,9 +1184,8 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
-	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
-	u64 i;
+	struct memblock_region *r;
 
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
@@ -1226,9 +1225,14 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+		int rflags = flags;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1241,21 @@ static void __init map_mem(void)
 		 * regions. The cost is at most one page of unmapped gap at
 		 * each boundary.
 		 */
-		start = PAGE_ALIGN(start);
-		end = end & PAGE_MASK;
+		start = PAGE_ALIGN(r->base);
+		end = (r->base + r->size) & PAGE_MASK;
 		if (start >= end)
 			continue;
+
+		if (memblock_is_ptemap(r))
+			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
-			       flags);
+			       rflags);
 	}
 }
 
-- 
2.56.0.542.g3ef89b7020-goog

