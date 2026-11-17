Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917272;
	b=LqvHLEgKCgpbYMpXFWz+L18eDFM9EMKbF2j+5njrCefrewGQzS8h8qeW8bqKlySkWCyw
	 AvyAsDEuWoOtu4Yyh7TfKA7zu4n+abDIIYZ+u9oc59OjInFGY32O7ViXpEk8aBo1qitNH
	 2wXXu/6g9IzwwV4TrRXyzCfgxkEzFQ5nCW8NBGntqf229wYt+6+qkuEdKo0trjmWHkEWu
	 ivxzUiN53YVjmUiS7p9COnoVgvIi3+lrys+wz1JoUhUkrg7gxwCUjeqdkcRpnyYK8xUdK
	 a0d/2SD4/AD5IiQLJkZMtjsO9AjdHWqpcZAkTf2/jPV66hPMgDRvKEoB6HYZMtEaHkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
	b=3WX83qhW+lxLqiybPllIOa5OpnrRBucngcHyF+Xv8/gyON/tCx6/FrGQatpTBm1SdGI3
	 JbdH8hWkje93jN1IGcqnbY2e6C3LmFQubH8ovVryCDcVM+9XmAI0DE0Qi/fc1xc9I5rpu
	 89wKZUFKbeUHfFeQlmAUpXzT1LbZXXsQlQMY9QXLVUzvGst26glFWR47JkUKanp2MeXv3
	 89M6u5Ox+xF4Ve8w0Cfj0XfGnxQ19o0tRqGrnml5mnD/K074wcRTk8A/UdZVRk2r/82gu
	 FPAvxcn9+EiGIJZ8j3TlGDGefNr1pQcGTOFk9OlN1wE4ZvCBEIdKpkQazVZV2GkkRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iwF0Kr1g;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADAE606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADAE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iwF0Kr1g
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so4152669c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917270; x=1795522070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
        b=iwF0Kr1gjZojuJAbCBxY8yD6AM0GP9Akj3W2Qsb1sS1OTqbzJK+KN+4CIx5laJ/Kul
         l4wzq26lAcZlB75DZFZk1aIEem4kBNevUdzBN5u0nhM4KKk/FtcV0OHxYkWNTcLIufqz
         eYfgntPsojzj2Y+tuOtsRDtg2DJQV3aRUZyu40V20AGWwUzau5Fff45Y+U7dg/9FH7H0
         7AcbdbtDvlRMtLN8QuDsi5+DSkZnbwqcFtZasnoQcC5MK83tKMLj8Gq1tciwtVQ5GS7D
         3oExCYKA1rKAT70Tf27PN56Ze+xo09oLMAPpLEgP+a9f18J+xhbBw1a9ccbY/GPPUL6W
         Wreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917270; x=1795522070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
        b=F4j/6vcCCS4sBC+nNx/U0BKMA0GpN3ATCqrZTUBXZjogCbGwYGmJqw0nQyACXaCX6p
         yhj8MAa95+3RDBA/SNSrMGGxjyp3HNPnPQ82QqNOMBwr6MEg2T1MNGwthZU6EzhBfiKK
         DvQ7b2/vH0aQ50n221ZvoaHRpz9Y/S+82KsuWNZ9zcE/pTQvWtwyPytyT5UTdfJfhngA
         G2pqYnY7bNbL4MT7w5wmJM4wrB/Bc5h38hTrOK6oZEm/3MmGSDg5Hel5ui+LM3vuWxw6
         aGvvAaeRIOZYLUwRQYIngijnYCHaLT5SsILhY9ZzSsi29qGh5y0ZfPIFO1ZbdQFAdlIt
         sAxw==
X-Forwarded-Encrypted: i=1; AL+hErGcIc7220JxaGc77kOjzuloFb343pV+UVSphd0qc06VVf4lWjrYoOj36Qqq3So8k7qwOITXgqAJxrkhQlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NwUJjypoQubUcfzxTodrCUas60zpB8RvNKZ2hoTc2bJdoNl7n
	Ht254d/jD1HMLKUYawvRxDlO7HaIhTIockgIe8u6dL259q4Sa+jUS6UJA0hJP5hzi4c=
X-Gm-Gg: AYBFou2w/HgGpsALIqMafppmUhEEPNQnOnzD6KfJ3/mWl5vXSfvxj8aD9l0x3ag3Umo
	FD+rbVDABKegEb8ThHajIIb14xEcEIw1hhWOUFbHhXHfj8bcpON4mcBNn4sOnDzspjqWU0x8PMF
	j8MLuNE8wN6ym4IVCBcH52zBCiiajZf4UE0xyLmHCahfkLccvwECrS/tJLQLzQMR4++6lvC33SD
	+wxVLIn3qk5UYraHwcCwwGS5fVjFza075WESOCca6b9EdF4YJ/ZNbXZ4Mk/1wRIP3UZ8J7H66bN
	ct3COrpino3HgnxoR/1DQ3QmJnFy3tGnn9KR4c9UMiHw13mH3n0jj0loFrk5BvwpAvFTBDHd9Fb
	z6TsY754lQ4GHi9JjewxDLEp8GZyZyHWdv3bQ2G7EtDBnJ9c5zHloSIHL6LYolfU+bAeDyWGSKQ
	gLj4aUVpWg750ftlXyw7QVt4iinPbxFznJ5iT6bLgtoIxqNBPkUcqrJqsxnvb887wxwZ2hEStfH
	hyc00iOGX+qTTb9MFHVJp39FaTeG80zxspuIW0B5bD6P6aVUvzp3Y9z4R7ESS6yeiKnOOwgKXre
	Ymkl+wHgrhTnw+oLHnQBwaU4aHS1nnGT8TyanM+TGd8VZXyj3pS7WlUWqlXXk1OlaEpT+/SkWuA
	Tx0d7eBDx9HHy
