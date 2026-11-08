Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174581;
	b=vMrcwVyhjUfgOQns3PC4osXed2rem/6h/r7eKw5oAGJCElKdP95ZU/UGPScOEtL6II6/
	 5E6LL0/xeE7IybX4jGf0rUbY5EazW3AW2X8gGvlggraB9ZhR5hW5aZnNF3PS6jWB95tq3
	 skLel7lpu9161aDbl2DSV0E7agAPd8oiIz7zNOcJlLOFnoCEfPXha/PtCi6GUjouHY6Tu
	 6p1Vw61ho834O1PsswqRzNSO0YUTHfEbhm0Xp93xBbrRLa3jbfdQjfcPjpwL4wknDPHgJ
	 IB/z+JicW6TqgxCf1JHo1j1w/x3dceMd0DH3stWmfwD8pz5afzw12PbTIq7ld0wQslA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174581;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=U78fsP/PEvvn36IV1M9tuiaI8BwdEU7C/ICv4U6B94A=;
	b=KUS+t+lnZeSA3F+HdJZm+A/IIoC1U0DU2R9DuoshTkxjRg9+O495JKutCp4DOt8+UN/F
	 mRxRD8OuyVrMVD04lRX3ratEzwnaqPao3p0OoN+3/g76xQYuVVQf3TUQdSaKKltSAky9A
	 0lL3QRFjrloYU8MpYuRVLB/YmsJupo4xOqNn8D/LRsD0aiaVnicwH4cN7UHHO8rrNqNdf
	 Sv4SUTcfNwSA8pP5IVG/L7veDa2OOXDj8aV2/YQUaW/NEpVFc7Q8Ea8G6obfrGgZXYIuO
	 ItszZXTqW6ZUwTdYdSR99w4xwThH9dXaTLU6+Gt30RGR5DeO8qO6xoujHbBP0dE9ycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sG5LKFrU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bQGdva23;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751D606D80C;
	Sun,  8 Nov 2026 21:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9751D606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sG5LKFrU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bQGdva23
Date: Sun, 08 Nov 2026 21:49:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174573;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U78fsP/PEvvn36IV1M9tuiaI8BwdEU7C/ICv4U6B94A=;
	b=sG5LKFrUWN0fOd7Cr2L3IPqOQha/GQFnHWJsd8p9982uHpBLNQn+MUUrGGHDv+GjzcjJCG
	WoYxu7TXJwxNwfqPAq0EKqLn2JP03Pc3ayq61bFahdDCI/QfKx0AeZJaepJvSwG2+HIuHF
	OdzLG57DZI8Ng1PR+PeWCCOdTCa/4di2eUMbA4sz48uW7WKPD5bV6QUCPZckwUHBcEMz+8
	unjv3pToX923DZp9lI56A5uefUpzytCAUc7PxlspTdRmvQs5sunRsrokl9lVMI3faI4JuI
	e278clReQajmUb4pt6reTaEsb/laxjVYDIzC0AMioQRt2/ZcOUpQRaLzwLxNJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174573;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U78fsP/PEvvn36IV1M9tuiaI8BwdEU7C/ICv4U6B94A=;
	b=bQGdva23I71Ab6XXcFwKeM7s2UzBcVmjzq1PIiiRBf2dowbGzpOafkhGAl2Wb5cQlhcOYp
	6IlIVrgiAXKv9RDA==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Dispose of child IRQ
 mappings in remove()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457143.2093942.3036178522886329265.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     2dc8bf99eefb6d811606b5a50e46fd507a7ab9d7
Gitweb:        https://git.kernel.org/tip/2dc8bf99eefb6d811606b5a50e46fd507a7=
ab9d7
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:56 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:44 +01:00

irqchip/imx-irqsteer: Dispose of child IRQ mappings in remove()

Once the driver can be unloaded, the IRQ domain mappings handed out to
downstream consumers must be released on remove(), otherwise:

 - a parent interrupt racing with the teardown can run the chained
   handler while irqsteer_data is freed (no synchronize_irq());
 - downstream irq_descs keep dangling chip pointers into the unloaded
   module.

Dispose of every child hwirq mapping in remove(). irq_dispose_mapping()
calls irq_domain_disassociate(), which runs synchronize_irq() and frees
the descriptor, closing both races.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-9-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 234fd10..f234dec 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -295,6 +295,9 @@ static void imx_irqsteer_remove(struct platform_device *p=
dev)
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
=20
+	for (unsigned int hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
+
 	irq_domain_remove(irqsteer_data->domain);
=20
 	if (ret >=3D 0)
