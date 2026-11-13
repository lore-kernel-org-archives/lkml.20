Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540946;
	b=1tQeYnoIQVR4KMC6gknHTr4sST3mUwuS5YcV57z37mW5I2IblaEwHnADbSso6B4GZoqR
	 614ZNeUMs6Q3/0YqUo7MtSxVt92YAwEPXqM5IiZRDGX+u57egDBdLbpKE4M5Sybt8Z852
	 qhYxwYTEQiz0wHcZBs73OVLQjxUOvFC0w4z4U/YOKLN0iqBJA1CxUqeiF+AislNOnO8f3
	 hK7h2Sr9cAcvgTyi9KU9OvdKISj3N2DLI8Tf4SmqOowQvHbnKFFBc3fsYnJLxkvJAYeUt
	 ENiLve0e8ac05IhiD36uirBzfZW/yPmaKNPC0+WFCXGPhdDPSkZdmhzkcCu8B2Ioy0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/EpJW4u8WbHMmv1aTon1aDhD2E0ZAU/gbjsg/EqSoho=;
	b=mr1IkqelRgWRvFuUHrlaLSmYzVlDlOq42L7mjVfiKJbJIk1kgbatH28N97bN3Y9WgTC2
	 tKp80ndAXTEnKcZseajZ/liJSvq7kC6ixzM7MtblQdUfsP/ZsA55+iqoFwJH8JeXSqtLd
	 Fi++XokaXnExiVeLl6yhVZx8K0v4BpPsfDBKG/f4VE4GaMn+ov27kyhMmEEADiukeGpsk
	 cLHmw4mZnvv+VLbWCf4jyUwPkRhnUos/FuD7M0b2I6GVlXOIWM4OzNrMgSUm8JYSQK4cm
	 yL1r99KljV00a3uW4yWKNO2WtqzDVeT/FRc4df/V4WVGePC47GUDZfQe3LBCAzxCaWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IWGi4Vee;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC61606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC61606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IWGi4Vee
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37071c0f42aso829940eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540945; x=1795145745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/EpJW4u8WbHMmv1aTon1aDhD2E0ZAU/gbjsg/EqSoho=;
        b=IWGi4VeeApgNbiY2dt3OsR9FKG1Cq+ZQ9w0a/iCMhOpMKNyWKW+hOCu5Q5xSWMxUe7
         ZyzEdEvgomKthZvmZwS6VjJiBeSsCoz+MpcyqpS5fsHSovhCaZ2aU+BrEMYN9Ylvs5pK
         srJC0ZlFBqi8Rad5BQCkVkglYk0eJFr//tMSCwynryeC7ui4U50xEZgf/lIp+ySqn6RK
         cM5JZvD8BFskkmEo1Zm959X9S8TF9SrGgwQ3HCBKHmoIsCSP/hbpXGaBeoipZQ378gOd
         2NhTJwaVKH8nYxw/hm6HrxFx43zomR75tCNWdjNSX3IeekLDpft7laNssIY9UYyK5uI6
         UAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540945; x=1795145745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/EpJW4u8WbHMmv1aTon1aDhD2E0ZAU/gbjsg/EqSoho=;
        b=koK7cOnhrQFSe5fzjXMLVcT54mPkEEB9ibVcCB/UAPu1FoLUnKq23TGB/Hj635kc73
         77YeEhC08HlS28lm+HzpGwqFtEovx0l+UW3ejQPECvaiLJS/j/f/O2D6hooGHccn7m2P
         TJQCLxunioknvzO9/Nivwfx3Tp/sLmRmPUnC3MnLT83kL9DAPcW8Nx70hlaL3Mn8u5Oh
         tZhGM7zKtWPj9+EQeI2RW3nxIUngZ0OmpyoxUH5+HGKRwNG5d7sn5tTUut+vQivguQke
         o3dLvt+U1owOcvGlZeHIQmcAaMyPoZjtjpmK+mOed/c0og2EqkNkQtFjR6AlIeV10M+Y
         m0Ew==
X-Forwarded-Encrypted: i=1; AL+hErHM0Lig/YUuRz4ZzrpopTk5l8CnibtAu8Igw165+JiYfhAdBkrQyETC8Fz17C3UqvaCBcLVwIFcZkHv2+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IXvubkHuUroGQgFesySP7g4QL1iMi22vkxiuu69ZB/AXHe5ES
	3edvvV0BEnV78Q4E/ayRgWyv5Zb9eSS5Bdm1RbGyJgwSQbLO2YXEa6wkLYy0UDnlupE=
X-Gm-Gg: AYBFou133tVwWbIaz48PzXZQJ+F+6lNZGbhDMvks/I3QiW0iSVrMkbREdXrfnBgLsrK
	7J54ru5nYqU2yp9VpkmRtHBJT1S69St/Oy51K7vDKI/VPX69b055pctF7/eWtsg7hRPaHS9pKW3
	hsbu5yq7KyjoBz+HUbyX0p3KHvDICI7aqJfCYD1iO+vfYc4O1sosubkGG6kUPFkqCPtn4XRGuVP
	vsoGXSXoAY2YhOVkQ5gGa78xyH++hLcIOifym7loJ4Clp2eaICyxZpfQbmZzNLeInkB6wcJnNYw
	yQA7tr+U+YkBHwVqA7lTyWTU06DZ8juqID6i3N8PQ45lYxgILamljDsFrO9gQ3vrhEB4DweDX4/
	mx5wPdb0YJIbDRfx9epRwsR0is3CZnB+C4EFXJAGZWwE6LH/HfXA6nNGwh8tAx8HMB4gULIJWtA
	s6UXo6DtE/jXHv1kFkLi3InHku9M23fzLh6/mYD5e7gSxVoRB9znPgQtZ9UAu3meSYAwGAMOZIJ
	T+wsT6x2TWlCWxPH4zXnoMz44v2TGLpUwsGwGHSMLnHFgbEFbrKYMzQSIfr7MS8x92h4t605vBp
	mDcY7HYjBX7CbLck1RZ7Nt+AXF4sUAX/OwuF8YiUUs44nbgprszD9f4f+BX1VYs=
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr1104966eec.10.1794540940323;
        Thu, 12 Nov 2026 19:35:40 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:39 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 05/14] mm/mm_init: simplify zone device page initialization
