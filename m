Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003125;
	b=Pa5eWFHPmFkIgA1dND7WLEYyjg4DrbRe3fV6IifyF/2SbxiNtjg8NAMPZeNzH7OjrlD1
	 NK3cVHaGvBKSJXyHn3hjRLXBlCuFGSANW7TIJLk+4OfALU70oSGHrgamzaPM3K6lnF4Re
	 K+7ZB8t7q5Riavowyb5DChvjl5YexBnSuPru66Rnuy0V3N3yTHqRRsqoF0BGANwAIJSeN
	 S8Y8AwOhUPBhnI0GtiqEXvplo36tl4Uus6CH0WmkT7SxY9czcu4btYOlp1cEisVmg1d9E
	 Vrb3hw63k2U5T928CH6HNr5xBnVkz/HhyEJf7zbUzQKyRmC91hl3sVz8KZK/sg4juEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=66dtAQQZ2ur+hcDbx1Q/uF2BFaiaoErzKtkiVpNvp7k=;
	b=kMyIrjA9kUVWn4rgbXUeBYDZ1HDqxLv6DEqIox9tRcv5MAyfhzUcwrc1pAKdW4F4ew/t
	 iZX9VG3+nnqnVU3ieiMG+6PowyZReMHY7kgOc2Oqy3s3NIUzHKzSAu0YQ6rgVKqJOpF9/
	 iX9fC799C4OVHWn1oVHF1kn1N6Do3U/Qudycm9fXVLNV4g8LjR7V+wFz2Ixq1E4ZZF32S
	 BoMEKV1RFlghLgWacq0DSmFxzBi0G4SsZpkTUHKMGbNfT9qkDFhCKXD02nEEgiJiNX8VP
	 SBQPxZoEONaTqGfvROywEqwvT49x9Vh3MBVnLzAy8nzocirkQY9DctVsC3qLUI55DeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hO5vXkLn;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D0606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88D0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hO5vXkLn
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so594683a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794003124; x=1794607924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=66dtAQQZ2ur+hcDbx1Q/uF2BFaiaoErzKtkiVpNvp7k=;
        b=hO5vXkLnagMOZAbuyQfZNcnDBYiHgGr3KN/TgmHKfU/K9ZJYMlyzzorQbjGcjb+xf4
         EJIreiACa/kjBo+2z9XJeEtNQ0Qay9fnko17H50N4qGG35Dje19nEtGZgw7qeuJlunuG
         wsESmuVf7FdvQW3LTlewrUnv1HXwgCAD1Ewrp5yXlhns1LdEARjEo14y8dEry9JN5rtu
         NG5z76ecz7ThuGx1Ag3SwMW46U89PR7BTELiG45Re76EK4+LxCgVKTJPVMQ6Qd2zDbbX
         +gwlXpG5L2s2A+9iXsQpcBIgNBsM46qYw4XA/BIKV1/1VOPsA2XYM8mttKqmaLTDgOcU
         o00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003124; x=1794607924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66dtAQQZ2ur+hcDbx1Q/uF2BFaiaoErzKtkiVpNvp7k=;
        b=EdQ+Nedc/EsP++7vSEs1YPjy3eVsfljGrjtemFf5i3ir5herpx/OtyQB4rAf3V5k4H
         ScTBwRJcPprDQtmTQXgoG3CHuGHmXwpppbHtEhjnRVt3FjPjmd7jwhzq2imK7ZT/H65M
         /eG6A/loesHsBsE/3WwBJrN0FsVSn+GlHYpWo1IbVk4kS9whkuHMBRmm6mA2kLJrrC2e
         vnZqIH/U5hjSVN8Sr7vXnT2xV9Z5l/pItdLlc1u6KXiGDh/6vTUnrU7uJ4mxC46Fbjdi
         7xbGWDQhT76S8h8IZ9YcjMFy8Jxkos3CMz3k4CySvPGLlFmy/Lpz7keV41q6MqSjeuX6
         2K+g==
