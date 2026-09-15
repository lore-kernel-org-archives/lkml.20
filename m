Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE723446AD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498944; cv=none; b=oSQPuXXBSShiN+deSKP2WZN/C096AgGS9zmTINDjszXezJ+rvw7YuiYpWB26t19epjFbuxSCxItI4PA3M8kj/sKqXykxw01vXVAGUO2JI1Vf8o/tvszbIUxkoRmpuCf63BXIIdp445JttPKmSNwxWWuT1Fp6knEraC9t41x8isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498944; c=relaxed/simple;
	bh=7zm2Dupr4nX+ARSflT++4+7w/gA8ATpyNVLg+vyhxA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbylcbJgWwd4dmS43NYguqvB7T6P/b9iGvmIJQ9PWWUK/XswF/8/rAdYBjpMNnqxm5aKuOjz9qEg2FqG3FMp/84tJaPmnjhNnseVfr0nRlu/KE0KSaKPCNpg6m+p09TGfVmp9tqdFVzFFkf0Y/QOAyODjlewjsGWeKWKWNUwlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAoaY7sY; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAoaY7sY"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so89877e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789498941; x=1790103741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Blu3nD0TwZs02oT5Bhblb/0DYGCIMyHVEsoa4MDtnsA=;
        b=rAoaY7sYf4EOfum3rXwSn8PyX91IqLRx6SwMJjbDPN9ydTyaVobMoTjNyyXu5YGwug
         xbaPGzAK5oZhXg1GUldM3Gaak8WiAn1LD2y+lK+cnYxMq0pBc6LEloWragFMQjz6Tww5
         5fFR3caZFhpJTQjxh391UojyUnwYdxI6i0POgPy29ilYxDAVwbJ1Pri0dS5S5gwB9fxz
         3ZjpILbi8WmRXBqYB97ce2j6Vx5NJxvV7C/jKkvuh0VxDjvhgAbGYfx1pxb3hJ7k63ez
         YkqcR3Tu2kLoAIcRH2C+H/eOCrHEFLHJyxEfq6ThJSAlLkDD34eudzrMikLR+9xCY6lQ
         KUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498941; x=1790103741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Blu3nD0TwZs02oT5Bhblb/0DYGCIMyHVEsoa4MDtnsA=;
        b=0daVRx3106aXaCp8pJ0ehPTDjW4mN+VcS4+uow/8a4H3vFm+b2Q2PPfbH78m/mVgCi
         WKWh/BtvtyJINvQHLCaxJVpEy93OctlAITqI3zBxsVeuWn/JRUgdNKsL4Ex3Tl0f4YQC
         fLb0lOA0lA7aou1CfaMVQfl35y8HUsO1IxhMgMe1yqMZyEyVwCGErZbl5JKmspbhpoQY
         lyxBboQGYFSNcaJWex9dEEiV/e9ld0Zm0Q75Ww+74lgZNtvyrC2ncOQzuasdbKJoqPOB
         mGxncY8A6sc/bBwbSeKBdpYlZXPBcdYAsxqjJneJUV3N7ZpnKYgGe5Lx6vb61efACt+p
         JHtg==
X-Forwarded-Encrypted: i=1; AKwUvByVica950XrJzZsDbQXYPLSurLTnEWzEN0yVE3HTnPVInai8H7QF9seZdDWLtIhnJctqjmQrnsShhKe90I=@vger.kernel.org
X-Gm-Message-State: AFuF++ljQbCJufo9Y5suhMTWk9vuivILLqoEVegmXGQo17LAMxngtznz
	VtXkjagQSeyKFqwiTzhrti+cnM/OZEs2+0Myp9urraSXuR+SnJo7LKWn
