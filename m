Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175074;
	b=UOwgYYLWhHQBJi26xrS3JxL7Kl1SohweKn0w6d1zrw1m/lqz14nsB0fN3Y2lhQhFa/ta
	 R2HYgpH2RhKJlQXvrT4/p9nj/NYxh0sj0yvMkv6mszPYgmoWqveYgbkKls6ADA/m4qO+V
	 S5UKZcLxgEHRA12jb7rCAXG0moDiWhs1Q3xqk161SWEOAvIGDCppDlFvKIdp7HVbsC/el
	 wdZorXnA7uwc94kOiHuwIX2Z0N6eUx/S6z85wnC7MV/GR50mUS62tQDiRTwV5fovpy3jN
	 +LpqsWblTS9lN6y3V3ONlru/bVa77EPmHm9COMXgPB9Z602tnnokJzqqatC3fR9Mpag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
	b=PsxGi18ZSy9u8FHntfIqHbzSpe2FSTh5L8JofzcmcIIVxJeyvbtEaiox0p9leC4awRL4
	 Pa3Q7bVYG0bnJ4LTIhBJ+bEfH6Ro1S8s7xNSsO8Ii83W9FC1+vdrZ7Ss91f17bROOuOax
	 ALRQnk6fRhMqLgtK88s8kSVnCKewwO68AfE6iq2Jp7dcISJgD6IX21845tQLjay7L3jA6
	 iYlTNXa3S1wA8T0YqUDKXlhy6JWMBXB4Ljzvic34exCQsFQ/P7q06lqpUBBfdo2mZgis/
	 TBS1s5FU6P2tW2z+cEpFskhIw54xA5rxPXFFr7G+mGIzVq4mLSdcn85N3Sgw6w7ocWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQcgXUzv;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593F606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B593F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQcgXUzv
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so84746a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175073; x=1794779873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
        b=xQcgXUzvkRsMSCLSNAa5J27caRShtGeC/mdLiBxrOft71Oi6uyY4jBxeu8ZgpagdMY
         CEdL924bOHI6HMQtjFLvLbkFUe3k5R1MgSeQu5/8/lTkA7ueyvMqBpcINUAwm4f9JWQj
         DzS/+UfADWW0t/36eFaTDv0fQ803XteYOBtTGpEjokRFGn0H5BC+xnjCxsX2irZUgXc8
         S+aQBQTRdonKK3CgE9izPM4tYWRNbLmRd4WxWjQAF2k9Lj34c2Dwjn6JpWtfxMVH0bl6
         MKSr9idkUMdj+p06lnVljjwudhctp/QZRzukIAA3hQbezQwg2k+U/hyRKpbtPbKNDmJe
         HefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175073; x=1794779873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
        b=LdJW3MP8xC4dovSkOtDRgtAppNEPe8m1S79+CatbkMAsqryVMEwRHD80pEsKzdwuHX
         3ZQAeJuqn2tJNxm7gYo9YFWgu0o5ozEFMeGdgFjWSxfS+YZRdCLQHSUXqA1VzvgToLcj
         maFaeIotvqiuZj8AgCpiSy0BGDIIkT670eHyv7rWxF86sFZ22teGZHSDCdcA9qKEAdp1
         UbO82aARzDMbQ/QESeJLUAzrM+Y4kIWbNXpVcL/1DSVHoFF6QfMThUEvJaCEV8xL1WMj
         hUR4m4AkKrznNu0InwOde6Lmc8DH+e6DnkVMq+iRsjFtKkaRnc4Wa9Q96dwkXP7uSBuQ
         eIRg==
X-Forwarded-Encrypted: i=1; AL+hErEg5zwyQ8iacJU4dSt5YIZ63H5jp+HTn+8Bf1Y0B3uSCWhDi+pPR1ahz3w/Cw9GIwEdUlYRYhcrWo/Mmgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gqm08tLbEeKSHssbdYwZSbYVpZLY/+2VPCg1UG+r2bfO8M+HN
	mIrKVih+IBfk3yKRdtmkf4uzODa5Pic6OeZaMB/YUEE/LcAq+362uqVt
X-Gm-Gg: AYBFou2fKlzUf2fnlTOJoinYNH//23WvlBd2FtPHgdWkdfj4VZTyMDNwJlh5CIIl4q7
	NoRE877Oft8ny4JzjKNNCr3bZsTonk08c6fSYW8tJmGiKfBNGscKo9zfaSNYjXLdnUbt6k8p/Qc
	amug9nCbyhKtLF8BQnNLvmjbbBT8S5/H1R0jM0+HVlbhMSCZdkQMG7oVoDnz+50unODfeWlTfAl
	zImB1a8jKpLxtX4l9ohhNd30kWRdY5obPixd1sBhZ8YiFIHaW9uXNs63AsHAshQ183s0W6q5a2t
	2CVgi2oHaOKXyohpfG+3fAFDEAjxW/bCLADH5UyqIObfnEdm3M2V41hVQOcUGdoQIrpxsJjPEHG
	10L2EL+kVzKj6ievjAtneE1qnvQ88MPC0Ryuy0HcjsZNal7TQIUJIWo6djRRTT5arXbrgXXD1Ac
	i6MEzAQvHoe8zDmUxo6aTi63FTevd5YsI2N3NPShbmw+Ka+Db/gKxS94wvKo5XFBlV29qbCSm7f
	wJC6gc79le/w/iwNV/noEkUyAP/YYANyga37rW6IuzlQw4FzFLw4xGg2ts9jruTss8GuaZPTmu6
	FaPB3k+9bA3iBLAmbrw4k+1CAgWkILBBfL/KS///mMcPv0l7Vo7yXJItycfmAHHW0XbT9D/pQ25
	6+OptWEF0aerBH9QaTJEGMhaRp5gWpngoiV+ER+yfJDCU+YVONAgTIf6WgLqIpn7ll9ikqQj3PE
	tK3g==
