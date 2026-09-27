Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5143C73E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545431; cv=none; b=pGDqzKTZFS1SRLzGzqcdNUq/p8d0i8vhxGluR0SKFHkIaY7hJHrgP/4MqFZDpglanvgltK7igD0Cq7xOde99K5lgnC2trm0JcooYPIGFdcSDPD/+YXJVez3Ug01NWEO2FnGneihaMvE/8m1nsFc8qcn0Ji3+VVExYDx3slhJEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545431; c=relaxed/simple;
	bh=W/J+iGtW2cqgl8E7D4V33DEgbjzhDkQun/Hg3T6koUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7r+NR6gbNwTyiC7ise70jZI5jBgM2W77S3vTJqtcyqz6RgN2cod8XmE+iiV/u+5gXFhW7/b/POGgisJL/rNvA8UKj69FZP3UGIKhgjYbH2x/dNk6c1Q29kqBuVHcB4XGgwhUYL2JfI6v0XGZYVqZ73WatVYYlopl8LPpxjWtiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSaruF45; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSaruF45"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so153126866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790545428; x=1791150228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMvMI0qdiExZzcrJJ7xCboaNG2SDA0ACb0R/plvY+Ac=;
        b=HSaruF45GNcKGL+Gozr8wITY5cACgJq7E+VQV7TnCqiYu2Erie3RhnPqvIcHTBK8ml
         Ozq3hq71qrQpQfIKSPTwf78BvnMrhBRjw8+Dx0eyRfV3pb2yytKOSnVPMOklepkDhKFH
         pC7te2/IzCaSxoPppEBVDiaH7asWA11mYNJv9akCASZKdWeNMmVMGqk8BQ/9iQKhIqGy
         GWNoHd+KUaAD29873r6bfau24RfRbEOAv4txJOwaglc+sFMWDp89BM5tFwKjWvqSEB33
         s6w8mpBjRfxKHQalVEYi6K73++UCpFLmKKej8FJHn+3xdOBxmcYDanCDdCn0+eKEp03w
         zuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790545428; x=1791150228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMvMI0qdiExZzcrJJ7xCboaNG2SDA0ACb0R/plvY+Ac=;
        b=ZsDr9cDTs7P10cDmRR1v6ASxwDydgjchN3dmexKyfSn4Jr8s/8bjLJKgUv/4P+GZ8M
         J7xi/kwgdmgQj3duDO0IkdeSx44pDv4gGDy1z4rsDM+QWfOhOjw8soYOVjA4stSZshPK
         4X5nhlnxpgIPx/yyJFHFRf73pXTlwfeL70rhnDHXWq9QmoBP93t0+kc2r5ZLzZHIAkYe
         GREDQ4nnvZzSxpbp9TuPxrZlON6QV+KoXF4m01zxEOv1G56x2g43QMxX4dTwkMGxVI0l
         y5/sXtjmvm+5lQGdaZITDZUpASr9CsTQncrJIlqbWBDYH3Ej5AAnemipZfUo/cuGDniI
         edkg==
X-Forwarded-Encrypted: i=1; AKwUvBzXjON3EYTEd2J9hDxluHsOMD4APM3oKXQYiIOsg+l4fKHdFs4QOVVcVfVvWNP+4qENRQ6mbf72nXWpU8E=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ4/vaaExcnplQK7eT7R5tKMpEBwg9RtRCPvjrBUCS8eEx+XVb
	h8xMotQoZlDdgLGWc05BhbCp5LT8d2vd2d2kWCOGfA4Ot8iDuEakiaV7bny/5g==
X-Gm-Gg: AYBFou3vV9VwBlglBXdFGwkzjfWk8uI5iGLTtfiYhpqVFGmSed3uU4HD4nPCWrorUyx
	E8M1Nm/0saahWiQBU4PoF9hgRfZErkVdp92CCLFdbEE8D2o36OFKSInywnKdTqGYAtRz/4y667M
	qTyMw2HPsAUfYRaq6zgHAHBvROPl5OplLuLOyBLuykSieZKxszYZhDBzNylq3ZaDVpA4PPGCJlk
	lHMqxOer2EnCO1MoqpDVa5XAS3XUQ0GZMlgKyF2rLyD6EP5zQbNU/Vp+iWvNAAjeGRKISVuWIKA
	WQzIXazKufyOKAQW1vDdeqL8g1Oj+5N5kBbVnq2xARM/OIhd38WWkIzPux0gSFxSE2IqLTYLwqP
	/RH+8jm9DFEQpUV+TN+sDGsLQ6otgfyXe8Me3C8M4Vr44t/m09jCM60rpbvfqoJeBsrZeQFkVqS
	4Ro06Fh5hfUnx2ZQfSkEnb/AVMLnPsZEzRvGC3CddBKpuC2a6rtHQH9RT6jGkHBH7+NbozD9M9x
	4xF3K/2nYFCK8M/pRw7opYLmMddDwT/QKp/3Bvc
X-Received: by 2002:a17:907:7211:b0:c26:25e6:5c73 with SMTP id a640c23a62f3a-c2ac21f983bmr984152266b.2.1790545427944;
        Sun, 27 Sep 2026 14:43:47 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm376091866b.33.2026.09.27.14.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:43:47 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v4 3/6] sparc32: populate memblock from the PROM memory map
Date: Sun, 27 Sep 2026 23:43:14 +0200
Message-ID: <20260927214334.886582-4-linmag7@gmail.com>
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

Add each available PROM memory range to memblock as it is discovered.
Keep populating sp_banks temporarily so the remaining users continue to
work while they are converted in the following patches.

Since the complete PROM map is now present before bootmem_init(), enforce
the mem= limit after the legacy bank processing. Adding a smaller
overlapping range would otherwise leave memory beyond the requested limit
in memblock during this intermediate commit.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_32.c  | 3 +++
 arch/sparc/prom/memory.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index e0e66f91ceeb..75050dfbc2ea 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -165,6 +165,9 @@ unsigned long __init bootmem_init(unsigned long *pages_avail)
 		memblock_add(sp_banks[i].base_addr, sp_banks[i].num_bytes);
 	}
 
+	if (cmdline_memory_size)
+		memblock_enforce_memory_limit(cmdline_memory_size);
+
 	/* Start with page aligned address of last symbol in kernel
 	 * image.
 	 */
diff --git a/arch/sparc/prom/memory.c b/arch/sparc/prom/memory.c
index 269d6ab5ef5e..59962bc0bc82 100644
--- a/arch/sparc/prom/memory.c
+++ b/arch/sparc/prom/memory.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/sort.h>
 #include <linux/init.h>
 
@@ -23,6 +24,7 @@ static int __init prom_meminit_v0(void)
 	for (p = *(romvec->pv_v0mem.v0_available); p; p = p->theres_more) {
 		sp_banks[index].base_addr = (unsigned long) p->start_adr;
 		sp_banks[index].num_bytes = p->num_bytes;
+		memblock_add(p->start_adr, p->num_bytes & PAGE_MASK);
 		index++;
 	}
 
@@ -42,6 +44,7 @@ static int __init prom_meminit_v2(void)
 	for (i = 0; i < num_ents; i++) {
 		sp_banks[i].base_addr = reg[i].phys_addr;
 		sp_banks[i].num_bytes = reg[i].reg_size;
+		memblock_add(reg[i].phys_addr, reg[i].reg_size & PAGE_MASK);
 	}
 
 	return num_ents;
-- 
2.43.0

