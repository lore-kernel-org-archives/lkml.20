Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590013;
	b=fTysdm1PVJdqIOKJCJbX5sL7XATnaXLVhVqa2WdfMyWsr4MGDDaPbT3Bs+UeHPcuQf5M
	 XKnUkkWjFvAjStmrJZhR14Qcp9+DpP6lX/9HozNRkluC+yGHDCMzRKs/QY5YAnK12h4aq
	 iQkRQ80Fsn4Df5C8yKvP9sLIm87jvBHm0T4vnjuqF//wgqbNGSM6CyfFPK3pA+SRIuCo7
	 qV8JIsoZcfliNIhVQy6Yab+gSdwWBtRAPQn2Tjxu9B+vUX2mQg5ksqL0gnHUkSqrCgavO
	 X+AXpB1pA3LpgMCYgf9qCVfgymYDW/v3eLZ81ghgErHlhkoksy7Abb67QxTd6+/cyLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zf/FNDxhVid8OTniOLqen6jveOdJkdoTFHxNy9gCCKI=;
	b=JRIy9CAs91f29rheNZkWJhh6BFxuMlw+q3j0yZQv4J6FfGMTHSsG773gI3qFEktZe1mJ
	 LtCr6YQh6CGsuJNz6k27E08SQgxlAt3ofUzI8WfYdLib4Ew/OnlKHipI48x19uL1ZWSK9
	 Jhmmr0Xwfw4608d/ale0PUrey/996It/S2pThkp9gtJginh9vtOmRcCJZ2sRlKPF6ZfWI
	 3gzp3l8kL3klK76Y422rZ0THY9LcwM41Tcni4HhPkMZ0jPKAkzz6SLpDxQG8JxRzc04Xn
	 CO/9eCBba6jhz0TCJvRvMOJfeMpijpbHbkCeFxG8gb4NMS4/0WNbZW9pcZzXn8wM3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SdJNrRut;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D4606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3D4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SdJNrRut
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so573939a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590012; x=1794194812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zf/FNDxhVid8OTniOLqen6jveOdJkdoTFHxNy9gCCKI=;
        b=SdJNrRutTuO0udJ2DNbs/EESQWWBtul7+ZFbrouei5hYoCvMKF/advHBeQU8f/NzuY
         0ww/sLlW6HPLnVReNtV5SYQ8cVGFEyQKd1e4qqsB28WIQCBJyb02MwC2+Wv2FwpeJS1M
         b4jLm5nATSXvTx84lEyn2a+2qecvZ9cstuF+ASquF6O1gcrbrY+hIIJyOQZHDZtyFYzh
         HNpeCUCObclEl18boXtJsomEe/XEfkNKTTzbSrrmXo1EFQqzmGLwJs4nhz4/GZB34pdU
         HMTxo9d/QBIkgfk/bRGDHY0UlIOB+k23PGBt7KaHS+BvYEFa/Yw5L0UJWU/BaD2kfLSz
         IuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590012; x=1794194812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zf/FNDxhVid8OTniOLqen6jveOdJkdoTFHxNy9gCCKI=;
        b=F2YecLI/2e+t8n5OLJeVlbmH7CBMPtXpwEgRMzmNRMq9YsZK5jIMyDEg0lnKdtdQlP
         UBec0lhBMqiOOlt8yyexVuH+WN3JkoXNFEXUkrHMrbiNJ6HwT4KG4ILO5TMjYTJulCli
         HRsisCcy5sSOd0p4YBWw4/Si5s0fb7LNjP8llAUw1OPq0eXF499JgToRTyhOlKG+dc2r
         IypBqMrhA+dBkoaJ8/16sGlewU1fUAQafVtLmmTsSw9FXa0/36RkbHbhY6LS+TrVqWZR
         JzlQJgqX+qYSn3W3XVL2hqNqnvLS3lT97M1RUXH5N3XVUKJnfYHIu4cjpjQh3maseYpV
         1rnA==
