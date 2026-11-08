Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175072;
	b=r6XE79KTRXFShsPYBFDvvJ4nHAgDdlEsY/WCo9QHrapdqrXcNtkVowsTkt0eSGXGqUKz
	 XtUHV3bwqDmNNDreV5dMurUyGfZiTAPnSm4Q4xfzcZZK33Xkv5GZCR3JdNwXVr9M9Zbnt
	 3uAz9itjhzenKTkDIU0rh8uGMdCZOXdEMbV0TTvvIeUeX1GH4cn3Ot8dH6PoFQdrOnbxq
	 fluW8W9IWNbdRttX1JNpsZB+8IcPU26e6RciG7KD17CjuctzQloGTFwUsFGZX+pMKcmDZ
	 iYsNWnGVras7ekxmL2RS/OBoooos5nRcwigFz2hPHGLBjsI8FvBln0on7q8b4h2CNhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
	b=TPtjbOkVkl30G4QdK6nxYGDuI6fjS2Df7V/vGeeKnzf+qnZ0StRLEhidwdOy7/JcdAhT
	 g20c7nvg89VHo6V0LCh4EHzhxIGLkWj+N568bZk47A20/n+TNlJnZ4dwinQtcX4U3+RdO
	 w5+KXCjpVOmzfvHAG7cbK6py6tHJ8VPjqyXIgxG8Qe/SSth68xl/cooXBkWsJYO+I4BSO
	 D5xdiO5XXsLf6anAm70004P87zN2f3TLBUgvFRBP5VIgbCzJTdTBd83yjvRhPkno4tXOv
	 5VOoGHoKFuZDqZmtVGdToBfZf3+PSK20vsT5AqBBnbtqtGSi4yvvkPW1T3RObi1q8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bygJju3r;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8F606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C8F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bygJju3r
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so135601a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175071; x=1794779871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
        b=bygJju3rhH16O/9kouZAhHixWlGelgLUlqnJ3c2EjKxjtWU4M0l8fnBBmoenPyIpRw
         0/QkmVx6JjZjjzyKhAly2yDpB+asS2DgcO9XBecS8KwJHA62arR5DNg22SFyBNXmun47
         AWKmZNDi8k2L4aGq4MGZzK5rtnXQ5X7fv+gBWUX73OPSa3KRxel+zBU6T3AUZMXyTGa1
         l5pDsuWcj33afL2JNg52RyVoP07XPTmCgKPNGwhe5tIJ+9qstJDKuBxRsDFqEBIkiwBm
         0Kchi/PeuZPNb4AEL2vUtHoDegZRcezQCxQWOXwKRq9mG1WQHNBErtoodvRSTAv4B5mo
         aNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175071; x=1794779871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
        b=jStYPHSEq6/plbJoYkG5EC3LlTHkai2jDaOuVtbzelcHplLs+6qiohkfPzPHIrKwmk
         cOEn1ZjrFvvkBt+1P6cIusHz2FFdODqFf0rNA0iH1oG+ue19oPDiBPfc1xM7zR8sAIuG
         CTLA4x8ISfQ4zWFryUsJPH341iWO1UfReilA/tioF/SzrXlkuQd5dr8ntrSR8f8DUWWQ
         2ykIzmBfiK2NYUCmzrC5N3Z0vxv89fR0/TmZCWM17hS4a+zgjEVKW1WWvZr2z7qwAw4M
         MxX/agi6iD4VyU8PW37yBC0mmGKwymRe86fk8jp7cKRe/agxhUyUb/DuWok78OTpV0NV
         VdIw==
X-Forwarded-Encrypted: i=1; AL+hErG6AnL6WBLfOnuK8wvRI9Ux67KAUL7u/kkc5AfSOOtdRZzi+4z2OSlsZ1EAaVPRCfHNT36KQZ1RBVMLExc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ro/YMzBaorJOfH37K08XqUHCVUgeJ7Tue4T9x46KlhC6tfF3r
	21AXmTURMH1wGKHy0CwIJBUJVtFVCXoH04CKBQUMrbyXFVOKx1vz3YX1
