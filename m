Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523513;
	b=FFJKTr+wvLJuiliyn7S2ft40auzYyzVevqV0gY7a7bTexHJrlc1VdxZSag6C73/4paQy
	 Dz4Snb2tJ9R5O7C63Jq3S2VkiRSGA7JlIoJqCuitY7Uv8ld2/1UPyf5tm64KK8GYz3ML9
	 NtyQh8i3f9tbcl0vWA1zG3i0/aomsneZCOsOBK3GXnsNoOCBkQdc9BqQz/oJuU7qTChfc
	 WmOQGEeEcegf1lOS3rd850+RUlkMkCuRbdUUtjaYWbz4KNtlBuIVFwVt8btY6Of0trmqe
	 3Q8uv/AxFEotHx3NaI6Xc/zh6snwkPX8X59WVktZdYvuU0PkZ6RHAQidd1Prd5IBTuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=heEUhtnTzevsAN/dn7ydMYMsHtnM+YjTEWE5POe1JUc=;
	b=NVYHkH7rgoxKC8OJxhSwD+aYKc7M1qxVhwh6psiIeSIBf0w0yZtViKvxyPrTcoB9AyUt
	 sAdFAcBAg+nGTRM/0vLAp/YvrR5ycsq2wiH6DcV5KBred+k2WWGxmhviuGcUG7bxhnXiN
	 Hx4NNwKtwO8aDHPrLjAE/fdGkJDapkEywsVSZ4cUOvgmtBDl/jMvTl7wchWT1xVkv2zuu
	 wnxEAWZeHK/kyvzvDEU7vfuE5QF0sAVWaizvH6qeeyferrSzRJmceJUKRdwChdEx3119v
	 2Ro4mxevYUo5iP25QzoJlgyd2ozRIDtdZlk21rMZEbTIwXswvWSofQhlSDlOTIVC9Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnbYQjAP;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299E606A8B8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6299E606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnbYQjAP
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so386540a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523512; x=1795128312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heEUhtnTzevsAN/dn7ydMYMsHtnM+YjTEWE5POe1JUc=;
        b=pnbYQjAPM2dhX280XyIRrMgzVTptJyJWJOykXUVKZQM+A70qSlygcE4MY3Ux/SkWEM
         eNzf2sFt4AB+h6tQV8fRiyU0mcSEfNRT9yNj4yJHO4dplq5ydoZjcZuatOAvY+vWGwoC
         88O+8vkheP5c+64Au0el5VggzHAIUvs5Gr7lDXYiMmAXHix+s2py8xDAXKKW/uqWLzjA
         hRM9J6/2jIDWuW8H/aPFw95+pdZnpqms6TOVcObjF5s6yv07jpe3uO85aqc0VcuV3xPC
         /H6eMc6HI+WXgVd6migwulf4Du81KFoU4WypNnl3pCdxAaoBB6bGA4YquPfg2mt9B9/0
         WUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523512; x=1795128312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=heEUhtnTzevsAN/dn7ydMYMsHtnM+YjTEWE5POe1JUc=;
        b=QcPbOB2Xql2U0SVJLcOhkUuqQ0WRI17tMT8RRGSulkLYLpJpfWcCCqnq+tT4epH/nA
         WC+PWnfo/huTYT2b0z8IJUL68eOG7c6TPEtjW8FxP1aclWhfH8KQJXkoYY+MjqdX7VNH
         bLXyyV0i4OCNZUFToOXVqltzY5FTY0JEYdzRYMyVlkZsJW985TeCqvsP9fZE9KQ6xHdK
         KUR0Q0Itvx1axLB9atHrstty2Nco1cGO6VYgrrZDbe1kR5tyMmf+XpkhtZ0HruTl7P90
         DVv3fE8sZQiP18mdNm/iPkIJ2EhDfT68r0i79N378wzt+BvzBMmFTJFwhzeqloZ05z0Z
         68iA==
X-Forwarded-Encrypted: i=1; AL+hErF9mMp9+6gCih6I8FZ6ngoXrHY6gR+0uyaXNQnxXMHSf6+osKW6sKcm88d28Z9VllVNEY9zQUnLv/gWo3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0sMDN+RbmF/HampTLDXl7YmMdGsf7qk7BAPIADW5ewCqNCE8M
	ouRaXLyf2iNt6sBp7bGbvrTfhX6lVCG/1sC5hFOAKpLcboWr7frA2FyU