X-Received: by 2002:a17:90b:39c4:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b12d2de5b4mr2232435a91.12.1794175072968;
        Sun, 08 Nov 2026 13:57:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: ath79: flush the DDR write buffers of an interrupt in parallel
Date: Sun,  8 Nov 2026 13:57:38 -0800
Message-ID: <20261108215738.113582-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215738.113582-1-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
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

When several devices share a CPU interrupt, plat_irq_dispatch() flushes
their DDR write buffers one after the other, waiting for each to drain
before starting the next.

Make ath79_ddr_wb_flush() take a mask of channels, and start the flush
of every channel before waiting for any of them, so that the write
buffers drain in parallel. For a single channel the sequence is
unchanged. Its only user is the built-in irqchip, so drop the export.

Keep flushing twice, as the AR7100 datasheet asks, and quote it instead
of the comment that it must be run twice.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/common.c                 | 51 ++++++++++++++++++------
 arch/mips/include/asm/mach-ath79/ath79.h |  2 +-
 drivers/irqchip/irq-ath79-cpu.c          | 13 +++---
 3 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/arch/mips/ath79/common.c b/arch/mips/ath79/common.c
index 137abbc65c60..9c5e9cd6931a 100644
--- a/arch/mips/ath79/common.c
+++ b/arch/mips/ath79/common.c
@@ -9,6 +9,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/types.h>
@@ -53,21 +54,47 @@ void ath79_ddr_ctrl_init(void)
 }
 EXPORT_SYMBOL_GPL(ath79_ddr_ctrl_init);
 
-void ath79_ddr_wb_flush(u32 reg)
+static void __ath79_ddr_wb_flush(unsigned long chans)
 {
-	void __iomem *flush_reg = ath79_ddr_wb_flush_base + (reg * 4);
-
-	/* Flush the DDR write buffer. */
-	__raw_writel(0x1, flush_reg);
-	while (__raw_readl(flush_reg) & 0x1)
-		;
+	u32 __iomem *base = ath79_ddr_wb_flush_base;
+	unsigned int chan;
+
+	/*
+	 * Start every flush before waiting for any of them, so that the
+	 * write buffers drain in parallel instead of one after the other.
+	 */
+	for_each_set_bit(chan, &chans, 32)
+		__raw_writel(0x1, base + chan);
+
+	for_each_set_bit(chan, &chans, 32)
+		while (__raw_readl(base + chan) & 0x1)
+			;
+}
 
-	/* It must be run twice. */
-	__raw_writel(0x1, flush_reg);
-	while (__raw_readl(flush_reg) & 0x1)
-		;
+/**
+ * ath79_ddr_wb_flush - flush DDR write buffers
+ * @chans: mask of the write buffer channels to flush
+ *
+ * Every DMA master of the SoC (the Ethernet MACs, USB, PCIe, WMAC) writes
+ * to DDR through its own write buffer in the DDR controller. The buffer
+ * may still hold data when the device raises its interrupt, so it has to
+ * be flushed before the interrupt handler looks at the DMA'd memory.
+ * Setting bit 0 of the channel's flush register starts the flush, and the
+ * controller clears it once the buffer is empty.
+ */
+void ath79_ddr_wb_flush(unsigned long chans)
+{
+	/*
+	 * The AR7100 datasheet says to flush twice, after reading the
+	 * interrupt status of the device, to ensure that its descriptor
+	 * updates have reached memory before software reads them. It does
+	 * not say why a single flush is not enough. The datasheets of the
+	 * later SoCs drop the note, but nothing says the need went away, so
+	 * flush twice on all of them.
+	 */
+	__ath79_ddr_wb_flush(chans);
+	__ath79_ddr_wb_flush(chans);
 }
-EXPORT_SYMBOL_GPL(ath79_ddr_wb_flush);
 
 void ath79_ddr_set_pci_windows(void)
 {
diff --git a/arch/mips/include/asm/mach-ath79/ath79.h b/arch/mips/include/asm/mach-ath79/ath79.h
index 70cda74494a4..15897d0f570d 100644
--- a/arch/mips/include/asm/mach-ath79/ath79.h
+++ b/arch/mips/include/asm/mach-ath79/ath79.h
@@ -145,7 +145,7 @@ static inline int soc_is_qca956x(void)
 	return soc_is_qca9561() || soc_is_qca9563();
 }
 
-void ath79_ddr_wb_flush(unsigned int reg);
+void ath79_ddr_wb_flush(unsigned long chans);
 void ath79_ddr_set_pci_windows(void);
 
 extern void __iomem *ath79_pll_base;
diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index ec39c37895c0..64272b15f4ed 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,7 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
-#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -44,8 +44,8 @@ static u32 irq_wb_chans[8];
 
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending, chans;
-	int irq, chan;
+	unsigned long pending;
+	int irq;
 
 	pending = read_c0_status() & read_c0_cause() & ST0_IM;
 
@@ -57,11 +57,8 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>= CAUSEB_IP;
 	while (pending) {
 		irq = fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chans)) {
-			chans = irq_wb_chans[irq];
-			for_each_set_bit(chan, &chans, 32)
-				ath79_ddr_wb_flush(chan);
-		}
+		if (irq < ARRAY_SIZE(irq_wb_chans) && irq_wb_chans[irq])
+			ath79_ddr_wb_flush(irq_wb_chans[irq]);
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &= ~BIT(irq);
 	}
-- 
2.56.0