X-Gm-Gg: AYBFou2V9+Z9YJAZx82g3yWTYRkyxXjrBuQUJWM1Nf1cAndEwHT6Nen587kAqQ257ZH
	kQtaZ+iXS0e8Q8TuQkg0/nr53v+zfNUNI8rm5GH69L8EpTzCreGJMXcRi6wQZz/MfP54qLVzdlm
	7OtaHGytBAwKyLNG3lIztHXGeyfeRaI4uajP3YOizrQSJcshQFzUTZj0MBCyDLcndKykzGGRWij
	SeXXTbSje1kGubs6yjbHmcYValpAe3kFvUEv0QsA6SBp+fo+EQnRqp8Nxr++Lh5Xi8TJXz4V8lU
	XCr5guRc7v+7Kn/Mce2PKmTeCMCnIh7JmzkP6XxJxtuyk6Ai4j1YDIatrOlt5y7zjwhGLMQebKC
	dBVxNDifgggMrH5KOMkGSUBN8jIFeU8f1fYVdiU8fYdMc8qgLiTLOzn/ClHQUMTEhlRbOvsv6Y6
	Fix6LDm92BmYuCSlKXKCuJO2Zr01UL2JqR2hqD+sZ9c0RXiC0J+n8BZk39MJ+TmivxnYVQRZdeZ
	C2TNXdHfrKX1QejdKVmQBuTc92kYFiM1qBji2DiJJkVGPENyOKOPUni9YzfGkdRgDYki2AcurDq
	0qdKplkIAz7S1N5c6p0I6Pcaqji9vevCh4G6r8MSoaz1uVdF2qvH1oyTvacuFMXaU+tDWuaZMlU
	nng8Hic91R0YhST058nk+V55Da+jRjnQb2D6DmBrJQ7m9CkUml69tYmEByAA+Kv703yOQFXNOFQ
	QqGA==
X-Received: by 2002:a17:90b:1b01:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3b12d3e3821mr1721811a91.38.1794175070564;
        Sun, 08 Nov 2026 13:57:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:49 -0800 (PST)
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
Subject: [PATCH v2 2/3] irqchip/ath79-cpu: flush every write buffer of a shared interrupt
Date: Sun,  8 Nov 2026 13:57:37 -0800
Message-ID: <20261108215738.113582-3-rosenp@gmail.com>
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
---
 drivers/irqchip/irq-ath79-cpu.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index 9b7273a7f8ce..ec39c37895c0 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,6 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -18,23 +19,33 @@
 #include <asm/mach-ath79/ath79.h>
 
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
-static unsigned irq_wb_chan[8] = {
-	-1, -1, -1, -1, -1, -1, -1, -1,
-};
+static u32 irq_wb_chans[8];
 
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending;
-	int irq;
+	unsigned long pending, chans;
+	int irq, chan;
 
 	pending = read_c0_status() & read_c0_cause() & ST0_IM;
 
@@ -46,8 +57,11 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>= CAUSEB_IP;
 	while (pending) {
 		irq = fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chan) && irq_wb_chan[irq] != -1)
-			ath79_ddr_wb_flush(irq_wb_chan[irq]);
+		if (irq < ARRAY_SIZE(irq_wb_chans)) {
+			chans = irq_wb_chans[irq];
+			for_each_set_bit(chan, &chans, 32)
+				ath79_ddr_wb_flush(chan);
+		}
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &= ~BIT(irq);
 	}
@@ -58,7 +72,7 @@ static int __init ar79_cpu_intc_of_init(
 {
 	int err, i, count;
 
-	/* Fill the irq_wb_chan table */
+	/* Fill the irq_wb_chans table */
 	count = of_count_phandle_with_args(
 		node, "qca,ddr-wb-channels", "#qca,ddr-wb-channel-cells");
 
@@ -68,7 +82,7 @@ static int __init ar79_cpu_intc_of_init(
 
 		of_property_read_u32_index(
 			node, "qca,ddr-wb-channel-interrupts", i, &irq);
-		if (irq >= ARRAY_SIZE(irq_wb_chan))
+		if (irq >= ARRAY_SIZE(irq_wb_chans))
 			continue;
 
 		err = of_parse_phandle_with_args(
@@ -78,7 +92,10 @@ static int __init ar79_cpu_intc_of_init(
 		if (err)
 			return err;
 
-		irq_wb_chan[irq] = args.args[0];
+		if (args.args[0] >= 32)
+			return -EINVAL;
+
+		irq_wb_chans[irq] |= BIT(args.args[0]);
 	}
 
 	return mips_cpu_irq_of_init(node, parent);
-- 
2.56.0

