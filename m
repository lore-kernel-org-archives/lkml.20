Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652962;
	b=ekEo/j+9cvS/wKVkXbvKelGqFR9BNoPqEZiv+2TvDJiaGcrW/I6devWmscnA1QHIZtAl
	 OC5cqFkE2eS4obcBMM1FtWb170EAlVkyM4lGvc9fzCYCKKDTMyVsb8FGGS/UOKmeuM63O
	 vJC8G6gvFVA5epmjOROKKLf0f2pILRgh3wdEDbYTbSi1JaBKqtKk+HdiLqr0s6Y2413HA
	 YsDauKoniWU/z8dTej7eZpWOAbqGfY0AHQbRVGc7fIub6BraKQt9xz6PXnPnp2gFTYyMl
	 agYmawmUSdpdCgtGNHsTS/AM7NUEo2GDpBZrdzwFLhDAEHGaTKrndVPAoCXVV0+UXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZLXm0HyVJe/uJeMVZwR1EneRdwmXhCI8DMdSCy58N3Q=;
	b=qrCC9i9+Iz/IiL9OhsuPAlmRYIrCIZ3tGbY+UQiI4TWVmuwe2IRQQfQMjGfiYDAziVbE
	 IKDBeQlWh4QA4hdkYJyiAFkDXxgie9YgOwWeKiM9Oj+oORo7/4B1tWKr3Vl6egMcVNnqf
	 LExHeVMkc73nCSA5rnjfUl8CyJK1eeZl/dlEgvDF7BSP+5gIyxFp1qYiCjccVBi3/IeWj
	 1QaWSqujh5+TxTrqDhO5CmRCBGpdfJDaj6GmfKCsDhOg8Ht6fMnJgjt6j2gVbZTnv2e5h
	 6M6rORPmX47BKObu6Tjqql7ssZqctaMuh6uWX+7nSlRa9hK1P0YbJlvEACCf9S3mu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UFCXVjHo;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC451606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC451606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UFCXVjHo
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so5459624eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794652961; x=1795257761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLXm0HyVJe/uJeMVZwR1EneRdwmXhCI8DMdSCy58N3Q=;
        b=UFCXVjHo1PLtx7q9m77Npeyowp9t2QcSFc2/o/PzsnEe08Mt6K3lJVh6ywDrSPGV10
         VF9UgsU6lTCU+vv3JV5DL7+hxnux4r3pR7DBeViQPPcxypBYTGxpzFbYaYKGKm+Co+LO
         sUI2GFpJI1APVFB0HtFdJUtmLZR0V40i8OpWhtmF0ZzGo+Ak9v8Qn3GftlezOYAK4CfW
         8R3cWjK/QIxB46T72Dpd4fRoHzOTIEcyFY1aeFmLw9RX0wY1zCsQs0Fh8A7vF1aanASN
         KyHt1LjGfRQFpHfVPcEBhqQ316bfGmL+OYFKooQ16LXtHSlVIPmDOHijJHUO06YCZJM/
         C0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652961; x=1795257761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLXm0HyVJe/uJeMVZwR1EneRdwmXhCI8DMdSCy58N3Q=;
        b=UScIz7Vu34FQkFxYG+bzrSz9u6m+bELzPsb3VTzyJUhOCzFPWPeLAd7r+KNeBZkLln
         dLhLTAhPUaJxprogZWHxEQq2jjW1GVrqH2E1lOv1ngcGPHteWMMd+F3sKdlD0J7b/GLX
         LAlFubbb1sZs/kxBx7l/VSjDrIm8ZQEeBjy6xaWnboFqrMkKaWpag7Ts4Xujo3R1Mzs8
         fX3Ft60VOfHMAsd4cT4kz0EPuQKhwSdbpaYlklAB67kAkTeryl0qdX16ozEgw+DIA1++
         4OwTFjhNLXcio2a80cwYYPhFOxQZgMvML3eWb/YaxidRPlJhtENh8b11nMAV4/eIWza8
         C/uw==
X-Forwarded-Encrypted: i=1; AL+hErH5a0UAh0lWH1deMzPba8sAlVVXJYxTdn/KZo74/9LTvDwUILIc3g1vlsRZixJ0tW5+dHsARiOcd6jEOK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cz+B//VaVVxNh+PHv27Yd94QVYiYjqVQ4rC/w73uD+phy7YmH
	qANldJraSWplbOiR24r0kkdQvWG2GoNJNSWeN72My0FhG56zIJcztNdsaoLzMA/jZoQ=
