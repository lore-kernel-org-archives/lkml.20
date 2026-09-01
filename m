Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D65415F07
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275217; cv=none; b=b99eW8oXwwlgXcRO/2sMWi5uj2pJR90sFeEqYwrrb7EFK1REm2NtcUo08P+H5THqwU0SzNcXhd6EAvUTAX5mf+KIc40idx8/OX0inkiLRP2BkrUlNDgH+Tdih8Z9isME2vSPg7D/KDd6zhB0OKmcC6BG80G75INrKKoh5jLtuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275217; c=relaxed/simple;
	bh=ixWA62zuTBRe8aIMP6azGm614OYOMuCWdpAVuIjhaf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrUZ7jPwPgkwctNMDsPGyALjjrC3Wd4twAwr69Dc5K37fxVB0ZUiN2a0GHgxK5ij4siLqI/v/z8zeqnAf8PIvss88TJdN9BEMkUeE42okSfXLpB0gZ2R6ocJqLZhtAmYhSbfNDQEuDxpFTm4ynO8jZMV7LVeJU0vAMG4QPImYJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUkvw6JS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUkvw6JS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso69417265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275213; x=1788880013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIhxiLKzSpy+3m2603jhfgBC54nQi3N4mrjaoTx15Vk=;
        b=ZUkvw6JST+56/W1F46p0dDTm4/Tskz7n8aVRms9qBLJQToHHmcC6kQOTVM/Mn4g4Jn
         Q23luGF3rPByA2LR5gvs2JYgcmjW3S1usXfqC/D42y0sBrERdD5NMqHUYucdKyW3p1um
         wQ7X6bfqqXNQLse/3r4vrlEmAAu4DH4RMt4kxRUgrWnd+dq2txjrho6gyehs/KJBxwyw
         4ewfoWbssUGlEMTRiZ16Cp0NviSx4gMe6SxnrH9Mzl7/KVwY293sRGKYxIQc/L/ZIKQO
         dHnSnmgY9BVSsuZg7RLUzU2hED8ERGVOKyJg2hg4yaUTs+/TlcSjdtbPuYYsUVE2AMj6
         z3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275213; x=1788880013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIhxiLKzSpy+3m2603jhfgBC54nQi3N4mrjaoTx15Vk=;
        b=VwVMpPyn+xad3UGZqfPdlj3YVSIv1xmbzZ15pOGVJjc1x9qsKFi7AlQ8QZyAeWkBaG
         WJSbpj+xS5yI03/ddajs9Z6rjB1KIQtg6xoJ90JXO0bo+N6WjBBGK6BR0Yc2QcLXs656
         9gEzXoMVdOt4DgsNYZi8F/DDEVEL4lcJZJcidNX5UFlhEAkUBmBMuHoEFuQDKaDWin8R
         ztZ5VDk3sf9BwdpkXcqxWDs56t4FI0Kg7QM37Ngrg5crbDm2+2g546YkU8C5uA/R+91C
         OkY94pFDbrS1G9RQTLGi/ewUcs/ufvTA+P9/WFCQ49wnUqKPE9ANwbPcCgvhAdziJ+t5
         Wylg==
X-Forwarded-Encrypted: i=1; AHgh+RrTQFdH9OzT6rgN9y5xOm3NTtMyTF6G6K8Ii6wfjRl1B+a+r+QeTsqKYdrZQVCe1D5OBBPj7gAg1Nw5k5U=@vger.kernel.org
X-Gm-Message-State: AFuF++kfZsm/1NCjx5voiY2yaL07C961sfYJRAQSLQuXL2VIiYvvsFMt
	MXLeG2VH3WP02d/RVei8+QgdC7o1RphkoUOxdxk6kHlsJZxLfpvdCXF7
