Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174583;
	b=COHGHOhb13LDx+sMal1cFq81G+/66K1B6aAmkxf/VIWw1IPRMJOWDmFkz4AKpM+MbCYB
	 DzSN+HpY5t6k1hpx61niwTJZzLhneaXLNCezcbeuJz5bQgG7VYs9eHPIk/PSd8hi5+NpC
	 4i2bCMI0mm7ygvnW82xT8Nw9cdXs8y200zvQeKCaveUTaVp4y7tD6RwJvR8xLrBCL6adl
	 M4F0Y9Kw+D/XpD8SVPGauac9TEgVkJBlu6CrBdk8b9iHqzkRKu/l7fvK64baeoxLSB2Mz
	 jGBzSnGDmNa/oSzIo0p6fa1Kp2NaT99mPmhI0+xHawpqTTNb2Y6XMy0a1DNeht+ng5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174583;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=GZofD7DSU9QPP19aOfUZxIH1h2CLibfmtAbT32rEXlY=;
	b=vWjQuWMJOD9c2C8dd4kBLZTx8zBUrQYG2g9cutvEPenRpaYn7XplFZ7yAH8d8t9EFOrw
	 ovgKgbXwJteoq8N1d2gTbhnvjJZ2KJs2nVh2bgaCx2F4W97NsB/Ea441g8G4NcVVMYob0
	 bU1O+K4szCLWSzGJxubtX3riI12Biewpo/7e+Qlr/nShs+Oz1sW/cwe5DCC1oMw22Fv77
	 or3i1MMxyVubE3ZyMX/vJ4Y+GxGS+ylsQzGSmh+KYHtZ9Lmxx22vEB1JgoQc3Tb/pliKd
	 vV2ov0kp5wuo22fVdR8Z1xrZiOfkVN5VN3OCXf9whzO3xWOblLlemaXuhIY8Amu46MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nuitj2lB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AbXzBm9T;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65F606D808;
	Sun,  8 Nov 2026 21:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F65F606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nuitj2lB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AbXzBm9T
Date: Sun, 08 Nov 2026 21:49:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174581;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZofD7DSU9QPP19aOfUZxIH1h2CLibfmtAbT32rEXlY=;
	b=nuitj2lBk8ulY6cH8ME90Wdp/iFUAX1oWU5s86pfvhlUO6A6jQVI6MvP+LMX3m22rtb4mh
	gG9QdNUYiSO2tavxcQQntFTeixoYWIs6KT7VwJiOfhsO8jwgGyAZgeXYZMEbW+Cb4KORu+
	YARzB7deCVCig4llRc8guo6M7bNz+L6aPzM3lAiYn7/j0SR2qs4xeA3CpjEHd1OZX5Od/e
	hR6N3G924TSxgl1K/7zlcFNymZss5iXgR4Gedph5b9OyyjrmeE0QW2baYGHO3ViCeiXQw1
	Ta9uCBhdXWgLeZwe5gDSWrcL9vLDZye4rREPGChARQbD0j/vTZYe2PdC56hBWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174581;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZofD7DSU9QPP19aOfUZxIH1h2CLibfmtAbT32rEXlY=;
	b=AbXzBm9TWm8TWZKGTsloQVf0OUGXj2fw/NEQ2ONVnePm5vFdqmyRmD8Y4PmNIys16NCezb
	EEvXBINjydmN61BA==
From: "tip-bot2 for Fabio Estevam" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Cc: Fabio Estevam <festevam@nabladev.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-3-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457995.2093942.6001079047755881830.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     f99f3c4acaff0df9393c1e6a3f28b7b974e01d95
Gitweb:        https://git.kernel.org/tip/f99f3c4acaff0df9393c1e6a3f28b7b974e=
01d95
Author:        Fabio Estevam <festevam@nabladev.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:50 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00

irqchip/imx-irqsteer: Validate IRQ count before creating domain

The IRQ count is validated after creating the IRQ domain. If it is
invalid, probe returns without removing the domain, leaving its host
data pointing at devm-managed memory that is freed on probe failure.

Validate the count before allocating resources to avoid the leak and
dangling pointer.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts suppo=
rt")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-3-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 1b8d0c8..766756e 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device *pde=
v)
 	 */
 	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
 	data->reg_num =3D irqs_num / 32;
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
+		return -EINVAL;
=20
 	if (IS_ENABLED(CONFIG_PM)) {
 		data->saved_reg =3D devm_kzalloc(&pdev->dev,
@@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
=20
-	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
-		ret =3D -EINVAL;
-		goto out;
-	}
-
 	for (i =3D 0; i < data->irq_count; i++) {
 		data->irq[i] =3D irq_of_parse_and_map(np, i);
 		if (!data->irq[i])
