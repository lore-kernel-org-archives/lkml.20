Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652976;
	b=O1TviLeKpBW+nKtby7ACb61XWNQUhVoQgMQNf1PNoDcd2z/1JmWaTW+Ao47ZOet1y9iF
	 pahsSdc+xYOY20EiO3tGDTXSglBuVKIJ+GYDygeRzzQzXxvV8gnFcTU+cOGVBtqU3QU/L
	 AygSRrFXSR6OMZmRx6uQDoDuE5nva28EyEvJwW69+cs3RRGGRoGEh2xmWgyBuOtnUqrtb
	 a9F9rH4MGQQnzll6UblcHXwM4kbnN4mi+L/W8/B4bxnGY+N0RRQqf6TYFV1x+gKXEcKLf
	 mJWsbSeDiMCRsId0UtDB4KDQAbrCx+iyPIbDUiFGjYmlos9z/Evb2oGtFd68dJJ5Xeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gUXejsOVyeS4hm2x219vafr/Kz/IOGP2NyEF6CTVDz0=;
	b=D9bdkkSe79E02wsHmI7QGKri177jjz1y2/EDUAzjeNmTqgVVDJEJwGn23yWh19ExxZdM
	 0ecXdwb6ZPz/ooPoDstY7PDc5xSKCnMjA2dcoDI9UMGZ5kzYHrtDzk5BvcYJfbOD/7xH7
	 0C0PZI9vMD5RH6rXTdsB5PZuhiTPIrmnAMLN/EJo2FUvSsZLMsf07lXebWGw1vOR2SiDd
	 UVA0uhiXh23mJBuRBzz+sPRjjUT2KXItF8cHK9WMzpINWRoBoeLRFmoqikuvYBZo3O0lC
	 T88wcFtCBe1Dy79u6J8VUh+N//NJXIrADM1hdX6lJv9X9NE3ywMSeVYN96V7dxaQ2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jzoriemD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6572606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6572606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jzoriemD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37600b0db49so2550228eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794652974; x=1795257774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUXejsOVyeS4hm2x219vafr/Kz/IOGP2NyEF6CTVDz0=;
        b=jzoriemDdnk7I7XneNJwQIe3fgW4EtTJg2saR3Mv0CECNS3fwdjXSv/nP2a7nCyWwi
         UIScwp3MFZgyZR79Jm7GiiMCPmtkYs++jXDXBE28qJEMq4oo3PgkcGDEDLEy/OnUSTtY
         YzhavNydZEOznhRVB6DI3XYWqTGQcXoMmmnE6PO18cVKbKNZf3L8xvpwsUuIAU6SLwLq
         lJS9dC4Wo/YKzOwEdiHRlOh8rjgAi4YJjIQtYEIzTNv3KkLBm1fUClbf1D7ZfpxfZeW8
         h34aehmcut3ArRTQolAjy/mJsZlbt5c4ij7dmUzbLtNgb0aeEQZBAeZQiKvEYpgVieUE
         ZGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652974; x=1795257774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUXejsOVyeS4hm2x219vafr/Kz/IOGP2NyEF6CTVDz0=;
        b=CaMp1ozJgVl6pigzAutW6NSPF0Ms0coih6kI9aTfbog4/3Pi5TTXSxL9xjJTiansq+
         Z8aJox7vFkaJLEw7ljNNqyqv3CWkkNyTd8oMSa9qInDO78yKK8Bh/HRXXXvcTlGe9On/
         mXnoKjNJhpUgsDnDvxhaNEZS7N0YKSuyYpQnTwiY//bSuobgaD5B8I3LWFPPOfxV0Q3b
         QsvtA1jswb+NDhukpDrla1RGtEJ4DpZbTPzpmYCzAtI4JFzO/OwII7r8XhezPLcoxjxz
         lRztX+Rou7XDERNxqIkiFGnieAMu75mJTDtZ08XveicZkCIxUJfdQOaFhV9CLdBTI5pN
         zrPg==