X-Gm-Gg: AYBFou1XXR/ptBKMC6gqaSLr5T/GSv88NYX3n8PLoGPH0pp3SB1GLJYxh3oLHCsQvWy
	bD55Yqjyla3C350D7IwypnHJwj9Okhymsy/KGeFrSIH/YSo/wgyp51S+XtUSW8WDmVgY0+2P7l5
	AJL3J7D3Eh5XCkH+Ne6dKu/0aMzbaX8SuHuV54NXoPSRlbcOi7qFXHsXXznfHanODHf2JgQjusv
	CkUl3DF4SPVhTHK2vkmnkpl14iCfMJNWgpn/cIAEVFnp2i06+xtYLZ0e9EWUhpHmIoogDiqVqx3
	KGmCUTCCUGQNaGXZUkq/SZ6siBa0lGBO02FzLakh5KNxvTCOwMtIUtZoBPhKgVNc8tB+WgGoQoM
	Qx/zR/Po1T+kfzbLxoQvzBMEUlQE5VUjzZYGL0Yl0YcRXnTGIXAH5UDXwRF+INSMYpbykXaysns
	ftATQ0YV3hzvxuli+19MEghydQNMTwL9PpZxEi8u+9QykA6yV+hKc6D4odTGLuS3oUTzjsHfeT/
	Y9AOFbSNORlJf7th3m3FKWWb5f8E7UpGOqAEe8dz5u1tS41LhNr91tmUGxKJY7Vo0dwIVRWk8p8
	DNr6HNLIw/9Bzomyt67BMHR4MYtbS9IUDJPs0bTAana13D6j4EI+ZmPv2Cec
X-Received: by 2002:a05:7300:b099:b0:375:3df0:722a with SMTP id 5a478bee46e88-379676f8cdamr5161245eec.28.1794652960640;
        Sat, 14 Nov 2026 02:42:40 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm15772917eec.7.2026.11.14.02.42.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 02:42:39 -0800 (PST)
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
Subject: [PATCH 2/3] mm/page_ext: support early allocation for SPARSEMEM
Date: Sat, 14 Nov 2026 18:41:48 +0800
Message-ID: <20261114104150.58424-3-songmuchun@bytedance.com>
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

Moving KMSAN's per-page metadata into page_ext requires page extensions
to be available when kmsan_init_shadow() runs, before memblock is freed.
FLATMEM page extensions are available by then, but SPARSEMEM normally
allocates them later from the page or vmalloc allocators.

Add need_early so clients can request SPARSEMEM section backing from
memblock during page_ext_init_early(). Use page_ext_init() as the common
late path for client callbacks.

KMSAN starts requesting early page extensions in the following patch.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/page_ext.h | 26 +++--------
 mm/mm_init.c             | 11 +----
 mm/page_ext.c            | 99 ++++++++++++++++++++++++++++++----------
 3 files changed, 82 insertions(+), 54 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..3b66720ddb18 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -16,6 +16,8 @@ struct pglist_data;
  * @size: The size of the client data within page_ext.
  * @need: Function that returns true if client requires page_ext.
  * @init: (optional) Called to initialize client once page_exts are allocated.
+ * @need_early: True if the client requires page_ext during early boot,
+ *              before normal memory allocation is available.
  * @need_shared_flags: True when client is using shared page_ext->flags
  *                     field.
  *
@@ -27,6 +29,7 @@ struct page_ext_operations {
 	size_t size;
 	bool (*need)(void);
 	void (*init)(void);
+	bool need_early;
 	bool need_shared_flags;
 };
 
@@ -61,15 +64,10 @@ static inline bool early_page_ext_enabled(void)
 	return early_page_ext;
 }
 
-#ifdef CONFIG_SPARSEMEM
-static inline void page_ext_init_flatmem(void)
-{
-}
-extern void page_ext_init(void);
-static inline void page_ext_init_flatmem_late(void)
-{
-}
+void page_ext_init_early(void);
+void page_ext_init(void);
 
+#ifdef CONFIG_SPARSEMEM
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	/*
@@ -79,12 +77,6 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-extern void page_ext_init_flatmem(void);
-extern void page_ext_init_flatmem_late(void);
-static inline void page_ext_init(void)
-{
-}
-
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	return true;
@@ -205,11 +197,7 @@ static inline void page_ext_init(void)
 {
 }
 
-static inline void page_ext_init_flatmem_late(void)
-{
-}
-
-static inline void page_ext_init_flatmem(void)
+static inline void page_ext_init_early(void)
 {
 }
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2367af05570b..35cf799971c3 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2707,11 +2707,7 @@ void __init mm_core_init(void)
 	build_all_zonelists(NULL);
 	page_alloc_init_cpuhp();
 	alloc_tag_sec_init();
-	/*
-	 * page_ext requires contiguous pages,
-	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
-	 */
-	page_ext_init_flatmem();
+	page_ext_init_early();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2727,11 +2723,6 @@ void __init mm_core_init(void)
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-	/*
-	 * page_owner must be initialized after buddy is ready, and also after
-	 * slab is ready so that stack_depot_init() works properly
-	 */
-	page_ext_init_flatmem_late();
 	kmemleak_init();
 	ptlock_cache_init();
 	pgtable_cache_init();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..8578f52a32db 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/slab.h>
 
 /*
  * struct page extension
@@ -135,7 +136,12 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			page_ext_ops[i]->offset = page_ext_size;
 			page_ext_size += page_ext_ops[i]->size;
-			need = true;
+			/*
+			 * page_ext requires contiguous pages, bigger than
+			 * MAX_PAGE_ORDER unless SPARSEMEM.
+			 */
+			need |= !IS_ENABLED(CONFIG_SPARSEMEM) ||
+				page_ext_ops[i]->need_early;
 		}
 	}
 
