Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACA54C8FF0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855306; cv=none; b=iZ0Jg0zWvE7WYcEf5FG/UkyqpsjQZbz7gwSIHVbgHujD/BspPXHrkvNYj9OGpU9H9avoRKSp3rV/9Z0ryTad7+kN1Z0Tew6pOTIudjeQQhCYcS+U3iG/GN3F26SRKPe+mlvNI0d6g6XV7xdHtMdMigRsJ/Zz+Hz2JbAwlQ6FJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855306; c=relaxed/simple;
	bh=kfvcDNFLDvpPA7sqXYTXffon/3kHbf04QAWcOZvY6gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7T7pW8dY6z5A3xS4zI2HjEmw5UlRxbq4H6AsrnRTdn6PLYabhLYN+u88SZZwLRJWO+f6iHnvqR1IaERzsanuEpvzc6ajTSk90VwEEAsHfqPIZOu124kH5BZwkvMerzd/S5TVZh2XbPO10t3xKo8PjELXcKy7GiKeI3mwuJzvwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4Os7gYj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4Os7gYj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c169ae1cb26so292339666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787855303; x=1788460103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wG70SWFyuhXCTUL7tySjRNucUOB8Zz4p1m/bUcF7/Y=;
        b=W4Os7gYjFiHKGhjaAR1ueRi0aTApjuofo6gmDP5rUncm5wO2q82eudYvIJWn7c51lx
         FEiBMv/5GM6tUYYtSxZGGnJljyH5fE9cnOY3H+bmerw0RDxSuoAJxirQ+NmdfKbfQvJC
         Mv9xPzoLrJ0bQw3e2a05VQbQxgmRFJfk/GN4WezAf5gOznQQ5qRkqKnIEGWKFGscHmYl
         46l5KvczLnRYajQ1NInsX1+PUPqXLRJXsN4gLEyKdngOy3juu5qxnVO3/M7xbTh/o4Xy
         UMf22l0fl+OJDxsfDgJkzagNIEC2xsXjeXwnEfPvFxVubLiMxueIf0301acgqvRatdOy
         eaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855303; x=1788460103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wG70SWFyuhXCTUL7tySjRNucUOB8Zz4p1m/bUcF7/Y=;
        b=VucmcbkFNeucin4B19p7vNpZCh5L+B5+qfhfAX4yTS3Khh7agBnNZeimnqhHNHr1IN
         ukY6S/JqNK4boevr6Fp381Q8m3qnYLGol7AYfzSbR7s0dMSTHIEW1Jy10iziKu/j1VDL
         UE7hLDU33Aoxk4WitnLvUpLojnqFFa+21gP83kYcFe6w5v5QOHncLHnSPMURH0Igg76c
         Jgd4Y2vPyJMw+fpBCo2dNfWfKun1+EWTvAzr/ulu7JlbOlNVJQqhgGME5gLO5sd/mqGV
         4dZBBgcwegRWr7MV6xE1BU0ZZe24flUDV5eL4YqiVj5qL3h1zWVSAS5w2fsYDnp9Kci4
         kj7g==
X-Forwarded-Encrypted: i=1; AHgh+Roj7f/sXcle+tnY/BX/ZhWhavNRZ/FbRPw4xNWbsvZIJJ4tx8DtEQN5GUU2hcLKIxnuiavefcYinkgxIlE=@vger.kernel.org
X-Gm-Message-State: AFuF++lGnyWIabzNJS2jOuK+6PX1hdbifZHlCVCFeu94HFcL/lecscRv
	gNEfImK//1+FJUD7jpRea8vFmtb/G2DOnZFXpBNhrfolrvGpSBzke4yw
X-Gm-Gg: AR+sD13Fvq0QAlaLMgTQLtYqhK4GWdiKCpVJMsi298IeUpAJtAKNTwq+8wIDMu+ighT
	MYopok0d1b7AZzOettAR/ubjXt03EEmNj3Oi1EOF+rBFG0lj0ESDP/kgVf6EINyZqkXafmXmIYa
	OX2TzuGO9IvrfDdauxHZvEgzHRD2ky/1LIftVjX9y9xmJOtzE2J4dirAnIXJJApgYhbkEceFlTa
	SXjykZyUmw6PUtTEqWVW9dLYmRecdo623ZYz2k3/NFwIR2hVWXItRTc+ELIEP4MFSfRkTL2JD5U
	dBsa26Z3opov+Y9i8vYAcCfoWE+v1cAbA2nfDPPl3TGR9Fqat+/4exl9CwbGeRSHEPHIbBYly93
	fClOy3G3llHnyDBbV1FJMhmAXJIt6dRQWoWe2OuB2inGt55WkuXwvmFV0i8XrIi9pxfuVv6ZX5n
	GuPgpwFgd8x1OTH0GfAh1oA59Czxa1JlqEpOl3Uu0e6dYWSw3JfIL8vfC2vwSs1wkxeG94MM4FL
	nJ32zDv1DGnVl4fzO6bphL7o6GDUzY=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c25360ae6f6mr650715066b.11.1787855303372;
        Thu, 27 Aug 2026 11:28:23 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c254e4e736dsm61288266b.11.2026.08.27.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:28:22 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 5/5] sparc32: drop sp_banks
Date: Thu, 27 Aug 2026 20:24:17 +0200
Message-ID: <20260827182757.6856-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827182757.6856-1-linmag7@gmail.com>
References: <20260827182757.6856-1-linmag7@gmail.com>
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
index 62c41d896421..4fc77ccedcbd 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -39,8 +39,6 @@
 
 static unsigned long *sparc_valid_addr_bitmap;
 
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

