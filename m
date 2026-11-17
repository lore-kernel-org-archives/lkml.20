Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917231;
	b=LL9WuzZEF3ld6c1/ca72wRBJEJd0iblWptSDIhXXHhpa5TvQ/d/fWyxpBD3E5LwKjr++
	 /gTXlF7zBbCYnLouVa2awxvZtOeD0WYCfJRwD7FU/G+TQRXIAta2oa1ffpiRvPNxFwjNK
	 qu6hn8hkOeDojav1CKdaIHZzrzL7a+ZgbXvNsNub47bPK6lr3J8i6E+l2tILHX8WP4BJ6
	 S1qwdrf0veO0kvkvKeFccQQHo0s8nt10IRHmLQNrd+GzkX244aLs5Iy5ByQmr1oD2GqmS
	 Q18wy6Ybm/pXInTJ/UNkUidhjOgF3ZX40cJUsqIXJCvjANRdV6ONwiIBsyqa0nABxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6c6XNgFhfszqQ1hFLaWUE4ktsCkCd4UwZmAEeIjy0+E=;
	b=SZRjn4kgnbHZBQaSca2ryh/DcFWZLP9T3LjNI8ojWS1pegVMVmV+Rdee8vrfhsoO21LJ
	 mYExRWW0HmMwmzYYFOG0OW1v6ttByt4TEuo4NCbNVyHMBpGjOkTgkVCK+serUo936Cvwk
	 3bTvW3KlaSi8G3TDj3fTOz6/E1Y29YMsYPlkNmeziC4WcbtTAdevsapcwzPp4KbV2SGrY
	 0O0TBj037D0f55UmRnKjkifwOIl3ouI21eCvxg/gB/mBvhq3pVUMzCW4vvS/+v1xJqKnb
	 OVK81H2mIRcwqg9OQtMC/l9WBm9oOF1O4AlNf+QSl+vo7dG/5i5pekavilzcrhIB19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QmggVGey;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA5606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDA5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QmggVGey
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso672518c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917230; x=1795522030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c6XNgFhfszqQ1hFLaWUE4ktsCkCd4UwZmAEeIjy0+E=;
        b=QmggVGeyr5sOJFmFta9mEnKKqACKxrkjP8/lDV/cJa4m7bKTTj7j8EbPwEaQ44oy5Y
         m9VGlmxww+7qsqGomfClghLgXfLw3L581iKaiuGzOejAuFDSEEzXAJ7pkrH+E4XcCNoF
         K9EbXyhn1fV89tAuobc4qgYoBzfL+VydbbOEo/Hfzf8rsbNIq4NgrzssQpZw6B4vbF2t
         xbOEtfWr3+5cXim5CTOvxUgIyXn3RKP4iZZ1FnbJqUWIGcJgS2dcVJOZvYtScOP6SGHG
         x8bTkWcJLtinet7SHmnZGMGos6VIYUgRKS2wSFez+s2m24+d07UW0ozRAVg3z8HYOfet
         apYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917230; x=1795522030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6c6XNgFhfszqQ1hFLaWUE4ktsCkCd4UwZmAEeIjy0+E=;
        b=rcZpzg36H+ItYeuigRg2/ahV54R0o/t1AvousYfMkn25mYywlLEx5u+6fH29tlzo8i
         8yfUNUCXOVxxvPZ3m34ltZ7ANJ5XIfp+Q7X9UmkUBINRQGoVAqenkuDbvFER4t1PXgkW
         tOocHmgRHJh/dxY/BgAUN59wW3PGyxVTK3kYp/gXEkVoV0sfMoFJi/vxKvTMUggpVNc4
         EjRotHs4Ea8js7JiwNBfYzoL1dcmDQVixEg2pkzwq3NOvBMonBoaKsbYASYFk2wVhN2t
         kRjnNmjU8rNHMk0ceSFjGlMNnx2bdqmkVgn5sZj2rh7FvmKV9/WtNmBGKdcuxswP6K4o
         lPcQ==
