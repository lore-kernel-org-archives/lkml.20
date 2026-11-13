Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540937;
	b=nh55UGuJvhDB02X2ghZnRDwUFD36d82XbQIiAKHdU9UVY89P+/dqVzvOCMTXhQZoeYNO
	 nFQYav6FOUUVM0YziH3AZzL6JS30ihrhBOjA62uK/DFw2LyCL/Hk/mgC17tvJDLSaynTH
	 weSh61swV1eYsYSvXwi4BCYDrUciPRyJdtwYrqs5lbmx5ng8vUqSrK4c7uIfnow6TiGju
	 wmfcmqH5+tNb7vQzMu3nhvlJio269vGXHmYqwHhJYwfwx1eug2DR9QelqHEL8zQYNWmLG
	 xDqGkn2t6jDFTZWaOzkVeKOb3QuNziet7cYL7/dK7NDe0IxIB5afbrQNBAm74AYU1/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xerMoqxyOI259DioKFmjqunoPjgI+nLHAnuHAtyHQXc=;
	b=qAX+IYomxyUbqdOLKig4cJ7hrp1dm5pGrDSnKKAVL3HFWy+mV0dZhWIR70O15IhyyPhQ
	 0D4TId6qPJR3tQs1gqjJaEmbltJbA/6Ud7QyZbhCXsgDexE2urYRvh6m0SkSgctkk1014
	 qfVrFzRKECVR0cczsxLhwsYoyNj8iwZSZ71aE6C//VDo+BXs712DJws721D+8O42iSf8A
	 A+4dTXkhng1sh3byRqwwbr+u2EoEg6isCQlprQRi0y+maQNxepU1QYPCrx1PkeeQsJEcM
	 3E5Zd0pGX/wknV/7Sq0s60RQa6oiwQj+19loKMOAd1PA2C/P7IADSHNop/6elQkweOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jp9lYbpn;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9F606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC9F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jp9lYbpn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso686350eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540936; x=1795145736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xerMoqxyOI259DioKFmjqunoPjgI+nLHAnuHAtyHQXc=;
        b=jp9lYbpnslb9NnxCgLJjuupbCbN/M0kLSY6fOUVxEkScWYkj/hzoi2Tdqp4JPexmd9
         G41mi11zY36C4nlO4LyRqzKUyc8vBrmQQ5HPMs8OL6D2Ex4gNmLU6dR19POgnR9SiSZ8
         9udzFXXIWoM9KLM0/Vfd6O3M3D7RazRSkOFk/A3tYsK/1/MAViflSfzpesLquLWe91Gy
         ufqs9yvr02VXiL7R4VCsWCfQ09wL1G5Xuc2srTIpZl1kcTZXPpGWxlevX70TktOy8BNL
         b0fu3J0TvrwE3dx+dqxEq/BLwBIbapCfuNwacZhMKzB4wj3fY8kMABnppuYwNKEVPzyu
         RJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540936; x=1795145736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xerMoqxyOI259DioKFmjqunoPjgI+nLHAnuHAtyHQXc=;
        b=qk0wMK7xqOgz3B2pA86veMiXwcc+6ZDxCeD3s7485SbJle6PShQrdTuCgMlU8/A4TK
         JcO2Rk8arRtbw8PQn3RuJll1TL0txYAJ3GCFHlqYS5d2n+bUG2N07I7o6WnE7I02WjNE
         ALqK9BaiO0GxsPRTgiigU87cFjyArSbhCJb2ieILDpyl44mB1sa8Cvte/WZx5prY2CdA
         RFJPzE2UiJDPx71dCVRhZzK23Ion7ZD7iGT/qavlfWgeldq3RnpM1D3tVVc3G6g4lkR4
         Qmtt9h09cfwFSdh8mF8xg9/CEVTUK12TlSo9CkQnXWUhqdhEoF4cPHtrObfpr1bHnJX+
         yKlA==
X-Forwarded-Encrypted: i=1; AL+hErHsYzuYQKatgsWBC1J9/DTq5+zd8VSXDa0BFwdFFyAkNHfSSRuo+k6Hz59oW7iFHy5ZDvnK29Bn92UjUlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JASfeJz36X5B5blEwEkpStySiQiavk90eFZ7UGJSWPxyJ60L5
	/0km88VP9Zz4NqV7J0YbfB0jq67Iw4U3ZD0Gp2s1OD0XMuqBoPFHs52S2Tlf5klA1LA=
