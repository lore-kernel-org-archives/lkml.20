Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899707;
	b=xXAI5+orqWeVpF1rbVVotgflve+jZL6IrdFrC4+pNsGukZxom7Mx88jnPNSRN6B/CoH4
	 ZhFZT33JmPundzn4n3CSUQFjHgyVvQrlnjjI0WQtx3IHfhQxGHgdWqDtbte2ScjOo3VPn
	 Xqbli33d0KbsvaqMy01bKZNLqSopaKynJzE2Jpw2YTF27DY1IE1w4fnmorhL502C33BGt
	 emr4WhZsMgMT0t7c3lP0smDMP+vnwoE5KmBZeixUkfuDUzrgZ+ssG1cDFeDDCtSCzT1Vb
	 OwH6fUwhr6DL0DD2mmVv/xQns6p7hI827VrfXq9fbJpejRR7teBOVO7jyHLlHKTRoEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899707;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=wKJtGPqUh8xd1e5gRSCSrRuD1kv5RiOZcl5rDs0i/H0=;
	b=5M7Hmn9jZTPhIV1G2Re2YWU3TYBOqwbrWH8UQV4VWt2kvHsSLPomya752WUTdmuep7QT
	 k6vKg96UGdPMp4ViqNJOfy4XqonBxIE/jGBKzWt9xKqhN+WLwbzNSlP2/6QnajCQ9DUpM
	 aWbTeS5nBVpzCVs1V6EyA1H7Zs1OllltayAP9IM5RGgpdz/mIYkXL95gWq3BG3m1dwkTJ
	 GFUfs+UWqc0ceS7emUSPls8RT4fxE9+aUkZslSMbSHiNLLTm9WJvnhJ66yYlCk87pcrfG
	 hT6iAGmL00uq8W9OL1/Thk4GnVBHQ+XGm/ZW9OKKw9YFYR+OCgsJAFh9QS5MEnrM42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHecvaiQ;
	arc=none smtp.remote-ip=95.215.58.113
Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66830606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66830606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHecvaiQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=egOOHYWo88XqIsFmRrJ9jNqDbHUnSeRXeEa+bS/h07s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899704; v=1; x=1795504504;
 b=ZHecvaiQA5gt/14YhiLhtDW/Br2QboeyBwUzeh38lXl3TSXoLDwP5SdhgIOU3L4yToezvy4p
 grE4/YG+TqFO/Cx5/qKk+KcwkSOdGnU6nH/l/bODrWHQqB9WdHA2UB+gQ/66zR6YGq7h6/dnUqI
 mUzVHiKPq+zdug9XSdwzsPaQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5b6e237ac341039;
	Tue, 17 Nov 2026 07:15:04 +0000
X-Mizu-Trace-ID: d5b6e237ac341039
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:11 +0800
Subject: [PATCH 7/8] irqchip/imx-intmux: Use
 devm_irq_domain_create_linear()
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
Message-Id: <20261117-imx-intmux-v1-7-189e7e0ad98d@nxp.com>
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

Manage the per-channel IRQ domains with devres so that they are removed
automatically when probe fails or the driver is unbound, instead of
calling irq_domain_remove() explicitly in the probe error path and in
imx_intmux_remove().

The child mappings are still disposed explicitly before the domains go
away. devres runs after imx_intmux_remove(), so each domain is removed
with an empty reverse map, and the domains are torn down before the IPG
clock devres action disables the clock.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 755c07007390..1f6e5d9c797a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -248,8 +248,9 @@ static int imx_intmux_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		domain = irq_domain_create_linear(of_fwnode_handle(np), 32, &imx_intmux_domain_ops,
-					       &data->irqchip_data[i]);
+		domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev), 32,
+						       &imx_intmux_domain_ops,
+						       &data->irqchip_data[i]);
 		if (!domain) {
 			ret = -ENOMEM;
 			dev_err(&pdev->dev, "failed to create IRQ domain\n");
@@ -283,7 +284,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 	pm_runtime_disable(&pdev->dev);
@@ -309,7 +309,6 @@ static void imx_intmux_remove(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 

-- 
2.56.0

