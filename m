Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759788;
	b=qurojeVSjIZSBa3cp9SkuJIjvwMBEoUX8FwkYd8EsiWOgGewcYLK4bIB4VJSVdLSC8ug
	 /jA0GD7fQ9AIn0JVMWsy5U3j3NnY9fB0Db0x3cYpjqt+g+LymX+zUOOaaDuIyLvDuNEi1
	 FTN0Z6UL+VnLFAqd8gWj83yQ7/Y2HsSA0srr5OhWsmWyEdtYx7CQDiL5B+hNco068IqTz
	 S8fo9OCr2eWtev7K7LYHR29mHUHMSv9PhlRIzj8vWEB/9eCGIXDUb3kTWw6kmZZloXu/+
	 2mz4bBQSCBIqsAams9R4pnD1e7Rd7Pk59jq0C3k7rV5YAZ+y47SvGaOcdhl/HGswc8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y0mn0lCTeJh6YvCHtCywa6O+LBHG8JthBO+lQUGYTQk=;
	b=sY4z0xprqEqFT1WR7LVeYwtWKpjy+ht4NnwrEEDmqrsHWvXs0cRLuAimf3bdR0oEjcHr
	 O/PRK6E3pzpI0go2S+03fMsJIPUUWpaO1hCGJ1267FvxjqefI7h687DDeYeApdJJ4pHB2
	 61RPBTI2+eBeGxplklAmiEPts9TiL/G91plDN3oLXk0EtgDTLmoDL3P9MkOp7as3sskaU
	 Xd6BX5s7oklVm+3rwRn+qSbQ8s35hEaFAmPeNo8BKnM/gEu/94wcqzW47Me4oj0zv1HEB
	 FcyidBbAGyoJlza9WfSbmTCOODi+CtCnaa2QInSh7bmfuBs9r0XYiSc5r94cR8wuh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bdBd59zw;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0594606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0594606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bdBd59zw
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89f639ba307so113553b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759787; x=1794364587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0mn0lCTeJh6YvCHtCywa6O+LBHG8JthBO+lQUGYTQk=;
        b=bdBd59zw1ty9LXsUowPco91blrCeGXhsqtwuj3Jpx/vWNEDN2NofSsGcN+4yDYdTYo
         t3t04w2w5PU9sUYS32/3FnWW1zMbFCUlEamotc/bThP7C9ncxDqYeFlzGaIwP3ZhFpTA
         yZ/6tWLcnSC3+ydPctVP0D3X3Lv+0uHteljOcHXDxjQ/MB9ozhbwE6oHDVQ/y4AaAFpj
         BnVUVbfo7k6pey7yZF1lgsj9/v93D7PujhMQRii4/ds5Db3PAc3Iw3zHrmvEgBj5AbGC
         Z8DfXS8ZQ/97GDEP7GbvMAeedl3SEv9vCRa1ZKqq+PypoWmFYDYmGDU1UyIkbrAZaWMG
         /AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759787; x=1794364587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0mn0lCTeJh6YvCHtCywa6O+LBHG8JthBO+lQUGYTQk=;
        b=eeX0bxib3S1r9ENLJrqASFqrfBS3hoEhdMqW7rduRVcLgfahJQCSG4NaykBZaI55zI
         fZ4ThFKVVCHiUN9c0iBG/WrgiAFwmF8b+HTSzIl4fb+j+I525XxF+aBxPhol524NSwNa
         Hz4gpkSkrSz0tr/di+ga2M3NqH+CA7v5JCPkDPp8EMw1FWaUQpSHDoj/bOZATU9ltcgQ
         jTL+0Z6WCnH9n+sukt7FLKu6e+UKaRLN2fg5f4I+JJnD+mEYlQskTzwSvoz5T7U1L/rC
         tacgWd/r9JeholsaLJbX207v8q0eX4s6bvBW9ir+a6QEbozruXx3VGiWVzG8AAZuVt+N
         Ts0w==
