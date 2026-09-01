Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9030459AC4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299213; cv=none; b=Z5bA1lp4ovh/iB+b22+FLlCpwIb5OZukcHFYp3x+FlFTjfX5pW+TsMwsK+R1RlhMtkgP+e0HNowHZvhcz1Fh0fGCzjqH00+lXTR1/dtew5dZVGSbWlGtmNI+oUQsa5yWyvDWhlvRYKS2reKzrReRhpzBrBXoa6pCRw0G7alIRVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299213; c=relaxed/simple;
	bh=GDJx9sH2sNSxbOwzq4dSkcb9spfCBs4Kvg21wjvIkiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6FkDOYl8gBDeh/hihjfmg2ajvYTZwLaBcsU46vBxIU05b/9cBWOQsRVb0Pa2pt9nM6CuHgqDkv6PuBYO/AsFOAokD2Vkv/Ts1ZlH8+2fdv5IB72ur1TWe/f8EdxPS2GKoukgVp3arFYX9P37ua1LUb81PdV+lePWuH5j3zxTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCcs465C; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCcs465C"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250f28f1cdso50292666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788299204; x=1788904004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUPNB03Hug6YvdWlUe1liatgYB+MaJgHVJDKZWHDKdE=;
        b=ZCcs465CWg0D90E4HsDKDpZQXFZye8tCUZOaH8P0vA/xC9XHetwfDDX0cbnsCQY97M
         hGqOFb5im7s/A/VAgJiysulu2osF1KL6k5MmVYQw+jW+egYSAUeBgOIzEtOvUbd1t1iH
         l8GjgMlW3T2ok6MFPaMMWR3tt1nALRT1fFawEl/wMAq5cL8c7Z3eqtj6S4ib1dHJHU4m
         U1TtOlU9efqubMzCLrHjClaZoF7iTeANm0ppmnTkzcdrkWlnsFH5+XpHD78wphqROZiK
         BTgNsiZJ67suVOykDZcfjKEJDcGumWD5xyheaVLIGhV9yjW1JoHa4PMJsrPFGz7RQa54
         soiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299204; x=1788904004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUPNB03Hug6YvdWlUe1liatgYB+MaJgHVJDKZWHDKdE=;
        b=WbtTplizupFhvFywlSeNd/CoEU8efaLoGmLRIxOeo5326j3oJG6lJN/xQ3sgI4qBtL
         cjfk5mCweEP44DxEOn5DyyFW++C+WJ3h3Z1fY5hsHvWMn9Uu+fztl84d4vK2wkVT1Jsx
         9CHKIxmGKw56sReLf+cEnp5GGxgBG2aG11rpKRl0HlAujnExctsjDGAfi4RTT478Yptb
         SR2q3AWUCmUFlgvVd0a5FdStaXRBAOFr/BGwHmIUvs53KtwyPt8HHy1opTHyl+6Ctlvs
         VwO3tuzBxmbB0kQ6twGoejE7yv1Y9q3KYj0YTAERYXCs7GT8hGQCYUCS+BEjs+a48Iog
         MF+A==
X-Forwarded-Encrypted: i=1; AHgh+RqMj5ANKBkEOi0dGWtUKSyDxh7qrTKJWgQVqiv+zTOC34eHBhGzvGQNoeFt+u5QaoYsj66+RcUA5O4DlOY=@vger.kernel.org
X-Gm-Message-State: AFuF++mOCN/HuUfbsUmxQr0wxauowSSOPGhgoGv77UMoGw0c25VAmWjd
	sy8HIHNdGMBHy01IWUT0Q7rSkEmWXRylWNRRQNV/M5Bp14H8xp9hZEcs
X-Gm-Gg: AR+sD13sJeGo4CDZP8MRJgZ/0T1oAmAFY7apV9OdysdvDE4AP+4WHvBqgGAAmwo97za
	7qqiU+MeBtpP0vXD7JGRenni6dnP1LuDFVv6oO3XsWpZXHnNVj1QPy1kdl8yNWfRrCF9+NRboZV
	ln/Ub8eUvRD1j70+WhYDsuK2J2HAQHJ+AEL1salbkGiofSo9qsKwDWy8blk1NeWDhN7FOiEGwcC
	lYok9k1ILf8eUowb37d+Paw0V7hYceBWyapaLiqCcJXeZwgoYc4WJcpq+1XVQroTiXmCbZ9HWZg
	MAjK12q5eCdstnneKuf4qJSeArLgACC0rHUcFFoQm3eZ60uLu6Pfxqv6D2th+VXM9hkAlq6ql0W
	twnqpTLMw350Ld63rl45uZLflNT9nhaCaJv8yqEpfUmVtm8PDnpTqxnEt/TNgOrsrL3Lsbjcreu
	C9YCEyQrta1vBwhmm4LCY11efrwkYJeN5DB2KBY0tXxZs04kyqu1HyORzY2JiUcvPHOV6aUiy76
	LJtqCZqyuYnQW0HNeZrW1cStsQ4ZI8z
X-Received: by 2002:a17:907:d89:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c25d547b88amr14288366b.7.1788299203837;
        Tue, 01 Sep 2026 14:46:43 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm27500866b.4.2026.09.01.14.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:46:43 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 6/6] sparc32: drop sp_banks
Date: Tue,  1 Sep 2026 23:45:50 +0200
Message-ID: <20260901214611.60560-7-linmag7@gmail.com>
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

