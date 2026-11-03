Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742211;
	b=1t5JH4iXdJYb4LcRA5W+JHdK+mcq6oTybY1pXzyA2D71pl3tE4gqp0ewmNVtb8L4zg2s
	 mns5lMDZIBvQbWc3CiL1Vm2aX2fAEPeOtR2Bawb3wOr+r7OC2yyKD0IlD+e97bv/l356o
	 LnAyN8jvRRMfOMkzDeAoM6oNkLXN5O3vMc180CI6LbVFSVIn1L7HTKqfLCj2xaqaiPFFz
	 DCKTwCutYZFwAGDBWNkOkDini/L12sGzP12zKsdzxLR8Kj2wMn2ZJ7EWh4h0xlYmI57I4
	 0OzadfQd/ruDKm9E19P5H8/eHBvwpQdZjYPGFKQujqF0k9kjRo9YJnh0BzMySLeHu/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
	b=EeaGtPUvjm8t0u3VVE3q0h+keQSNSkox0eXMr0Q+2yXEdKD1MI7li5XpRpXR4+0c6cl1
	 kk9MYZwLnOJSKA1yaIyBhyiv1t2n68mzZHGeK82opAEkxEKdCGs6GDbVkMldgoUvFxuQE
	 SqC+HVOicoeqPVpRSor/bmmj9yS6LVFK6pNU4AQx8x72t7QngYLP8HBz5qQeLkbSWPkoy
	 1o72l8ZFq2gDFS+BPWkv9fxUKfgMhZojI6hiQ0Na9lc4RTWWliA0UionEJ901hbh/pH1+
	 wxt/LrssbtKKPsKLOTH9syBsk7csbY30qvGhSN5BKh0ULuClsUt49CF3vTEX4CuTVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTHfZyUk;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0F608362C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D0F608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTHfZyUk
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso6889344a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742209; x=1794347009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
        b=HTHfZyUkR+CGaEi6RFltw/Q79BosoRmkYOaEoxG4BOnw3t6SV8KOKChgJ6EvNnShT5
         C1eemaxBQENs4tJWO8q538GklljGQdb3jXJs6SrQpJdGDPAQdbt70f4FHVUaqzI7zNdy
         6/FtUS/ts53qLilpvz/Akv8860ymHJGucqduMgjYcvJPz7PNx7EWvtrKtgcCrtARWEf5
         8VTNKhhV2pPMNwQRsnZlfvFYMmy9lLPCfZzZoEZ6ab2uWbMKVH9jOsAdNBUf+QdYuUla
         ESp1VuQNM1D1eVt2poGmTPndkc3jpvuXq/5Dx+6agQkeC7VZVtyFVcLlUAx/rZnxT5t2
         gFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742209; x=1794347009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
        b=Jh5xMcRUklQjQCudMMtiA3m9Vpuq1saGxQE9gqrVnH1LwoTYGb/OSh8J8F9E2ZPRfI
         exQeTpi/4F1S+SjrkCo/a4w0GF/EmTWT4+Fj41EdatGdOYzTdkEKOm6wG/W3a+QmSGTI
         pskE2JXf7UQaLIwUCFjWYuK0YSzz7lU7TKB588s5GigsOBlSrAN7z09DhMPvKeRINYFr
         8SUMXh4Xa2t3fF4FqK25VFXlT+p6O8uA8sbVvEFjYBUsvX12zP6HJa/W0uP6e9AanU3t
         LUDX0LisaI4RyaEBnpjtApeQ3KIbfaU8AUcZwnY2tHvCdewVQDGSDXARlwCI1GcKEBOt
         8PVA==
X-Forwarded-Encrypted: i=1; AKwUvBytBohwDOMBIwFH4cWKKZt3xdUPQ8JIx8FoeKincviYK2He4ec+ulNBeQfuW8F9TulSZQPrCyFJJJ4DgsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lsdNbHpPEPtNwwDHSKFhzNTcA6etwD1YoVDqXupGq5yEdZlT0
	sys1DZ6J3qk/uEP+wlz3DMlHASf12yHSUJbQ/HBDngOc1j+FfSAtYoxHrM93SKkEQyg=