X-Gm-Gg: AYBFou33okW55axQFptlkdZ+Jpyx+AT3zNTcbNSuH/jYO3kTqF7QS3jdyJUoZ7O9q4C
	7QEC9Gvxk6SqnPyPoeTkuQ8q7cL2E/jxhb1rBMW8c5QSKnvLaxtEY6zJ7YD8Aks1ARt81igJdda
	3fqfmnaN4MYa0q2UTFUW8U5D/pprPKadi3cd7O88XtOC2ZI/VaoAfqNp0DlXvmu5q0ih/xObNFA
	S+07LD+1OAIaXmOTWg4MrainV/FkD51LS7pR9pCwdxUte+kg8QrspPxdBYGWwnolpV8Vf7FdAVy
	wBh+HHY0Wx4El4d0GH1B4l9b49c2hWH4lRybnxG/MkfXs+fkSOpiKCjQ2MqRNe/V6E0Ll0P5Fuh
	w9G14ugxb6azqWdS2vTNulzSoyjPYoF5LGO5YO31/fGanlVCwnvGTw8e2L7otQ3DjIOKyPLm0zl
	cdb5eMKsaODmk9ZtmZspB9j8CEmp1uGilV7f8osQhYRIXiN+8mLr6lXy0e/UrNkKNuXh/RZuWxM
	HjnbJaAC+rkctkr62Am18ofk5JzRgbMcCNpoPjHbWkTkGLSutrJDv2mROri85WZEeiFIabk2z8N
	OxZ8S8xvp9yLZwRkJwxrVZEWlv2ilB5lu94Be8y3IXS/Hi+2YjX7vlWKenDFaQfGig==
X-Received: by 2002:ac2:4c4e:0:b0:5b6:425:4bf0 with SMTP id 2adb3069b0e04-5b8ae8acdb4mr4205302e87.33.1789498940542;
        Tue, 15 Sep 2026 12:02:20 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-a052-b900-3da4-4f58-44df-c60c.rev.dnainternet.fi. [2001:14ba:a052:b900:3da4:4f58:44df:c60c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e0bd1sm157626e87.59.2026.09.15.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:02:19 -0700 (PDT)
From: Dima Koziuk <dmytrokoziuk68@gmail.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dmytrokoziuk68@gmail.com
Subject: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
Date: Tue, 15 Sep 2026 19:02:06 +0300
Message-ID: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While studying the code, I noticed that kmsan_iounmap_page_range() calls
__vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-page
loop, and does the same for origin. The first iteration therefore unmaps
the entire metadata range, removing the PTEs for later pages before the
loop can recover their backing pages.

Looking at the page lookup, I found another problem. The only callers of
kmsan_vmalloc_to_page_or_null() pass shadow and origin addresses, but the
helper accepts only regular vmalloc and module addresses. KMSAN metadata
lies outside those ranges, so the helper returns NULL and the backing
blocks are never freed.

I considered extending the helper's range check, but vmalloc_to_page()
also checks is_vmalloc_or_module_addr() through VIRTUAL_BUG_ON() when
CONFIG_DEBUG_VIRTUAL is enabled. Supporting metadata addresses there
would bring KMSAN-specific information of the address layout into generic
vmalloc code. That seemed broader than necessary for this fix and would
make it harder to review and maintain, so I looked at how KASAN handles
metadata teardown.

Follow the existing KASAN approach: walk the existing metadata PTEs, clear
each mapping and free its backing block, then flush the metadata TLB
ranges. Put this in a private kmsan_iounmap_pages() helper and remove the
now-unused kmsan_vmalloc_to_page_or_null() and its declaration.

Fixes: b073d7f8aee4 ("mm: kmsan: maintain KMSAN metadata for page operations")
Signed-off-by: Dima Koziuk <dmytrokoziuk68@gmail.com>

---
 mm/kmsan/core.c  |   14 ------------
 mm/kmsan/hooks.c |   64 +++++++++++++++++++++++++++++++++++++++---------------
 mm/kmsan/kmsan.h |    1 -
 3 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/mm/kmsan/core.c b/mm/kmsan/core.c
index 90f427b95a21..bf8c86fdcc5a 100644
--- a/mm/kmsan/core.c
+++ b/mm/kmsan/core.c
@@ -236,20 +236,6 @@ void kmsan_internal_set_shadow_origin(void *addr, size_t size, int b,
 	}
 }
 
