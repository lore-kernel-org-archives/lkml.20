Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426985;
	b=UD10pokGRugpycXzszUO48c7lnqEDk5WVAQcZbx1uUFuHVqjpkkICMKX4mxMiwfVBNs1
	 bmykKdMP34BayZcyn9saMvnWb5icqLir24TNn0d7YbmJyOSUY6k9wu9K7ahPAsQy3mK4A
	 iGhuTdEgggGJ/uaImv5AN0jLz4XtFXQy9ozI/ukcSJJiTIJBnhO8ii/R97SXdjh3+9Hbk
	 gF06rWTlRvXFiYDDmd7G323Mb9v/VIAkisUFUC3LNnTSeByCejel7Jz9rrFEev53ZUN/Z
	 LCc5POmk1gWVgYa5ZlBjOfHEQQ1RbVNe8dAssNxuWhkLGvyjJFfPsyykyx1uwYEU+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426985;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=XmCtGiduH8xhCU2Y860AaYkY4UNed5balTJWhb4wmVk=;
	b=yagH87dT/0sN3jIXGnMy0qHwfiSlRz0oHx0hRDpzhwblPUxDxnwkKLtJfM1vI4lUubXl
	 8cEI07f5EefqOIs/I3uP34l4+qXZVTyZ2N3D9Dwe0IJ+JHh5EnSImhX5lnP+pns5rzod+
	 ILVtOyoDKhYMxuZauSDIKfKPx8MOCJaNaVezULCgu6P7FxFJF22IcSWKTOrG/TApxaw3E
	 nP99DgCziCkRL8eiQOTCXXdqqkIr2KPBxOV1LEJzhS7AEWLPG+SwuTzhZOxmBfEOwtqFO
	 NyRG1E2gEvpX7U6sutDyoZRlQSDWyHmnnMJKE5siBfYfwhfxxZt9HzKy9fa5Us5RP/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gCIXW2zL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YypuVDE2;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7A606A32D;
	Wed, 11 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F7A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gCIXW2zL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YypuVDE2
Date: Wed, 11 Nov 2026 19:56:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794426983;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmCtGiduH8xhCU2Y860AaYkY4UNed5balTJWhb4wmVk=;
	b=gCIXW2zLuD11+o9VkO/eQ+bHuTC+WvBtBPVKBY6UQvWCwh0tEqsoFM5QIvNVvXRm8N0cGN
	XtoG+/whRmi6up71WVJ5iJkxM4mNv4LtlkmR6/o999GtRMPWFdCTbBuTRNXWvJPa5CydLB
	jdVJHOz/9Kgo7ExLYYFmbEELHis6iwYh797L5a6ZpsMu1dWFK7QfhAdIAr+McTXQPxpbV9
	+SWazeF8DmCS/kf8r9D+QwNJusuy5eQqEUBFxDbLEj4Ykv2j/bq/DdCQ/LtIxDXWPgCg4P
	uLBj9TImBVn1yLKxBi7jZndqGjOo1CfcsmzjtRQQE0WF4v/1v7Jv369Y7QdRSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794426983;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmCtGiduH8xhCU2Y860AaYkY4UNed5balTJWhb4wmVk=;
	b=YypuVDE2GEcW3SyfL43y4T/NUDjh7Thc2m8DBldXMgKWtfwdthy9WHNIH3pdNbhUpYe5FF
	mOOWVytXyso6yjCA==
From: "tip-bot2 for Rosen Penev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/ath79-cpu: Flush every write buffer of a
 shared interrupt
Cc: Rosen Penev <rosenp@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261108215738.113582-3-rosenp@gmail.com>
References: <20261108215738.113582-3-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179442698178.2093942.14397347215986655895.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     4e1d12a78596b4201303a953c229bd40fb506a15
Gitweb:        https://git.kernel.org/tip/4e1d12a78596b4201303a953c229bd40fb5=
06a15
Author:        Rosen Penev <rosenp@gmail.com>
AuthorDate:    Sun, 08 Nov 2026 13:57:37 -08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 11 Nov 2026 00:56:19 +01:00

irqchip/ath79-cpu: Flush every write buffer of a shared interrupt

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but each writes to DDR through its own write buffer, and
both have to be flushed before their handlers can see the data. The
driver keeps one write buffer per interrupt, so the last one listed in
the device tree wins.