X-Gm-Gg: AR+sD13kf3flq6XLXvNDD5cDItBcXYBImj+1ZuWOW7xGRcZK/qU/YBbqpuAFm0ci6WJ
	DeSPlWS2Ye7/EmsdaX7D9J7W+4fFBE3cCeCdDqEgz0ztnsfqr01g4ZZh28OmIxGw75dm4sMMZ3u
	hZmVlPn3xclxqZ8AJYE24T9/yGVpiB4x0ntCyPtoFlzf3bR3fAzQRRkHjsyclvGYHn/horroi0s
	/TKo78PQJ8VoXxWTZ+UWKNHZgTlhH5KqD3OiRXADl2XIlTz7OfQ81CZl7LabRV2+5qu+ZzKlj5K
	GYZeTCI0Ik4Q8tBC2+OF0C52UAeFenufN0+tnARnlmQ9ULeh1VCKpRjoxXVZLH98OgVp0THQ0l9
	XOEVXbYbPHmJIoVLitB2Pm2F8TxNlVZZmTQAU5903r++JNgR/uaLNYd9Vrpnzgtjt8TvwQnRZuY
	N7tKOQoSw6NODmR8ZyG9P03WVR1wqTPhY1F5l8lBNKUE/6uvKum0gaVEb7xJsvqqNtjleSTFtA2
	T1XK8TH1K/OobPm/2JSituxn3HkuvDo8Kj3C0MBv1xGcsjYq++w
X-Received: by 2002:a05:600c:45d4:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49b91c1ebd7mr491856785e9.4.1788275210457;
        Tue, 01 Sep 2026 08:06:50 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm303172635e9.1.2026.09.01.08.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:06:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	Frank.Li@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: kernel-janitors@vger.kernel.org,
	linusw@kernel.org,
	kees@kernel.org,
	colin.i.king@gmail.com,
	rosenp@gmail.com,
	joao@joaoff.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] powerpc: remove dead 440SP code
Date: Tue,  1 Sep 2026 16:06:45 +0100
Message-ID: <20260901150645.1199097-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 440SP config option can never be enabled, making all references to it
dead code.