@@ -159,7 +165,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -217,9 +223,8 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_init_flatmem(void)
+void __init page_ext_init_early(void)
 {
-
 	int nid, fail;
 
 	if (!invoke_need_callbacks())
@@ -262,11 +267,19 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 	return get_entry(page_ext, pfn);
 }
 
-static void *__meminit alloc_page_ext(size_t size, int nid)
+static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
 	void *addr = NULL;
 
+	if (!slab_is_available()) {
+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, 0,
+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		if (addr)
+			memmap_boot_pages_add(size / PAGE_SIZE);
+		return addr;
+	}
+
 	addr = alloc_pages_exact_nid(nid, size, flags);
 	if (addr)
 		kmemleak_alloc(addr, size, 1, flags);
@@ -274,7 +287,7 @@ static void *__meminit alloc_page_ext(size_t size, int nid)
 		addr = vzalloc_node(size, nid);
 
 	if (addr)
-		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
+		memmap_pages_add(size / PAGE_SIZE);
 
 	return addr;
 }
@@ -290,7 +303,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 	if (section->page_ext)
 		return 0;
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
+	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
 	base = alloc_page_ext(table_size, nid);
 
 	/*
@@ -317,20 +330,27 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 
 static void free_page_ext(void *addr)
 {
-	size_t table_size;
+	size_t table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
+	long nr_pages = table_size / PAGE_SIZE;
 	struct page *page;
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
-	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
 	if (is_vmalloc_addr(addr)) {
+		memmap_pages_add(-nr_pages);
 		vfree(addr);
-	} else {
-		page = virt_to_page(addr);
-		BUG_ON(PageReserved(page));
-		kmemleak_free(addr);
-		free_pages_exact(addr, table_size);
+		return;
+	}
+
+	page = virt_to_page(addr);
+	if (PageReserved(page)) {
+		memmap_boot_pages_add(-nr_pages);
+		kmemleak_free_part_phys(__pa(addr), table_size);
+		free_reserved_area(addr, addr + table_size, -1, "page_ext");
+		return;
 	}
+
+	memmap_pages_add(-nr_pages);
+	kmemleak_free(addr);
+	free_pages_exact(addr, table_size);
 }
 
 static void __free_page_ext(unsigned long pfn)
@@ -444,14 +464,28 @@ static int __meminit page_ext_callback(struct notifier_block *self,
 	return notifier_from_errno(ret);
 }
 
-void __init page_ext_init(void)
+static int __init page_ext_init_sections_early(void)
+{
+	unsigned long start, end, pfn;
+	int i, nid;
+
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
+		for (pfn = start; pfn < end; pfn = SECTION_ALIGN_UP(pfn + 1)) {
+			if (!pfn_valid(pfn))
+				continue;
+			if (init_section_page_ext(pfn, nid))
+				return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static int __init page_ext_init_sections(void)
 {
 	unsigned long pfn;
 	int nid;
 
-	if (!invoke_need_callbacks())
-		return;
-
 	for_each_node_state(nid, N_MEMORY) {
 		unsigned long start_pfn, end_pfn;
 
@@ -476,17 +510,32 @@ void __init page_ext_init(void)
 			if (pfn_to_nid(pfn) != nid)
 				continue;
 			if (init_section_page_ext(pfn, nid))
-				goto oom;
+				return -ENOMEM;
 			cond_resched();
 		}
 	}
+
+	return 0;
+}
+
+void __init page_ext_init_early(void)
+{
+	if (!invoke_need_callbacks())
+		return;
+	if (page_ext_init_sections_early())
+		panic("Out of memory");
+}
+
+void __init page_ext_init(void)
+{
+	if (!page_ext_size)
+		return;
+	if (page_ext_init_sections())
+		panic("Out of memory");
+
 	hotplug_memory_notifier(page_ext_callback, DEFAULT_CALLBACK_PRI);
 	pr_info("allocated %ld bytes of page_ext\n", total_usage);
 	invoke_init_callbacks();
-	return;
-
-oom:
-	panic("Out of memory");
 }
 
 #endif
-- 
2.54.0