X-Forwarded-Encrypted: i=1; AKwUvBziJMoHvlgQW2L0LqudfrZCpdQDj4VrBDx11b6hXrIOi9+qa7Wuv5xiolgcvp3FwZBDB2Ggju3N4G733YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YMqlEFXPOptYT0nODOq6xXlXpi1WsVlVRm/S2QBFNpoxyJGsm
	C6os0+dFGvQ5NgGXjazR1AFm0sndR+G6aNhFEUbUIluRrDqy6SDwCOwd9CTCoeitGsVXHToQBk1
	gdL/H
X-Gm-Gg: AYBFou3cOXMn4aK0XcvJB+A8iNwn3mb0tEgfHqYmpV9mS+Iw+tBIc3aVGYyY4sEwwVV
	CQJuH6IBNqF8W00oKiQIoqx7e3qJ9UfAjufEmKP+5h0qo9OIes15SqUzsyuJy2UrH5mbB6I0nic
	WVYtArX4pHENfEE5vUJU24pC/7AhPvOqjdBT8OPqw/QXvilHO9x6Ek1p5dPIoIbbj0XW5ni/8qQ
	3ZIcGSWLzNW050Rtzd7ZRIl47KQ/yIo0NfFT8tNRBLdDiWPj5TxHmoACoRVBR6nGZx2b2DMVW0K
	zYS8dk+cq9RRpzfwMLcEtCKTrzRzff5+pSwTUVB3a8hogbyimNeO3rf6tjvKKyHlU8qIeNPpCwp
	66sySqA46WqZRfmHrfkwtdj+XHjrFjpIvRFUANbEGhn0Hfad9V6bPoV88r4Yg10xABWGi4Tpowg
	UelhEb/Td2uaGmdfAAGltsXa9OmBv6RTkHmAsBjoIuEjncqY1CShnAGUc7aLx/rKoH4JlB99b/o
	NO8cNzSF3UcLW3Xu4XkfYxlzRSmD6UMvL7ew73mXt3xbeE7OPxXWeostEgL192HofspYwHs3fIj
	keMoZqW7HUUMHIAoJ2kuka+yEUo6uL17/4UN2AoKWwRNcgQcLg==
X-Received: by 2002:a17:90a:e7d2:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3ae8984dde2mr7884760a91.52.1793590012203;
        Sun, 01 Nov 2026 19:26:52 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:51 -0800 (PST)
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
Subject: [PATCH v2 08/12] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free helper
Date: Mon,  2 Nov 2026 11:25:21 +0800
Message-ID: <20261102032525.3597743-9-songmuchun@bytedance.com>
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

Keep alloc_vmemmap_page_list() together with
free_vmemmap_page_list(). This also allows the folio-oriented
optimization helper introduced in a subsequent change to reuse the
allocator without a forward declaration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d0af251aa533..244cd8a0c78a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -197,6 +197,28 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
+				   int nid)
+{
+	LIST_HEAD(local);
+
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		struct page *page;
+
+		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
+		if (!page) {
+			memmap_pages_add(i);
+			free_vmemmap_page_list(&local);
+			return -ENOMEM;
+		}
+		list_add(&page->lru, &local);
+	}
+	list_splice(&local, head);
+	memmap_pages_add(nr_pages);
+
+	return 0;
+}
+
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 					       struct list_head *vmemmap_pages)
 {
@@ -325,28 +347,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
-				   int nid)
-{
-	LIST_HEAD(local);
-
-	for (unsigned int i = 0; i < nr_pages; i++) {
-		struct page *page;
-
-		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
-		if (!page) {
-			memmap_pages_add(i);
-			free_vmemmap_page_list(&local);
-			return -ENOMEM;
-		}
-		list_add(&page->lru, &local);
-	}
-	list_splice(&local, head);
-	memmap_pages_add(nr_pages);
-
-	return 0;
-}
-
 /**
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
-- 
2.54.0

