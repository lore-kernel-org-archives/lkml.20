Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652948;
	b=Pe6LqlBH1rz8lKAZRTCcM2BCXyEdpHMirRSKwWlQd1eG/7+DVs8/9ayIgwtcIPmAsRWn
	 /jvzolS6AvPZh5eIJSGQh+7bxTwCu41uzexT+OITpNtl+qo2/4D3gca3pa57VunTo4RD2
	 lG3+sq+GCr2zZF9Y+EWzJr+V9R7otA4ijo0BNNPrCgD1a4Th9krve4pK3OUOq9gRcXQvG
	 QbJ5PyRzEb8h/ABc0uA9ehUmdNC9KghOkrf5+rYy0cJFmmgznoLLKxs3QNQCq6REMzbw8
	 Sb16plTYTcSk/Ocz+z/AaNS0UQBw8Yk5WdS/uIkl99I0T+BkTCvGYbozjzu9rhTTFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=99ZqQGXUzLhB02hNr3DGsqAO8D0mPds4zbqLAs61ubA=;
	b=xV+14rc/DxpFiBS9I+kjnsekzaOQ3K5kfnv3xtTHvgMQXJo/OMXbHSpMMrc69ZMlo70D
	 iNSyr46eO3zzX1pCA5yItOf+LzUvvrbDx7ZMtF3j8e6iPjVWoSiFqZgEJKuPpIvIO6Vk8
	 67WsjJxFuynuJYq2tV8ASUD3WUvcrwNiAqGL+4RAZbLn18rQTpGj60P7IbGRwLsoxwL1z
	 1MRUH3IyhgaViAHaXHrtCsxuMRYT2Z+/691hIciWYOxFrxWSlz6LJl4f/WameBO07BQLK
	 zh8fGRBs1GusItxxCSezElweScyFSvyGq2tL9gYaXWU5tpTzJuMFfdDZEauwUuplxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZrD5rBnt;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C1606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8C1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZrD5rBnt
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3720addb068so2949562eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794652947; x=1795257747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99ZqQGXUzLhB02hNr3DGsqAO8D0mPds4zbqLAs61ubA=;
        b=ZrD5rBnt4MwkiufJP0CYSSLREaptrf6sHKZYW9Zuczpb/t28Z0Ohtj8ZQEnMihgoxl
         5tYDCyw3/+I9/PNvvvDC7JvxViVQYPXNjjfl2D9hhJVaTk15FUaz1/VaByIzDBhqP5DT
         U7qJ0Pzt+yNoiCRnVnXzsP5XqoZcvHw/cq6TkSdMmsoLdiBiFlZgZwHiMBfwE0Bq6DUY
         CIkkTeXmKVFLVc6dggrFuWuYJfTbuRv/KgBDek7S3upBkIGY9BvnZFKbukw5rqMlwHRh
         TqBOc9GRnnZN2HLhRR3t+t02u/s3ug+KVMgZm4nvw7OOCN/CbZuYd0nt6YV3ZpWDBPsX
         Zfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652947; x=1795257747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99ZqQGXUzLhB02hNr3DGsqAO8D0mPds4zbqLAs61ubA=;
        b=zAolNhbl//PEvN6rtUsMS8KFOgHaayPfLUz8Da4bYMyX/OdeQcInGK6YcczNq89DNZ
         ZhNUO7oqvZi9w9S/SLcLw4dQMbwWZRjXJB1CXnK0hbumut0JfUDRZeIRxsdvXyDsXy5h
         kstVq64+sqcc+sF6jMyjtD87D0cNswKwZ6mHFwhHOaWYnFKx+nyiB2xMNYxMxr3s2GPf
         FPBycqNYvfERdCHbF21lZ9JRRRd5bp5816c1yh0L53v0xy8/CZ4cFyzfjsbRmV3FlZ1S
         bf0w8PwwvWPOvzIDn8TvZmO7q76xyxkowKw0RgZ0gRhzoifDpK2BEgEjKPn0Wjj/9teX
         SkCQ==
X-Forwarded-Encrypted: i=1; AL+hErFzdCRp6G3wWmt9fBGiCFSByrsSD0v9L0S85EFtRgc+0B8iop9br/QRQ4DzqzxoxtNr3xvzHM+Ym3zl5P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NL3nuO6zOCrstKm0S56bYFL63QMjZpqUYmdb7iE+mOjVdDi9d
	6t6Y8PAzDFA7ecLkvI1xwsbkJBnmrdunc8L3sbJv+SAJ12aSoHEe0UQRF/zCr0QSM/M=
