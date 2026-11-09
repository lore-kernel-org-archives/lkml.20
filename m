Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215176;
	b=GEfoy+61aZaKAKSBgnoP/fBfE5funLwThtO8DJ75w2rq5LCvSQFdxxuR2TBpOKvF8Wl/
	 MzIrWbMy35pCibjGYw0oKXtogtV5LAjIiebQ7L35GXLaOrfysaCvhvanmopsSW7ZqP0KA
	 pysfMpjV6pmUecZtMB+6uO+iQH3SOg30TYw0hnXxUcpWIfmi9rcBg+rekHtdqWkLw0hdS
	 3nVlPtCmPn1SjPTieRWgOyA4DPXiRRnkMuSk10ZQsdHHghTo5Bmss40UQMiX2fcQEZ8MX
	 lgULCWb+KB4wcJjHn6U6M6Ya0W6VW14bNyku/PlrrmJXEII1j8pD3Rk0eN/J2ew6seQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215176;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=mMenPRpPcc0xCQ4BYpxPpvwPBfk19pGKOE7TnhualII=;
	b=F8W8JccpB2f4urqYgz3WTI53gT3ZWC/CMkS/7Po0bM/yelJ3LgIxM+NsTcnN+Dd3Jwre
	 QmmrjXnpW0OrsLcT+iNvTFCeP7vS9PZ2vqu4WD1eR6ovpNPsc4qXI0Z+1WfATRsBlvS2B
	 29C2FfAyQarWk3g4Z1bOrZCauCnrprWxRXZqlW3n6f6eVnnMD1jcL1DBuyO92oNTTyhaa
	 8kewLnoK9iUohref5GI1+xVD0LIkTeTcJzSPNJ6+PwyGl9Xj8NuTKKvFtwMq29Vqvnpdd
	 7sBTMumYjyk/Vtn9Dy6YPKRn4vBxN0XhYdkX9jpUoIzG1uhjy8M+AiIlL8VQlbIO0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="qeUSHr/Q";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VkstDRrk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D95606EE85;
	Mon,  9 Nov 2026 09:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D95606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qeUSHr/Q;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VkstDRrk
Date: Mon, 09 Nov 2026 09:06:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215174;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMenPRpPcc0xCQ4BYpxPpvwPBfk19pGKOE7TnhualII=;
	b=qeUSHr/Qv8AEDXor7MhX2N5ywh16JkZpn+3gWkACnSvOmleWupV3eKEfbFMeDaoF3Uu+uu
	CAv3FAVwEQoxoSSA+zs1isCwty165n/6FQ7UDmeQoYk1Feuc+rLvDY620hxFdE//2Q8lAG
	hk6n/cwQYnhTmE4LoLSEnkWyKYqoSK/tRGFPuPMq8yNEJ+1A3Qwz1YdMOdzGDsmjp94hYy
	8jbqwpzRvGiensuJx5uZTdCBOPjhzGo3Aq803hnSHIWu0Gn5TALF3CKxPgsp+yGqMH4uPq
	lIyRCY2qrduoJhyskswDHmO8Nlw2yb/3cndNQqWfXulKVIERRXTDikqg/bjdZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215174;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMenPRpPcc0xCQ4BYpxPpvwPBfk19pGKOE7TnhualII=;
	b=VkstDRrkD9oncc+Gp7901d6qgXc6O2bv9l0Uk6E6E7fL/pPHuVdDj+OmCMiKp11NV0dzG9
	dTH7DHSPVeHsFMDg==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Cc: Fabio Estevam <festevam@nabladev.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421517301.2093942.3711654502464422261.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     856767c01a93cfc255a83d0918aff4aae614de10
Gitweb:        https://git.kernel.org/tip/856767c01a93cfc255a83d0918aff4aae61=
4de10
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:52 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:07 +01:00

irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()

imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
imx_irqsteer_remove() never disables it. Runtime PM therefore stays
enabled after the device is unbound, and rebinding it triggers:

  Unbalanced pm_runtime_enable!

Use devm_pm_runtime_set_active_enabled() so the driver core marks the
device active (matching the enabled clock) and disables runtime PM again
on unbind, keeping the enable balanced across unbind/rebind.

This becomes reachable once the driver can be unbound and reloaded, but
the imbalance already exists today on unbind, so fix it separately with
a Fixes tag for stable.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Suggested-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20261104073759.386777-5-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index b9ea1e8..9bf739a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,12 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
=20
+	platform_set_drvdata(pdev, data);
+
+	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto out;
+
 	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg=
_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -258,11 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 						 data);
 	}
=20
-	platform_set_drvdata(pdev, data);
-
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
@@ -283,7 +284,8 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
=20
 	irq_domain_remove(irqsteer_data->domain);
=20
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
=20
 #ifdef CONFIG_PM