-struct page *kmsan_vmalloc_to_page_or_null(void *vaddr)
-{
-	struct page *page;
-
-	if (!kmsan_internal_is_vmalloc_addr(vaddr) &&
-	    !kmsan_internal_is_module_addr(vaddr))
-		return NULL;
-	page = vmalloc_to_page(vaddr);
-	if (pfn_valid(page_to_pfn(page)))
-		return page;
-	else
-		return NULL;
-}
-
 void kmsan_internal_check_memory(void *addr, size_t size,
 				 const void __user *user_addr, int reason)
 {
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 5f1b8053f9fa..084ba667cbf7 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -20,6 +20,8 @@
 #include <linux/uaccess.h>
 #include <linux/usb.h>
 
+#include <asm/tlbflush.h>
+
 #include "../internal.h"
 #include "../vmalloc.h"
 #include "../slab.h"
@@ -142,6 +144,49 @@ void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
 }
 
+#define KMSAN_IOREMAP_META_ORDER 1
+
+static int kmsan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
+					void *unused)
+{
+	pte_t pte;
+	int none;
+
+	lazy_mmu_mode_pause();
+
+	spin_lock(&init_mm.page_table_lock);
+	pte = ptep_get(ptep);
+	none = pte_none(pte);
+	if (likely(!none))
+		pte_clear(&init_mm, addr, ptep);
+	spin_unlock(&init_mm.page_table_lock);
+
+	if (likely(!none))
+		__free_pages(pfn_to_page(pte_pfn(pte)), KMSAN_IOREMAP_META_ORDER);
+
+	lazy_mmu_mode_resume();
+
+	return 0;
+}
+
+static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
+{
+	unsigned long shadow_start = vmalloc_shadow(start),
+		      shadow_end = vmalloc_shadow(end);
+	unsigned long origin_start = vmalloc_origin(start),
+		      origin_end = vmalloc_origin(end);
+
+	apply_to_existing_page_range(&init_mm, shadow_start,
+				     shadow_end - shadow_start,
+				     kmsan_depopulate_vmalloc_pte, NULL);
+	apply_to_existing_page_range(&init_mm, origin_start,
+				     origin_end - origin_start,
+				     kmsan_depopulate_vmalloc_pte, NULL);
+
+	flush_tlb_kernel_range(shadow_start, shadow_end);
+	flush_tlb_kernel_range(origin_start, origin_end);
+}
+
 /*
  * This function creates new shadow/origin pages for the physical pages mapped
  * into the virtual memory. If those physical pages already had shadow/origin,
@@ -219,28 +264,11 @@ ret:
 
 void kmsan_iounmap_page_range(unsigned long start, unsigned long end)
 {
-	unsigned long v_shadow, v_origin;
-	struct page *shadow, *origin;
-	int nr;
-
 	if (!kmsan_enabled || kmsan_in_runtime())
 		return;
 
-	nr = (end - start) / PAGE_SIZE;
 	kmsan_enter_runtime();
-	v_shadow = (unsigned long)vmalloc_shadow(start);
-	v_origin = (unsigned long)vmalloc_origin(start);
-	for (int i = 0; i < nr;
-	     i++, v_shadow += PAGE_SIZE, v_origin += PAGE_SIZE) {
-		shadow = kmsan_vmalloc_to_page_or_null((void *)v_shadow);
-		origin = kmsan_vmalloc_to_page_or_null((void *)v_origin);
-		__vunmap_range_noflush(v_shadow, vmalloc_shadow(end));
-		__vunmap_range_noflush(v_origin, vmalloc_origin(end));
-		if (shadow)
-			__free_pages(shadow, 1);
-		if (origin)
-			__free_pages(origin, 1);
-	}
+	kmsan_iounmap_pages(start, end);
 	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
 	kmsan_leave_runtime();
diff --git a/mm/kmsan/kmsan.h b/mm/kmsan/kmsan.h
index bc3d1810f352..681594186663 100644
--- a/mm/kmsan/kmsan.h
+++ b/mm/kmsan/kmsan.h
@@ -165,7 +165,6 @@ bool kmsan_metadata_is_contiguous(void *addr, size_t size);
 void kmsan_internal_check_memory(void *addr, size_t size,
 				 const void __user *user_addr, int reason);
 
-struct page *kmsan_vmalloc_to_page_or_null(void *vaddr);
 void kmsan_setup_meta(struct page *page, struct page *shadow,
 		      struct page *origin, int order);
 