The only board using CONFIG_440SP was IBM LUAN, which was commented out by
commit f65573314e4e ("[POWERPC] Re-organize Kconfig code for 4xx in
arch/powerpc") then removed by commit ff5f483f3091 ("powerpc: 4xx: remove
commented out Kconfig entries").

Let's remove support for 440SP, since nobody can be using it anyway.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- cleaned up preprocessor condition
- added historic details to description 

Link to v1:
https://lore.kernel.org/all/20260816125615.985387-1-julianbraha@gmail.com/
---
 arch/powerpc/boot/cuboot-katmai.c   |  2 +-
 arch/powerpc/include/asm/async_tx.h |  2 +-
 arch/powerpc/include/asm/dcr-regs.h | 10 +++++-----
 arch/powerpc/kernel/cpu_specs_44x.h | 12 ------------
 arch/powerpc/platforms/44x/Kconfig  |  3 ---
 drivers/dma/Kconfig                 |  2 +-
 drivers/dma/ppc4xx/adma.c           |  9 ---------
 drivers/dma/ppc4xx/adma.h           |  2 +-
 drivers/dma/ppc4xx/dma.h            |  9 ---------
 drivers/net/ethernet/ibm/emac/mal.h |  2 +-
 10 files changed, 10 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/boot/cuboot-katmai.c b/arch/powerpc/boot/cuboot-katmai.c
index 034a748fde24..fcd71e76309f 100644
--- a/arch/powerpc/boot/cuboot-katmai.c
+++ b/arch/powerpc/boot/cuboot-katmai.c
@@ -31,7 +31,7 @@ static void katmai_fixups(void)
 {
 	unsigned long sysclk = 33333000;
 
-	/* 440SP Clock logic is all but identical to 440GX
+	/* 440SPe Clock logic is all but identical to 440GX
 	 * so we just use that code for now at least
 	 */
 	ibm440spe_fixup_clocks(sysclk, 6 * 1843200, 0);
diff --git a/arch/powerpc/include/asm/async_tx.h b/arch/powerpc/include/asm/async_tx.h
index a14758426dd5..1ff5b2ca3ed1 100644
--- a/arch/powerpc/include/asm/async_tx.h
+++ b/arch/powerpc/include/asm/async_tx.h
@@ -7,7 +7,7 @@
 #ifndef _ASM_POWERPC_ASYNC_TX_H_
 #define _ASM_POWERPC_ASYNC_TX_H_
 
-#if defined(CONFIG_440SPe) || defined(CONFIG_440SP)
+#if defined(CONFIG_440SPe)
 extern struct dma_chan *
 ppc440spe_async_tx_find_best_channel(enum dma_transaction_type cap,
 	struct page **dst_lst, int dst_cnt, struct page **src_lst,
diff --git a/arch/powerpc/include/asm/dcr-regs.h b/arch/powerpc/include/asm/dcr-regs.h
index 5c1a4973f46a..e39a55e527da 100644
--- a/arch/powerpc/include/asm/dcr-regs.h
+++ b/arch/powerpc/include/asm/dcr-regs.h
@@ -25,11 +25,11 @@
  * of the driver main register set
  */
 
-/* CPRs (440GX and 440SP/440SPe) */
+/* CPRs (440GX and 440SPe) */
 #define DCRN_CPR0_CONFIG_ADDR	0xc
 #define DCRN_CPR0_CONFIG_DATA	0xd
 
-/* SDRs (440GX and 440SP/440SPe) */
+/* SDRs (440GX and 440SPe) */
 #define DCRN_SDR0_CONFIG_ADDR 	0xe
 #define DCRN_SDR0_CONFIG_DATA	0xf
 
@@ -159,18 +159,18 @@
 #define  L2C_SNP_ESR		0x00000800
 
 /*
- * DCR register offsets for 440SP/440SPe I2O/DMA controller.
+ * DCR register offsets for 440SPe I2O/DMA controller.
  * The base address is configured in the device tree.
  */
 #define DCRN_I2O0_IBAL		0x006
 #define DCRN_I2O0_IBAH		0x007
 #define I2O_REG_ENABLE		0x00000001	/* Enable I2O/DMA access */
 
-/* 440SP/440SPe Software Reset DCR */
+/* 440SPe Software Reset DCR */
 #define DCRN_SDR0_SRST		0x0200
 #define DCRN_SDR0_SRST_I2ODMA	(0x80000000 >> 15)	/* Reset I2O/DMA */
 
-/* 440SP/440SPe Memory Queue DCR offsets */
+/* 440SPe Memory Queue DCR offsets */
 #define DCRN_MQ0_XORBA		0x04
 #define DCRN_MQ0_CF2H		0x06
 #define DCRN_MQ0_CFBHL		0x0f
diff --git a/arch/powerpc/kernel/cpu_specs_44x.h b/arch/powerpc/kernel/cpu_specs_44x.h
index 69c4cdc0cdee..41ed2c16d8cc 100644
--- a/arch/powerpc/kernel/cpu_specs_44x.h
+++ b/arch/powerpc/kernel/cpu_specs_44x.h
@@ -172,18 +172,6 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.machine_check		= machine_check_440A,
 		.platform		= "ppc440",
 	},
-	{ /* 440SP Rev. A */
-		.pvr_mask		= 0xfff00fff,
-		.pvr_value		= 0x53200891,
-		.cpu_name		= "440SP Rev. A",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc440",
-	},
 	{ /* 440SPe Rev. A */
 		.pvr_mask               = 0xfff00fff,
 		.pvr_value              = 0x53400890,
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 150813cea945..b481ef2b0f4c 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -260,9 +260,6 @@ config 440GX
 	select IBM_EMAC_ZMII if IBM_EMAC #test only
 	select IBM_EMAC_TAH if IBM_EMAC  #test only
 
-config 440SP
-	bool
-
 config 440SPe
 	bool
 	select IBM_EMAC_EMAC4 if IBM_EMAC
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..f0f61b4932f5 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -77,7 +77,7 @@ config AMBA_PL08X
 
 config AMCC_PPC440SPE_ADMA
 	tristate "AMCC PPC440SPe ADMA support"
-	depends on 440SPe || 440SP
+	depends on 440SPe
 	select DMA_ENGINE
 	select DMA_ENGINE_RAID
 	select ARCH_HAS_ASYNC_TX_FIND_CHANNEL
diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..ecbf4c84a318 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4349,14 +4349,9 @@ static ssize_t poly_show(struct device_driver *dev, char *buf)
 	ssize_t size = 0;
 	u32 reg;
 
-#ifdef CONFIG_440SP
-	/* 440SP has fixed polynomial */
-	reg = 0x4d;
-#else
 	reg = dcr_read(ppc440spe_mq_dcr_host, DCRN_MQ0_CFBHL);
 	reg >>= MQ0_CFBHL_POLY;
 	reg &= 0xFF;
-#endif
 
 	size = sysfs_emit(buf, "PPC440SP(e) RAID-6 driver "
 			"uses 0x1%02x polynomial.\n", reg);
@@ -4368,10 +4363,6 @@ static ssize_t poly_store(struct device_driver *dev, const char *buf,
 {
 	unsigned long reg, val;
 	int err;
-#ifdef CONFIG_440SP
-	/* 440SP uses default 0x14D polynomial only */
-	return -EINVAL;
-#endif
 
 	if (!count || count > 6)
 		return -EINVAL;
diff --git a/drivers/dma/ppc4xx/adma.h b/drivers/dma/ppc4xx/adma.h
index f8a5d7c1fb40..0ec35382d274 100644
--- a/drivers/dma/ppc4xx/adma.h
+++ b/drivers/dma/ppc4xx/adma.h
@@ -19,7 +19,7 @@
 #define tx_to_ppc440spe_adma_slot(tx) \
 		container_of(tx, struct ppc440spe_adma_desc_slot, async_tx)
 
-/* Default polynomial (for 440SP is only available) */
+/* Default polynomial */
 #define PPC440SPE_DEFAULT_POLY	0x4d
 
 #define PPC440SPE_ADMA_ENGINES_NUM	(XOR_ENGINES_NUM + DMA_ENGINES_NUM)
diff --git a/drivers/dma/ppc4xx/dma.h b/drivers/dma/ppc4xx/dma.h
index b5725481bfa6..17cbb2d1ee1c 100644
--- a/drivers/dma/ppc4xx/dma.h
+++ b/drivers/dma/ppc4xx/dma.h
@@ -70,20 +70,11 @@
 
 #define DMA_CUED_XOR_BASE	(0x10000000)
 #define DMA_CUED_XOR_HB		(0x00000008)
-
-#ifdef CONFIG_440SP
-#define DMA_CUED_MULT1_OFF	0
-#define DMA_CUED_MULT2_OFF	8
-#define DMA_CUED_MULT3_OFF	16
-#define DMA_CUED_REGION_OFF	24
-#define DMA_CUED_XOR_WIN_MSK	(0xFC000000)
-#else
 #define DMA_CUED_MULT1_OFF	2
 #define DMA_CUED_MULT2_OFF	10
 #define DMA_CUED_MULT3_OFF	18
 #define DMA_CUED_REGION_OFF	26
 #define DMA_CUED_XOR_WIN_MSK	(0xF0000000)
-#endif
 
 #define DMA_CUED_REGION_MSK	0x3
 #define DMA_RXOR123		0x0
diff --git a/drivers/net/ethernet/ibm/emac/mal.h b/drivers/net/ethernet/ibm/emac/mal.h
index e0ddc41186a2..6cdd40bca2cd 100644
--- a/drivers/net/ethernet/ibm/emac/mal.h
+++ b/drivers/net/ethernet/ibm/emac/mal.h
@@ -26,7 +26,7 @@
  * We call MAL 1 the version in 405GP, 405GPR, 405EP, 440EP, 440GR and
  * NP405H.
  *
- * We call MAL 2 the version in 440GP, 440GX, 440SP, 440SPE and Axon
+ * We call MAL 2 the version in 440GP, 440GX, 440SPE and Axon
  *
  * The driver expects a "version" property in the emac node containing
  * a number 1 or 2. New device-trees for EMAC capable platforms are thus
-- 
2.55.0