X-Forwarded-Encrypted: i=1; AL+hErHoQwm9oraUQK5kKdDgkKX7+gaOJpx4XZvpSz7BmYKGWSByBbF2ShKhpB+3X7LRhBBs6lHQGMEnfJphUUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lk/8D/PxT4+PZuD8cy9977RVgpYBlZyoNyIGoE8ZnD060m16d
	fTn/utV3uU04wEqm4kGdBwHX6X0Dh8eoCIvkwwH2HNfWd+eq9c2Dd9y6QzDO2eoiZkk=
X-Gm-Gg: AYBFou2PbmUC6A960YQgrLyPWuMWStuUmXVjhdQFqm8aN3hBek5OUablwfA0xOlHHdA
	txl5XP6zNvwgx6nzlIWDAfwc7UVt4FNbDvl8uzE4cRt/8triaxHGu/fywBoXtvrWU/KbroFp+S2
	L53iXZRhix6ZbZfL4Cs+psXy5qyFHFGCVU/dpcyKNgCE65G5MfE2hp3kw5u6xgfFP9iH7dJst7H
	xfsKkWjowbKtf44Mp/Hw52ruSshKXhTNBnLIWnP/ldmwhfA4V/BGJwda6kJbjk4b5t3+GEmWK2w
	CBDTszqjo7tHpvO6EL2OVXDiHnSXlbYb5r7xOdNXVtZWjVAwK21K1xIlH+4slPHXo12s/iM3LmL
	1jsNCqjQvJ6NIUUQT2AxTPqqREaqvfq2Q07IRkNIAbe3zmHE26xMCTyijzk6GlXw5Vfzp28BTuj
	2VyBR7Jg4J2zC7swmigq3b5dPQfqJmSaYLtd42jKzP3C0bi2eOyhRjrT2CSktWiNhAzvFYDzXYV
	3HUrsxk+uLiGQrDXoWWvZaVkHmgWy+erHcmtOw9WTqbIluyPU2PoZt0Ed0W/T0epUeJwVKLcJHm
	2i1MF5nHy1/OoYQjCm9kUdcL3a56yk0B1CyVhr5tZacofozOrAz/43ecsWg2JTtRhAK+gvOiwQU
	WITRfoQ==
X-Received: by 2002:a05:693c:8244:b0:375:11dc:7222 with SMTP id 5a478bee46e88-377e16e4fd6mr8253235eec.21.1794652974225;
        Sat, 14 Nov 2026 02:42:54 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm15772917eec.7.2026.11.14.02.42.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 02:42:53 -0800 (PST)
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
	Muchun Song <songmuchun@bytedance.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] kmsan: fix metadata loss during HugeTLB struct page reinitialization
Date: Sat, 14 Nov 2026 18:41:49 +0800
Message-ID: <20261114104150.58424-4-songmuchun@bytedance.com>
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

KMSAN stores each page's shadow and origin pointers in struct page. Late
initialization of boot-time gigantic HugeTLB pages rewrites page
descriptors after kmsan_init_shadow() has installed the metadata, losing
the mappings and leaking the metadata pages.

Store the pointers in page_ext, which survives struct page
reinitialization, and request early page extensions so they are available
when kmsan_init_shadow() runs.

