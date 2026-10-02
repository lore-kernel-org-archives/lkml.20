Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF64496D4A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971535; cv=none; b=CzB1codQNmL5ijDoUEkHBgQOrUVPTrNDSH9X9Rt4NvDqo9tBfngjeX7pbngc/n2lISJa3w0vB1xtQiDcwS1AqiDOb88vXvTaAPGo2ljRJVUkGGRUed+xmIzg9nbi7QYBRFi0Yfa8RqSrwTRv18BwBA9D6z8ld7kfDWBHkzwCTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971535; c=relaxed/simple;
	bh=+9Wul2VwqMqLw/PMW+tswlbQn905lhecZvHn50OrasQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvWSa20kkSWV5503j06tT1hlVRh36yaLaWj+tkJOF9zv+/EhAw7xZ99dmaEYt4/DBXy7/BYwW/cJmiOZqiu5mjcKaJbPZ/DzR1WPADPz+RIFvXcT6BLBUNhsTbnySeJAXckF1KWEtgIMe+z+bhnBFwGt/fgaY06L/i0+QNyo6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF+9Btnt; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF+9Btnt"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so2723873e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971531; x=1791576331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVNK4JoiucBTLzRok4UL7M6qjfOQzVIKG+cDN0ZVD+8=;
        b=XF+9BtntsniyorMtuQjj7PgvRq0lCvQMcbM8+E2oibb/d43KFF0NKmMSwUnMCQkxKX
         Y1COordyJYZVgQYIGuXivKLMSlzZhm16oBLknBt2Vk33dWyaVe8EEdefR/Dloy09wFwC
         vr6CupwQs+WAFkdXbfBiGBtI8Uji+TCvw53tdNmd/d9AmVwHhMui3EmnTUnfE7A/N7T1
         0E34Vfv0ybosaB4koffI7EaWw7QkesFCXpf+RTHBghZFUwrGmcLkefOPpibtqPY+ebVO
         OhKcL0/no7ihoJS6RbDI97jhHtY/sFmAteJ2ChgVHSzMYw7cCv4uaWrfpT0GvYTttOxS
         0Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971531; x=1791576331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVNK4JoiucBTLzRok4UL7M6qjfOQzVIKG+cDN0ZVD+8=;
        b=0jPqt8QePBNYqtMqncd/i1olwRPHuQ82pjo3jYhveng91rooecYV7njTloufKtp7fR
         Tn2P6O6YCgHSXgUZxAovzBzO7LgCe2L8IIshnhP7bbP+OOqECczhGtWKVzEQYS7m1zrA
         xTzVGLmmlZIbZgGmJvDnqrRa/x6VP1wVjIwZGLJM6U4IQTb+IsXp8/3iWhBSUx2vHpJU
         IUj6QnuCTsS03SsBNpwRzBV3kLxa18rwifwm3VQ/ISULiDrhco1dWsN214K3Nw81QZaE
         K942+xOMCDSDesrh7Uhx14G/dyhx8w+u6K3BV3f9ipaY1M2IKSH2vJOwFvbT2u9vxrjd
         3Djg==
X-Forwarded-Encrypted: i=1; AKwUvBwOJnJ7XXjYqILxVuOADKsr0zBamZUktXzbyAqZx6rNPGUiTEsjdBEbidBV+uquZJPhx4EyxhXaGEyUCxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw/3ML0JLOHn9snbLzKsj3gzZ6TZeUWkbB9PDU6TWdb0554x+K
	NIUfAzUgb84u9aNP5Jew76SJC7Oic/Pvxd19QxqCsbUX8ozvJF6PWg0Mww1F88vdJtY=