X-Forwarded-Encrypted: i=1; AL+hErEhKZ/Bcun58nFJSeBMBV7HXAfItWihnTyynA8QnuugDTx32fv9lDzAWz8Y7QK8EzKq9Kofat7lWMi7C48=@vger.kernel.org
X-Gm-Message-State: APuU4Z81LfWpZk8ETG0U+Lb4gVyFDQf7dUpoTiIvX3Qvxd20pKicDDAI
	iHA9LtvMWIsJq7Bulu9ky+166nQdkGwEGpTO6G5imSuz+aZr1scN6/LBf0XEOWH0Z/E=
X-Gm-Gg: AYBFou26lubWCdRPBlNPhQk/TUUw9I4FIwoGnm2fNKFAdpd9ZP20x+RJv69YUdsljJ/
	qVhLNBDh6mLfu9L3kMjsCrR4J3PDk3H2BJvEHAuuEdowWwtx3Rjpvwqpp9fgD/8tSjIakuHyBYE
	hy+ycWkgWwMzMti3xV/giHCHzTltzVmNejhRdBrz6a2NMcFKjyo1GyUJ6alJcWw5Fs8mC4VMOyg
	v4sy4Lq5Hb61uiuV3MTU6Qd6UiDDx/FGBsLUPAfetkI/IOYHXcbM2OtTOM5dnkyuTPUVJIQvwzk
	y3FtuQdwP/I1wX6hpG3fpStrxVv5u/Z+m/nTXPFbaPRqCaMF6Lo1SNeN4cMSDjJO04iLgieOGGR
	iDxgbxREZY87scVRx4G3uA0YPBK0x7LbdWLUT77mMrUywzUDizLpEZN4+4egFtfGFSKDW2E4G5g
	g3sD6N6GOXuWY38heEY0Is9c1ilBVsmV6YM9Ed0GoixgffUyjgthWLcnEH+PSp0K8LtsP6r2yCo
	C4CLQSxNNwhYKwxqYUPTTIAwteFSsxmuiyyGB84zxboVpk5wDmqyo+bwsDmPVqeCHLUnJTERxj8
	KcINImOxFG+ZuVVnUCbl5PFwpps6PGWHnE5haT9ZWa+GjHHkOs4LI0ZriE4Lnd5P3w==
X-Received: by 2002:a05:701b:4208:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b53a3d6f36mr2100222c88.11.1794917230199;
        Tue, 17 Nov 2026 04:07:10 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:09 -0800 (PST)
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
Subject: [PATCH v2 1/7] kmsan: encapsulate per-page metadata access
Date: Tue, 17 Nov 2026 20:06:21 +0800
Message-ID: <20261117120627.50601-2-songmuchun@bytedance.com>
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

KMSAN directly accesses page->kmsan_shadow and page->kmsan_origin
throughout the shadow implementation. This couples these users to
storing the metadata pointers in struct page, requiring every access
site to change when the storage moves elsewhere.

Introduce helpers that get and set both metadata page pointers as a pair
and convert the existing users to them.

kmsan_get_shadow_origin_ptr() is the main metadata lookup path for
compiler-instrumented memory accesses and requires both pointers. For
page-backed addresses, resolve the backing page once and obtain the
metadata pair through one lookup instead of calling the single-metadata
path twice. This also avoids duplicate lookups after moving the metadata
storage out of struct page.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Use one page metadata lookup for shadow and origin pointers (suggested
  by Chris Down)
---
 mm/kmsan/shadow.c | 166 +++++++++++++++++++++++++++++++---------------
 1 file changed, 111 insertions(+), 55 deletions(-)

diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 0c88d89bf0d6..300b48818af1 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -9,6 +9,7 @@
 
 #include <asm/kmsan.h>
 #include <asm/tlbflush.h>
+#include <linux/bits.h>
 #include <linux/cacheflush.h>
 #include <linux/memblock.h>
 #include <linux/mm_types.h>
