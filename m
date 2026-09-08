Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162154BC005
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860460; cv=none; b=ENQpLnfC04VBzYDleS+Mstj8P510QNwqkt7jpUjW+DeXQMfZ3JfezMkEy6xZivhEks7ZrTZ9ZF7e3XJqJK2W+y5DENDbow02MFpRejOCxCTMFHBkYhAy8OWAqVyAp5CKtS9QzCCuWZT6hY14TjTF+C2sT13ZxoSwP27uBl6fgzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860460; c=relaxed/simple;
	bh=XptwVmfUoiIJK8VHQYIPBBrmMngRcXORGZtBYEr0qu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjiwtXjGNqEUiYAMBLpF6rYTTb3/cWW19EV5pOrS6LbIHoHRexM1Xks4HANfSplKrSUVcvVmGeY5VaRMQGihYoMhtEWZlwHl0r9HIHuaiSYKAE1sdGOy7ci68tH69a0LoLV1IE0kJEr7wgPOc7UoC6AC9XTNnA7j/Gf6Wo0rP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9o5UX+j; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9o5UX+j"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so7027817a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860458; x=1789465258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDId+Wco2epUyic9nqDMJBbZ658AKVfGGs4jzmV5spo=;
        b=M9o5UX+jl9BYex2XsPscU2ySqCEMiEWsISLEuReH+DZqeEU8of+RFCkxfmyng+xCLM
         jajUrPY6MfBVIfky8D/YEeMUjMHduZPs0qrJtk1GnpMIUK1IpQW6s46MdhIcPe7dNy22
         DJNcqU4ngO1lIr4I0vREKkeJovwnx88XybaDoyJSAZtRR12u7CqaRp1egZNtZoP8HkyP
         EozTluAlvae/oaku7rZk1f++wYLxpVuu0RoLcEkPgcOQInfsim3XFMyLHsiiU6nTmxJT
         tND4eGb2N3AfeFByzA3Ns7In5BVCejvhgrm6kaYYsySqM0/ZRFs4owBh9SfrHqdFOcZG
         2Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860458; x=1789465258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDId+Wco2epUyic9nqDMJBbZ658AKVfGGs4jzmV5spo=;
        b=qzme9VGBJpJ5Qk1KxIITrt7h0jG/glMaWe71s8y+V3iEMXoWGkTjb+YHt0tiyxKL/w
         bAyBTSL13318y9/i5hIvgKrX5HNy9ec9FD5Hj2J8Hgkm+GtsPBjKK33b22fqr5GYfYef
         l8EA4PCEgyPw2WetDXNaFeB8Aw4fAXnM+F0VuOraxgNwag5GjD7FNFccy8a4bURxUniN
         AXDr8WsycAjZjJNMOhCOu6azBKvtvXsCp1M1bGDC89pLarB3UDsXA/myISu6wE9wdSq/
         GaftVnpJeaFBEVneHuSMJU/3fbOCaNxkEzZPxkDjyl4PGvCkw15h0TWt+0EwbjQ3lCVk
         PPxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRPFc6uJF0Sp4huMpIjqv0ei4/c8VR3odf0+GnvS9cHdgCzGRj9DKtpKCYqhvPb660okdZd8Up6yLmEDo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Gy1OfPsi0P1G7Dju8ODzMbDXU6fI9tXaGPNmFBXFmnL2afSt
	BQEib/M7bYvvKQUlTjy451Z9FJsqOrEq1UFne3CfyRQL0vufTDUxXPFI
X-Gm-Gg: AYBFou0RPufdjQO/y+GRFKixuehG51lGuxEDfyu3yNvOFKFk6VGWER+RV2J+5R9/x0w
	EoMmd5q4m7p4hvI0HVLR88NzzEqd3ihB8vo3IUKy0yAMqpMi1SRpnAzUjRbxxZJhbN9xvnx37cj
	umQwXjg4P4IPgdWfMRW/2vHLRR598mRquQFtvsyThgb2GOGraS/AxzApNmvYQjJzbSP4W3VODKr
	OQp4zLcnRlrFhHQ0H75HuJjjvNCUaIg0+DA7+Ju9JeNeHnJyRhQlg8HZoJQZ6yUrM0jfiXXLxXs
	BELvggx3M0kcUGj9fp5MbK9CUH3plmCmYkrY2PHKJUk3Uxn9zm6qkYI6fFaHjPEHbGjL/r6UyC2
	3vyANDC5Qpkrr1c3yxyMlex4JYZKLBQLnEGYQu100rjIA9v9cvEC8IBzTFc5HdB2kqRaOSskckd
	bLQY0cUFl5m23Lsk0WxEx2hquu1mmasMGpw4zDwOV1a3INXRAK9Q1Tic+ekObPDyhlVgdW2ypaL
	RImGIP8A8mbhcmUOEAHxwBKhpZf1Wm7yAE4T8Q8cra+SwEPUFOx+myJw6tFh1M9CAE=
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr39529394a91.8.1788860458288;
        Tue, 08 Sep 2026 02:40:58 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:57 -0700 (PDT)
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
Subject: [PATCH 4/6] irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
Date: Tue,  8 Sep 2026 09:40:14 +0000
Message-ID: <20260908094016.1997918-5-visitorckw@gmail.com>
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

The driver currently only supports device tree initialization and
hardcodes the IRQ base to 8, which prevents non DT platforms from using
it.

Split the core controller setup out of goldfish_pic_of_init() into a
new exported helper goldfish_pic_init() that accepts a mapped base
address, parent IRQ, IRQ base, and fwnode.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                              |  1 +
 drivers/irqchip/irq-goldfish-pic.c       | 84 ++++++++++++++----------
 include/linux/irqchip/irq-goldfish-pic.h | 15 +++++
 3 files changed, 67 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..f6c37e1dbee7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2004,6 +2004,7 @@ M:	Miodrag Dinic <miodrag.dinic@mips.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 F:	drivers/irqchip/irq-goldfish-pic.c
