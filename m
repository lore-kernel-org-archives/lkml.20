Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215179;
	b=lbeybeuI2cEQTJznNgRlXMYJfLBd5PsLd6r5rQYmqIAxyyNJqluK+mFFMiFmxM9h8oyN
	 XMMkPg/fwNSH9PQtZ90D3Wc1bSwkteuCm/6Pd5Ei0yVXBDP/rXGtm4D9NfH2Y9zghg5ym
	 tyRzs6rJI1oMwARrTzhtzDS/I+wWVCuAfpLSC85XKT1/bqAVle1u7ftDO8mQDGBy/BuB7
	 fgQIVFY5Fe/TXEA94dKzcQBAET5MzvfiaokYvs8EmsDOiphCEYgMEeuD41UZoe8eN68g7
	 yrlIMKkSy97+55w6VXkf2V4nKVfVpkQ6oSOpCdiG+V++U4N+6tAhUd8PCFyklPS5WPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215179;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=wC9xzsktCnRVE6WeYXAbsFIWq6LKEgbraVl6HGFAaMI=;
	b=pv6oMf5xeiqIr73BmrbC3NVI0H6Ed78/dfkYMhbzr3kra763VZHVRHvQXqi8Yu5MW9ME
	 oxTPYnBzHCQNOe+rMPEV5gLmAIO0+Hyr1F7S4vckdRr/92B0dIkRIOAdluA1NpIRpjHXS
	 n+DlFtfJogHqqFPaAJJljBbKQBiOpuOqsJxAP0urqx+4WZpHAOpg9SYtJbDNhjCIamYwz
	 x9u8wCEvIjWVXIYVIRRaa6jBh4RQSmHsgamVuj1Zqsckz07bZvnG5XOYQvMeJE2uksWVc
	 2AmeCkkiLOYKmOQUa6zORoLhCdaqltaYnW1v/gVZNBecuenWDn2YAJN1a8e5SOoADIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="R/kEASXT";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nWLaVGU6;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A583606EEA5;
	Mon,  9 Nov 2026 09:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A583606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R/kEASXT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nWLaVGU6
Date: Mon, 09 Nov 2026 09:06:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215177;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC9xzsktCnRVE6WeYXAbsFIWq6LKEgbraVl6HGFAaMI=;
	b=R/kEASXTGgNGAnR1KV/I95lHCNJnGEjtKLReI399VCUH6xJGnTnDk0x8hY2vqymYxr2wkn
	Z7XdOJ17VCLXRiiG48EKtJ+jUMhzJ491Hj4gRICYJLPtA2tnN57icljY5I1BEQinRnW+wa
	IEyuF598EdfyckGYiWUN38JtbyvflPnowhZ4jXKyxKHntdO/tRsAeTuoHM4ToAL0JvSpgk
	KI+0MjgCLF3iD1wfvkN8Cy26pakicIh3q0D2IU+f6AfodFj/ZBi8E/1BHGdzlKdKHfJ05C
	fcoEjukLlci9mMo4ZzjEYJhKkQVmaK9EWjXKGec85/BHlp4xsRsSRPiTp5ty+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215177;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC9xzsktCnRVE6WeYXAbsFIWq6LKEgbraVl6HGFAaMI=;
	b=nWLaVGU6dL6VLn7xEDcEk+qb1IjavnmSENlcK/hulE9TS7JOMYLhfjvxLjHEbVUmgV1K+5
	V4MOMFvyjB5noyAw==
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
Message-ID: <179421517610.2093942.10727891140402000112.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     5109f741cfc95646cbf0112f9181c5bc5e8ef7e7
Gitweb:        https://git.kernel.org/tip/5109f741cfc95646cbf0112f9181c5bc5e8=
ef7e7
Author:        Fabio Estevam <festevam@nabladev.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:50 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:07 +01:00

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
