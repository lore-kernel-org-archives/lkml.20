Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972A3DDB1F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299204; cv=none; b=W17McDiB5EGJ5EYTmjGKAWx3ip9/7WB1oAAntOARdrY80essEwQCdfLLR1ukuP6EKD4RyGj7FAsoxp96kgtyWJZKuWlIC6p4akHSmPJn9WJ5b7HNroO/QM7iI/pPpBBDw7XdekEXf1aPUPSZFXU+Tyl79NzPKrMHLJdw1XQ17FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299204; c=relaxed/simple;
	bh=z+smutewlOq/DVax40CqKK7q1Y7YvZUwgS3R4KOIJ/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGo4YoQx1vIslko0mIpJ71jqIYFerwj0/QqTasqcwAWJlGlwocdDA8bLylAdtAL+vDcs1aUQCOMgJz9Jor7X/W839Y+JW5kUREL49vunFYjfGwHeTesQjMo0duBXHYaAhTtfJ8gr8a1Zlea34gY+/CxSkSPKcI00wgSwup+croo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbd1D/hP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbd1D/hP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso36120666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788299201; x=1788904001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiQkNyFj/w6aOeqdi5RimSxmu3RrYESQzCuwF1FuMeo=;
        b=Wbd1D/hPpOGUfCMd3HsWyo0SWLBzdC3827/KrsQgdIU310mgnJsJnOgfw9JkLtGNnO
         DhteeuOmObBQs7D6iRUjZfDTh+Bt4Ufmqu89NEV2cqANrsMclw7hD2Jx+n0qahfSO8S8
         Lal2U4WN9GcLv7P1V6fZs1VC65NkVeJiLPkCL+Bs219Iz3GL/hwM4nmQQ6k75rQpgKQC
         hgxnxuBw7R0ajpQ+oboZMsXUs8pK2lLzbrTV7G8P/vwdbQFRibbtdxUUeNnnZuKE7j51
         4mFwAffBEaympy8wGgndRm6aBNqZoik3Mry0so7m11MD82Ots121AII1y+lGcgTOTeDr
         T/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299201; x=1788904001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiQkNyFj/w6aOeqdi5RimSxmu3RrYESQzCuwF1FuMeo=;
        b=cazRCxU1PY64n8zFKc9NX8ClYBrdk9d6CHzGCjM4tHAQJ08eJmwBBnffiW+4+D05bJ
         zkDzAb2gy2TalYOuBYuUfzSrA8eued9JmNQo60zH2ozIaS6IoYDK/Rx+s15qs8o/aujV
         a27ZB2wZJMDWViopJlVPXJ2kogQR+Kajxw0uD2TdpDTKWTqeI2SJVU3+XYYYxHItE/jq
         NEVA5Nzq/j9EArgu3/7AKOKrEwwwnRFyZpyJp8VsBMeaBgOpdyekH7drUlNA7qRmb0Rz
         E38mGbDXqEVGLecjSW+mW1Zfa93+p0fbBvKuVcaCvniFg6CENcWclFgv2PkIKCsA88m9
         6vlA==
X-Forwarded-Encrypted: i=1; AHgh+RqFo4YZvtAuXhM8uVk8dzioKFcBp6/dh/cePoKfihSNNCLiz6xt9Uz0CGC0j5biKZElus1PsvhPiCzfIF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mjul9L/k6dvPiB6J5EfjlQMliuTUrH+oKGttr9PgQzswa7GMls
	5HeNAUWyaCEKwjt93bXtbJXqjyzoX5rK78BqTBPcZcFnHnKHqLsuKdrN7oywIg==