@@ -20,29 +21,46 @@
 #include "../vmalloc.h"
 #include "kmsan.h"
 
-#define shadow_page_for(page) ((page)->kmsan_shadow)
+#define KMSAN_META_MASK_SHADOW		BIT(0)
+#define KMSAN_META_MASK_ORIGIN		BIT(1)
 
-#define origin_page_for(page) ((page)->kmsan_origin)
+struct page_metadata {
+	struct page *shadow;
+	struct page *origin;
+};
 
-static void *shadow_ptr_for(struct page *page)
+static inline struct page_metadata get_page_metadata(struct page *page)
 {
-	return page_address(shadow_page_for(page));
+	return (struct page_metadata) {
+		.shadow = page->kmsan_shadow,
+		.origin = page->kmsan_origin,
+	};
 }
 
-static void *origin_ptr_for(struct page *page)
+static inline void set_page_metadata(struct page *page, struct page_metadata meta)
 {
-	return page_address(origin_page_for(page));
+	page->kmsan_shadow = meta.shadow;
+	page->kmsan_origin = meta.origin;
 }
 
-static bool page_has_metadata(struct page *page)
+static inline void *shadow_ptr_for(struct page_metadata meta)
 {
-	return shadow_page_for(page) && origin_page_for(page);
+	return page_address(meta.shadow);
+}
+
+static inline void *origin_ptr_for(struct page_metadata meta)
+{
+	return page_address(meta.origin);
+}
+
+static inline bool page_has_metadata(struct page_metadata meta)
+{
+	return meta.shadow && meta.origin;
 }
 
 static void set_no_shadow_origin_page(struct page *page)
 {
-	shadow_page_for(page) = NULL;
-	origin_page_for(page) = NULL;
+	set_page_metadata(page, (struct page_metadata) {});
 }
 
 /*
@@ -79,11 +97,56 @@ static struct page *virt_to_page_or_null(void *vaddr)
 		return NULL;
 }
 
+static __always_inline
+struct shadow_origin_ptr __kmsan_get_metadata(void *address, unsigned int mask)
+{
+	struct shadow_origin_ptr ret = {};
+	struct page_metadata meta;
+	struct page *page;
+	u64 addr = (u64)address;
+	u64 origin_addr = ALIGN_DOWN(addr, KMSAN_ORIGIN_SIZE);
+
+	if (kmsan_internal_is_vmalloc_addr(address) ||
+	    kmsan_internal_is_module_addr(address)) {
+		if (mask & KMSAN_META_MASK_SHADOW)
+			ret.shadow = (void *)vmalloc_meta(address, KMSAN_META_SHADOW);
+		if (mask & KMSAN_META_MASK_ORIGIN)
+			ret.origin = (void *)vmalloc_meta((void *)origin_addr,
+							  KMSAN_META_ORIGIN);
+		return ret;
+	}
+
+	if (mask & KMSAN_META_MASK_SHADOW) {
+		ret.shadow = arch_kmsan_get_meta_or_null(address, KMSAN_META_SHADOW);
+		if (!ret.shadow)
+			goto lookup_page;
+	}
+	if (mask & KMSAN_META_MASK_ORIGIN)
+		ret.origin = arch_kmsan_get_meta_or_null((void *)origin_addr,
+							 KMSAN_META_ORIGIN);
+	if (ret.shadow || ret.origin)
+		return ret;
+
+lookup_page:
+	page = virt_to_page_or_null(address);
+	if (!page)
+		return ret;
+	meta = get_page_metadata(page);
+	if (!page_has_metadata(meta))
+		return ret;
+
+	if (mask & KMSAN_META_MASK_SHADOW)
+		ret.shadow = shadow_ptr_for(meta) + offset_in_page(addr);
+	if (mask & KMSAN_META_MASK_ORIGIN)
+		ret.origin = origin_ptr_for(meta) + offset_in_page(origin_addr);
+
+	return ret;
+}
+
 struct shadow_origin_ptr kmsan_get_shadow_origin_ptr(void *address, u64 size,
 						     bool store)
 {
 	struct shadow_origin_ptr ret;
-	void *shadow;
 
 	/*
 	 * Even if we redirect this memory access to the dummy page, it will
@@ -95,12 +158,10 @@ struct shadow_origin_ptr kmsan_get_shadow_origin_ptr(void *address, u64 size,
 		goto return_dummy;
 
 	KMSAN_WARN_ON(!kmsan_metadata_is_contiguous(address, size));
-	shadow = kmsan_get_metadata(address, KMSAN_META_SHADOW);
-	if (!shadow)
+	ret = __kmsan_get_metadata(address, KMSAN_META_MASK_SHADOW |
+					    KMSAN_META_MASK_ORIGIN);
+	if (!ret.shadow)
 		goto return_dummy;
-
-	ret.shadow = shadow;
-	ret.origin = kmsan_get_metadata(address, KMSAN_META_ORIGIN);
 	return ret;
 
 return_dummy:
@@ -124,46 +185,36 @@ struct shadow_origin_ptr kmsan_get_shadow_origin_ptr(void *address, u64 size,
  */
 void *kmsan_get_metadata(void *address, bool is_origin)
 {
-	u64 addr = (u64)address, off;
-	struct page *page;
-	void *ret;
-
-	if (is_origin)
-		addr = ALIGN_DOWN(addr, KMSAN_ORIGIN_SIZE);
-	address = (void *)addr;
-	if (kmsan_internal_is_vmalloc_addr(address) ||
-	    kmsan_internal_is_module_addr(address))
-		return (void *)vmalloc_meta(address, is_origin);
-
-	ret = arch_kmsan_get_meta_or_null(address, is_origin);
-	if (ret)
-		return ret;
-
-	page = virt_to_page_or_null(address);
-	if (!page)
-		return NULL;
-	if (!page_has_metadata(page))
-		return NULL;
-	off = offset_in_page(addr);
+	struct shadow_origin_ptr ret;
+	unsigned int mask;
 
-	return (is_origin ? origin_ptr_for(page) : shadow_ptr_for(page)) + off;
+	mask = is_origin ? KMSAN_META_MASK_ORIGIN : KMSAN_META_MASK_SHADOW;
+	ret = __kmsan_get_metadata(address, mask);
+	return is_origin ? ret.origin : ret.shadow;
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
@@ -171,19 +222,18 @@ EXPORT_SYMBOL(kmsan_copy_page_meta);
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
 
@@ -191,7 +241,7 @@ void kmsan_alloc_page(struct page *page, unsigned int order, gfp_t flags)
 	if (kmsan_in_runtime())
 		return;
 
-	__memset(page_address(shadow), -1, PAGE_SIZE * pages);
+	__memset(shadow_ptr_for(meta), -1, PAGE_SIZE * pages);
 	kmsan_enter_runtime();
 	handle = kmsan_save_stack_with_flags(flags, /*extra_bits*/ 0);
 	kmsan_leave_runtime();
@@ -200,7 +250,7 @@ void kmsan_alloc_page(struct page *page, unsigned int order, gfp_t flags)
 	 * to just fill the origin pages with @handle.
 	 */
 	for (int i = 0; i < PAGE_SIZE * pages / sizeof(handle); i++)
-		((depot_stack_handle_t *)page_address(origin))[i] = handle;
+		((depot_stack_handle_t *)origin_ptr_for(meta))[i] = handle;
 }
 
 void kmsan_free_page(struct page *page, unsigned int order)
@@ -238,8 +288,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
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
 
@@ -289,10 +341,12 @@ void __init kmsan_init_alloc_meta_for_range(void *start, void *end)
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
 
@@ -302,7 +356,9 @@ void kmsan_setup_meta(struct page *page, struct page *shadow,
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