Treat page_ext as part of the KMSAN runtime: use a raw lookup under notrace
preemption and compile page_ext without sanitizer, tracing, branch
profiling, or coverage instrumentation to avoid recursive metadata lookup.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ac161ba4-30cc-4bd3-b93c-ab7af8a6f64f
Fixes: fde1c4ecf916 ("mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/kmsan.h    |  3 +++
 include/linux/mm_types.h | 12 -----------
 include/linux/page_ext.h |  1 +
 lib/Kconfig.kmsan        |  1 +
 mm/Makefile              |  8 +++++++
 mm/kmsan/shadow.c        | 46 ++++++++++++++++++++++++++++++++++------
 mm/page_ext.c            | 37 ++++++++++++++++++++++++++++----
 7 files changed, 86 insertions(+), 22 deletions(-)

diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 7da9fd506b39..d7498abe7d42 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 struct page;
+struct page_ext_operations;
 struct kmem_cache;
 struct task_struct;
 struct scatterlist;
@@ -22,6 +23,8 @@ struct urb;
 
 #ifdef CONFIG_KMSAN
 
+extern struct page_ext_operations kmsan_ops;
+
 /**
  * kmsan_task_create() - Initialize KMSAN state for the task.
  * @task: task to initialize.
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..dc73f9f5a51b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -208,18 +208,6 @@ struct page {
 #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
 	int _last_cpupid;
 #endif
-
-#ifdef CONFIG_KMSAN
-	/*
-	 * KMSAN metadata for this page:
-	 *  - shadow page: every bit indicates whether the corresponding
-	 *    bit of the original page is initialized (0) or not (1);
-	 *  - origin page: every 4 bytes contain an id of the stack trace
-	 *    where the uninitialized value was created.
-	 */
-	struct page *kmsan_shadow;
-	struct page *kmsan_origin;
-#endif
 } _struct_page_alignment;
 
 /*
diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 3b66720ddb18..4bca34450356 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -87,6 +87,7 @@ extern struct page_ext *page_ext_get(const struct page *page);
 extern struct page_ext *page_ext_from_phys(phys_addr_t phys);
 extern void page_ext_put(struct page_ext *page_ext);
 extern struct page_ext *page_ext_lookup(unsigned long pfn);
+struct page_ext *page_ext_lookup_raw(unsigned long pfn);
 
 static inline void *page_ext_data(struct page_ext *page_ext,
 				  struct page_ext_operations *ops)
diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
index cae1ddcc18e1..015e85c70793 100644
--- a/lib/Kconfig.kmsan
+++ b/lib/Kconfig.kmsan
@@ -10,6 +10,7 @@ config KMSAN
 	depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
 	depends on DEBUG_KERNEL && !KASAN && !KCSAN
 	depends on !PREEMPT_RT
+	select PAGE_EXTENSION
 	select STACKDEPOT
 	select STACKDEPOT_ALWAYS_INIT
 	help
diff --git a/mm/Makefile b/mm/Makefile
index 277b97f7f8d7..7655f87fe974 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -17,6 +17,14 @@ KCSAN_SANITIZE_page_alloc.o := n
 # But enable explicit instrumentation for memory barriers.
 KCSAN_INSTRUMENT_BARRIERS := y
 
+ifdef CONFIG_KMSAN
+KMSAN_SANITIZE_page_ext.o	:= n
+KCOV_INSTRUMENT_page_ext.o	:= n
+UBSAN_SANITIZE_page_ext.o	:= n
+CFLAGS_page_ext.o		+= -DDISABLE_BRANCH_PROFILING
+CFLAGS_REMOVE_page_ext.o	= $(CC_FLAGS_FTRACE)
+endif
+
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
 # free pages, or a task is migrated between nodes.
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 8922d1ba9a0a..cab8896e1fc4 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -12,6 +12,7 @@
 #include <linux/cacheflush.h>
 #include <linux/memblock.h>
 #include <linux/mm_types.h>
+#include <linux/page_ext.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -20,23 +21,56 @@
 #include "../vmalloc.h"
 #include "kmsan.h"
 
+/*
+ * KMSAN metadata for this page:
+ *  - shadow page: every bit indicates whether the corresponding
+ *    bit of the original page is initialized (0) or not (1);
+ *  - origin page: every 4 bytes contain an id of the stack trace
+ *    where the uninitialized value was created.
+ */
 struct page_metadata {
 	struct page *shadow;
 	struct page *origin;
 };
 
