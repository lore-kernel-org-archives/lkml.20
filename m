Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174579;
	b=XBCVDFbtAcKaCzQWgbSscJbKp6OTBR1bSlRn08+as7OEVxCJx+7SN1EIT+/TtXr0YUrG
	 jKwvE8PLnBoujugh8g4sSI8/S3S2+1iGRg08ukVC7b2jsk5dmO/lcb9ZiurrAcAMcs7CQ
	 m8nVB/2c6ed1wn8E8Q50Bo484vuHsLrd4TdMrTF9KH6tX907lwN/q5J2V/t69AuZVeqxB
	 5zB+dlV81bw9Lhz6ch51WqSsz2Ztgoj9oYdUAMLZ2LugttKA7xxgtfMUKxwrirhczikp8
	 wgJOnmjnVp+J5x23umjqqR0Q0AcetFBL6ATWbP5OhdHJqdVD/IVK7+gTPue3gWGQ1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174579;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Bf8O5WrN62YmbilXc/Wt2cX+BSTerNTZ/RJ0tsI/9/Q=;
	b=Njiy2zXnvxRQCZGrsidgOkS8tXHIDzbHy+gRWraezjZpbzAJFjdCyfbCeSW4aGoDWvod
	 neFf6mn6Qvp03XwuIg13dBV1BEZzyGG2sVyfEJbtJpsF07ds6XknFkEKdAfsUH3MyhI7S
	 XGZfnzA+/DpaOl9TbLovwYWcCkHKnHGfXwxg+g1qO7DBCHiap7drzZZI27DMlX+yOafyp
	 gUK3pQfz6oRUHG/epoP6bl3JWsLBOQTC8UCXQ0jnxBF10Ev6goTFZi1pi0zKS0Bjp39Yl
	 F2NF5lRty2YUoFSwM/ma1DoEKuItR2hvyTTeuOJ8djRHFkvkeOiH+tJ1Ta3rce4Yzgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gi8GMGzy;
	dkim=temperror header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CPgG+EGP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9088606A32A;
	Sun,  8 Nov 2026 21:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9088606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gi8GMGzy;
	dkim=temperror header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CPgG+EGP
Date: Sun, 08 Nov 2026 21:49:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bf8O5WrN62YmbilXc/Wt2cX+BSTerNTZ/RJ0tsI/9/Q=;
	b=gi8GMGzyeLA7C1/gUiUvmklad6FvtYnImQmp6T+4m3tY05KpCCp/9yQCl/kVm4KgMIbOMP
	pCMseuGC8xoMi9U2qIkbtSIpsjOjLoGG9ewP0m3v2uVciQIWhEOjXSVys6Pj6xpISVEVkx
	sUMsGjEJDH2XH0c4gM4OjX0KibiNtf+C5S8wlsQrEw9WlVQN6AknGiE+AzQ084PgqLOZRy
	ZkNJmgBiEVH0Rw7SYf0hq7NwcchB5l8vmJ7E9i9OuVgHgoMkn86mGa7Z2igRo2ahKCX/rG
	cLACHwRZ3cgJnubX0CWZycUOyzGe5588KvMcErLlb9mPhM0flU3ySZPevcQTDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bf8O5WrN62YmbilXc/Wt2cX+BSTerNTZ/RJ0tsI/9/Q=;
	b=CPgG+EGPFvidzyxVWC4pz4L4k0DhUX4FQ2+yJisvCZ+QiQ8bPZUHQSgREmFOSvf6Gn7CrW
	V+XOroQxuRjy+rAA==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417456854.2093942.13028152230126826482.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0c0da722d7839e5250999416404d4a4055afb300
Gitweb:        https://git.kernel.org/tip/0c0da722d7839e5250999416404d4a4055a=
fb300
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:58 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:44 +01:00

irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

Replace irq_domain_create_linear() with the new
devm_irq_domain_create_linear() helper, so the IRQ domain is released
automatically on unbind and remove() no longer has to call
irq_domain_remove(). No functional change.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-11-Zhipeng.wang_1@oss.nx=
p.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index f234dec..0e4ad47 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -248,8 +248,9 @@ static int imx_irqsteer_probe(struct platform_device *pde=
v)
 	if (ret)
 		return ret;
=20
-	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg=
_num * 32,
-						&imx_irqsteer_domain_ops, data);
+	data->domain =3D devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev=
->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -298,8 +299,6 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
 	for (unsigned int hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
=20
-	irq_domain_remove(irqsteer_data->domain);
-
 	if (ret >=3D 0)
 		pm_runtime_put_noidle(&pdev->dev);
 }
