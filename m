Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795851990F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860444; cv=none; b=udFLmP5a9D+4jHmB13fAX9J7n9gW98CwMUWJxfmLVc1hdrg7W+2MH8tiGqPXJuXgZnGuBtZ6zAgxq86tvw7X0VhWkbMimjxPz35U90nQy1UtX8AYr3aitC2Bfn6EOcs9TYnLbRfe4hCIgR3Hwb01A9wSyAOp8IQRpciwflN6uww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860444; c=relaxed/simple;
	bh=SWI63MDFjZNht/c4EEElOt+aKVUKQ3L3CRCdW/g+hoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ch6WJmgdZqYwUjOdEIYnGAmif4sA3eZkvqhAZpZLxjIGS1BuNa6g/dlxgOMHl5X8HxlJ/uLNN2lLgqcyfzH3/H+/0jUDUWDHXqA9hsw+KX03K41/Dq5KQG0vZKpVKyOAUA2w2OvszKD+s5jpNclcyDZz/p8lMcF0JIavrzb/Di0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJrIOdlF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJrIOdlF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so2719835a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860442; x=1789465242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKlva5de7tLauDWwEtkNz/euSCPlj9TGyi6mfKDbnjA=;
        b=iJrIOdlFuSbo/Je3M9Ayh51gdDyyC56pItH5s/CB5S5ls6zmep+60QYSA/K025OvBb
         3DObP7cFQv9P6qWU1Xg3/Ti4Y0mSWMan4tGf9/D+GfSBKr5n3VdJfO3BDlqxnd6ETta2
         gxPrVO7pxyNLgqr/NJMGC9SVP1TLi5KoE/VYG2fK3xJ6g4RFKXutwOmvWAShAvaKlQ+D
         YanRv8rfzb4s8IrYKS8ghSQNhCTahLynEvIwUxBFKMpkaNjRDt6/Ykjizc1I/KJzVTb1
         gUr0m1UrRzkxpUXLP8X0Hk7xomiDrbuK98w5rD3gonueK0KLu2F3iZ8esNZl2/tPKVce
         ewCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860442; x=1789465242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKlva5de7tLauDWwEtkNz/euSCPlj9TGyi6mfKDbnjA=;
        b=AzibAUdRLRf3I9VbI2sut/2DqohJ9S9Y4B4xvJ7ad+D+AO73z8uMA2Ne2e8+s/auDg
         gpT4YdKbRLdnuXI1Cc5q45GmydM1ekKF0nbLRSob+RA+rPRPiFvKidVuz8RBl0FMWk/6
         fn5u8K/O/oc8sQGtdhtUtpVp3hEA0p4PslN5461i6vncgPLGYqnpdkLiKhIzUfCxzNpJ
         DTT8dzsJuCCakEpJFWOuXMSWdnYd9DntJ+Ch7ZHyic9X9hKm6FdOWrU3uejGNAwXQl1Q
         w9JzmYYsFAeZf5yT6FBAEw4Uya37bhexBmpEndcawsV0D7LMYAz35+/LaI6MuOdDIXWY
         qG3A==
X-Forwarded-Encrypted: i=1; AKwUvBzGY3qPPWoYDGas1s4HXKSO5MrKJKIEM826KMND/R+p/frDU400mY5M3uix0j4QbXflFEeWIzPtwUeWNeM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCOz2jEWbfejKbJQjXQ22kQT2VeXSorGlQQQQPZujAyZn1Y2jG
	Foo9Fu3kqMc8EU1thBRMggbhDHUp3HN6WfPfjtf3bDXVHxs3koPk3G8r
X-Gm-Gg: AYBFou1KFDbeRkyJsh0zFZVb1GSBVrugqoH+lakYC29xZZWjSbROjh8HV3rmfT9fQX8
	VVe5QVb57zFqR62Mfii7FZBLVrheM+vB8T3akmPfMY5T5Ko2y6mb9mAb1iHhQhRZ6o+XJGymr36
	6D4BGojPViq36A2JrRd+hJCzl1xyWBpkMliZ4BzIYjr78jT1xnLc9884A4u7fLLCJJuY/DlbSuY
	y05gOpsIXAOmtMZ0hU+RM0LB1Md7x5HY946Pg4eE/xiVDny8JsyW1Y+0rG+6ArsMDqJnQuSSEae
	AqFQ9Dmt0WdZXdzr3KdwMOGtQZoJcf+SdXN8sd6BjEilBZEt24lv0bvnSpRVmX1awXAjGWvBvNY
	Exgb8kfA1IwYvM+W/YOHARHy5tP+uJrCHEij77/bhw2nKhlibMOoSBAEEw20zXqK0V7loLclpNz
	Ebo6nCC6qkVMhYhTwDgAp1wXDbWyFzhYeR5VuehkRsFN9DVfmz6rxYpkIXs7ll1WkE+l5ONAhVQ
	BJrIUZiHMThk9/EWKYMdseuxE/aoY6lj/SoaMvM9JsiRfzJYQAc3eeyOCu4iGapHooJF6cmnUr4
	uQ==
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr38336464a91.17.1788860442166;
        Tue, 08 Sep 2026 02:40:42 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:41 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/6] irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
Date: Tue,  8 Sep 2026 09:40:11 +0000
Message-ID: <20260908094016.1997918-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goldfish PIC driver uses readl() and writel() directly for register
accesses. On big endian architectures, goldfish devices require big
endian MMIO accessors [1].

Switch to gf_ioread32() and gf_iowrite32() to make MMIO accesses endian
safe.

Link: https://gitlab.com/qemu-project/qemu/-/blob/stable-11.1/hw/intc/goldfish_pic.c#L130 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index d458cf898f8e..c3c33f066140 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -38,7 +39,7 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 
 	chained_irq_enter(host_chip, desc);
 
-	pending = readl(gfpic->base + GFPIC_REG_IRQ_PENDING);
+	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
 	while (pending) {
 		hwirq = __fls(pending);
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
@@ -52,6 +53,16 @@ static const struct irq_domain_ops goldfish_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static u32 gfpic_read(void __iomem *addr)
+{
+	return gf_ioread32(addr);
+}
+
+static void gfpic_write(u32 val, void __iomem *addr)
+{
+	gf_iowrite32(val, addr);
+}
+
 static int __init goldfish_pic_of_init(struct device_node *of_node,
 				       struct device_node *parent)
 {
@@ -82,7 +93,7 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 	}
 
 	/* Mask interrupts. */
-	writel(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
+	gf_iowrite32(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
 
 	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
 				    handle_level_irq);
@@ -92,6 +103,9 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 		goto out_iounmap;
 	}
 
+	gc->reg_readl = gfpic_read;
+	gc->reg_writel = gfpic_write;
+
 	ct = gc->chip_types;
 	ct->regs.enable = GFPIC_REG_IRQ_ENABLE;
 	ct->regs.disable = GFPIC_REG_IRQ_DISABLE;
-- 
2.55.0.979.g7e5102b832-goog

