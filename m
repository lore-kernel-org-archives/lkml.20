Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759775;
	b=AzTzk03wb4rrAcVv/ijsehz9JihaU6XYvb/Pp8pwv1TFSiNI25YnLxvBK0acF0bEOES1
	 8i/Z76Q88Ew/orrDaoUlNxLSay7W5sl1ZDaHRhuYHLisvgWdTBmFbLw5V3NFVAbre8s+b
	 Vf9XXusIuwVm1ruQutR77UX5A2Hu2cihXmwDLPWHPz+wog1NrujRX+pEjXdGytEY1mBtX
	 mgBdhttOSdPQboQpVo33QnoOwTTqfSGOOafp8ZNt1n99DMRe4EQKXihB8ZqF9SjVkl56J
	 eKg4xcAoMd9owhHwpevD6cj0QzgOPiVbkiYOYWWPQ7PCrwYP6RgtyLExejKBozD2YKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hmNHcAA6E+5GLdOkuX3S9/3awqhKo47NdKXWx99+ceI=;
	b=1Ub6qspYJAeFW3baTdMM/QvI4G3YtKpVgqSDyciOj6FTR/aIrFQZNNlNEj1Qn+pLRFMn
	 UEFbTlA1B9gNdw8djFlYb7cH8qkCXH+EOT09hjZiwIqAeaC49TKp+NB3V/NVANiWfo1xy
	 zWKH2GrHCO8iBBuUAk6YcwoqxD3MTd8N6QdfTF21HM4qet+npXI7/G6r1FaAFf7q9Lucq
	 WZOIxQsQxdPWmev2YjMLeTP1/f4W3zaRREr2VjHQ3lVesraHyUoFjtP+LjMjkJN4Dcsls
	 P8u3Di5BF1eKxOxfk5jKPumN+cDf8NQ+pusZ5agcK7i1ul1t2W9PJ+Zbhaq6XY0xXxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EUHRn6eZ;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57660606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57660606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EUHRn6eZ
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a070781f63so120209b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759775; x=1794364575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmNHcAA6E+5GLdOkuX3S9/3awqhKo47NdKXWx99+ceI=;
        b=EUHRn6eZ1dHWSAzz0R2rpgM9VSJ7sJTLUVrf2DsbYvbcjFidCrlU7gOuqO0eb2PKGn
         F76gu11WWqwpHnpce7q7h6iqHzus6Me5T3470k1TZ+tnj8lHdBCWSqpAs4E+9B7g7//0
         Yjxqwca/G1AmoTuL2TXeJ25AYchPMqfiMEQTexaT9MOf18c+8vtEFeKGT6CSYLQ0hNgA
         vLgd9GsuccT0X/kWB3oX8ZTmYhGMGAvHsrpsMlqwxssxz5IxVQ3ED/5XgspQrEVi0xqm
         xQwiuXmgYNLjc5kbS7tWyqNBrn4LbDqKE202qQ8vYVJWgiHOfw3P2a8B3eBwnUUgsUJ8
         RmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759775; x=1794364575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmNHcAA6E+5GLdOkuX3S9/3awqhKo47NdKXWx99+ceI=;
        b=uUVXLUa/QDEE4g3g+pTVwgoOsf9PxWr1oeRoJ9uTfmiRafvhJ47zOgoun6MV4MS4u8
         NHkkE0cYIAtRceGXhgOL/0ipGHhGtZNi6uAb9+9sE9C0ZjQK1U8Lysh1K5C5oCvUzbHd
         zbBb3DdnZp67p18jXXJUnxdaAQRNsX8TPqkHG0m1+RfR3TfMvSszo3bqj8jF08O7GI2C
         GkrcgXTRnX6k0cd2iaFRfVltiOZJT40R9J0+Z1QSvqIxmSeRwT+xKW3s+OpODyUEHuZH
         3IwRYjnk0uoeC64UsfCXFXy/mwNtouMaxjRTwyVqTgy0ovRJo2xS/w2SKzyXRYXdx8Xf
         U4Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwBIndNuJ34bom6r302UUjrs7XJcKHJNeYrAsZsa8NjIqHhuY9MmL7p/Zn1s/T02Cpm5vfyjm5rD6Uod9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mLyNEWR8aUe5pbdEEJFUeidv/Wj9iGQtPLAjIy2/nNTtv6esN
	qhjU6nuQ7LnHQYgnFaWnPjIFnChSQhaaem25iQE7FMaZMASwPlcGj6J7H6HiLOu/YZ0=
