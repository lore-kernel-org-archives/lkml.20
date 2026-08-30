Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B913B3899
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091687; cv=none; b=EWL/TuB8fMHnhpcRmbXQqzvcYOtG1kzUcKVYCmbit/bQzsJSWjExvwbeY2c1YZQp8UX6pltPc1bc0j2ZdAD816Edq73uXlBBPaM++NKxuB5+MhMq4hCK7A2okRzvJpFA0naxi5sh3BxCNtzNAujI7l/qXUoHPWUnuCN/mQpt7D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091687; c=relaxed/simple;
	bh=z2qi+q5AJnkxlEfjpzpDgsmodaQkxj8lO318C99t39Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh9+fhjKgnETDwJ44A73udtUBvAj8XUl6PshznWkOmrQA7zff8eliGMcAr5Jq/DoqsFKSH+N9DYDJP4HmkzI5V3vXsLYbR/u+kRzeBOnZj4N03E8+h5jTCmpxq3OrAMVqAp1nK6QJNhj/oeYxNIKc3QNEI8InDu+Gj1TNum5xcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQHRUVz0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQHRUVz0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20ce3c118aso501239366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788091682; x=1788696482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3Gsn95qnpdRU3YZCGZvsdQTe2c2T737LYOnz4pViig=;
        b=EQHRUVz0gmOjv2JeljJSN4Ip4fZFeYtMqml+pi8mjjEz7FtuDum0KDLF+37tyKvW1C
         GsCPgV8QLxV+nwGHFVL9Jjj5LQSknAm4qsbRmDurhXQXyRrVWRKWHmDLAEQHqWNbwZeY
         Lad8gze+4iyiJFJ7WpINDuuaBvuz+E2WmioiJ4ohhQ8ttz7xeIW1WBdwf53ZHocmSbiR
         +60iaWc0rCWxW6Ecem/Dz7VubZWkqyLmvTAF1ndRnPFN6Mg3+Gry03vsXYjo6OUCQHJ0
         zmmi96Wpncs9/XSGn6fZvvVwdcgp0iiPSd5Gd7Ub0s+8k/6kkl/V4GtnIWzfeHRWPaXz
         aAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788091682; x=1788696482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3Gsn95qnpdRU3YZCGZvsdQTe2c2T737LYOnz4pViig=;
        b=kN8PrGGgsP425xAZThjeSffPEmjeQF2pjR3zyWnqaSjhVO5kSvsjr9fdc30J44jv5h
         hgJczV2+tUraqUYwUdOIijfrgufPoNDqZrac78dEw29qitJpWsVIcWwjqYttGL7BPSFw
         Cb9Egce+ajX/nDkF6ZccVd+EYS+uMhZnKgSPQrhkJKFjd8NF/Vd58emQuiolb6bIMqHM
         YKhItAJwwtpRaB/SBIsQF6dUmS5IL7y1feeYzNoiKZ7+LqWvj/qUXna2SOcKm83W6xgr
         HYA9234NuPyiL37l+F3NdD90vSJYWseOpX6D7y3Zf2hrlhJTWF5dNxCK1ytFpMFwTxmp
         XakA==
X-Forwarded-Encrypted: i=1; AHgh+RqGgb0FrpGV2u2jz6cysl8Ao2Gvf9cN6uAr4r9I2+2WZLe6+E9j5KdvRz/oVO4+G46mKwT56k83cmdm++Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lQtXGOf16QTbe0KHguZS4cB2vN79rJF9vy1huYvGWFKqe0lIkn
	nQDecP1LtA/SEyxhCA0QHezCmTyVXBYJlIdGmdhauaOt9/wAi6kaPfad
X-Gm-Gg: AR+sD10auqV5aBGEolLYaZxIV7NkfmFeL7kx7expP0fSz5fWoaaitvVL9J8b7gZSXx/
	YWhtLCHlDhUYZod9YHeg7JUGkYq3we04zGVVH2bawp5N/D1fa4TH2U9OUJSyD1QDJ6Fj48EaHJM
	a4ZnciIt7tueOzf+bp65ZeWtj6VLFn+qUcSCoB02cXyf4E1GLavnMk7W9IgBrlPhEsVD/2AU502
	6SnZQ3vaOSoAL81nl1X+WD5w/TaFLPfY/R3aJiuQWOCSTaqCMans8lKO2v/29qT25Q79/fG/A5U
	wFl5hOb+kkY0esLrfje8cmoEqDBhqX6DBtyBpUsf+msGcNLGYGNt4W5K8Ej7NCZ7s4PvnzPpe+7
	pneZd2D0eGMgckI4A2tILQoTT9sqe2NhTlVu+kmH7+WLlYH/fQ+5/H2uHb9TUHkrG3Anil4rDRA
	NV9NCgGJVPxRQOhokWvUl9zxZ2iddTfPF9HJMXEyXP9LKKiXa0iaezpLiFoFtKiTQS8d/uffHW5
	RScW5SAQcEYaAPR5JGNw7Bgh5KPzSU=
X-Received: by 2002:a17:906:eec6:b0:c20:7cb0:f33c with SMTP id a640c23a62f3a-c2596a15f75mr96669666b.16.1788091682244;
        Sun, 30 Aug 2026 05:08:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm304287966b.10.2026.08.30.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:08:01 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 4/6] sparc32: drop unused valid address bitmap
Date: Sun, 30 Aug 2026 14:06:43 +0200
Message-ID: <20260830120742.20950-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830120742.20950-1-linmag7@gmail.com>
References: <20260830120742.20950-1-linmag7@gmail.com>
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

