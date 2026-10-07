Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1794657E0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394913; cv=none; b=JEHN0lqxRxPKU2zxN7aGhd+I4CuxT7qg8hbhI2IXphYkS8fFS+XR2dfTcjAmVPUKLSywRkQVH893VYkOs+nUfIjvSwfbE9Rru6j36+trIM2+DsNLYHDOH4NxNjnkWg7iju+fUtxoo5RVmgrV2grWSoos5rspsqgf94Bt/FOJY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394913; c=relaxed/simple;
	bh=1531Yq/nVppQGrlAquxN2x1KLWXV3EHMaR/ahEcKkNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKjabbVcYbzgjNj00KQGF9UkOJtGQmJbv5uEjVgOxg68SpzURm4ZkM/Ep3KnQ9CosZG+UeaBg6j3tClFPefE5ZOrXAaTiMVnZYvZdTdBB3muCVir0kxnX0WB+CABLVvkLKz6StNDpzz6hXM8EIQkroqk9V1m4PPGGS2CcNhx9gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIz2z4hx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIz2z4hx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aa5d092211so7129261a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394908; x=1791999708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCuCzlksNfjrgkZXx3iznj1+OuURI9PaCP0uSZRfzi0=;
        b=KIz2z4hxLhENwpslc46/LnouryEJ73NwoEnn70UcAymNcriv3JiJCR2q5I/Yj+es3S
         X4RxAh7S0a+/unUZZ/yuj1Ny914FHVpG0F+yNX3QAbE2Yydck9Uu5PKoAplKQS4x1N5N
         ZMJDpJ5rV7DWrSJS83fcl0UuWNMENbUuue2MTtL00i2kq983CknXGSNqpA9U4/l008o1
         p987ZXt4FmJp4kzIoqKFv3L8cEW3T8w7hYFmW2QhTTN13Gw79hDKHldWT4T++UxDs2S1
         NlPTB1UzKOdwECixTlZwMR/PDN5yODwTCbstQo2E4tdcApw2S4nwrtDFY9JEyauAYrMK
         30EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394908; x=1791999708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCuCzlksNfjrgkZXx3iznj1+OuURI9PaCP0uSZRfzi0=;
        b=GR7ijXpliOio17GJgOVOxv+PE5333yxrDyV0XBMioaJPvLzZXpwxxZU9Cf1K21goPh
         v++RmbuhkmPgGrT3Ymx9RPribUW8xzhTURyRtPO81KQR5yXeYQhopu71vg2Vpa5Gxfym
         sXMiT8zVgSJQeMqskAOL6F7Nr108jagDjA+OOO6IPD+Ssran9OOvUKz1Ptm0MyaMiKje
         67WnEQ1RFE2aOfEoIhIFD0rbZjpz2P40q7PKojz203Xk98gH6lN3Vijd00QRxChiFXkK
         TJToq6drTivh3HMW/kTpIC8nm/VQ7CpChkJ6W/l2yaDnaR6W52yIj51uQdTjRYiKDzuo
         GTUg==
X-Forwarded-Encrypted: i=1; AKwUvBwgKP2kOY/GKfs+DFb4IGdCLDRl/RkCxan6h4N0agwfNQqSOetjGvtNHOeCKHDkupPjiYua6Zl2EhQRmfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ05EO64KI/nF/Dcn6pWRkApUnvMeF68i9yQZymmzDckQ3XM6Eq
	zcweoBasaQz7833aWajfOTyTLhFZUPDYJo7YN9xBb4D31yI/YAmHszg3
X-Gm-Gg: AYBFou1pOqvfFysAjdh4irAvpeXEbgT8UvtbiQozhQf+mzGk0+BT7nVjld15UAFU6hP
	amiLnCAAOyiXEGhniv48ybcLCiV2Ak+sGOVK2QZfzsrwMNSLvHXcnUbTbHCmYgkNgaemmG/wJ+K
	9z7IdcFHdP5ZkB7R5rDM6mDzE3HJJycgk5ZYCps6NfX5L00Ktv33OzuvM6/PBvqBvG88G7dQCAl
	BvFJ0H4Fx7UdNmQZrizEfF2vSFSWM10MQnN88PzYDf7r/b63qtexJHcP6MCog+wvttlOO1fLhN7
	pynhJud+LXiR8GQi9zVZS6I+57TaBjviJ1FJX7OO0Dep7BVQch+QiwPk1NAoLukAY0NozAgqKq5
	su5SU2B/0YIx0Lw3wSk6WKbal12a8qHD1ksDNf0e2sYI7mtSMeS3olQK/VC9gNFlwQ+2lAYjyZd
	ZWZzCEI5AljPqtsXboQw/C5/DJUzXZG+CGaQ9BcqVn6kx/sce4GU8gxHNNcMbWy0Tfdy8zeaLYD
	FbwnuoJsbLGf05U/564wezgYImDBLMKWRVM62Mw0Q==