X-Gm-Gg: AYBFou3t+Eim/eLD2iGSns+Wc/0hGjPmo2f8hEZuYAPQq5C/gTOvdWuBxx+mYQXalaW
	Q2sk5gGIhyQiA7r99Lcq4bDF3TWbMn0jNDKzF6iJxS72o6kgIvugSGKEn5lKPJVmfvei4zw0Xgr
	4Uv/2zEXFae3Bxn1kXe5z437BzwGWPymqXRnScNyp35Wis1tEU5P6bPndAioEq4wthNdZSkT0HY
	GF9yKBwMTUkyturTrtiY7RiYsoCfXdNIqMggfJiOyli40Pv6zjyozpuYQKnuVxx4tuxC7wj14z5
	SavAQ43+V7llot+AK3IcXXp+GBeIlqyXo/fUX0wWVovE26iSnUHbgu8HEpGfaVvEwmgVFGC10XA
	BuhNySAlQx4AOLVUtrcQ5DllmfdCDp7UUoxXZzfq82nvmBr1qhZIZeihl0x5MTxff0NrwMgs+nx
	NGDEtBZVfBMUW8fzWWK+Xt0ySqRqQCTOhBV8Ngqgk617ruQtmNT8aYvIAGA16PYN/kJqHSDaalu
	7lNIJc3M6IRsAwT93YUoJmD4AM1oa9yDTHzU4EVoysGcW4G/HR1LmgKKDSm6OYVZjSa7wIQbTX2
	MuwDyiYACPVuDR7w01+EgJT4O2zgJBuHl+bTebT8kKB8AomKbU4kp/sdEwO1zGilpGadEZo=
X-Received: by 2002:a05:6a00:6017:b0:88c:fa50:1a86 with SMTP id d2e1a72fcca58-8a9be48be28mr11709585b3a.25.1793759774527;
        Tue, 03 Nov 2026 18:36:14 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:13 -0800 (PST)
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
Subject: [PATCH v3 08/12] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free helper
Date: Wed,  4 Nov 2026 10:35:06 +0800
Message-ID: <20261104023510.260766-9-songmuchun@bytedance.com>
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

Keep alloc_vmemmap_page_list() together with
free_vmemmap_page_list(). This also allows the folio-oriented
optimization helper introduced in a subsequent change to reuse the
allocator without a forward declaration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Carry the revised allocation cleanup through the helper move (follow-up
  to review by Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2724539f9c62..7d51df1cb78b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -197,6 +197,28 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static int alloc_vmemmap_page_list(struct list_head *head,
+		unsigned int nr_pages, int nid)
+{
+	LIST_HEAD(new_pages);
+	struct page *page, *next;
+
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
+		if (!page)
+			goto free_pages;
+		list_add(&page->lru, &new_pages);
+	}
+	list_splice(&new_pages, head);
+	memmap_pages_add(nr_pages);
+
+	return 0;
+free_pages:
+	list_for_each_entry_safe(page, next, &new_pages, lru)
+		__free_page(page);
+	return -ENOMEM;
+}
+
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 		struct list_head *vmemmap_pages)
 {
@@ -324,28 +346,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(struct list_head *head,
-		unsigned int nr_pages, int nid)
-{
-	LIST_HEAD(new_pages);
-	struct page *page, *next;
-
-	for (unsigned int i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
-		if (!page)
-			goto free_pages;
-		list_add(&page->lru, &new_pages);
-	}
-	list_splice(&new_pages, head);
-	memmap_pages_add(nr_pages);
-
-	return 0;
-free_pages:
-	list_for_each_entry_safe(page, next, &new_pages, lru)
-		__free_page(page);
-	return -ENOMEM;
-}
-
 /**
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
-- 
2.54.0