Date: Fri, 13 Nov 2026 11:34:33 +0800
Message-ID: <20261113033442.62970-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

memmap_init_zone_device() currently seeds its reusable head and tail
templates by fully initializing the first real struct page and copying
it back into a stack object. This keeps the first page outside the
common loops and leaves __init_zone_device_page() only for template
construction.

Build both templates directly from the PFN-independent state. Add the
head-specific pgmap and refcount state to the head template and the
compound metadata to the tail template, then initialize every page
through memmap_init_page_from_template().

This removes the special handling for the first head and tail pages
without changing their final state.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Rebase on memmap_init_page_from_template().
---
 mm/mm_init.c | 94 ++++++++--------------------------------------------
 1 file changed, 14 insertions(+), 80 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 8d0b8faf3938..69bbaf75f935 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1064,48 +1064,6 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
-{
-
-	__init_single_page(page, pfn, zone_idx, nid);
-
-	/*
-	 * Mark page reserved as it will need to wait for onlining
-	 * phase for it to be fully associated with a zone.
-	 *
-	 * We can use the non-atomic __set_bit operation for setting
-	 * the flag as we are still initializing the pages.
-	 */
-	__SetPageReserved(page);
-
-	/*
-	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
-	 * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
-	 * ever freed or placed on a driver-private list.
-	 */
-	page_folio(page)->pgmap = pgmap;
-	page->zone_device_data = NULL;
-
-	/*
-	 * MEMORY_DEVICE_GENERIC pages regain a refcount of 1 in the free
-	 * path. The remaining ZONE_DEVICE types start from 0 here and raise
-	 * the count again when the allocator or driver hands the page out.
-	 */
-	switch (pgmap->type) {
-	case MEMORY_DEVICE_FS_DAX:
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_COHERENT:
-	case MEMORY_DEVICE_PCI_P2PDMA:
-		set_page_count(page, 0);
-		break;
-
-	case MEMORY_DEVICE_GENERIC:
-		break;
-	}
-}
-
 /*
  * With compound page geometry and when struct pages are stored in ram most
  * tail pages are reused. Consequently, the amount of unique struct pages to
@@ -1134,30 +1092,13 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 	struct page template;
-	struct page *page;
 
-	/*
-	 * We have to initialize the pages, including setting up page links.
-	 * prep_compound_page() does not take care of that, so instead we
-	 * open-code prep_compound_page() so we can take care of initializing
-	 * the pages in the same go.
-	 */
-	__SetPageHead(head);
-
-	/*
-	 * All tails of the same compound page share the state established by
-	 * prep_compound_tail(). Reuse one tail template for the whole range and
-	 * refresh only the PFN-dependent fields in that template before each copy.
-	 */
-	pfn = head_pfn + 1;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	prep_compound_tail(page, head, order);
-	set_page_count(page, 0);
-	memcpy(&template, page, sizeof(*page));
+	memmap_init_page_common(&template, zone_idx, nid);
+	prep_compound_tail(&template, head, order);
 
-	/* Initialize the remaining tail pages from template. */
-	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
+	__SetPageHead(head);
+	/* Initialize the tail pages from template. */
+	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
 		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
 					       device_zone(nid), &template);
 	prep_compound_head(head, order);
@@ -1191,27 +1132,20 @@ void __ref memmap_init_zone_device(struct zone *zone,
 		nr_pages = end_pfn - start_pfn;
 	}
 
-	if (!nr_pages)
-		return;
-
 	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
 
+	memmap_init_page_common(&template, zone_idx, nid);
+	page_folio(&template)->pgmap = pgmap;
 	/*
-	 * Seed the reusable head-page template from the first real struct
-	 * page. The normal page-init and refcount helpers must operate on
-	 * a real memmap entry rather than a stack object.
+	 * MEMORY_DEVICE_GENERIC pages regain a refcount of one in the free
+	 * path. The remaining ZONE_DEVICE types start from zero here and raise
+	 * the count again when the allocator or driver hands the page out.
 	 */
-	pfn = start_pfn;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	memcpy(&template, page, sizeof(*page));
-	if (pfns_per_compound != 1)
-		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, pgmap));
-	pfn += pfns_per_compound;
+	if (pgmap->type == MEMORY_DEVICE_GENERIC)
+		atomic_set(&template._refcount, 1);
 
-	/* Initialize the remaining head pages from template. */
-	for (; pfn < end_pfn; pfn += pfns_per_compound) {
+	/* Initialize the head pages from template. */
+	for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
 		page = pfn_to_page(pfn);
 
 		memmap_init_page_from_template(page, pfn, zone, &template);
-- 
2.54.0