X-Gm-Gg: AYBFou0jAMimjkJv8wnsn3MTL+teAT1ZDPedpk7UZ/tEHm1RbJuyHzCCrFJRKl07o/M
	eCXQ5sA5kR2Hihm9TjDq0htebQNVULze2Q3muNSpaGvksRuVgMg+++slV5RvtV0O2LzpOG3e32Y
	ha9jGy7di+dOA4MN0HBqGP4oQK/DTlC6DPgyHmfIt/xVLH+Dy4dElKUDLUMMJWzCJrA1QTOLd2Z
	PEtpqBlnPJ1wRQJjwO9IFzwsdCIfrjLEQKZBMlGMQcX4LysVuXr8cjiDLRjC93euTBb019nzvmQ
	hJ1y1X2j3PpxwXmfENLpxCvJeXmP8pMQ702CK/QO7Gde5436SIhs+4Bu7E0uqp3lH+hygb3/DtN
	kIhf+WP5N1JPgIDJ6uu6/GUZUYCl6W1cNu/3m9hplrBF4KpUMolPOzGwyzlpc6MYpvAO1JcifII
	3ljfSJLuzMXj7cduX3NWmtCYTQHBoKqW+T1TkHWg5BY+7zwrlExIyHZ6EoToDqEPGy/lU1CXpZv
	yJVLzTUL2B1+vHstghj6zvuqSsO8hwBZGKJjCsw5ekYdlFQBgVsIcnBKWShQYYuvxqoPQLlLzv2
	kqd0VseEsRyee6vFjgSy2hQJrMeIVxgsmg7HgyIO4JjX/GX+sKpoBCehzCw7Dnc=
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr1048930eec.0.1794540935826;
        Thu, 12 Nov 2026 19:35:35 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:35 -0800 (PST)
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
Subject: [PATCH v2 04/14] mm/mm_init: factor out common struct page initialization
Date: Fri, 13 Nov 2026 11:34:32 +0800
Message-ID: <20261113033442.62970-5-songmuchun@bytedance.com>
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

Several struct page fields have the same initial values for every page in
a zone. __init_single_page() initializes this state as part of its
per-page setup, while the shared vmemmap tail path open-codes only a
subset.

Factor the PFN-independent state into memmap_init_page_common() and use
it for both regular and shared tail struct pages. Keep section-, PFN-
and instance-specific initialization in __init_single_page().

This also initializes the last cpupid and KASAN tag for shared tail
struct pages consistently with regular struct pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Remove __meminit from memmap_init_page_common() so HVO shared tail
  pages can call it after init text is freed (reported by Sashiko).
---
 include/linux/mm.h  |  8 --------
 mm/mm_init.c        | 22 +++++++++++++++++-----
 mm/mm_init.h        |  1 +
 mm/sparse-vmemmap.c |  7 +------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77b5d450fe45..2e182498898e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3022,14 +3022,6 @@ static inline void set_page_node(struct page *page, unsigned long node)
 	page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
 }
 
-static inline void set_page_links(struct page *page, enum zone_type zone,
-	unsigned long node, unsigned long pfn)
-{
-	set_page_zone(page, zone);
-	set_page_node(page, node);
-	set_page_section_from_pfn(page, pfn);
-}
-
 /**
  * folio_nr_pages - The number of pages in the folio.
  * @folio: The folio.
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5ce5a325021c..8d0b8faf3938 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -603,15 +603,27 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
 			page_zone_id(page));
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid)
+/* Initialize PFN-independent fields common to pages in the same zone. */
+void memmap_init_page_common(struct page *page, enum zone_type zone, int nid)
 {
 	mm_zero_struct_page(page);
-	set_page_links(page, zone, nid, pfn);
-	init_page_count(page);
-	atomic_set(&page->_mapcount, -1);
+	set_page_zone(page, zone);
+	set_page_node(page, nid);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
+	atomic_set(&page->_mapcount, -1);
+#ifdef CONFIG_ZONE_DEVICE
+	if (zone == ZONE_DEVICE)
+		__SetPageReserved(page);
+#endif
+}
+
+void __meminit __init_single_page(struct page *page, unsigned long pfn,
+		unsigned long zone, int nid)
+{
+	memmap_init_page_common(page, zone, nid);
+	set_page_section_from_pfn(page, pfn);
+	init_page_count(page);
 
 	INIT_LIST_HEAD(&page->lru);
 #ifdef WANT_PAGE_VIRTUAL
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 4478419f0bb9..9de9db31320d 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -109,6 +109,7 @@ extern bool mirrored_kernelcore;
 bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
+void memmap_init_page_common(struct page *page, enum zone_type zone, int nid);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
 void __meminit memmap_init_page_from_template(struct page *page,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 9b80dd7326f7..fd869617423a 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -212,12 +212,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
-		mm_zero_struct_page(page);
-		atomic_set(&page->_mapcount, -1);
-		set_page_node(page, zone_to_nid(zone));
-		set_page_zone(page, zone_idx(zone));
-		if (zone_is_zone_device(zone))
-			__SetPageReserved(page);
+		memmap_init_page_common(page, zone_idx(zone), zone_to_nid(zone));
 		prep_compound_tail(page, NULL, order);
 	}
 
-- 
2.54.0