X-Gm-Gg: AYBFou10vh7j7PCvWFB1wmEm67SVrKSgvjBxmgHn21fcdArA+UCxCxX9xd/LxzX9NQl
	IduDs7DczLmF/Fx3gHT9vROvDBT9XeWu64jq+rruQmy+nhTW6SOgKV7M7++SCkRiy82qc/FrgR9
	KKG2dlT+T4xjBYTI/6o6wPYy2JfVf3YIk+44E6CZNxkljKOGPX5phrFXYBDHiBHQbpj6fHQovJG
	aEKOnnbmP6145sG0tdyOrFloZ9S4KYRdoggrp2bdPzZ5rBxmVlvbIs/fWBnF962FZ3WBPN4D7Ux
	YfffcaY+9TL/DeU34CYqngRFPbd8KAaU2SOJawfbiv0hrkqIf3WdQU2fIm/cl9S10aG74daOtYM
	eX0/A2qYzD7WHBO0IGC2FkQjbl1q8nUM6JkE16BASVWBUi5Ocs71yJmD+HjcDOOF0YT1vzD46e0
	4LAlheMAaGibrYW3aJpTYr9bsJDUq0I0CHs/bNUjOZOu3ji6cIhjkWMJP8sDeA6XfOcuk6FM9+6
	sKPs9K4w9mGgI6x42g3g8ITexf1ZzMR3DvqqNwqR/fNOURNaQyfFxz2akVa9pkfltehKcdT688h
	JxfZF6k1b66+E7zrqDw2Oxr+Z2upEqD6TsGvQCRT4m+YYb5ieixGZ87zHystTNc=
