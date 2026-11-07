Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059461;
	b=P0WPJbazDR2znYWAGaZyQXDEdawUdN3a63GbGo6bqtrIuvpsVBKhbt0JEzcj/xelCUAY
	 K9N6bXWr1IYoqylb3W4RYGhjc13vz1kM56Z6JBQ+VgvQ7m4rp7vYqPGzZ99VavbbKdSRK
	 ai0l1iA/yCeKdpnF4ZYb2vwExujlPrCVxQGWN8AGu5efuI5vyi//HKNZCmOlvwRUFJk/J
	 WEcrMW0bym68uHfH6DppatATeMFKQUSy/SqMChVUTrv+wmV+PDVEeFmeTvzSNI90qMny6
	 i1KjB5PYWKpOb+TNWkPvWNEvxoZ30DyxDMvcQAEaP7wN76swRTQqCyD+BZ+AKq74KfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=;
	b=TM/TbMACLsbXygVUb2mOrflQ5PID45SUKVckHXfWRWamYec6z+t4aPaC1H+d3PkI6ZV5
	 cPQ2XRbrEm5IlEZnLw3mrSjq2/nhrd+Ecd6Lpc54IlXltIi5jayhugRwtKcTgEYGpGnBB
	 7JCwx0nqji2JQ1/YUC0LmUEn9d1l/yoAdJvP7dPcKbf8kXY1GOqNfHCR+xw9v8sZ7Lb4V
	 5gixO18UoULVl11PyC2U5YAq2JdKa8P/IATaYJ90eFNTwSqX18A5re2xQw2wpdABEcLN0
	 0LxW7rSC0pBz7H76CwJ6xwz6wJRybEMGvs47Ufv+wj1z3U4ZPyxff7Qw2v93pl3IufA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCLMKgrt;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16A606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD16A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCLMKgrt
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2544340eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059460; x=1794664260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=;
        b=zCLMKgrtRgVOiA2nru7jGU2ahJI8wb64XNZXoX9C75Ey/UdEaf0k9NK/rZgWl+3sH2
         3mOcnad6/pHQ8lXTZE9n7Fa5NCW5Dg37HlJQk9SGRn8rQ+MF3/x28G0PRuZjsnuNlaQ4
         s6nmjgu441CrAVXKOD4nwrdFoeRaDijN1/KTsSjeEbZ3fMED6nsMYKHXEKRer/CL2Wtl
         kLgLLId8/5ul4A/Nl1sxzxv+L/inR/wxINM2wtZ+5v3Gsdpmwr+YniUbFHPu9D88XbYF
         CPZjhPnBsU0NdaDmlwtnKoHnXzXX7PgTmwLcv8d3V4BibymzLQ+YVhwYZaLg/M7VQAB1
         rpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059460; x=1794664260;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=;
        b=Hy5IT9/t/vAFEw9qPDw2Pu6y5UTaQMHqh4Pb/hYn79MqnxZt/SDEYHqF8j6j21B0nw
         yM0azdVtlcurLzbejGi+iNQkw/k687ZdugR5gy95IHdNck2kHeCGH4eXkD3O+9V4186q
         BGWhINQ4nX1iJo++YpnYvr85sPigCcpRmZWVqQA+TI23bK1L8hshUnJD3mtIuytFXTm4
         u0ba7i0MEO8xM4wCQi3+REeHMXbBxOdMOFmSVNfawFaUd9WztKI+BIsL7zqwEIrnOY+o
         x7Ltb8eM3rXQI4YKDh1rrhbuIR+TGwQlVRAumLS07mRpfp84kreDV/DuA8c6j3j+F2NZ
         BdYg==
X-Forwarded-Encrypted: i=1; AL+hErFum2d+Mb7m52uaoBv1vf/qSNI9uK0NpTbIfsILiHqW2dteAKIsLQ6MM445NXbkjFMBzjaDgCqtTdEqDzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c/Hb+cwGv5f+T5MbOG5CRPej8aNkTDh8RFxi7QHwZWkbX4vOu
	S8qiHgcrh0HUtG/Vwo9HZ4hbTShKkqpItRtUZfu1maaFba+y85efPUpF
X-Gm-Gg: AYBFou3ccRHPzt16tIKMMveShvrXm8tQLb6TmCghMgsjlEjultLfauDlOWQhcMXv8+k
	yb4nmYwwXsA5n+1NtQqoXPTtYGkgDHs86bvGKRYff1o5N5EByP0lln+xXrKDfjj+UuHVYCdu1NA
	uJEztaKypRnGCvjaCkMHv+CVVHJseVEX0cGUlwLHK5kIGVOFANJR8xFWqz+Z+bGgzgE3ESh/TQX
	Fo9rjXofVb3bgFDWgvOugHlMuLBnMGG52NiK8u5IHwAszeNcA18xEbO2hRpXCym8CtZve70GC/n
	s/aAD8ailaz7jOoS4KQTGi6HDd5ebauH7eXF4kKHZLoP053PNZSQkh6q36+x/owxiGlWm89otCB
	wEP9zk+qVy3UscDery/Q0Aq8FT8/WkiYZS3FwDvwkn+WFHj6BHmsPpNnCxJcuCbELoOv+a6VwN0
	4T1EhUluqHluJnQKILQUJvSe8iaS8aAoHB2SEnxk2RGA81JZzMcMyvi3VBAlr+9cpliTa9YKVSS
	67dzNrM/XAMhLS5n922FE/unAY4ISZgs9tncJagQe7FBGXWnw6O83BV9BUJmCwe5WTmB7TTc9UZ
	IpxMnpPLx4DhYEisbqloEV9YJaV6Ij3qvWtclsi5qcgwJt6WRuyTME34MQ==
X-Received: by 2002:a05:7301:6285:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36f76f0e752mr7696943eec.38.1794059459921;
        Sat, 07 Nov 2026 05:50:59 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:59 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Sat,  7 Nov 2026 21:49:52 +0800
Message-Id: <20261107134953.748622-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

With large mappings, vmap_try_huge_pmd() may free an empty PTE table
left behind by an earlier vunmap() and install a PMD while vread_iter()
walks the same range without the mmap lock. Set VM_UNINITIALIZED on the
area until the mapping is complete, as __vmalloc_node_range_noprof()
already does, so that vread_iter() skips it.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 884e178405171..5b898da0826ad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3617,6 +3617,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
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
@@ -3655,13 +3734,13 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_vm_area_caller(size, flags | VM_UNINITIALIZED,
+				  __builtin_return_address(0));
 	if (!area)
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
@@ -3670,6 +3749,9 @@ void *vmap(struct page **pages, unsigned int count,
 		area->pages = pages;
 		area->nr_pages = count;
 	}
+
+	clear_vm_uninitialized_flag(area);
+
 	return area->addr;
 }
 EXPORT_SYMBOL(vmap);
-- 
2.34.1

