Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8403EFFD7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394911; cv=none; b=mdDr7u46l8VRYn+kvx8+YX5lyL8Ps8+kfEhvyP2BDVlA9X91w08r6cW+vbApPmb9ikgxtJ8CBofHKQ3HeANKWt10cvs83t1i15xXscnlHAxZ1WzTjMbcwxZX/14cUuUjWMnFuLW0wP4zBfwof2DJwvgHEftc5O93ImZ28ATNi64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394911; c=relaxed/simple;
	bh=W/J+iGtW2cqgl8E7D4V33DEgbjzhDkQun/Hg3T6koUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFZt4IzqwiOjMXhK6mYZ/Q6P28HcWRNNmC9mPCea5wibZo4t7KaAIz9pRqUC1T4fAshtaq2fwn5VAUMDnSv2ZC8DVNPUF3ZN3MkJYRrwfhZOIzFtGCKP8CbfspTr10TZr1ilPWQc/hB78TIeR0KsLBTlLS3CAfOl5aNN3nwVYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAcnRvfr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAcnRvfr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so3304043a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394905; x=1791999705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMvMI0qdiExZzcrJJ7xCboaNG2SDA0ACb0R/plvY+Ac=;
        b=XAcnRvfrpRFXoHSnNzTDmijGkI+sTOZs8xrttjhvc7f3LCUoBkD7PyYR3GE0wZ/kYV
         nr+lv3vFvuNY4VV3jFLoTZ8b6Ggxkv9jJPzSqVYQlgthIM9flA5da1Ib3lhVOoe9cDly
         p035URifoQkX02IA1RjOvhU1s662h0UYFbUxkVeBexpb4xs5/hFkVuLsPP+338H7Cik0
         W1xLazWAySO99Rc2g2YjBRaTOWG9rdXwt5p2mvna2bfySAcNKzYr1PgUfmjw3HwUiz+y
         uaCC85HoAD59SYbrgkrUGodqeLi3CqlYnCJEbqv5dRYBYQwI4Tt+W8BA8QoeaAjzP8s8
         FLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394905; x=1791999705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMvMI0qdiExZzcrJJ7xCboaNG2SDA0ACb0R/plvY+Ac=;
        b=RZ1WaSAgGbIqwUJwUi92c/dgjQeBGt3w5BPOfCcyKTUUxISTNAZc2tbe0kkAIvAKK3
         BqUmpVVuOkm9mve0mGTAp4hakyCyAN73/dOxf6fGlznxpBMk+jOmAwZvpx8VxRX+TxlV
         w/SdIiYYTS+Ei9sjDGxZJOh8wTc1IjvFhTl77JDiabq43cM3Q5kHY7B8dSYGRQTt3z/h
         iWi+zipuKyjVVGjP59KZ3Ujtuh+Zr63g78ocYu3Rm98yJQufFc3d8c6yDOwVT1dguLB3
         cj/JZmzMKuDNzHHRvp4Lr+xDnkjb54vZqr9gMlZdyEkrRURL5EmctTmw3iCbiGfjl197
         7lZg==
X-Forwarded-Encrypted: i=1; AKwUvBwLbLc4HRHWXn/tRmhsVCUI0jabMvZ/4YSz0pSuY/7OflQ24UsXzSAuL4zC42TQ9QMVU7PLXod1GRpMpVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNJKJGJHFHuIRdZ0sghJqMD8gAG10QsFV96BA2ebcY4c6BdJ8l
	DJlE/i6u4Htq7cCQsM1sKbcZ9xSKNUY8LyGiuZtUxGoAfrd2YCRXShTC
X-Gm-Gg: AYBFou0fnyMY7Qv3NO0SfEgc1a7Ce4Gq9ABYUoM6lgoggpE2AGrT9Zya/8McYgoH4z0
	QjwCa4niHiW2aBxaNSGfX0PJJ3Kw0TyQ9qn6vW8QAlnjHcoMf9S8yKmtzYLDdeHcXMzQNrWVExl
	DTgtJQfLmasxp2El1DWEjTNKNHi03z88H0A2K2IXS93E1aTsvaqNxR9bbITaqt88frX697F4sgd
	dvjix/SvF5RmzyeKtDxMSOdw+nVMnObi1/UZOeHJjgnMmUdctRX4UWVhZU8GVYgYUrdjt5PIbwa
	ZH21BXgC3bkT8knU1SqNdVQFXpRqdwSUFX1vXr+pnVc2J3k0KLq38nSj5OEqR478J9ZM4UZ8E+K
	oKxFHFmS3d4mnyYbM2Em4Qmf9iy1Wv4WXq2bDqDsDRV0RSkRtJrH58etY/YuAIAq1tpFyEgN0MM
	nr92e12YN3DtTxsJiG2ViUVU/rvLUjC4ki9ZP2ajg74lm6TTKFI9j6LWMMj/2Iz4TSTojTDbq/p
	SxcSTCGEIY96HgLWZcupFkUwLfgZKicKtA28Sg5RiNL/eV1CDc=
X-Received: by 2002:a05:6402:42c8:b0:6ac:7d58:dbd2 with SMTP id 4fb4d7f45d1cf-6aff395b2f9mr3095144a12.22.1791394905117;
        Wed, 07 Oct 2026 10:41:45 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b009e80cd8sm356802a12.8.2026.10.07.10.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:41:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v5 3/6] sparc32: populate memblock from the PROM memory map
Date: Wed,  7 Oct 2026 19:41:12 +0200
Message-ID: <20261007174128.959307-4-linmag7@gmail.com>
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