X-Gm-Gg: AYBFou3xzP89Q09r09VI2K+XB8zNWgM7LAfcBtE6QOGS+K+VDRstO8yDpRNn/z4YZmm
	RurOpW76Kos12/hY4Ml/T4YLTm1CR+w/Qbrt790SKL1MqALA6K5FbB4+KUElMHrW0n3Sk/uJVpw
	yrsWuo5hoc3UizStdRmtsaVcCK/AV8wrrBKxj10XN6LDQkfH/bNJUN91QwnsF5cCFr3rHWRMbz4
	bbSpOag03e2KQDfgCc7OWmZrbwVEgAyiwwX4oaOfpFx2zUj9VPWccxLjWZxljlFJHjNGKnoq1Jf
	Tl7s2pnpIB+uKsqL/l8rzHu4KQQamZl9wNrLSN5UarRc+CwOEzf8/5Z5QMHqLWnZw2abNY3Y2Qa
	SdlV4OaATLxy0U21UK+mZotJ1Yu0vJH6wtDAsC8gGF2uEeB4uOBpT74t7CPY171kxwYcYDXAD3+
	Vcyn/KMoAZSnsZrz6ZwOHXYnNBLQJdQtSSQ3jhB5kSwZx3cgQEi9M+kg7/dPydJ2EE/CpEfnVtv
	t4xnnP1/OasqNSH0OaS10pSImh8KhH5efAYmlNAoZr8LEhB8jeuCz0lKhXsVJMo3VrRWa+/0I+4
	yT764BFL9TcbHPM4DgcpTBY3aCr0b+B5U2Sn0k7I40MhTLKjUnG18l2Gkx5H
X-Received: by 2002:a05:693c:414f:10b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-37965f9c4e4mr5541101eec.8.1794652947179;
        Sat, 14 Nov 2026 02:42:27 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm15772917eec.7.2026.11.14.02.42.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 02:42:26 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Mostafa Saleh <smostafa@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Usama Arif <usama.arif@bytedance.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/3] kmsan: encapsulate per-page metadata access
Date: Sat, 14 Nov 2026 18:41:47 +0800
Message-ID: <20261114104150.58424-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114104150.58424-1-songmuchun@bytedance.com>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
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

KMSAN accesses the shadow and origin page pointers directly through
struct page.  This spreads knowledge of the metadata storage across the
shadow implementation and makes changing that storage unnecessarily
invasive.

Introduce helpers that get and set both metadata page pointers together
and convert the existing users to them.  Keeping the pair together also
lets callers avoid duplicate lookups once the storage moves out of struct
page.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/kmsan/shadow.c | 86 +++++++++++++++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 0c88d89bf0d6..8922d1ba9a0a 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -20,29 +20,43 @@
 #include "../vmalloc.h"
 #include "kmsan.h"
 
-#define shadow_page_for(page) ((page)->kmsan_shadow)
+struct page_metadata {
+	struct page *shadow;
+	struct page *origin;
+};
 
-#define origin_page_for(page) ((page)->kmsan_origin)
+static inline struct page_metadata get_page_metadata(struct page *page)
+{
+	return (struct page_metadata) {
+		.shadow = page->kmsan_shadow,
+		.origin = page->kmsan_origin,
+	};
+}
+
+static inline void set_page_metadata(struct page *page, struct page_metadata meta)
+{
+	page->kmsan_shadow = meta.shadow;
+	page->kmsan_origin = meta.origin;
+}
 
-static void *shadow_ptr_for(struct page *page)
+static inline void *shadow_ptr_for(struct page_metadata meta)
 {
-	return page_address(shadow_page_for(page));
+	return page_address(meta.shadow);
 }
 
-static void *origin_ptr_for(struct page *page)
+static inline void *origin_ptr_for(struct page_metadata meta)
 {
-	return page_address(origin_page_for(page));
+	return page_address(meta.origin);
 }
 
