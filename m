Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899701;
	b=ssSUNEgWvY6gzyOoY8fhW5uBc5XzQ3ORzAj2BMpoYL4j9i4cbl91f7HNwnr2apj6uv7S
	 dEJQa4XuhwhdajzgqkanE4xrLw8/aMPmLWs+SZbAmRF07n+404Qm7xFnQJNZOUNM912p5
	 xk25cJvBCBFdt6j56BuOzWJZpajs80NYcs6W8I3jn+RDt4pvRBXDwDe+lcognM6nSkcb3
	 veEwXZqewhcC3Yb8Z3yL4tAZiTAm5j+rUF0bkb+Rk1H7zu82nSlr/wpQYJhePm8CluY2M
	 Jy/9I1Rdel7TPmrLPtcqiOhvy41xSe5GO1TRCKMhQ6UqATjzgpqzm9lyHyKdQnBeV3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899701;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=CEtV9Of40PlIkgls/ESF0YVCrLHY2cnVFegrd0OWX3U=;
	b=XxlMAJ6xvxUmhxzmyNFjYTSuGIReadOgTAaNbnWlmXPzsLeVIwXUblScl//MVFIvcM19
	 6me8ICHqPL2t6NaVeQkpK1p3FPVTXW/ty3+aDcaLN4Br4FuzBOeCgIZYLOPWMY46HcpNv
	 x4xzU84qg+wy3Pgh+06UtXOLu+JOrtREuYc6cAF47eUFghd45f0kkw+y45D3PHXuV3phv
	 SqO0R5OZS+XYeUjNnYhfZs7BNtaW2ktrZ9kLsp4/lyfUOp1ZSmZ31JcxpyIkAGIl/eW/p
	 lBLrfeEKSVl5ImolS4x7ant/OFwqYGwELWXGbzQB3y1Lhx47ufUZGcgcpknTsQnaXJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxwcWPSF;
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxwcWPSF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Wwhk/gDwsoNFkoxCGTnT6H0lIHt7+Q74XS0tvVACqJA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899698; v=1; x=1795504498;
 b=qxwcWPSFkfxxzVOiPYsFJIcNsIzUaZgf8sUkwjLouMsdm3KKhmgv0aDc/3HgMOeMrK+ZVCQw
 rzhNeFGdWmWeGbi3I8RMR0455+yoDtQ0uTK6EOxVXU4QKETKUMOlsMAggiuksGwgEECpuBqJ0oH
 CG1c3OkY3hKGdSb2nnKdQ7J4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e02f4fff576faa84;
	Tue, 17 Nov 2026 07:14:58 +0000
X-Mizu-Trace-ID: e02f4fff576faa84
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:10 +0800
Subject: [PATCH 6/8] irqchip/imx-intmux: Use devm_clk_get_enabled()
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
Message-Id: <20261117-imx-intmux-v1-6-189e7e0ad98d@nxp.com>
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

Enable the IPG clock with devm_clk_get_enabled() so that it is enabled
during probe and automatically disabled when the device is detached.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index ebfff621e5a9..755c07007390 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -226,7 +226,7 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -234,12 +234,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -294,7 +288,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
 
@@ -323,7 +316,6 @@ static void imx_intmux_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (ret >= 0) {
 		pm_runtime_put_noidle(&pdev->dev);
-		clk_disable_unprepare(data->ipg_clk);
 		pm_runtime_set_suspended(&pdev->dev);
 	}
 }

-- 
2.56.0