X-Gm-Gg: AR+sD10u9WxBVSR+VzBiXKulxHzix3DH3nAQiwRoEGThg8vfirMwFUIJ7r9T7epXOJc
	y2QlH/Vs8InLa2RTFQeD1J4ct/AFuU/Bvw19S22FhoVBwn0wSXmiO7jyMWVnr78pwd0MEtQ70Cx
	f7mbE9k4vFmlmUIPVIdthAbg3fC+PX2NXej8n8JKFYiFMPzM1JpdEyBUkDrXGNMtf8zbTAlZRtP
	OnoDUV5TP8WSfrRoRCQQTUCyMP+c1HHh2UofYuVH8OgdpASDeDtoO+m5JtpN4iz25iMcLk1hiGk
	eOCEp+5ikD3Rr3dFs7gMF3l9aTtQ3lvUGnQx9aOdGYa+ttb/+14Fml0pvmUJhC11lZkxCH9cGT4
	DbjwyZHlxc1aSc3IywjzOrkn9IJII8mtsxE8s2SVP+uEPIfg5bKaXZCo5TvGMQK5qT0UHysVxxM
	GZt5YswWCRW9/hQbmS8RpCrXqJSgcQZHh/XDm574oMDTi1YeKDNsgPjAnK6C2sdWnyzqp0+PLW9
	0LRVXrgYGbJH6W/s+BadAOYFVcRwwaq9euEZdscyA==
X-Received: by 2002:a17:906:478d:b0:c25:848a:4a8d with SMTP id a640c23a62f3a-c25d52875e3mr17277066b.5.1788299201163;
        Tue, 01 Sep 2026 14:46:41 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm27500866b.4.2026.09.01.14.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:46:40 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 4/6] sparc32: drop unused valid address bitmap
Date: Tue,  1 Sep 2026 23:45:48 +0200
Message-ID: <20260901214611.60560-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901214611.60560-1-linmag7@gmail.com>
References: <20260901214611.60560-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparc_valid_addr_bitmap is populated during early memory setup but never
read. Remove the bitmap, its allocation and the population helper.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/mm/init_32.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 75050dfbc2ea..6880d9cb30a5 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -13,7 +13,6 @@
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
-#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/ptrace.h>
 #include <linux/mman.h>
@@ -24,7 +23,6 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/pagemap.h>
-#include <linux/poison.h>
 #include <linux/gfp.h>
 
 #include <asm/sections.h>
@@ -37,8 +35,6 @@
 
 #include "mm_32.h"
 
-static unsigned long *sparc_valid_addr_bitmap;
-
 unsigned long phys_base;
 EXPORT_SYMBOL(phys_base);
 
@@ -218,27 +214,8 @@ void __init paging_init(void)
 	device_scan();
 }
 
-static void __init taint_real_pages(void)
-{
-	int i;
-
-	for (i = 0; sp_banks[i].num_bytes; i++) {
-		unsigned long start, end;
-
-		start = sp_banks[i].base_addr;
-		end = start + sp_banks[i].num_bytes;
-
-		while (start < end) {
-			set_bit(start >> 20, sparc_valid_addr_bitmap);
-			start += PAGE_SIZE;
-		}
-	}
-}
-
 void __init arch_mm_preinit(void)
 {
-	int i;
-
 	if (PKMAP_BASE+LAST_PKMAP*PAGE_SIZE >= FIXADDR_START) {
 		prom_printf("BUG: fixmap and pkmap areas overlap\n");
 		prom_printf("pkbase: 0x%lx pkend: 0x%lx fixstart 0x%lx\n",
@@ -248,19 +225,6 @@ void __init arch_mm_preinit(void)
 		prom_printf("Please mail sparclinux@vger.kernel.org.\n");
 		prom_halt();
 	}
-
-	i = last_valid_pfn >> ((20 - PAGE_SHIFT) + 5);
-	i += 1;
-	sparc_valid_addr_bitmap = (unsigned long *)
-		memblock_alloc(i << 2, SMP_CACHE_BYTES);
-
-	if (sparc_valid_addr_bitmap == NULL) {
-		prom_printf("mem_init: Cannot alloc valid_addr_bitmap.\n");
-		prom_halt();
-	}
-	memset(sparc_valid_addr_bitmap, 0, i << 2);
-
-	taint_real_pages();
 }
 
 void sparc_flush_page_to_ram(struct page *page)
-- 
2.43.0

