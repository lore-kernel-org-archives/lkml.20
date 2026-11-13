Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540923;
	b=rcDp6EGQVub7K4JKUqykOhMW/S+qvLHqgfx7FdzwoZXH7CZjOMeQ2FH1evy14BlmSMyw
	 nqEK0UcNH4nWKYtf5ej+hC+FY7gKMMaAyjqO72CmmGWsJ/jnLORORrZQLK71McX3Z+o0E
	 vYg2fFR2JRgUMV6ZWHvqLDN84JZULaMbFZo2RCilXfyLseGXD2KGUQ+3tsqOw/6nDUmea
	 8SGz3DpLQYLp0BwoWxJR4MPkEpE+wOwF0KeV4/7wPMtHEWAxoZu+/ClPKkKUHOmaD+G5D
	 KGQnmFD062dMeZHcPnOEfe8/Yn66FFEV7+0KA2e0Ld0czPtT3nog426GkIWO1RiDBUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F8Mc5bfPfaML+usFR7btwu5wOcUdY4Py09ljLQ8hfIQ=;
	b=FQTwq2y4k6DBBfYcJD8eG/92MwHj/MWQyzlHIjSYW77a6hr2qUZj196rRi4A10GAq2Kv
	 phBLj4EYsub0l2MZ0cvASWW51+1Le1KBqIW/CYTYi+gq6s+8VxIeytELqRt2iLwl4cMIb
	 /svzQAWkaiGL6evFXLRFnTrjSvupIzsLP+dHxzKmO13WY5jv5dJcFvR2kFCV8bQ5t4GoN
	 MxbUvXsmnOGvCobsQBSw9sNBomVj/+616gP8JIa8De460cbgYLEso3GpAW6+dULQvVBgn
	 km88SarA8hXoLJlpKQrGq2lAK/Hd0/utTq0V1TGXnbv/eJD4KU2qAeVnO7AUtk/D4zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="PEyyR/Vs";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2C606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E2C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PEyyR/Vs
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so854703eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540922; x=1795145722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8Mc5bfPfaML+usFR7btwu5wOcUdY4Py09ljLQ8hfIQ=;
        b=PEyyR/VsqIQD7H6q4f1TE2PCVJWnEo9ZacISYyxSnwpoYW7FhYv17kNMx1+Wm6Y7TZ
         id5M6wASa7w3laeu4lgREB6/bhoRPHZVXTk8l8vNdZgDFhmS+Jc1+6dxv4Cn1cwnkMyi
         9J9WYFQO54eMt3ryNQIiXRSqcMNNfp+cMX+YIQ5UvcRhlf3jESJVVqZzyQGJ3aqpjrwn
         jw1WJCp5QDGoFf49RzYxDpo0JbaiBNzZ+zu2hnuPHYPRTCN6DXh9yNYR++BCKSzx1k9b
         56aYuhneJNTCcC8CxwM4sSDmIeo4MkrT+m68wXACABbblqZsUKH8mRjkoHwIqdgDLcav
         ka9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540922; x=1795145722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8Mc5bfPfaML+usFR7btwu5wOcUdY4Py09ljLQ8hfIQ=;
        b=BdHGTxYcBr02lzOTfFGFqQ6u/jXFUnGcYUHK+FWvultJ9ULDQUMkhAovSunZrGGrtW
         945a3LYfgzHTmwyxFs7BREt7VCb6To9ZUhMVoZRKwVZ7MZUUvQ32oLTniaxs3Qom/paK
         IpZ7iMWbOB7sAqJOgyIypa4kH/j+LtfXYzulqyVs60P3SIFU2HapoS/Uu4Ywbgm1PYVh
         rtweGCuROAVnBf//kQ0hOJ2e0IX+LIbO4gpeWXyEI+sMBGnYDolu0bZTewdYXCrFuNO8
         gxISYxsHzEj5CTv2oGwAiq4svd/JYL+UI4SXxe1FjUFyDoVS2hBg1ctD95M2gyqZdkqC
         eQ9Q==
X-Forwarded-Encrypted: i=1; AL+hErG/IZ7OuegXfUtT/NDKL5tDAceIy1dHdMzSXItqXHWVMJdiHaIQla5n+F2ZWB6SnprvdvQuKWL6Td1OQr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E6PsnV67/mZjAmmPrtq/GJFMiRPTPC0gCw72nOXy4S+ER5wqb
	BVjcr1zXH0X+YGkPMKV0HqG5GGyRSgMpLb/XxzZ7OYwbHx3TIXV7afcEMuq/wF0VzqU=