X-Received: by 2002:a05:6402:21d4:b0:6ac:b013:8648 with SMTP id 4fb4d7f45d1cf-6aff47a8104mr2545139a12.35.1791394908085;
        Wed, 07 Oct 2026 10:41:48 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b009e80cd8sm356802a12.8.2026.10.07.10.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:41:47 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v5 6/6] sparc32: drop sp_banks
Date: Wed,  7 Oct 2026 19:41:15 +0200
Message-ID: <20261007174128.959307-7-linmag7@gmail.com>
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

All memory-map consumers now use memblock. Stop duplicating the PROM map
in sp_banks and remove the array, its type, and its fixed bank limit.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/page_32.h | 16 -----------
 arch/sparc/mm/init_32.c          |  2 --
 arch/sparc/prom/memory.c         | 48 ++++----------------------------
 3 files changed, 6 insertions(+), 60 deletions(-)

diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
index 9f0b54f70908..7429291fb118 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -28,22 +28,6 @@
 		(void)(vaddr);			\
 	} while (0)
 
-/* The following structure is used to hold the physical
- * memory configuration of the machine.  This is filled in
- * prom_meminit() and is later used by mem_init() to set up
- * mem_map[].  We statically allocate SPARC_PHYS_BANKS+1 of
- * these structs, this is arbitrary.  The entry after the
- * last valid one has num_bytes==0.
- */
-struct sparc_phys_banks {
-  unsigned long base_addr;
-  unsigned long num_bytes;
-};
-
-#define SPARC_PHYS_BANKS 32
-
-extern struct sparc_phys_banks sp_banks[SPARC_PHYS_BANKS+1];
-
 /* passing structs on the Sparc slow us down tremendously... */
 
 /* #define STRICT_MM_TYPECHECKS */
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index ac4462f1cf76..2f693b70dbd8 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -35,8 +35,6 @@
 
 #include "mm_32.h"
 
-struct sparc_phys_banks sp_banks[SPARC_PHYS_BANKS+1];
-
 /* Initial ramdisk setup */
 extern unsigned int sparc_ramdisk_image;
 extern unsigned int sparc_ramdisk_size;
diff --git a/arch/sparc/prom/memory.c b/arch/sparc/prom/memory.c
index 59962bc0bc82..3f65bde2bb89 100644
--- a/arch/sparc/prom/memory.c
+++ b/arch/sparc/prom/memory.c
@@ -8,30 +8,21 @@
 
 #include <linux/kernel.h>
 #include <linux/memblock.h>
-#include <linux/sort.h>
 #include <linux/init.h>
 
 #include <asm/openprom.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
 
-static int __init prom_meminit_v0(void)
+static void __init prom_meminit_v0(void)
 {
 	struct linux_mlist_v0 *p;
-	int index;
 
-	index = 0;
-	for (p = *(romvec->pv_v0mem.v0_available); p; p = p->theres_more) {
-		sp_banks[index].base_addr = (unsigned long) p->start_adr;
-		sp_banks[index].num_bytes = p->num_bytes;
+	for (p = *(romvec->pv_v0mem.v0_available); p; p = p->theres_more)
 		memblock_add(p->start_adr, p->num_bytes & PAGE_MASK);
-		index++;
-	}
-
-	return index;
 }
 
-static int __init prom_meminit_v2(void)
+static void __init prom_meminit_v2(void)
 {
 	struct linux_prom_registers reg[64];
 	phandle node;
@@ -41,51 +32,24 @@ static int __init prom_meminit_v2(void)
 	size = prom_getproperty(node, "available", (char *) reg, sizeof(reg));
 	num_ents = size / sizeof(struct linux_prom_registers);
 
-	for (i = 0; i < num_ents; i++) {
-		sp_banks[i].base_addr = reg[i].phys_addr;
-		sp_banks[i].num_bytes = reg[i].reg_size;
+	for (i = 0; i < num_ents; i++)
 		memblock_add(reg[i].phys_addr, reg[i].reg_size & PAGE_MASK);
-	}
-
-	return num_ents;
-}
-
-static int sp_banks_cmp(const void *a, const void *b)
-{
-	const struct sparc_phys_banks *x = a, *y = b;
-
-	if (x->base_addr > y->base_addr)
-		return 1;
-	if (x->base_addr < y->base_addr)
-		return -1;
-	return 0;
 }
 
 /* Initialize the memory lists based upon the prom version. */
 void __init prom_meminit(void)
 {
-	int i, num_ents = 0;
-
 	switch (prom_vers) {
 	case PROM_V0:
-		num_ents = prom_meminit_v0();
+		prom_meminit_v0();
 		break;
 
 	case PROM_V2:
 	case PROM_V3:
-		num_ents = prom_meminit_v2();
+		prom_meminit_v2();
 		break;
 
 	default:
 		break;
 	}
-	sort(sp_banks, num_ents, sizeof(struct sparc_phys_banks),
-	     sp_banks_cmp, NULL);
-
-	/* Sentinel.  */
-	sp_banks[num_ents].base_addr = 0xdeadbeef;
-	sp_banks[num_ents].num_bytes = 0;
-
-	for (i = 0; i < num_ents; i++)
-		sp_banks[i].num_bytes &= PAGE_MASK;
 }
-- 
2.43.0

