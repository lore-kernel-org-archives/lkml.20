Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781D3EC2D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394914; cv=none; b=JD1ObEm8i8iMnBk6Cy4UCQEpR8Gn7CevXRrXKHvkOxB9P3h8HdcHvlKrkXNbuz4EJm7U0oWZRQsnQQn4pEMJqsJ+qaqW/M7xgLa4OxMa/hjy5ckUMestH1BEiE0eD5S1J0dYIK30O3/pwze7aa5CwRhlkVriAjN/2D2aI/HOb2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394914; c=relaxed/simple;
	bh=/dsZPKgs3LiEVy3t0FVgwAqo7s2V/HbIC3nNFSOG314=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AN5QbVTAhkHrLavSRQUJZ5f2lkn2KpNWg7X/zjJpbZ4Y/OAHVHWU2iNebBEwZ2ZG6vca9JEbr4y7zaCa1mY8iDVYmJBPdoI24VLSL7attWVKRk4MFiwwwrgBxamq146f3k6BSsXOQ0roUfJi+MdSMjA2p1y9d7abp43pSSspoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+QnFvTf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+QnFvTf"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so7398312a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394906; x=1791999706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMyYSrhfIYHYqjp8mHUnXor+qxDuOXc+/5yPGSD7oKw=;
        b=M+QnFvTf6GT2IMpxUj2uG0YBnpBTbpdmqfQ6Svld8LmGA1pQalZiloNvUxRpeNfm5Z
         Q2TPC3k4XRNwkxTJCQtxTUStzfqINPaNSKmTWMmwmQpUXG2+i0tz4QZ++IjEiru1xA+V
         yGqNBcG0gZlEbQfaEoMVHX5/sFO0X532GC0l7tpruexiimpNuLk0KM6f2eqXFg9RtO7v
         kJzEmcGSAGWeYKWSbHWzEfTUsfjs2YHnYDXgTvFmrjmWXoNKgsJvQmnxnuJ414FUdUUs
         J0j3TUv+Q5hQzva5xpQj2fftrVFKwsGcEqbsmUwU+FhdGsNNGFn70wX4JLcRKfw7w3Uv
         UDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394906; x=1791999706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMyYSrhfIYHYqjp8mHUnXor+qxDuOXc+/5yPGSD7oKw=;
        b=nS+ztPZRw5QFzZVIpyrK+mj9jgUJHYOGM96EtZwD1EWYGktBofj4+jL3k3ol583JJX
         sjmHRZ/NjJrIa6Gq49XJyHCkNhv6a743XgiWtE7zE85t4+JONRG35JN4OnT84sFKvZI7
         QFTgzBSaQuxL/57glbih+D5Me0dtBRJZ9l/hqDMPWYz3GfAmhFzY4q8OhhJH2ofE1z7+
         MSHGEM/mnLkj5ieaqxEsg9WBQ9TK5HNvL4H2odH88Ts4KYWXzHAVTaNXKkhLH5jo5y2M
         2KOiHI/ZcQsQo3bP7j8KysewT/qYdujs+JRxrhwJY8dtFxTNiIKMZX6SNoqymkpQNDfe
         JTZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRpvpCKmO834KB1c1QtSf8dkTpjO1MBiu+nf2vUd5OmB+k4nbK7izCL5/0tQM8e7JyfN88Z+SYGQcEwpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlhquT+GWIWRaiozhSaul2pvuZ2JqI34QRcibLDUfH/Hg83seG
	ws9Gaw6QUfbWNDUR3yla/MA504PSeiYK6ls1pr0MJDpFg/fyIzTrunGQ
X-Gm-Gg: AYBFou3hbXpSUibmIrR3Qa64ln5Bz9eUfN825M7DAIDSDpuMJUp55wN6BW8fn9vRqw9
	EapgQ+bsJScSMTt/0R/zSnxRNxno0lfT0Ee5Gk0vfyGxt0jYy/BawDzWcgoQCz2WpyUFzNtmM2l
	cTg6QZdJ0TKHdjHF6d1OUEcms53/8cQ3ho4MXuQtVOepXlhWbmI1FvrY9b+Di5l/8BKTj0bp/lM
	VV9UgssvpXFRDCvpKdJQazSzHCtpHdeGBEpyRF5119K0hUJzNwg6cPu3e8YwPNid6dKgcdcbvEr
	rNxCltsETsg/fpWpsakxYFrrR8a5m8roi4Q5Tx2sskoXdHjLJqzcPtlP1AWE/Dujh4A+UERUjmB
	C1badwR7WrcdRrjezF/V1DHgzSeXdzYEVynL3SxviF60LLR7ZoItzyNeSiiygGxHFAXVXFPBU7R
	sZzIc0bXUa9xe1Nu0Wwt7Z8MM4A+THe9LxXhPNpqb1hImzJdQY4rD/1CzlwWAhh1U3Tax5G3wen
	GGhs4w/+ARmLHnjpJk4F17a0fgqRE+KVqqehnNQ
X-Received: by 2002:a05:6402:52d6:b0:6aa:f129:b193 with SMTP id 4fb4d7f45d1cf-6aff458de1emr2912087a12.22.1791394906156;
        Wed, 07 Oct 2026 10:41:46 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b009e80cd8sm356802a12.8.2026.10.07.10.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:41:45 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v5 4/6] sparc32: drop unused valid address bitmap
Date: Wed,  7 Oct 2026 19:41:13 +0200
Message-ID: <20261007174128.959307-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007174128.959307-1-linmag7@gmail.com>
References: <20261007174128.959307-1-linmag7@gmail.com>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
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