Keep a mask of write buffers per interrupt instead, and flush all of
them. A flush is a few accesses to the DDR controller, which costs much
less than splitting the interrupt by source, as OpenWrt does with a
cascaded interrupt controller.

Document the interrupt wiring, the write buffers and why a shared line
flushes all of them.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261108215738.113582-3-rosenp@gmail.com
---
 drivers/irqchip/irq-ath79-cpu.c | 51 +++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index 9b7273a..ec39c37 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,6 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
=20
+#include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -18,23 +19,33 @@
 #include <asm/mach-ath79/ath79.h>
=20
 /*
- * The IP2/IP3 lines are tied to a PCI/WMAC/USB device. Drivers for
- * these devices typically allocate coherent DMA memory, however the
- * DMA controller may still have some unsynchronized data in the FIFO.
- * Issue a flush in the handlers to ensure that the driver sees
- * the update.
+ * The MIPS core has 8 interrupt lines: IP0/IP1 are software interrupts,
+ * IP7 is the CP0 timer, and IP2-IP6 are wired by the SoC to its devices.
+ * The wiring is fixed in hardware. Several devices can share a line, like
+ * the WMAC and the PCIe root complex on IP2 of AR934x, and their drivers
+ * then request the interrupt with IRQF_SHARED.
  *
- * This array map the interrupt lines to the DDR write buffer channels.
+ * Each DMA master writes to DDR through its own write buffer in the DDR
+ * controller, and each write buffer has its own flush register. When a
+ * device raises its interrupt, its last DMA writes may still sit in its
+ * write buffer, so the handler could read stale descriptors or data.
+ *
+ * The CPU interrupt says nothing about which device on a shared line
+ * raised it. So before running the handlers of a line, flush the write
+ * buffers of every device wired to it. Each handler then sees its
+ * device's data, checks its own status, and returns IRQ_NONE if it was
+ * not the source.
+ *
+ * irq_wb_chans maps each CPU interrupt line to the mask of the write
+ * buffer channels to flush, from the qca,ddr-wb-channel-interrupts and
+ * qca,ddr-wb-channels properties.
  */
-
-static unsigned irq_wb_chan[8] =3D {
-	-1, -1, -1, -1, -1, -1, -1, -1,
-};
+static u32 irq_wb_chans[8];
=20
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending;
-	int irq;
+	unsigned long pending, chans;
+	int irq, chan;
=20
 	pending =3D read_c0_status() & read_c0_cause() & ST0_IM;
=20
@@ -46,8 +57,11 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>=3D CAUSEB_IP;
 	while (pending) {
 		irq =3D fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chan) && irq_wb_chan[irq] !=3D -1)
-			ath79_ddr_wb_flush(irq_wb_chan[irq]);
+		if (irq < ARRAY_SIZE(irq_wb_chans)) {
+			chans =3D irq_wb_chans[irq];
+			for_each_set_bit(chan, &chans, 32)
+				ath79_ddr_wb_flush(chan);
+		}
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &=3D ~BIT(irq);
 	}
@@ -58,7 +72,7 @@ static int __init ar79_cpu_intc_of_init(
 {
 	int err, i, count;
=20
-	/* Fill the irq_wb_chan table */
+	/* Fill the irq_wb_chans table */
 	count =3D of_count_phandle_with_args(
 		node, "qca,ddr-wb-channels", "#qca,ddr-wb-channel-cells");
=20
@@ -68,7 +82,7 @@ static int __init ar79_cpu_intc_of_init(
=20
 		of_property_read_u32_index(
 			node, "qca,ddr-wb-channel-interrupts", i, &irq);
-		if (irq >=3D ARRAY_SIZE(irq_wb_chan))
+		if (irq >=3D ARRAY_SIZE(irq_wb_chans))
 			continue;
=20
 		err =3D of_parse_phandle_with_args(
@@ -78,7 +92,10 @@ static int __init ar79_cpu_intc_of_init(
 		if (err)
 			return err;
=20
-		irq_wb_chan[irq] =3D args.args[0];
+		if (args.args[0] >=3D 32)
+			return -EINVAL;
+
+		irq_wb_chans[irq] |=3D BIT(args.args[0]);
 	}
=20
 	return mips_cpu_irq_of_init(node, parent);