-static bool page_has_metadata(struct page *page)
+static inline bool page_has_metadata(struct page_metadata meta)
 {
-	return shadow_page_for(page) && origin_page_for(page);
+	return meta.shadow && meta.origin;
 }
 
 static void set_no_shadow_origin_page(struct page *page)
 {
-	shadow_page_for(page) = NULL;
-	origin_page_for(page) = NULL;
+	set_page_metadata(page, (struct page_metadata) {});
 }
 
 /*
@@ -124,6 +138,7 @@ struct shadow_origin_ptr kmsan_get_shadow_origin_ptr(void *address, u64 size,
  */
 void *kmsan_get_metadata(void *address, bool is_origin)
 {
+	struct page_metadata meta;
 	u64 addr = (u64)address, off;
 	struct page *page;
 	void *ret;
@@ -142,28 +157,36 @@ void *kmsan_get_metadata(void *address, bool is_origin)
 	page = virt_to_page_or_null(address);
 	if (!page)
 		return NULL;
-	if (!page_has_metadata(page))
+	meta = get_page_metadata(page);
+	if (!page_has_metadata(meta))
 		return NULL;
 	off = offset_in_page(addr);
 
-	return (is_origin ? origin_ptr_for(page) : shadow_ptr_for(page)) + off;
+	return (is_origin ? origin_ptr_for(meta) : shadow_ptr_for(meta)) + off;
 }
 
 void kmsan_copy_page_meta(struct page *dst, struct page *src)
 {
+	struct page_metadata dst_meta, src_meta;
+
 	if (!kmsan_enabled || kmsan_in_runtime())
 		return;
-	if (!dst || !page_has_metadata(dst))
+	if (!dst)
 		return;
-	if (!src || !page_has_metadata(src)) {
+	dst_meta = get_page_metadata(dst);
+	if (!page_has_metadata(dst_meta))
+		return;
+	if (src)
+		src_meta = get_page_metadata(src);
+	if (!src || !page_has_metadata(src_meta)) {
 		kmsan_internal_unpoison_memory(page_address(dst), PAGE_SIZE,
 					       /*checked*/ false);
 		return;
 	}
 
 	kmsan_enter_runtime();
-	__memcpy(shadow_ptr_for(dst), shadow_ptr_for(src), PAGE_SIZE);
-	__memcpy(origin_ptr_for(dst), origin_ptr_for(src), PAGE_SIZE);
+	__memcpy(shadow_ptr_for(dst_meta), shadow_ptr_for(src_meta), PAGE_SIZE);
+	__memcpy(origin_ptr_for(dst_meta), origin_ptr_for(src_meta), PAGE_SIZE);
 	kmsan_leave_runtime();
 }
 EXPORT_SYMBOL(kmsan_copy_page_meta);
@@ -171,19 +194,18 @@ EXPORT_SYMBOL(kmsan_copy_page_meta);
 void kmsan_alloc_page(struct page *page, unsigned int order, gfp_t flags)
 {
 	bool initialized = (flags & __GFP_ZERO) || !kmsan_enabled;
-	struct page *shadow, *origin;
+	struct page_metadata meta;
 	depot_stack_handle_t handle;
 	int pages = 1 << order;
 
 	if (!page)
 		return;
 
-	shadow = shadow_page_for(page);
-	origin = origin_page_for(page);
+	meta = get_page_metadata(page);
 
 	if (initialized) {
-		__memset(page_address(shadow), 0, PAGE_SIZE * pages);
-		__memset(page_address(origin), 0, PAGE_SIZE * pages);
+		__memset(shadow_ptr_for(meta), 0, PAGE_SIZE * pages);
+		__memset(origin_ptr_for(meta), 0, PAGE_SIZE * pages);
 		return;
 	}
 
@@ -191,7 +213,7 @@ void kmsan_alloc_page(struct page *page, unsigned int order, gfp_t flags)
 	if (kmsan_in_runtime())
 		return;
 
-	__memset(page_address(shadow), -1, PAGE_SIZE * pages);
+	__memset(shadow_ptr_for(meta), -1, PAGE_SIZE * pages);
 	kmsan_enter_runtime();
 	handle = kmsan_save_stack_with_flags(flags, /*extra_bits*/ 0);
 	kmsan_leave_runtime();
@@ -200,7 +222,7 @@ void kmsan_alloc_page(struct page *page, unsigned int order, gfp_t flags)
 	 * to just fill the origin pages with @handle.
 	 */
 	for (int i = 0; i < PAGE_SIZE * pages / sizeof(handle); i++)
-		((depot_stack_handle_t *)page_address(origin))[i] = handle;
+		((depot_stack_handle_t *)origin_ptr_for(meta))[i] = handle;
 }
 
 void kmsan_free_page(struct page *page, unsigned int order)
@@ -238,8 +260,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 		goto ret;
 	}
 	for (int i = 0; i < nr; i++) {
-		s_pages[i] = shadow_page_for(pages[i]);
-		o_pages[i] = origin_page_for(pages[i]);
+		struct page_metadata meta = get_page_metadata(pages[i]);
+
+		s_pages[i] = meta.shadow;
+		o_pages[i] = meta.origin;
 	}
 	prot = PAGE_KERNEL;
 
@@ -289,10 +313,12 @@ void __init kmsan_init_alloc_meta_for_range(void *start, void *end)
 		page = virt_to_page_or_null((char *)start + addr);
 		shadow_p = virt_to_page((char *)shadow + addr);
 		set_no_shadow_origin_page(shadow_p);
-		shadow_page_for(page) = shadow_p;
 		origin_p = virt_to_page((char *)origin + addr);
 		set_no_shadow_origin_page(origin_p);
-		origin_page_for(page) = origin_p;
+		set_page_metadata(page, (struct page_metadata) {
+			.shadow = shadow_p,
+			.origin = origin_p,
+		});
 	}
 }
 
@@ -302,7 +328,9 @@ void kmsan_setup_meta(struct page *page, struct page *shadow,
 	for (int i = 0; i < (1 << order); i++) {
 		set_no_shadow_origin_page(&shadow[i]);
 		set_no_shadow_origin_page(&origin[i]);
-		shadow_page_for(&page[i]) = &shadow[i];
-		origin_page_for(&page[i]) = &origin[i];
+		set_page_metadata(&page[i], (struct page_metadata) {
+			.shadow = &shadow[i],
+			.origin = &origin[i],
+		});
 	}
 }
-- 
2.54.0

