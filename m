Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04F3B42EB
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091690; cv=none; b=G0UnGlleV2QunzltsUFxl9rSRWlEAc6aD9o4ntqI1JStOI93h+9pi0+/TJXJmPLYU9H/JxamZXGaPhS0roSCOeOJrue2wuw1/s2YFmlrZ5PF8CifACOD0ZLtpE9LrmJsz/bgftDLd563fgO3zdSIYrB0xf8TlLhoo0ZLCYTh0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091690; c=relaxed/simple;
	bh=GDJx9sH2sNSxbOwzq4dSkcb9spfCBs4Kvg21wjvIkiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RO6TcguDWqrR1PDk4Uwz96qJMOFgUXYpup9IarCbTdYvoWvW8oqJboDIdNBR7z5cmbTlpdbMRWV/Y6Zs4t6RoGKXb115U4oPOpKEODac3fzJWhQQVsGhpFbPFLy7yLkbWIJIEyVQq9K4o4tRdwd9AmwllDnsfX9UaCtIKNg9Ehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFLPu4uK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFLPu4uK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2533d83e3bso413246866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788091685; x=1788696485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUPNB03Hug6YvdWlUe1liatgYB+MaJgHVJDKZWHDKdE=;
        b=CFLPu4uKCZul6140KnpiCnhhjx+KR35Okf911O+j1ko+ghts3HT12yu+AZE853YteA
         +C32reSHb41OY9MxxdOTecUhHfxYW/TgJYowTyZMAtL2RNFymo2IDZbo2dtwPmIdKlGe
         HA79jEwysrOp1rIvj4UKDn6npfGtUs0ilVSmBUtdh7nJA3jih7Fg6RmaAEAgGfVv/54A
         YoHK8RFsLGALdPDkOFw3J+tUuZ25m24UKtbJmuDqPcfDbBzJkrAt01/x1mGkmw6RC2l0
         HCWyQUpnzJR7sFeQw4h4/j7LKIrjPD9gu4wIALNmAYZa27Bjdlj7trdACO8JGTM+F5DW
         Y5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788091685; x=1788696485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUPNB03Hug6YvdWlUe1liatgYB+MaJgHVJDKZWHDKdE=;
        b=rxWPxwNL0Fs4+3rxr8iSwCDGehR8PQtPbiLu2a4yN5V9Xx7PPMO/qgo5qp+47H4fjN
         7mlyYxlSw4n//cpmFNKwLyCS7cddafy6pjbPcDjJgZOlApM9WttRp/prfzbzth4Lo4iN
         TrITQObAjNQPeOCBvjAbv4ATBT2kczfkQZQXGmYU72mPslUxAzDTGPbpoI7HRfim50BJ
         ROOOEdFIO/TMPYI0mIEBjb12YKiSXrHquEjwoc6/wnEauV5BGiE41wts1xT94ZDVsqef
         NJKFh4rK/upXTstISUs0dhhQD96hLB4fnf9zEK+ey60F0fHW3V3tgXGKdWsfWyOmYRPx
         w76Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrh8y4TtnhxUstmbILzXfXbVv0JHiekiXdiDRSK5gSf8KI6TyStbD3hrZCgSK/JdlBrgT2A/9dfm/fVufE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQz4Y+K/EIA/l1NUCuVHBBZSjlv7OKwf1LOMjyM5slp8h7113R
	+oKdVdJUvCkp75Cds95c7AuVh33svGO0MllQpAIVPmooqr32kWLP+zkt
X-Gm-Gg: AR+sD13z9qSDBythIVnBKFqluy49t+WR3kl0eS4+m0Zxy3V3O8S+WHnXLtfNdzCKzyy
	oHJegITULqtNqWDWUMRQA4d9jCGwh1PAnBnLj4v/lJhMyKZn3IdfFGinElVn7to3AECvTTYQ+pH
	QS0JrA6/vnRCXTEk3XU2eNhq60QEyOjLn/6FxPkX3UgHYqLI4QpaY37pecPB5fMGVd2WDaRaVwh
	QBWb66k2ISCfkLsY8sKXChe2YwdiodYwSyh5OnTv8YdM9p+kACqVfmh+pFqv6nuGTENcIf7COQx
	OM1hOZr79egYfKt/oepRqluDORd+sB73Oc6FYXneAzaD42GESDRwAry/cA8bOFdMbSitk49b7HH
	2Nd8j8Z4Ti7S0/FCeA0oHERx527lYgxNeem4W3Am7C/N3dKMNSwUIE3nCOHHe2gDGiB76smwbD3
	ToT873nERCGTpuNGT5XAlmI29VB5xZDZAuYSBvAM5ozlPU3JeE3NWlrywKI1Tp26wOa7PGNyDci
	bzPDF8L0gJaTajkbL7kLnhF4AxYRX0=
X-Received: by 2002:a17:907:9810:b0:c25:5114:c832 with SMTP id a640c23a62f3a-c2556bd290bmr1242333066b.3.1788091684609;
        Sun, 30 Aug 2026 05:08:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm304287966b.10.2026.08.30.05.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:08:04 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 6/6] sparc32: drop sp_banks
Date: Sun, 30 Aug 2026 14:06:45 +0200
Message-ID: <20260830120742.20950-7-linmag7@gmail.com>
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

All memory-map consumers now use memblock. Stop duplicating the PROM map
in sp_banks and remove the array, its type, and its fixed bank limit.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/include/asm/page_32.h | 16 -----------
 arch/sparc/mm/init_32.c          |  2 --
 arch/sparc/prom/memory.c         | 48 ++++----------------------------
 3 files changed, 6 insertions(+), 60 deletions(-)

diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
index c1bccbedf567..5daa5fd8eaa5 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -26,22 +26,6 @@
 		sparc_flush_page_to_ram(page);	\
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