X-Gm-Gg: AYBFou0Z1x5TF/SOJ0I+pOuFGwoTlxvq6fXgMjYFxNoN50MzkCq7Qfu3YAOOGX+KClp
	9zPed3JuvC8JvMaDJb6DiPeu8qWNKK9CVr8zPdsEZGbjpAPs1tc+2doUhSlERB5Bo5SNFzas6S9
	7YynRhodTPdGRHVOWj/K9qsBQA84Q1kSXWN5zQCyl2WAvYg0LgIL9ADs8dpUaIu7EH99dKbUBHx
	lOAK7DcDEE8Z+XV2eW/TvtjFEdHlkI9LA/fChhOEfhQCKBZakTRJ61rdjYlSB4aS7N+HUAEe9EI
	nF2tI/MJj0kVXfC+UeJHh9Gwn8dfFNSEkDY+wgULlBPl978nLD7f8MFxGZNVqgbVYFzIJCV7Y60
	TNaj6ZWELQqf4V3+kU7oWC9O/iD83/V2DLjGXR+FzgM7tAoj0nvkso4wg950ugeAHzo8VPjCLqB
	OjAqJwpORwO6jGbLO60Jmzmj4yQRfVZaTI76N50s+spxpolhhhpMMAsnBEiwH5k9Ve31hWZttmg
	B5TcMkngTFl4vmCAp5Nq3IbkLTUIwTrHDg5HsCMquOsiFneT9nht4rclnwTOyZoPTzUwEr4KapW
	EKTQxmPWoFB9jFfxz7AV2ZEXLTHa27H5B+WDDRkPRrTFAQhIHOPa6gwIRJz9vw==
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr962228eec.6.1794540921443;
        Thu, 12 Nov 2026 19:35:21 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:20 -0800 (PST)
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
Subject: [PATCH v2 01/14] mm/mm_init: factor out memmap_init_page_from_template()
Date: Fri, 13 Nov 2026 11:34:29 +0800
Message-ID: <20261113033442.62970-2-songmuchun@bytedance.com>
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

From: Li Zhe <lizhe.67@bytedance.com>

ZONE_DEVICE memmap initialization already uses a reusable struct page
template when initializing compound tail pages.  The template mostly
contains invariant state, but a few fields still depend on the target PFN
and must be refreshed before copying the template into each destination
struct page.

Factor that operation into memmap_init_page_from_template() so other
boot-time memmap initialization paths can reuse the same helper.

No functional change intended.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 33 +++++++++++++++++++--------------
 mm/mm_init.h |  2 ++
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2367af05570b..3988c19699bc 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -707,6 +707,22 @@ static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 	}
 }
 
+void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, const struct zone *zone, struct page *template)
+{
+	/*
+	 * Refresh PFN-dependent fields in the template before the
+	 * non-temporal copy, so the destination page does not need cached
+	 * stores after memcpy_nontemporal().
+	 */
+	set_page_section_from_pfn(template, pfn);
+#ifdef WANT_PAGE_VIRTUAL
+	if (!is_highmem_idx(zone_idx(zone)))
+		set_page_address(template, __va(pfn << PAGE_SHIFT));
+#endif
+	memcpy_nontemporal(page, template, sizeof(*page));
+}
+
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
@@ -1074,17 +1090,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	}
 }
 
-static void zone_device_page_init_from_template(struct page *page,
-		unsigned long pfn, struct page *template)
-{
-	set_page_section_from_pfn(template, pfn);
-#ifdef WANT_PAGE_VIRTUAL
-	if (!is_highmem_idx(ZONE_DEVICE))
-		set_page_address(template, __va(pfn << PAGE_SHIFT));
-#endif
-	memcpy_nontemporal(page, template, sizeof(*page));
-}
-
 /*
  * With compound page geometry and when struct pages are stored in ram most
  * tail pages are reused. Consequently, the amount of unique struct pages to
@@ -1137,8 +1142,8 @@ static void __ref memmap_init_compound(struct page *head,
 
 	/* Initialize the remaining tail pages from template. */
 	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
-		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
-						    &template);
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
+					       device_zone(nid), &template);
 	prep_compound_head(head, order);
 }
 
@@ -1193,7 +1198,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 	for (; pfn < end_pfn; pfn += pfns_per_compound) {
 		page = pfn_to_page(pfn);
 
-		zone_device_page_init_from_template(page, pfn, &template);
+		memmap_init_page_from_template(page, pfn, zone, &template);
 
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 0034e37dbabd..4478419f0bb9 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -111,5 +111,7 @@ void memblock_free_all(void);
 
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
+void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, const struct zone *zone, struct page *template);
 
 #endif /* __MM_MM_INIT_H */
-- 
2.54.0