X-Received: by 2002:a05:7022:408d:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b50310591dmr12810999c88.23.1794917270047;
        Tue, 17 Nov 2026 04:07:50 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:49 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
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
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 7/7] kmsan: fix metadata loss during HugeTLB struct page reinitialization
Date: Tue, 17 Nov 2026 20:06:27 +0800
Message-ID: <20261117120627.50601-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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

KMSAN stores each page's shadow and origin pointers in struct page.
Boot-time gigantic HugeTLB pages are reinitialized after
kmsan_init_shadow() installs these pointers, dropping the mappings and
leaving the allocated metadata pages unreachable.

Move the pointers to page_ext, whose boot-time storage is available
before kmsan_init_shadow() and survives struct page reinitialization.
Use the inline unchecked lookup under notrace preemption so metadata
lookup cannot recurse through instrumented hooks.

This shrinks struct page from 80 to 64 bytes on x86-64 KMSAN builds,
making its size a power of two and allowing HugeTLB Vmemmap Optimization
with KMSAN.

Fixes: fde1c4ecf916 ("mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ac161ba4-30cc-4bd3-b93c-ab7af8a6f64f
---
v2:
- Update __mm_zero_struct_page() for the smaller struct page.
- Keep the unchecked lookup inline in KMSAN and leave page_ext.c
  instrumented (suggested by Chris Down)
- Document page_ext metadata storage and KMSAN HVO support (suggested
  by Chris Down)
- Use the common boot-time page_ext allocation instead of need_early
---
 Documentation/dev-tools/kmsan.rst |  8 +++---
 include/linux/kmsan.h             |  2 ++
 include/linux/mm.h                | 12 +++------
 include/linux/mm_types.h          | 12 ---------
 lib/Kconfig.kmsan                 |  1 +
 mm/kmsan/shadow.c                 | 45 ++++++++++++++++++++++++++-----
 mm/page_ext.c                     |  4 +++
 7 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
index 0dc668b183f6..5330d21d141d 100644
--- a/Documentation/dev-tools/kmsan.rst
+++ b/Documentation/dev-tools/kmsan.rst
@@ -376,13 +376,11 @@ Metadata allocation
 
 There are several places in the kernel for which the metadata is stored.
 
-1. Each ``struct page`` instance contains two pointers to its shadow and
-origin pages::
+1. Each page frame has a corresponding ``struct page_metadata`` entry containing
+two pointers to its shadow and origin pages::
 
-  struct page {
-    ...
+  struct page_metadata {
     struct page *shadow, *origin;
-    ...
   };
 
 At boot-time, the kernel allocates shadow and origin pages for every available
diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 7da9fd506b39..08fb79566235 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -15,12 +15,14 @@
 #include <linux/types.h>
 
 struct page;
+struct page_ext_operations;
 struct kmem_cache;
 struct task_struct;
 struct scatterlist;
 struct urb;
 
 #ifdef CONFIG_KMSAN
+extern struct page_ext_operations kmsan_ops;
 
 /**
  * kmsan_task_create() - Initialize KMSAN state for the task.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77b5d450fe45..9349209cd2c0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -133,7 +133,7 @@ extern int mmap_rnd_compat_bits __read_mostly;
  * define their own version of this macro in <asm/pgtable.h>
  */
 #if BITS_PER_LONG == 64
-/* This function must be updated when the size of struct page grows above 96
+/* This function must be updated when the size of struct page grows above 80
  * or reduces below 56. The idea that compiler optimizes out switch()
  * statement, and only leaves move/store instructions. Also the compiler can
  * combine write statements if they are both assignments and can be reordered,
@@ -144,18 +144,12 @@ static inline void __mm_zero_struct_page(struct page *page)
 {
 	unsigned long *_pp = (void *)page;
 
-	 /* Check that struct page is either 56, 64, 72, 80, 88 or 96 bytes */
+	/* Check that struct page is either 56, 64, 72 or 80 bytes */
 	BUILD_BUG_ON(sizeof(struct page) & 7);
 	BUILD_BUG_ON(sizeof(struct page) < 56);
-	BUILD_BUG_ON(sizeof(struct page) > 96);
+	BUILD_BUG_ON(sizeof(struct page) > 80);
 
 	switch (sizeof(struct page)) {
-	case 96:
-		_pp[11] = 0;
-		fallthrough;
-	case 88:
-		_pp[10] = 0;
-		fallthrough;
 	case 80:
 		_pp[9] = 0;
 		fallthrough;
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
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 300b48818af1..fa2a403d87c2 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -13,6 +13,7 @@
 #include <linux/cacheflush.h>
 #include <linux/memblock.h>
 #include <linux/mm_types.h>
+#include <linux/page_ext.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -24,23 +25,55 @@
 #define KMSAN_META_MASK_SHADOW		BIT(0)
 #define KMSAN_META_MASK_ORIGIN		BIT(1)
 
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
+	.size	= sizeof(struct page_metadata),
+	.need	= need_page_metadata,
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
+	page_ext = __page_ext_lookup(page_to_pfn(page));
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
+	page_ext = __page_ext_lookup(page_to_pfn(page));
+	if (page_ext)
+		*(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops) = meta;
+	preempt_enable_no_resched_notrace();
 }
 
 static inline void *shadow_ptr_for(struct page_metadata meta)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 0f31e2da2611..274c3e778be6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kmsan.h>
 #include <linux/slab.h>
 
 /*
@@ -87,6 +88,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_PAGE_TABLE_CHECK
 	&page_table_check_ops,
 #endif
+#ifdef CONFIG_KMSAN
+	&kmsan_ops,
+#endif
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 	&page_iommu_debug_ops,
 #endif
-- 
2.54.0

