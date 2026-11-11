Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426984;
	b=fKC234uV6JzhYxA57bSZd4ZHfG/mZ/aYJNCRjBEB9fDy27/3lSF1djABTvzb7xzx6/5A
	 hVtMSxM+qMWRInDGlhLCPmJq5fe2ITy0bp5QXWJJwleOxj/VbmSTjXxd4dvtQj/6kq3Yf
	 dWw+mZ5R/vfKfEF68GP4KB9ecp8Y3HeTQ67RQ8n0SrmYC0mijGE2EYsT/LF61YxCRFh2w
	 LPJc7plIc9iul1ZTPUooyBX0HSNj7D+w/Sm4DQ80DkTnaOByV6qmYheFh5+c0urg/rlOY
	 0dbCueeFWNMklQXXfY4410SrGANzi7BS1cOVpTu+X8nGV34ka2TNOAJ20VqVU+9yxww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426984;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=CMlrOwuDS3pvHjYZja16oEjaKx0nHtm9+gGTuZBie28=;
	b=rdAF3UNu9Uxe9R4orgqHVFP8LqWLMso3HGnSEMjwQaZUkgjs96PNox6pFa39LpB5LWX+
	 BFDEIrRmuYAh8ojAXc5AffyZsgtWSMYaif56x6VvoWuNOzpNTIw+A4+VHRHzNC1Sjfj5y
	 N7aXVQWjvQx9It8eBF8PNS+82UZ7glL7nHAv6YYJhb6l1xlnkk3VP1nv2Wq+I7SvPigl9
	 4DfajyPjIG3jHmx9CRzjTbsN5oANOYv6ovQewVf+/nX7t+kL32qM9sd7JkXeUcsy9kg0L
	 RI0op8RDPSI0Qjs5l+ZFJGExVuzU/GK8Kg4D8ic9ekGFT+Phde4lqehCdV34xMv5AfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XIuvAFiG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dmlyVdkO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48508606A326;
	Wed, 11 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48508606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XIuvAFiG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dmlyVdkO
Date: Wed, 11 Nov 2026 19:56:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794426982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMlrOwuDS3pvHjYZja16oEjaKx0nHtm9+gGTuZBie28=;
	b=XIuvAFiGSeW1KGWWjYECfw+lBh0o44AT+4o1f3z9gizwVKCWVJSZzDFLzEz6tWOFJSK6fe
	aCQpz4sHdv6r4tpZTZzWYKLiaCQ04kOMZovRBgqJhWFdP1GI4tncG0jl0rWXcEbBd9BMd7
	ZDg57yLrzCdVQA5qyijYa26Y9PXvHIWI+q8feR7OlKCIBv04RR4YdSRAxwKO4Tljd6L6xj
	iQsriaOG4pVTmTKJnzxoWmdbZ98a70yNPruHGcLyWfOEwV/5B1ZFlZgfMnbYk0SG+UcCYC
	/1aT6K9AyaaJu+U6Cfa2IZcn2MMOULg/A0dEgooZXITNmfe0+nAmnKqx34DImQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794426982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMlrOwuDS3pvHjYZja16oEjaKx0nHtm9+gGTuZBie28=;
	b=dmlyVdkO4TQqLvrB0mgUn/uZkTE3v0dFB/OIl+J+ac+8wvqMacc4/PN1GEmlayOu08XZYO
	lEu5iNgFLey6QyCQ==
From: "tip-bot2 for Rosen Penev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] MIPS: ath79: Flush the DDR write buffers of an
 interrupt in parallel
Cc: Thomas Gleixner <tglx@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261108215738.113582-4-rosenp@gmail.com>
References: <20261108215738.113582-4-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179442698022.2093942.10867861115492414418.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     08b814ca0a6945b8effc1a0d64999d562f24c923
Gitweb:        https://git.kernel.org/tip/08b814ca0a6945b8effc1a0d64999d562f2=
4c923
Author:        Rosen Penev <rosenp@gmail.com>
AuthorDate:    Sun, 08 Nov 2026 13:57:38 -08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 11 Nov 2026 00:56:19 +01:00

MIPS: ath79: Flush the DDR write buffers of an interrupt in parallel

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
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261108215738.113582-4-rosenp@gmail.com
---
 arch/mips/ath79/common.c                 | 52 +++++++++++++++++------
 arch/mips/include/asm/mach-ath79/ath79.h |  2 +-
 drivers/irqchip/irq-ath79-cpu.c          | 13 ++----
 3 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/arch/mips/ath79/common.c b/arch/mips/ath79/common.c
index 137abbc..672e840 100644
--- a/arch/mips/ath79/common.c
+++ b/arch/mips/ath79/common.c
@@ -9,6 +9,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
=20
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/types.h>
@@ -53,21 +54,48 @@ void ath79_ddr_ctrl_init(void)
 }
 EXPORT_SYMBOL_GPL(ath79_ddr_ctrl_init);
=20
-void ath79_ddr_wb_flush(u32 reg)
+static void __ath79_ddr_wb_flush(unsigned long chans)
 {
-	void __iomem *flush_reg =3D ath79_ddr_wb_flush_base + (reg * 4);
-
-	/* Flush the DDR write buffer. */
-	__raw_writel(0x1, flush_reg);
-	while (__raw_readl(flush_reg) & 0x1)
-		;
+	u32 __iomem *base =3D ath79_ddr_wb_flush_base;
+	unsigned int chan;
+
+	/*
+	 * Start every flush before waiting for any of them, so that the
+	 * write buffers drain in parallel instead of one after the other.
+	 */
+	for_each_set_bit(chan, &chans, 32)
+		__raw_writel(0x1, base + chan);
+
+	for_each_set_bit(chan, &chans, 32) {
+		while (__raw_readl(base + chan) & 0x1)
+			;
+	}
+}
=20
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
=20
 void ath79_ddr_set_pci_windows(void)
 {
diff --git a/arch/mips/include/asm/mach-ath79/ath79.h b/arch/mips/include/asm=
/mach-ath79/ath79.h
index 70cda74..15897d0 100644
--- a/arch/mips/include/asm/mach-ath79/ath79.h
+++ b/arch/mips/include/asm/mach-ath79/ath79.h
@@ -145,7 +145,7 @@ static inline int soc_is_qca956x(void)
 	return soc_is_qca9561() || soc_is_qca9563();
 }
=20
-void ath79_ddr_wb_flush(unsigned int reg);
+void ath79_ddr_wb_flush(unsigned long chans);
 void ath79_ddr_set_pci_windows(void);
=20
 extern void __iomem *ath79_pll_base;
diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index ec39c37..64272b1 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,7 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
=20
-#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -44,8 +44,8 @@ static u32 irq_wb_chans[8];
=20
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending, chans;
-	int irq, chan;
+	unsigned long pending;
+	int irq;
=20
 	pending =3D read_c0_status() & read_c0_cause() & ST0_IM;
=20
@@ -57,11 +57,8 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>=3D CAUSEB_IP;
 	while (pending) {
 		irq =3D fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chans)) {
-			chans =3D irq_wb_chans[irq];
-			for_each_set_bit(chan, &chans, 32)
-				ath79_ddr_wb_flush(chan);
-		}
+		if (irq < ARRAY_SIZE(irq_wb_chans) && irq_wb_chans[irq])
+			ath79_ddr_wb_flush(irq_wb_chans[irq]);
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &=3D ~BIT(irq);
 	}
