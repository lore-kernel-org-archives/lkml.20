Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430079;
	b=3wjNHJEtI23exliE+Vyn3ZVv6EKC8VbadAy3ODofA9WymipQFWH8caP0QxhuQL9o3+fN
	 ClwlPjsz0dz0mDr28jnYN2KvxsrvKMC2+oiCBrQsbOfMPDnlCVQ/cnMV1+cqSGPixfx/w
	 4lz0H2Q1Rk5lian74kPKxxXfzbETksscR3KCvvAYh9AzI00fijez/oGALuK+aXLI3VCJ/
	 GzFaBUEZvGEE+PIipgQMT9tlVZ0kFeoFKLKd3QFNxMArcomL/tSE1XGKulTPwBPDcf9BS
	 31tCN854Owyxb9gltyPhAMJ0IjLLuJdMhQAVjrCzXy8XTJvWDSJnvvWbhMDzMulJHew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
	b=U8CsqkBmrtNSKeehqsGg5Nl0MP33jGnBnjkOZ/cji87bKyBE1GGzwHhn0KGtoskGmozC
	 M3RQ4fMn2IWi0FqUF7mH3AM/R/X0TlktwkZhiL/bZBq5p6jMUMKnm44O3bqQ0z7UBOJVm
	 cg+CJ8Xnsl2s/WqTVaR5ja8FLLlogUd0oZC5p1SB+ggc9KhFtBJjV5C/tdVEXU82v4tMv
	 ZiAXWCGP9RHvkS5AWNtkWK5kn1SWcg95+14ta4Mhqf02ZHrIfaIlfrq0NnVfgHirDq9cp
	 3lNq9UwrqRCafXOS/agEE2y8Q+uTBkMPp50bKhFDo5l1MHdz1cdNAyd5uT+oYqUqSFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjk11Zji;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF28606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjk11Zji
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so4791572c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430078; x=1795034878; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
        b=tjk11Zji+duBbyhWU2BAujfuUXoTJ+WMfauewxmQg7/8cJu9rYl8cLCWGY5hahEL+7
         31Q2AjrzCRGdvHkQgnBT4YCqIHHDDdoYiRil0UQFfWuoOxOkt2otPPrPiFYE3tpLxHKU
         AOijL/KVR8iKA7crrhH/rGTsW/njiAyLqC3OjY3BfoR2IwLW4CLW2NWfxrq3x3ZoTKIk
         0Cd/tYUFB/rWwPxRdriVmh6MLSnSg+iQos89j489HeYJySzW472TDqd2XgpiYyJAfzb1
         WZT1JgwEVNmxhS1QfTLp8dZFSY73Pb7skBJAbbk4hbElut9q/uGKx+wETozzoIR0GhEC
         QTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430078; x=1795034878;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
        b=2aKS3yjMBcCOIhkF3Lt8EXwoK0fuUSPrYd9irP/c3Id0priLLsNQcdmr2jqlA7Ct+l
         FBuBXCT9KGOQHZF978vdpeBZPXgTdEwXu1Vvpeuk8BfAvYXgc3ROT1fyRk3XuGDLWBSI
         WZ2t5CXjvXpYVDV5Qq4ZYN5K18P0QqMsc5BqenMBZ8Bd6APyPzI10EA/kACakrFyODex
         xnkXxRG7MykYLKZPZPBTNll2z59XO9vd1dwXvkVDkowZ2fxKmA0iEGcIZF/AFBVuXPWJ
         agdPxCmy36PPMpNV4Fc7K1cOMqFe8nooxuYWfmkZp9xWMGC062SPM34w4JJIzFpE/2+Y
         KFag==
X-Forwarded-Encrypted: i=1; AL+hErGlQ7QNMR+l42TOKzrfEpOxgcD9X5kHITT7vNLijsb8jnoMROe/oBpuG0Y/ClLXwN/T3GxdN6GTKAN+KOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z93KYRHA9mwGTYQ2orhnD86YJUdh48Q/sozC7bSu0aMri58opnb
	eYqpkfPGQXVYXSN21NKcnPQl+szJtkoT1FxUoPsyiLYM3MxWmlaZKvIy
X-Gm-Gg: AYBFou33Mm5l1DUYaGkSCwsr7n+ipZ2Ryw7Dk2jD7knWN7yHakBeXHvi/HthOiX4XFG
	9H0Bv27K0jtPbjmCx/PafoFbe8raVe93tjHyTPcDmW293B9F6FVPMJnuZq8WE+VOChP3v5hH9bn
	6FLKTujqsAD17L2lb8/OMHUP+Rexp25jnie/BIiCvFNsh3/p2cemveoFL+29IyesoIeUPGj/Jp4
	Hrd5FtMdBIvO4TJCm9Np8h6SnN2KqXPY8L1Lu7Gplyle6jJacfxxCDcEUOG/IbYfW09ynicC7Ik
	I2mPEDB4Swmnia15d+n38TAwLi99tSK9BV3C7AGNEiIpx8B4HIbTMsreH8cjOZNU/FgqR2ON92D
	Eb3I3gIMoZhqe2xskRm5DucnaTXvzrEPa1iEnKBU5sZCODHeaMPKZx4rXCCJhVuQG+hfgdHPcDs
	sxRl+5kOjdRRl6uJeQBGLYrbVJEyQX4Ty7UOpANNItEkLJf2GtjpnrKS4tcNNO3C2hJuROUtX4o
	/vd6TSde8PEXv9U9UOfmzGJ++ifzwFHBzNrcyPq49vXrXYyT5TJueR0YKc1fLJyU2AYYmJLjEKT
	HqTJlCxa6CEshcxS6lSsTW9gUf3oSUPKZWXfQVRMJAn1vWlbOWLeVUB1o5za7jvzXKeOopzmKGE
	iKhDg