+static __init bool need_page_metadata(void)
+{
+	return true;
+}
+
+struct page_ext_operations kmsan_ops = {
+	.size		= sizeof(struct page_metadata),
+	.need		= need_page_metadata,
+	.need_early	= true,
+};
+
 static inline struct page_metadata get_page_metadata(struct page *page)
 {
-	return (struct page_metadata) {
-		.shadow = page->kmsan_shadow,
-		.origin = page->kmsan_origin,
-	};
+	struct page_metadata meta = {};
+	struct page_ext *page_ext;
+
+	/*
+	 * Avoid instrumented preemption debug and tracing hooks while resolving
+	 * KMSAN metadata, as they would recurse back into metadata lookup.
+	 */
+	preempt_disable_notrace();
+	page_ext = page_ext_lookup_raw(page_to_pfn(page));
+	if (page_ext)
+		meta = *(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops);
+	preempt_enable_no_resched_notrace();
+
+	return meta;
 }
 
 static inline void set_page_metadata(struct page *page, struct page_metadata meta)
 {
-	page->kmsan_shadow = meta.shadow;
-	page->kmsan_origin = meta.origin;
+	struct page_ext *page_ext;
+
+	preempt_disable_notrace();
+	page_ext = page_ext_lookup_raw(page_to_pfn(page));
+	if (page_ext)
+		*(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops) = meta;
+	preempt_enable_no_resched_notrace();
 }
 
 static inline void *shadow_ptr_for(struct page_metadata meta)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 8578f52a32db..caffe29421a1 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kmsan.h>
 #include <linux/slab.h>
 
 /*
@@ -94,6 +95,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 	&page_iommu_debug_ops,
 #endif
+#ifdef CONFIG_KMSAN
+	&kmsan_ops,
+#endif
 };
 
 unsigned long page_ext_size;
@@ -170,13 +174,12 @@ void __init page_ext_init(void)
 	invoke_init_callbacks();
 }
 
-static struct page_ext *lookup_page_ext(const struct page *page)
+static struct page_ext *__lookup_page_ext(const struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page);
 	unsigned long index;
 	struct page_ext *base;
 
-	WARN_ON_ONCE(!rcu_read_lock_held());
 	base = NODE_DATA(page_to_nid(page))->node_page_ext;
 	/*
 	 * The sanity checks the page allocator does upon freeing a
@@ -191,6 +194,12 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 	return get_entry(base, index);
 }
 
+static struct page_ext *lookup_page_ext(const struct page *page)
+{
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return __lookup_page_ext(page);
+}
+
 static int __init alloc_node_page_ext(int nid)
 {
 	struct page_ext *base;
@@ -249,13 +258,12 @@ static bool page_ext_invalid(struct page_ext *page_ext)
 	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
 }
 
-static struct page_ext *lookup_page_ext(const struct page *page)
+static struct page_ext *__lookup_page_ext(const struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page);
 	struct mem_section *section = __pfn_to_section(pfn);
 	struct page_ext *page_ext = READ_ONCE(section->page_ext);
 
-	WARN_ON_ONCE(!rcu_read_lock_held());
 	/*
 	 * The sanity checks the page allocator does upon freeing a
 	 * page can reach here before the page_ext arrays are
@@ -267,6 +275,12 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 	return get_entry(page_ext, pfn);
 }
 
+static struct page_ext *lookup_page_ext(const struct page *page)
+{
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return __lookup_page_ext(page);
+}
+
 static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
@@ -553,6 +567,21 @@ struct page_ext *page_ext_lookup(unsigned long pfn)
 	return lookup_page_ext(pfn_to_page(pfn));
 }
 
+/**
+ * page_ext_lookup_raw() - Lookup a page extension without RCU checking.
+ * @pfn: PFN of the page we're interested in.
+ *
+ * The caller must prevent the page extension from being freed, for example by
+ * disabling preemption.  Unlike page_ext_lookup(), this function does not run
+ * lockdep checks and is safe to call from low-level sanitizer runtime code.
+ *
+ * Return: NULL if no page_ext exists for this page.
+ */
+struct page_ext *page_ext_lookup_raw(unsigned long pfn)
+{
+	return __lookup_page_ext(pfn_to_page(pfn));
+}
+
 /**
  * page_ext_get() - Get the extended information for a page.
  * @page: The page we're interested in.
-- 
2.54.0