X-Gm-Gg: AYBFou3Jxggru8Ly+cqUAfrzom7Wy1DvCWrjMMkUuaD5W2lQK4cNzfZqkdfqSPsYI/C
	q1jTbbH34/ZVGvL++DZTr0TxU9Pkc6qVDw+BUHL1XWVZQN3y4mIoxsm/npuLGhvU25uj+etPckE
	W9UetQJ07r7uuEkkiQJoXKB7CBn+E1Yf+Gh5+Xn2huN6Ot3MmK3JtLecgAyeVP4CXSOKKaVM5Gi
	Ouk/c5ijJuGCYyY8wIN6qZ2V8MZm0A6bxrzXwwC0HDuTjfFgQ9PLph6bzkyhUv5cMH6UtnILE+y
	m8IUen9nFUOYIPJLckNT0nt+ZoNKHoOaOHxo2N6bOHcN9aiAuACXybM94SczOGTHb1oiJXgzKHY
	cqdliZs+zK1tSZpoNfy124xHcb/4U9GgCigqX5oNLLK5v1DwqT3yyEEHVShfxnfyU+a/8VvtEQr
	8AE9rFViqhnEuSP/YNoSPPx/v6CKCK30IW+ISuEFGhvDJwsfuMKy2rJCPjjumf7IDs8cCwYgvgt
	n7x/6guiAJ+n7S/MzqwTCclwsC4r/P3EntBVcB6VAGBKbzHkNN1vZpMMJdEXwvadTFG1Pg05S4+
	IhLhPCr1iwLHhwIIHkh0h5AQrCv6YdLqGwN+waT39pt4FneCcPGBzzE8aVABMlgoQgwC+HCcPtG
	4GahWk7pElorg9Z2KarJ1bd+OjGORkyP4X9p+X1xGqpyO5sA5nxE7ZOSX0uny3dbmbHBROxbuWb
	ldKQ==
X-Received: by 2002:a17:90b:3890:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b1b0a4e441mr448540a91.55.1794523512591;
        Thu, 12 Nov 2026 14:45:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:12 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 3/4] irqchip/ath79-misc: convert to a platform driver
Date: Thu, 12 Nov 2026 14:44:44 -0800
Message-ID: <20261112224445.213324-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112224445.213324-1-rosenp@gmail.com>
References: <20261112224445.213324-1-rosenp@gmail.com>
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

The MISC interrupt controller is cascaded from a CPU interrupt, and its
users are all platform devices, which defer their probe until it is
available. The performance counter interrupt, the only one needed
before the early initcalls, is now mapped on demand.

Probe the controller as a platform driver, and use device-managed
resources, which also fixes the leak of the register mapping when the
irq domain cannot be created.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-misc.c | 78 ++++++++++++++------------------
 1 file changed, 34 insertions(+), 44 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 5cedea5234e0..b06ece446746 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -12,8 +12,9 @@
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include <asm/time.h>
 
@@ -124,65 +125,54 @@ static const struct irq_domain_ops misc_irq_domain_ops = {
 	.map = misc_map,
 };
 
-static void __init ath79_misc_intc_domain_init(
-	struct irq_domain *domain, int irq)
-{
-	void __iomem *base = domain->host_data;
-
-	/* Disable and clear all interrupts */
-	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
-	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
-
-	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
-}
-
-static int __init ath79_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ath79_misc_intc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct irq_domain *domain;
 	void __iomem *base;
 	int irq;
 
-	irq = irq_of_parse_and_map(node, 0);
-	if (!irq) {
-		pr_err("Failed to get MISC IRQ\n");
-		return -EINVAL;
-	}
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("Failed to get MISC IRQ registers\n");
-		return -ENOMEM;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	domain = irq_domain_create_linear(of_fwnode_handle(node), ATH79_MISC_IRQ_COUNT,
-				&misc_irq_domain_ops, base);
-	if (!domain) {
-		pr_err("Failed to add MISC irqdomain\n");
-		return -EINVAL;
-	}
+	domain = devm_irq_domain_create_linear(dev, dev_fwnode(dev),
+					       ATH79_MISC_IRQ_COUNT,
+					       &misc_irq_domain_ops, base);
+	if (!domain)
+		return dev_err_probe(dev, -ENOMEM, "failed to add the irq domain\n");
+
+	/* Disable and clear all interrupts */
+	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
+	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
-	ath79_misc_intc_domain_init(domain, irq);
+	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
 	ath79_misc_domain = domain;
+
 	return 0;
 }
 
-static int __init ar7100_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ar7100_misc_intc_probe(struct platform_device *pdev,
+				  struct device_node *parent)
 {
 	ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
-	return ath79_misc_intc_of_init(node, parent);
+	return ath79_misc_intc_probe(pdev);
 }
 
-IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
-		ar7100_misc_intc_of_init);
-
-static int __init ar7240_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ar7240_misc_intc_probe(struct platform_device *pdev,
+				  struct device_node *parent)
 {
 	ath79_misc_irq_chip.irq_ack = ar724x_misc_irq_ack;
-	return ath79_misc_intc_of_init(node, parent);
+	return ath79_misc_intc_probe(pdev);
 }
 
-IRQCHIP_DECLARE(ar7240_misc_intc, "qca,ar7240-misc-intc",
-		ar7240_misc_intc_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(ath79_misc_intc)
+IRQCHIP_MATCH("qca,ar7100-misc-intc", ar7100_misc_intc_probe)
+IRQCHIP_MATCH("qca,ar7240-misc-intc", ar7240_misc_intc_probe)
+IRQCHIP_PLATFORM_DRIVER_END(ath79_misc_intc)
+MODULE_DESCRIPTION("Atheros AR71xx/AR724x/AR913x MISC interrupt controller");
+MODULE_LICENSE("GPL");
-- 
2.56.1