X-Forwarded-Encrypted: i=1; AKwUvBzUJlVVSQV8y55UqiaZdWYuRWNsbAzbma0kNvWUpmVyklmz9wf15vcl9HmmeXsaraOhWQcLUTyJHwJ5Wpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z98ijgtVLI3YgiU5q2+LndjUudqXyavMfQRbGdTLCuDvNy7nVqj
	Ntegkj96SSPcob2IpfJ00l6L50m+f3AgnGVVw/N3HOhjw77hFFEWXYxCT6P2lYNswTVsupsR+yx
	rX/L/Gn8=
X-Gm-Gg: AYBFou1oJMnCyifRk4dglweHBRKPh7h6CINR4oeQ7VAeLxUg8Qw9b8zI6TsSEmCFATB
	fSFuKHVNm7LOqdWUAWScwZkpXSDjx46PmRlVi3qY9R4jJkWwNrjoi/qCySrImxpavEui54GHP/r
	1XDG3wxE/PlBnLQWmmLiLcKvbIc7XUFivm0/l3kQ2gcMGWC93Kc9X9ih8LBzO1e8TuNECQvjy7O
	Tt9OvdFFUGzf1Z2okqrHUl5Ie+TWferWLEsyWIHxdMN8WknDclOU/5C+8CYzd3vdvTGpAUNP7NN
	xSY/D5M6+qp0E0r2KZsURMQgwkX2mpP7WYuKBqp87gc8n0xqiDVmW5kAeYfU3FCNHsmx6RRzBSu
	dQ7QWBF+XtchXXbrxXECLTighQtMTkSt6wHiFRE9CWgrbWh+uEyzRWMBKt1VyGX0csL3Kff1KYF
	YvoFeo2rb2JLx7nBjs7LxeR5nU7ChkZYrDhEvTLByunPQXFbmmxMKAehCfSg2TPZi7X9tnU9xHw
	NapY/hSvL8NTdtdwNmbNbkLZBoEYdkiPq/43i8uCm5YD2038l9CWjuyMqhwvB/Ha1vKEDPwuS2j
	XfqHePvCiVIQu0iYjpqNXrWJmIqdpceHm3l7E1J0LUmDoIdTHIw=
X-Received: by 2002:a05:6a21:6197:b0:3e2:168b:d317 with SMTP id adf61e73a8af0-3e928d8ad35mr12759117637.44.1793759786727;
        Tue, 03 Nov 2026 18:36:26 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:25 -0800 (PST)
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
Subject: [PATCH v3 11/12] mm: hugetlb_vmemmap: unify vmemmap range restoration
Date: Wed,  4 Nov 2026 10:35:09 +0800
Message-ID: <20261104023510.260766-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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

Restoring an optimized folio and rolling back a partial optimization
both restore a vmemmap range, but the operation is currently implemented
separately in each path.

Use a single range-restoration path for both cases, making rollback an
explicit bounded form of normal restoration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index e424cb0b1a78..0dcbc2b72384 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -287,6 +287,18 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
+		struct list_head *vmemmap_pages, unsigned long flags)
+{
+	struct vmemmap_remap_walk walk = {
+		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_pages	= vmemmap_pages,
+		.flags		= flags,
+	};
+
+	return vmemmap_remap_range(start, end, &walk);
+}
+
 /**
  * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
  *                      backing PMDs of the directmap into PTEs
@@ -345,19 +357,7 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 		return ret;
 
 	end = start + walk.nr_walked * PAGE_SIZE;
-
-	/*
-	 * vmemmap_pages contains pages from the previous vmemmap_remap_range()
-	 * call which failed.  These are pages which were removed from
-	 * the vmemmap. They will be restored in the following call.
-	 */
-	walk = (struct vmemmap_remap_walk) {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= vmemmap_pages,
-		.flags		= 0,
-	};
-
-	vmemmap_remap_range(start, end, &walk);
+	vmemmap_restore_range(start, end, vmemmap_pages, 0);
 
 	return ret;
 }
@@ -379,17 +379,12 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	int nid = folio_nid(folio);
 	unsigned long start = (unsigned long)folio_page(folio, 0);
 	unsigned long end = start + folio_vmemmap_size(folio);
-	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= &vmemmap_pages,
-		.flags		= flags,
-	};
 
 	start += VMEMMAP_OPTIMIZATION_SIZE;
 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
 		return -ENOMEM;
 
-	return vmemmap_remap_range(start, end, &walk);
+	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
-- 
2.54.0

