Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A573C5DBA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545433; cv=none; b=dibOvNLJY2IbqEcY+KWDziTQuL0f8zHmSq/qxgPsvVBOFPp6h8czDzhmAdEhpuE/ByG6X/z+2h2kRuWF8Abh6d/ZV7OQnAfWtqVCKow1qY3UW6jp6mJsEmnW9mzw188iSYvfw/LzXJWYeMs07qqxaF6jU6/yYD225By1tU1Su/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545433; c=relaxed/simple;
	bh=/dsZPKgs3LiEVy3t0FVgwAqo7s2V/HbIC3nNFSOG314=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Poiqk5ZdDGTNv/AXJsBiKPYw8ntR7VDyghYJHElCRXYDNNCAOEkHsDBJibXdDd9yW11U9Eyt4wNGR9O8IfHwU6Kicp3oxGLyeelY8psgJJ0MIX6nM59lxssbMDPoRJfTHQ5kBppbprKJ0lxxZHg65ujD4Pyx8mfoVhf4/vRSrx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnGJ07dH; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnGJ07dH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so341431366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790545429; x=1791150229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMyYSrhfIYHYqjp8mHUnXor+qxDuOXc+/5yPGSD7oKw=;
        b=FnGJ07dHLWVCYz2tz2pJVe6fVowlwpQxQZ3dB7bSC8s/2oLOrcA/Xclk4YvyfPvCCM
         Ih6bW43R0cvWJNhSTYUbhyPiyZnHwjKXT+drrzJ6DYWinxeZ+ND7ZBwZ496e37jAXYO+
         PsLlfLbXue8ai3SwJFWb+aQFsDX6rwIFUdP0UMkWGSCeT6Y3vDPScrvUhJexLgwXfvxx
         13ekHq6uBzlELLoRJ9fwuYJJm95gg4ErEyAFqUiV4xixAaQa/kIhCXYpgOHYmq9q1yx0
         kdiBBkxODJUVtzQzouayfLgy5U0NwnfEa1Y33KILBu5dMipSTRFGR5EbL92sxZaBeh0a
         AiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790545429; x=1791150229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMyYSrhfIYHYqjp8mHUnXor+qxDuOXc+/5yPGSD7oKw=;
        b=sfkU7bWyjNgpnRrXfH02wmelc0cf6+BowB8zAnHe/4xspPnuS9MS4tbexa2kqeHjCd
         l1Q2MIY2NpDf6MgGeFc2PpxPwxqnBLChf2pQF98uKdq96YAbxSf9XWuQJA+XhDRis7iT
         YG+tOMKAX01kY2Z3dGfGmnsE/80SQRo5wTQnp+oYssr7D95PbbgJRQYfEnvyIuH2PXtI
         4Xzrnn4UbO3VxX7StfAYe+6Q7mpyg3pJwEG/1sGgvnX+4Eq2sk3lj73NwTj+BPPQnGdN
         vfC29TMigKLEMNT+PxhDPmca68oXDl55H75Y+lYjQ1e+R+luyKUhH5gfDwSN+zIPFRB7
         fRNw==
X-Forwarded-Encrypted: i=1; AKwUvBwhpx62HRsqi24zGo0nf6dYyeXcyZ1+LXBzCnUuItSVVfI6+RaZkRsYq5gHAjJ+jIlAajnrGNBcR40ZVVE=@vger.kernel.org
X-Gm-Message-State: AFuF++n8qjuh87oy0sszViffj17bvZbihocN8wL6b2K2+THc926avP7e
	LepWA44wuooFyO6LH/YplUmy4x87gnEmBOkCCTXVJKKBI0ORByRLxj+Z
X-Gm-Gg: AYBFou1nAtoxefuKCjLqMMw4OMbYir6mWAPD/lfU685fT6q4unugZAsGarmss1zM7zY
	1ZCjD5O2/TAisZ07x3HIem73Xmz4n35+/0Fkua+dE8PqBlTVQlu7cB6HdywosCI+69acqWilO0F
	smixl6FAP2atyU2fJsvBw54yK/Te+0jPUBZ/LPm5ZmfnrMXI5JKt2njEmFne4P6jYP8hlkmKx2z
	awQYit63w6XxWLDAQH5Gyqu4U7mlu52gHgF8rxqa58dTv2FDbkAMnB8nQOKg8Yn8CsKG0xyQ+pf
	H8El9RIHNJJsDWGVRpPOsf44bScqkDW+o7fwy5Sz2XQqlu4LIZy50m9R8vvx0ftV4e8k9ryaAJA
	A2pEsjuZLCSJcFLOnBsp9GgRZ5oNFH6rsGxZThnIRCQXD3YLtAxjXYnoSOVRoVRjrsqR83ISrgK
	s9sKKJ8dBSV7RkuwJ/WBZXUwVFq/5GxzYuFSBXIj/UOw3P+81nncnweY06mvR1YobiEm1boyiYT
	P2ZEtk1ZZ+3R9seJc/SKRh9UD3gUTSrLzcnAvmsZw==
X-Received: by 2002:a17:907:1b03:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c2ae97cb3b9mr671379566b.11.1790545429116;
        Sun, 27 Sep 2026 14:43:49 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm376091866b.33.2026.09.27.14.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:43:48 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v4 4/6] sparc32: drop unused valid address bitmap
Date: Sun, 27 Sep 2026 23:43:15 +0200
Message-ID: <20260927214334.886582-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927214334.886582-1-linmag7@gmail.com>
References: <20260927214334.886582-1-linmag7@gmail.com>
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