X-Received: by 2002:a05:701b:4349:b0:144:eb46:be0 with SMTP id a92af1059eb24-1b3c033451dmr3326215c88.13.1794430078157;
        Wed, 11 Nov 2026 12:47:58 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm18469021c88.2.2026.11.11.12.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:47:57 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
Date: Wed, 11 Nov 2026 13:47:58 -0700
Subject: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on
 XBurst II
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH3U9GoC/x2MSwqAMAwFryJZG6j1i1cRF1ajBrSWFlQovbvB2
 Q3DexECeaYAfRbB082BLytS5BnM+2Q3Ql7EQSvdFAKe7AKyBMszHhqfyeOqyJRUtWVtOpCl87T
 y+78OY0ofzheCZWUAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hunter Laux <hunterlaux@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794430077; l=3270;
 i=hunterlaux@gmail.com; s=20261109; h=from:subject:message-id;
 bh=67LE0kGufq3au4XmWv1z0ZrUAGrmejn8GG09kq5SEfg=;
 b=xCHTSsmMUgPp4K3sd0mSo/bVuFVGxFVdG0sDg/ZVkqV/qrKCBWF7JY74GxAtWojmUMciCbScf
 pGJ9gR7JcwmCHiXUdbbcPL0C+q/hBv77y+m2k6uLvu1spqbAUQP7HRc
X-Developer-Key: i=hunterlaux@gmail.com; a=ed25519;
 pk=Z5VTsE4CAwditt0CNeG+rpPk7xDUVh+oHWDZlNNm8FI=

On XBurst II, with the L2-to-DDR prefetcher enabled, invalidating the
L2 with Hit CACHE operations can leave stale data there: a buffer read
after a device has written to it returns what it held before the
transfer, although it is invalidated before and after the DMA.

The RTL8821CU USB Wi-Fi driver, rtw88, shows it in its register reads,
which go through 4-byte buffers: about one read in 500 is stale with
the driver's buffers, and one in 12 when each buffer starts its own L2
line. None are with the L2-to-DDR prefetcher turned off (CCU
MSCR.DisPFB2), or with a load from an uncached address before the L2
is invalidated, which Ingenic's kernels issue: none in 20000 reads
over 4 boots.

Add that load to mips_sc_inv() under a WAR_INGENIC_L2_HIT_CACHEOP
option, on XBurst II only.

Cc: Paul Cercueil <paul@crapouillou.net>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
No XBurst II SoC is in mainline yet; this came up on the X2600, whose
support I'm preparing.
---
 arch/mips/Kconfig      | 9 +++++++++
 arch/mips/mm/sc-mips.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dac3ec5120..fd438b52fd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -131,6 +131,7 @@ config MACH_INGENIC
 	select USE_OF
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
+	select WAR_INGENIC_L2_HIT_CACHEOP
 
 menu "Machine selection"
 
@@ -2524,6 +2525,14 @@ config WAR_R4600_V1_HIT_CACHEOP
 config WAR_R4600_V2_HIT_CACHEOP
 	bool
 
+# Ingenic XBurst II: with the L2-to-DDR prefetcher enabled, invalidating
+# the L2 with Hit CACHE operations can leave stale data there, so that a
+# buffer read after DMA returns what it held before the transfer.  A load
+# from an uncached address before the operations avoids it.  Only XBurst II
+# CPUs run it: XBurst1 shares the platform code but not the prefetcher.
+config WAR_INGENIC_L2_HIT_CACHEOP
+	bool
+
 # From TX49/H2 manual: "If the instruction (i.e. CACHE) is issued for
 # the line which this instruction itself exists, the following
 # operation is not guaranteed."
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 06ec304ad4..41ad4905e5 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -21,6 +21,14 @@
  * MIPS32/MIPS64 L2 cache handling
  */
 
+static inline void mips_sc_hit_cacheop_war(void)
+{
+	if (IS_ENABLED(CONFIG_WAR_INGENIC_L2_HIT_CACHEOP) &&
+	    current_cpu_type() == CPU_XBURST &&
+	    (current_cpu_data.processor_id & PRID_IMP_MASK) == PRID_IMP_XBURST2)
+		__fast_iob();
+}
+
 /*
  * Writeback and invalidate the secondary cache before DMA.
  */
@@ -37,6 +45,7 @@ static void mips_sc_inv(unsigned long addr, unsigned long size)
 	unsigned long lsize = cpu_scache_line_size();
 	unsigned long almask = ~(lsize - 1);
 
+	mips_sc_hit_cacheop_war();
 	cache_op(Hit_Writeback_Inv_SD, addr & almask);
 	cache_op(Hit_Writeback_Inv_SD, (addr + size - 1) & almask);
 	blast_inv_scache_range(addr, addr + size);

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261111-mips-ingenic-l2-war-f0eb3e4735b8

Best regards,
-- 
Hunter Laux <hunterlaux@gmail.com>

