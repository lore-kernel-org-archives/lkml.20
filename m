Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF04156F9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144979; cv=none; b=FA+H4uUvEPbXU5RXiUoE4da/4mgg1aPJlbrdgtBoG5MHHDITUTnS4R+gvYqzCkhdfo0JxsjzdlZ5n2/DQmU3H7UtWOV218NDn57qv5JReh7GLp0rJSWCqlPoftubhLu+Y+tw0dFezzGeNLfZIPP7hvIIx/fGCzNRgQ26czeN98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144979; c=relaxed/simple;
	bh=j2LDewBnaNSHSszWiLsF8rrjIezPLg/AfJBstLlMPfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRlz3r/ffstVf53zp+/4PPThSY6uJMSNXrgoeFGztPQOGlzQ+D5HrBmLPBVELInNyAAhoPnDpnBaECBQZLQv2Iz934uhuNtFV1g5UoHzXIgZdDYKgprR5QKb97rlWfadKTxHXmIdfrQb9hQJ8/qiMiQBxqQaYP0FKbFU+CuBcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn8fIPLv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn8fIPLv"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so3508725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144972; x=1790749772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEaCg+SoOuqpLOGmqy1zgShmdKDFtyrROF+HoSyjUpM=;
        b=Jn8fIPLvUJNKQOUWYa9dIyD1NuCuK7P8bsLyR0mBQV/Te/H+wFaS2tW6vjmmH/PwYI
         Eo16vqlWI4qBzGTI8wKoLfQ69TWaTR6+aEiFuKhlU0vyWbCaHFLP/UIZOW5KDMw52UoQ
         Wx8uNsXzRhW/FM+gbFwarvC6U9WWWGD5GHp5CsJwRzNt88zSIo4/HppMZBMUj7nr+KPr
         015ao1YFkmNdRz81EepBqjfL3vIhZDAm19kYLDr/KXgH8lCmvedI3q+IbYlDZu9DOtPR
         aKV585VttvqEV0qKuIXqndRDEvtSXw/HLg7hpN7sbtGQXjajKmOpp93K8JFZnfLQlJWi
         7/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144972; x=1790749772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEaCg+SoOuqpLOGmqy1zgShmdKDFtyrROF+HoSyjUpM=;
        b=2Ss1ps9PSk7ZtVPHbqCCQpsM8H6R81YZP6k/K6lZqjDsrVibO93JE/iLKk9b5GqyFM
         SnJuEWSW+dLwElhhpl70mfli0sJGF9m8sFr/spj2ApWQuItzVSB9hDeBtxctfUngD/Cl
         aBsavEulcQ5S1QRaDO5MvIEzjzGAu9Tdi1viJoNB6hoXUZjzR9rwvFFgq3BtI5WkFaOj
         udfN2qjIwxV+APTHOQqpAq4C4tXLIsfg/zCgblTgWQ+GeNj69jzriRLlzI3fgZMRmBEX
         7MKJyiCWbiown9LqzjOvj6ud6HJbzuDPv3I8RYgsApOfGCrhhO76mluLC+lz+RRQFw5T
         PztA==
X-Forwarded-Encrypted: i=1; AKwUvBwIZ/ZlvC7dfXs5ybqYE0H7wepbGNIh03y+zTT1aAz9k+M3vrqZZ6ih4PFmpO+GRfheef9FNnDxUASPwS8=@vger.kernel.org
X-Gm-Message-State: AFuF++nut7xpOaXLEr3049lo3DNNc9X0ocb/53P4g7cI201Daj8lOO7u
	pUAMaKPmLy9w+qW9Bk/IR4DuzxyZDl6szEBjgo6+L+ojjmrrWIcuQs7N
X-Gm-Gg: AYBFou2ZHVma8gveCjHLj4g/N2fuzV5IkvyVN9r/1ZqhgY26Uz8sBISRXE7foFyQ4Z4
	YpDDE6MthYuoxrNZqEomT8ZHfVQGnyOzOlix/5pSuNEhxkrwaBIyJtIZUzkTIBn61ZItQ2DZJ45
	4JfoBKM4Ryop8IxTyN3p1cEgGrlFf50vWCCLVy3ZNqy4GYE2zd1QFeSAIyNkgXqgdsH0zsi/0ED
	80isJE1gFAH+E7xJtobpDUhmBCefHEAisiEK3GMHxzEMun6qSBCvHz2pc2yEinO8z7Kx0hiWUAw
	oVRG8dHpW7x6kSw1Uv4nNL8AD8ClfUrLXdmnr8f1sLWseK799tcoVT8XbzgLlfEdqSDb8/pbbFx
	iEPBjRGp6nRA4G2s27oOGz/ep711cAzhK5ZOEvbSl/7G659sgR8BcUhOS/rAssGdaV4eDOWeOvd
	RWWlyYNZ3fTAhD4VrwSdL4vURzUNHat/o49fNl1m5x9EVTh1M8m1Y+dM6BqHPuCL1Y2I564FgLa
	BX/Dyf2jZXV8HrlCSC+4w==
X-Received: by 2002:a17:902:db0b:b0:2dd:c100:b2c2 with SMTP id d9443c01a7336-2df69e01d0cmr15666125ad.45.1790144972237;
        Tue, 22 Sep 2026 23:29:32 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:31 -0700 (PDT)
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
Subject: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Wed, 23 Sep 2026 14:28:31 +0800
Message-Id: <20260923062832.479455-10-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
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
index a43965016eb4d..37cddb7f45a4f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
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

