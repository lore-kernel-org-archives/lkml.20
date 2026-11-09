Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215173;
	b=WmlQhWIG1ui40Bld7NtRxdGB8G5C/qURWcEJKHOXzNHQAuBMRKtdkLUB77mLOYlhYS3y
	 LHWhPvVGhLFiXFhlxyaiGyO73OsPlTo4SNT1elwxiK+TRSraJeY7kJRIIIwjexiCWWE9G
	 JRCQv3ISNjLRxwr7EPaeST+4gmrtneGpoYsX2qRe/rQF1PrWK7Jp4Nf5RrMXXULC94iFO
	 gQnr9kL8iwZdV8/7CCD7aOxUPZMTzoNRWWEHsnCIicjX5wTP3wNtAQJb4j44Br3wSvhoO
	 YQc5JOp+7wTDBgaEVDbtm+hWqmUWH9OJzR3ZhO/6gkyVCxA941xpO2lC/24QgbgP4ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215173;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=af6U6Yc3nd7Hj5YMK9toj+QlDmN+yCsHYWRShC1VjYg=;
	b=3DzrGJ9VQhdzrXyPezZLG9GUTULV5LSQrWjKlQCTrbkMNgVVV1lbrA58S62h26N2vnme
	 YS73fKi2SEPF/d9VNlfKh9YBtKSklFdSb24RNaIKw0RUkZVvXlDcu7CxsMuuy9Jg7Ro8Q
	 +MoSyYRMBsOUwf9+NUkERtte3xy7/vroXwMfDcavC3l6FVI5ZCXbsjhiOcyrpxgtRRGeB
	 zcH2fKzVTE3QTTvRfqIlVM4cWqCQ9bXGXjLRXOZLcCgEcg53BDYklmDnnNfd2mKQ6NAF5
	 kwPKE/FTLkWlWb/f27Kdpm2YbKMCZ0/RoD6ZWP4NBw+AXhoohWE3k3hMYJx04oC3dQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="d/OBvOOU";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qsrToS7L;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76D606D81D;
	Mon,  9 Nov 2026 09:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B76D606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=d/OBvOOU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qsrToS7L
Date: Mon, 09 Nov 2026 09:06:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215171;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=af6U6Yc3nd7Hj5YMK9toj+QlDmN+yCsHYWRShC1VjYg=;
	b=d/OBvOOUOIBHyP/N4oUEz+0QnCSbRlxZltWAZAwW/Y7+Vlix8m7DlLazQofYz9IHt+xMBX
	Z+7HUsRHc3Km2R96eNNXsC1j2ieGToMdwkIRlOihjYPaeexe5EKTWGR4+HzQWPWbfw2UC3
	wlTASvF+B2sGiUf3nV1at64e6IX3fIi4TPP4TkmITSi99Oybeg3vBk3YpRKnTWbZdhb4rI
	TL5gyPaGONXpyZDpKIKkVadNvWDCpRn7dhaGXG1BPdICYTAaEsQTXWRAgwxEsxPLTeXRvD
	CMhUr66YykBoVZG7c5l4reElJE3ZWdY9efS44755lkB/nOkUCPRFa10nGGwQIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215171;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=af6U6Yc3nd7Hj5YMK9toj+QlDmN+yCsHYWRShC1VjYg=;
	b=qsrToS7LCi3DAWx2mZC5Xp1uJSmvBMPHalxi9qo/wDx9mNx+Y6W9vT7YLR2cQCxjCXegN8
	Gls/vQSHEN4GL9BQ==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Let devres own the clock
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-7-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-7-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421516974.2093942.2576175937132157953.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     a5e56178ae7bd67d0d549ff6e033e3225c9788f8
Gitweb:        https://git.kernel.org/tip/a5e56178ae7bd67d0d549ff6e033e3225c9=
788f8
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:54 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:08 +01:00

irqchip/imx-irqsteer: Let devres own the clock

Let the driver core own the clock lifetime so that the probe() error
path and remove() do not have to hand-balance it:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20261104073759.386777-7-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 35 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 7451c15..6e1f77d 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pde=
v)
 		return PTR_ERR(data->regs);
 	}
=20
-	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk =3D devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 			return -ENOMEM;
 	}
=20
-	ret =3D clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	/* steer all IRQs into configured channel */
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
@@ -251,14 +245,13 @@ static int imx_irqsteer_probe(struct platform_device *p=
dev)
=20
 	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
 	if (ret)
-		goto out;
+		return ret;
=20
 	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg=
_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret =3D -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
=20
@@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_device *p=
dev)
 	}
=20
 	return 0;
-out:
-	clk_disable_unprepare(data->ipg_clk);
-	return ret;
 }
=20
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
=20
+	/*
+	 * The device may be runtime-suspended here, in which case the runtime
+	 * suspend callback has already dropped the clock enable count. Resume
+	 * it so the devres clk_disable_unprepare(), which runs after remove(),
+	 * finds the clock enabled and stays balanced. On success drop the
+	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
+	 * suspend (which would re-disable the clock) and must not leak to the
+	 * next probe of this persistent device.
+	 */
+	int ret =3D pm_runtime_resume_and_get(&pdev->dev);
+
 	for (int i =3D 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
@@ -292,8 +293,8 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
=20
 	irq_domain_remove(irqsteer_data->domain);
=20
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (ret >=3D 0)
+		pm_runtime_put_noidle(&pdev->dev);
 }
=20
 #ifdef CONFIG_PM
@@ -323,7 +324,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
=20
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
=20
 	return 0;
 }
@@ -333,7 +334,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
 	int ret;
=20
-	ret =3D clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret =3D clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