+F:	include/linux/irqchip/irq-goldfish-pic.h
 
 ANDROID GOLDFISH RTC DRIVER
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 8d40df0e3a88..a3e9d4672ffd 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -13,15 +13,13 @@
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-goldfish-pic.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #define GFPIC_NR_IRQS			32
 
-/* 8..39 Cascaded Goldfish PIC interrupts */
-#define GFPIC_IRQ_BASE			8
-
 #define GFPIC_REG_IRQ_PENDING		0x04
 #define GFPIC_REG_IRQ_DISABLE_ALL	0x08
 #define GFPIC_REG_IRQ_DISABLE		0x0c
@@ -62,44 +60,29 @@ static void gfpic_write(u32 val, void __iomem *addr)
 	gf_iowrite32(val, addr);
 }
 
-static int __init goldfish_pic_of_init(struct device_node *of_node,
-				       struct device_node *parent)
+int __init goldfish_pic_init(void __iomem *base, unsigned int parent_irq,
+			     unsigned int irq_base, struct fwnode_handle *fwnode)
 {
 	struct goldfish_pic_data *gfpic;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
-	unsigned int parent_irq;
-	int ret = 0;
+	int ret;
 
 	gfpic = kzalloc_obj(*gfpic);
-	if (!gfpic) {
-		ret = -ENOMEM;
-		goto out_err;
-	}
+	if (!gfpic)
+		return -ENOMEM;
 
-	parent_irq = irq_of_parse_and_map(of_node, 0);
-	if (!parent_irq) {
-		pr_err("Failed to map parent IRQ!\n");
-		ret = -EINVAL;
-		goto out_free;
-	}
-
-	gfpic->base = of_iomap(of_node, 0);
-	if (!gfpic->base) {
-		pr_err("Failed to map base address!\n");
-		ret = -ENOMEM;
-		goto out_unmap_irq;
-	}
+	gfpic->base = base;
 
 	/* Mask interrupts. */
 	gf_iowrite32(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
 
-	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
+	gc = irq_alloc_generic_chip("GFPIC", 1, irq_base, gfpic->base,
 				    handle_level_irq);
 	if (!gc) {
 		pr_err("Failed to allocate chip structures!\n");
 		ret = -ENOMEM;
-		goto out_iounmap;
+		goto out_free;
 	}
 
 	gc->reg_readl = gfpic_read;
@@ -114,8 +97,9 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 	irq_setup_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS), 0,
 			       IRQ_NOPROBE | IRQ_LEVEL, 0);
 
-	gfpic->irq_domain = irq_domain_create_legacy(of_fwnode_handle(of_node), GFPIC_NR_IRQS,
-						     GFPIC_IRQ_BASE, 0, &goldfish_irq_domain_ops,
+	gfpic->irq_domain = irq_domain_create_legacy(fwnode, GFPIC_NR_IRQS,
+						     irq_base, 0,
+						     &goldfish_irq_domain_ops,
 						     NULL);
 	if (!gfpic->irq_domain) {
 		pr_err("Failed to add irqdomain!\n");
@@ -132,15 +116,49 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 out_destroy_generic_chip:
 	irq_destroy_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS),
 				 IRQ_NOPROBE | IRQ_LEVEL, 0);
-out_iounmap:
-	iounmap(gfpic->base);
-out_unmap_irq:
-	irq_dispose_mapping(parent_irq);
 out_free:
 	kfree(gfpic);
-out_err:
 	pr_err("Failed to initialize! (errno = %d)\n", ret);
 	return ret;
 }
 
+#ifdef CONFIG_OF
+/* 8..39 Cascaded Goldfish PIC interrupts */
+#define GFPIC_OF_IRQ_BASE		8
+
+static int __init goldfish_pic_of_init(struct device_node *of_node,
+				       struct device_node *parent)
+{
+	unsigned int parent_irq;
+	void __iomem *base;
+	int ret;
+
+	parent_irq = irq_of_parse_and_map(of_node, 0);
+	if (!parent_irq) {
+		pr_err("Failed to map parent IRQ!\n");
+		return -EINVAL;
+	}
+
+	base = of_iomap(of_node, 0);
+	if (!base) {
+		pr_err("Failed to map base address!\n");
+		ret = -ENOMEM;
+		goto out_unmap_irq;
+	}
+
+	ret = goldfish_pic_init(base, parent_irq, GFPIC_OF_IRQ_BASE,
+				of_fwnode_handle(of_node));
+	if (ret)
+		goto out_iounmap;
+
+	return 0;
+
+out_iounmap:
+	iounmap(base);
+out_unmap_irq:
+	irq_dispose_mapping(parent_irq);
+	return ret;
+}
+
 IRQCHIP_DECLARE(google_gf_pic, "google,goldfish-pic", goldfish_pic_of_init);
+#endif
diff --git a/include/linux/irqchip/irq-goldfish-pic.h b/include/linux/irqchip/irq-goldfish-pic.h
new file mode 100644
index 000000000000..f2e8762aec88
--- /dev/null
+++ b/include/linux/irqchip/irq-goldfish-pic.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Goldfish Programmable Interrupt Controller support
+ */
+
+#ifndef __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H
+#define __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H
+
+#include <linux/fwnode.h>
+#include <linux/types.h>
+
+int goldfish_pic_init(void __iomem *base, unsigned int parent_irq,
+		      unsigned int irq_base, struct fwnode_handle *fwnode);
+
+#endif /* __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H */
-- 
2.55.0.979.g7e5102b832-goog