X-Gm-Message-State: APuU4Z9LekqbXgEsTFdY1gfAPd7HITPjZNHQ2X31Xd1kguno2331dtTr
	r/seBwuom1u9NncJe93N9k/K25HxUAKazbSZ6CB7xJFp/yCPO2qMHVMgdWWC/A==
X-Gm-Gg: AYBFou3/fpvYZDguq/KoyECYahj7ab/OcANGdVRPt0DksWlcaVMZi+MQDiER3Is1Rvc
	AQcQ1xK8N4oBabJh+VYyO5S8uGf+8C9OYvXgf+o3mhomoVjeRCx+ekpTBXEuDfOVc75W720mdfW
	pXGwv/bihiOwYdgIpq1h3SAhzx14vJYuTS8pdkh/FGnmUi0U60xZzZ/xvGXBE8b5rdPS4p11Bu3
	qpnazjo7rplAzHVl9UTTfWry3Q3RCckixM25Jexv7HpvZx399fU6+G8DxsoLHnVAAacuUGds/o3
	uf4Tc0D/cSJnKx3Lm+oRvxzk3Q0DSglHuIW7zbkusXHn1L15KEOBnYXVZcqGHURUkAqUnXNq/zW
	WXa9QctKpigAH6nHj9GfyrtDivH7WrWPoER7BEwnmDFrmpbGIscpvI7KnG5/9NCI693ArebM4nw
	jVGqSGJjSKoVWmbBvV927FBnCaTa96hoi6I1VZVE7YrLoCjCBsuiU7EG8h0YLVjJOkD/5D6yJGR
	htjBqEli2PEwsTvd1zQ8Vugaeaq3ybGbqvRx0WSnGRZOlaFHcJbUkQxDV/k/wlA/SfCbO+N+m82
	r/oEFcDPIP8QuUNMPrL820ThGwnR1ixkLXe17WDV2mqG3ECDPXdtjm+Dp8G7inj0NLAXAFEJhJ2
	4P17JSmzb8SnuzsP0Niiuy1Ty6/zhbiF/r6hgO2mxV5FywONWEx3gFopeTOJigllJLc3yg5/7fW
	qcXg==
X-Received: by 2002:a17:90b:580b:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b0db609a2emr3588771a91.1.1794003124137;
        Fri, 06 Nov 2026 14:12:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105831cf6sm470721a91.11.2026.11.06.14.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:12:03 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH] irqchip/ath79-cpu: Flush every write buffer of a shared interrupt
Date: Fri,  6 Nov 2026 14:12:01 -0800
Message-ID: <20261106221201.15054-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-cpu.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index 9b7273a7f8ce..6bbbdf7ff26e 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,6 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -24,17 +25,17 @@
  * Issue a flush in the handlers to ensure that the driver sees
  * the update.
  *
- * This array map the interrupt lines to the DDR write buffer channels.
+ * This array maps the interrupt lines to a mask of the DDR write buffer
+ * channels to flush. A line shared by several devices, like the WMAC and
+ * the PCIe root complex on AR934x, flushes the channels of all of them.
  */
 
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
 
@@ -46,8 +47,11 @@ asmlinkage void plat_irq_dispatch(void)
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
@@ -58,7 +62,7 @@ static int __init ar79_cpu_intc_of_init(
 {
 	int err, i, count;
 
-	/* Fill the irq_wb_chan table */
+	/* Fill the irq_wb_chans table */
 	count = of_count_phandle_with_args(
 		node, "qca,ddr-wb-channels", "#qca,ddr-wb-channel-cells");
 
@@ -68,7 +72,7 @@ static int __init ar79_cpu_intc_of_init(
 
 		of_property_read_u32_index(
 			node, "qca,ddr-wb-channel-interrupts", i, &irq);
-		if (irq >= ARRAY_SIZE(irq_wb_chan))
+		if (irq >= ARRAY_SIZE(irq_wb_chans))
 			continue;
 
 		err = of_parse_phandle_with_args(
@@ -78,7 +82,10 @@ static int __init ar79_cpu_intc_of_init(
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