X-Received: by 2002:a05:6512:838e:b0:5ba:3fc3:d8cf with SMTP id 2adb3069b0e04-5bb9bc24242mr1151978e87.34.1790971530812;
        Fri, 02 Oct 2026 13:05:30 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-a052-b900-354c-f1dd-ffbd-a9f2.rev.dnainternet.fi. [2001:14ba:a052:b900:354c:f1dd:ffbd:a9f2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c78bcecsm1018388e87.15.2026.10.02.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:05:30 -0700 (PDT)
From: Dima Koziuk <dmytrokoziuk68@gmail.com>
To: glider@google.com,
	akpm@linux-foundation.org
Cc: dmytrokoziuk68@gmail.com,
	elver@google.com,
	dvyukov@google.com,
	urezki@gmail.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm: kmsan: fix iounmap metadata teardown
Date: Fri,  2 Oct 2026 23:05:07 +0300
Message-ID: <20261002200508.546-1-dmytrokoziuk68@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmsan_vmalloc_to_page_or_null() rejects addresses outside the regular
vmalloc and module ranges, including the shadow and origin addresses
passed by its callers. As a result, iounmap does not free the metadata
backing pages. Also, the first iteration of the teardown loop
unmaps the entire metadata range, preventing subsequent iterations from
finding their pages even if the address lookup is fixed.

Factor the page-table walk out of vmalloc_to_page() into
__vmalloc_to_page(), keeping the address check in the public wrapper.
Use the unchecked helper in kmsan_vmalloc_to_page_or_null() and check
for NULL before converting the returned page to a PFN. Mark
__vmalloc_to_page() as __always_inline to avoid an additional function
call in vmalloc_to_page().

Move metadata teardown into kmsan_iounmap_pages(). Free the backing
blocks while their mappings are still available, then unmap each
metadata range once and flush its TLB entries.

Fixes: b073d7f8aee4 ("mm: kmsan: maintain KMSAN metadata for page operations")
Suggested-by: Alexander Potapenko <glider@google.com>
Link: https://lkml.iu.edu/2609.3/12748.html
Signed-off-by: Dima Koziuk <dmytrokoziuk68@gmail.com>
---
Changes in v2:
- Share the vmalloc page-table walk instead of adding a KMSAN PTE walker.
- Keep kmsan_vmalloc_to_page_or_null() and handle absent mappings.

 mm/kmsan/core.c  |  8 +++-----
 mm/kmsan/hooks.c | 51 +++++++++++++++++++++++++++++++-----------------
 mm/vmalloc.c     | 21 ++++++++++++--------
 mm/vmalloc.h     |  1 +
 4 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/mm/kmsan/core.c b/mm/kmsan/core.c
index 90f427b95a21..3ad5f31d56b6 100644
--- a/mm/kmsan/core.c
+++ b/mm/kmsan/core.c
@@ -27,6 +27,7 @@
 #include <linux/vmalloc.h>
 
 #include "../slab.h"
+#include "../vmalloc.h"
 #include "kmsan.h"
 
 bool kmsan_enabled __read_mostly;
@@ -240,11 +241,8 @@ struct page *kmsan_vmalloc_to_page_or_null(void *vaddr)
 {
 	struct page *page;
 
-	if (!kmsan_internal_is_vmalloc_addr(vaddr) &&
-	    !kmsan_internal_is_module_addr(vaddr))
-		return NULL;
-	page = vmalloc_to_page(vaddr);
-	if (pfn_valid(page_to_pfn(page)))
+	page = __vmalloc_to_page(vaddr);
+	if (page && pfn_valid(page_to_pfn(page)))
 		return page;
 	else
 		return NULL;
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 5f1b8053f9fa..24f71bc65896 100644
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
@@ -142,6 +144,36 @@ void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
 }
 
+#define KMSAN_IOREMAP_META_ORDER 1
+
+static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
+{
+	unsigned long shadow_start = vmalloc_shadow(start),
+		      shadow_end = vmalloc_shadow(end);
+	unsigned long origin_start = vmalloc_origin(start),
+		      origin_end = vmalloc_origin(end);
+	unsigned long v_shadow, v_origin;
+	struct page *shadow, *origin;
+	int nr;
+
+	nr = (end - start) / PAGE_SIZE;
+	v_shadow = shadow_start;
+	v_origin = origin_start;
+	for (int i = 0; i < nr;
+	     i++, v_shadow += PAGE_SIZE, v_origin += PAGE_SIZE) {
+		shadow = kmsan_vmalloc_to_page_or_null((void *)v_shadow);
+		origin = kmsan_vmalloc_to_page_or_null((void *)v_origin);
+		if (shadow)
+			__free_pages(shadow, KMSAN_IOREMAP_META_ORDER);
+		if (origin)
+			__free_pages(origin, KMSAN_IOREMAP_META_ORDER);
+	}
+	__vunmap_range_noflush(shadow_start, shadow_end);
+	__vunmap_range_noflush(origin_start, origin_end);
+	flush_tlb_kernel_range(shadow_start, shadow_end);
+	flush_tlb_kernel_range(origin_start, origin_end);
+}
+
 /*
  * This function creates new shadow/origin pages for the physical pages mapped
  * into the virtual memory. If those physical pages already had shadow/origin,
@@ -219,28 +251,11 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 
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
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..5fe37ad41f38 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -817,9 +817,10 @@ EXPORT_SYMBOL_GPL(is_vmalloc_or_module_addr);
 /*
  * Walk a vmap address to the struct page it maps. Huge vmap mappings will
  * return the tail page that corresponds to the base page address, which
- * matches small vmap mappings.
+ * matches small vmap mappings. Unlike vmalloc_to_page(), this also accepts
+ * addresses outside the vmalloc and module ranges, such as KMSAN metadata.
  */
-struct page *vmalloc_to_page(const void *vmalloc_addr)
+__always_inline struct page *__vmalloc_to_page(const void *vmalloc_addr)
 {
 	unsigned long addr = (unsigned long) vmalloc_addr;
 	struct page *page = NULL;
@@ -829,12 +830,6 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 	pmd_t *pmd;
 	pte_t *ptep, pte;
 
-	/*
-	 * XXX we might need to change this if we add VIRTUAL_BUG_ON for
-	 * architectures that do not vmalloc module space
-	 */
-	VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
-
 	if (pgd_none(*pgd))
 		return NULL;
 	if (WARN_ON_ONCE(pgd_leaf(*pgd)))
@@ -873,6 +868,16 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 
 	return page;
 }
+
+struct page *vmalloc_to_page(const void *vmalloc_addr)
+{
+	/*
+	 * XXX we might need to change this if we add VIRTUAL_BUG_ON for
+	 * architectures that do not vmalloc module space
+	 */
+	VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
+	return __vmalloc_to_page(vmalloc_addr);
+}
 EXPORT_SYMBOL(vmalloc_to_page);
 
 /*
diff --git a/mm/vmalloc.h b/mm/vmalloc.h
index 8866ddcff668..bce4c982c88b 100644
--- a/mm/vmalloc.h
+++ b/mm/vmalloc.h
@@ -8,6 +8,7 @@
 #include <linux/vmalloc.h>
 
 #ifdef CONFIG_MMU
+struct page *__vmalloc_to_page(const void *vmalloc_addr);
 void __init vmalloc_init(void);
 int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages,

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
