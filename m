Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899667;
	b=stHGyzvIUsdo+t6c4fOEEhxTTj07+/GHYmrAXQQdqgvZ4104QweUotcc0N70W8T76x2Y
	 HDjT4HI/z9PXFNYPquF3iFivX/9IAyi01Gh3HRz8CfGq+BLj7jkV8vRXMrSn0LIrCxZcT
	 yrK8ZYRHTrBt/u9K1VFcZqlsV2p1I/OPFHhhA3puDJI3r4PWOD+PjI6aW7uCjtWToqaVj
	 L2MPWuLknkTLyXm38nWv6mSPL5zF0Eqrpn3dcDJGkA4kuYdDY6GKE8Ghn1kBvUPKT6LGF
	 83gFnAbBjFfCk+pNldNbqJXQDlciuS9ldBYgV5szpqQ+KO/ojpt763+GbAyZYeJ2hCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899667;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=1b6l3YGau032EVeygYOJg5BVqWTm176W8bz28Sny1EU=;
	b=5syTf7AzFRPytk0eDOzxjtCqcGecJnD0yM9HxW7fs6iGhAmHUbTufa75LYH5EN1Nykve
	 BTXE2uTjSDGS3z/5tXaxqykw470RJBGkpcJNie4wAHAx7HkKeUDtv3QzHS7gzGC0gp8ch
	 f6SQGIA2bjb769uhpFOH5nNhnl/B4Chmnp1L0ZXsUcCuDlGevNUeon3DErizDEwYrbh0z
	 JcdhA3EopIlp2D2CiSy6ZXEK9/8NtUgbwnf7BYKqpplhf88BbL6xwBuJPngxzKq/t7bm0
	 r7VQuXiHZEPYBkN74tMiLqb/QHJ3WpQa5AWUK0Fdv968Mil1svgftl+dSMn1SQpL5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S+EnR4c8;
	arc=none smtp.remote-ip=91.218.175.147
Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67685606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67685606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S+EnR4c8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=coC0tS1tygocqhlfhKcWZR4OuG6pBS7PG4xBtlX2tl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899664; v=1; x=1795504464;
 b=S+EnR4c808pVdkEfhQammIz+1lKHhvK1LquPtUyRC+DfFLLIEBK22rCYcMP/yw6ArcIjsZTn
 TitX6Ee1Wbexv9tiaw9f+g7lGC1nzQcHVlOiJjLjLCzbG+QZUzTZLx0CJYXx9/2T9bHaNAh3pyY
 DcGwX2x383+AJE12cSc2gWL4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2885ca772be6b0d2;
	Tue, 17 Nov 2026 07:14:24 +0000
X-Mizu-Trace-ID: 2885ca772be6b0d2
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:05 +0800
Subject: [PATCH 1/8] irqchip/imx-intmux: Fix probe error path
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
Message-Id: <20261117-imx-intmux-v1-1-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

When setting up a channel fails after previous channels have been
initialized, the error path only disables the clock. The chained
handlers of those channels stay registered with handler data pointing
into the devres-managed intmux_data, which is released when probe
fails, leaving dangling pointers behind. The created IRQ domains and
parent IRQ mappings are leaked as well.

Unwind the initialized channels, tear down runtime PM and only then
disable the clock. Also enable the clock before touching runtime PM so
that a clock failure cannot leave runtime PM enabled with an
unbalanced usage counter.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index c7914fea3d1f..a9eda7646e2f 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -233,16 +233,16 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	ret = clk_prepare_enable(data->ipg_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
 	}
 
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	for (i = 0; i < channum; i++) {
 		data->irqchip_data[i].chanidx = i;
 
@@ -258,6 +258,7 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		if (!domain) {
 			ret = -ENOMEM;
 			dev_err(&pdev->dev, "failed to create IRQ domain\n");
+			irq_dispose_mapping(data->irqchip_data[i].irq);
 			goto out;
 		}
 		data->irqchip_data[i].domain = domain;
@@ -281,6 +282,17 @@ static int imx_intmux_probe(struct platform_device *pdev)
 
 	return 0;
 out:
+	while (i--) {
+		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
+						 NULL, NULL);
+		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
+							     hwirq));
+		irq_domain_remove(data->irqchip_data[i].domain);
+		irq_dispose_mapping(data->irqchip_data[i].irq);
+	}
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }

-- 
2.56.0

