Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218307;
	b=y7BEkNb7hwxMd/NmPbP8f4oZ7TKADowFDpdZBumgab1MsQZRmmCWNGv5nzc4RAQx2Ok/
	 LjEuOxNn9SFxlJgngnqwjrcigz4mEiCwsBn7B2qA/PDSm4AcXIXnBqvXeiVSBHOjFB6LJ
	 rB7myElM9I3I71RH9ZbaOjPCAd8qSpFo1gS4xfkXbZyTviSpwRJ3HvjmWf2BsiDp5bU3Y
	 3bSLlapiqcjj0O0NH+0t0TJnDy4RmmifvimAqFC11JHJlg5oQbmj/z27ndkGqRKHlluOc
	 XlLReGim92/JrwSSBnRrH49WHQdWp87iDIye6VI8j8iMd3OENmldU6Uwq7GxFnkBUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ByyGzij7OlfhxHWNMnja3/uYDDbPONWszNtjJ9JVHuk=;
	b=4eO2jrMUQ6oaUoTCcVGMGsG0xztS5BbDjy/Z2aQgyNgsezOiF1o8NyIszfZaYyrPTeOF
	 fjCaxNtQDTbV/ym2coCsjk/W9swEfcc7ilqGjhCmkjdgldhczWad9vZPTPv+HR2qHSM4v
	 +QFRXHYVkClKsb/66fndQdxX+I+nLggPnLINFmjbg/KwpMuytbSFt15Nv/snJic/6kv/0
	 kaWhwQFF/jHVejn8KkFX163uTFpcbaeC+KRZ9HAM8m6Wia2GebMkgTP/+7C/cr5GR4GIS
	 yp5goZiw6up7HsaZ+/d6u1+X2tKLd79ZR614Bd3BZ+AfPmeNzBV8MFy2hQywTMFzVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JRGcIBic;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CD606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JRGcIBic
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so786937c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218306; x=1794823106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByyGzij7OlfhxHWNMnja3/uYDDbPONWszNtjJ9JVHuk=;
        b=JRGcIBicPJ8kMbSGIIwXmkN0lwNANWcuihItsoe+qbVpjZthWcYeH001BpciJoOAx+
         ychr0A2vGUfBzrnvluEoiSnOrU4vortQ9qLe8qjs3VHNCrd2qJhR2wp3acrCCQN1Pj8a
         rAAbiq4oWxBklCmHU1tGKzq/aXrEcmwh3cXdzcDXzBDVf1fn0WSBW0UoWSkA4exUDbGC
         dGWKrNtFvHkZGHJPdnDulJADFtWEhkzWgBoezTUjJ1cIhBzbifMaZPDI2qMccPNY8DrP
         82cOsEDozl/Au85p6GCiglHHGdquAOx11li8zpJZtMmyp6eszxl5iS727oEJIw857kEd
         QaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218306; x=1794823106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByyGzij7OlfhxHWNMnja3/uYDDbPONWszNtjJ9JVHuk=;
        b=ed1wcOA3TEvAjVVB/g1a/+UESEwBgimk6PJKBBK2GKlkLmYXxEcx8LQC2JcD+fLUXu
         UxTTflbSa9c3NpMapYbf+8aUlqakZFDEza9/qZDJBfex+2WaLwfwaT1rOCnH3S2vmler
         VyUuRjpjoJWb4Ta/DHvyPzOmZmHv0AQQdA14DeI9dEKagi8Stky1Xm0Fphc4rHJyaLIY
         0G4KA4mMBn+oCc7NAiUzMzFN3BkEh8Sz6nn7DjG3xKy8yUva7QDtcuDczzZ52kD4lWXH
         a5Q20SlB/4A47RG+zVJTYyrC/dOslY4i3YbbhXT1mvosQ//sgT7i4spZVmcyAeYByutU
         3tPw==
X-Forwarded-Encrypted: i=1; AL+hErGVxS2B5OXMsGtdVx4z7g/YlnzKQ3OkgI0HQ5wKc5IrB/2B3YnCZIBcq+q9Hr0OsUTtzHBLwDJjLn6yFio=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ufryExDdzu/21+XghO9Hy7fWVscKXH0AFkZ306jisRt1IXLXB
	NS1VxPSbUFTSv+iMO7mQ23g4ofTJuvmeGNzsrdtGM7oSjEXCXHFttACOk/Pl4oB5YFI=
X-Gm-Gg: AYBFou2zk9at14HRcyYVNyMcx4fFyrKuMIMzaDdZFn7/uf9F7dCZ36jLhZjZe7yYYbn
	rJVd+uMqpCcJRur3pOGwRcdqx5MXSwVqQd3C7LDfW8/3CYUwe8KXasjuCYJCPDJ7p9F9O6udCHA
	swLrnUebQaVCwgh73zOb59EioubXC4EqBpEv8m0Yx8imjIrV15vIbjEHCcauHVMTDJ6bI8mWjH/
	UesTDt1tQrLtmY9klXNoNHNGVXQZyEMg5r07fw/oyGFEz8KrXRCfIv76KmBum5AzSd2UHvyTrbA
	EGC/vppIgOelXqdp8s+KvsZOfPTk6qr/9cEub2fYUIOI3o9AIf2DpF7dmlfpO1mYvhsyaeNylYz
	SPo/8jcNBAsIdmvyHNDvGO8UH85V2nJQMQSiPaYeEORc3Fn85sOdfVkch/jTuslkMc/yA/ZlLVt
	Z1TjJDsnEzwJHtXKWHLt6nzsEu+J+T8IziLsb8WJ0Ytip2Gsf2IEeBEbTVASPV3vlG9x8BrL6hh
	t7TljGFUjdWKF+qRnQ/wW1oTIyOJGiVoukFWcGgYN9OQPmFmRx1i4R4f771BZyWU46N7ZgRQQSy
	rX2co8KK8M0YJnXXjm4YAY/LImArIBanm3TnMBwXUW0fypsNSeWSUe9WVrkngo0=
X-Received: by 2002:a05:7023:a4c:b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b3af3aea3cmr969015c88.0.1794218305527;
        Mon, 09 Nov 2026 01:58:25 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:24 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH 02/11] mm/mm_init: factor out common struct page initialization
Date: Mon,  9 Nov 2026 17:57:57 +0800
Message-ID: <20261109095807.41547-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
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
 include/linux/mm.h  |  8 --------
 mm/mm_init.c        | 23 ++++++++++++++++++-----
 mm/mm_init.h        |  2 ++
 mm/sparse-vmemmap.c |  7 +------
 4 files changed, 21 insertions(+), 19 deletions(-)

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
index 0129152b74d8..9677698f30d3 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -602,15 +602,28 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
 			page_zone_id(page));
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid)
+/* Initialize PFN-independent fields common to pages in the same zone. */
+void __meminit memmap_init_page_common(struct page *page,
+		enum zone_type zone, int nid)
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
index 0034e37dbabd..0df0644c703c 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -109,6 +109,8 @@ extern bool mirrored_kernelcore;
 bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
+void __meminit memmap_init_page_common(struct page *page, enum zone_type zone,
+		int nid);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
 
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