X-Gm-Gg: AYBFou3/XPdO1LCKx6VZgo7aByMh6H5BJIw4vCTMw9evYtbRse66AG/URJo35LLupHQ
	JesUja0Ep6WgMbxUHxSgjiEJQTGL+9mNeB9pglTh58z7Xez0xFRsWCklMpQFIpgoBotHtb+m9Mw
	0/NF3ESHuGqjViZBGgd3tfGgkcIuRFEtlch+zjhvRHhjZztRFJnqftj2UhPFPDlwwGOxoK6pTJI
	QF8aFfS2xovKuQhyxsQ/shqCCSiVEEP2bA/o3xYsmpawp7cz2U+dwA9Vu7Y1JUSBHJoIdrToMfH
	q+vSq10Jarw4vqHops4kvieWpuTcNrzbjTGu9BYNx0MHLh9+rNxgPbCKEihQldxlKm4U5s5cHyk
	pD8yrdKBdOCkmU7w/akLmWX1c8+a4xywVq5iWUw7dgYhbFxtob71OfQmEO4QHCqXV2Wd3DbUzPO
	KMR4b2ORadn7gvfGzEnm0atPe2bAnl3X7GmvUeGth37XR/cKw71sX2fbfSbKNKTt+/FvhkOMCWG
	Gr65Yf7Av0bhxkfUias7nbUuxE4syXDjlMHwTJyZ4cGWHLJMajtj166OkdBAMCGId72tApdBicc
	GpeXmFxNHC/v4LBIB7v8+2IGzhd4ZT4MruqkJvz8QvZzjoORdMxFWkZzVLPazHuF3DGVEQE=
X-Received: by 2002:a05:6402:22d0:b0:6b4:35af:328d with SMTP id 4fb4d7f45d1cf-6b4d438bdacmr8620654a12.14.1793742209093;
        Tue, 03 Nov 2026 13:43:29 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:28 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 14/14] alpha: use generic CPU device registration
Date: Tue,  3 Nov 2026 22:35:20 +0100
Message-ID: <20261103214120.1099893-15-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select GENERIC_CPU_DEVICES and remove the private registration initcall.
Alpha keeps its possible and present CPU masks in sync, and the generic
path registers CPU devices after SMP setup using the same register_cpu()
helper.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig        |  1 +
 arch/alpha/kernel/setup.c | 17 -----------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 014a52e63dec88d72c51c93b3d1c254839ecf33c..6ccb2d2303269661eb36ba4892e3026bf595f8a7 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -54,6 +54,7 @@ config ALPHA
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select EDAC_SUPPORT
+	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 28387786cb9f9ad4b587a22a3b0267b825b424c7..9fda01b73b18414c8d9c12903660024bfc0af94c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -17,7 +17,6 @@
 #include <linux/stddef.h>
 #include <linux/unistd.h>
 #include <linux/ptrace.h>
-#include <linux/slab.h>
 #include <linux/user.h>
 #include <linux/screen_info.h>
 #include <linux/delay.h>
@@ -366,22 +365,6 @@ int page_is_ram(unsigned long pfn)
 	return 0;
 }
 
-static int __init
-register_cpus(void)
-{
-	int i;
-
-	for_each_possible_cpu(i) {
-		struct cpu *p = kzalloc_obj(*p);
-		if (!p)
-			return -ENOMEM;
-		register_cpu(p, i);
-	}
-	return 0;
-}
-
-arch_initcall(register_cpus);
-
 #ifdef CONFIG_MAGIC_SYSRQ
 static void sysrq_reboot_handler(u8 unused)
 {
-- 
2.43.0

