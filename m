Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215178;
	b=B3aiyZcobfXj864a8+PdFnKTg7VuSLgtmzauyIJbznoFJbTm3pl0E/ZHu1cTXHrzpTEW
	 UWt23+E/utGIEr4FLYLdM9V3FZihqkBEdhWCYT3pvgmEkn79kJ3j2pByPpdYzegBbSMr5
	 8KMUA1zlWjApMJxgLi6T/KlNadXf0+KUYkkKGryxY8RF1qPUjgr0XvLkzVr3EtfqtUpFz
	 NKp8HendvgPPOYdX2V/AaWTEl9UYUMo8cCFTTB63eaWqjUUtWOma4x6CjdZ2lH4SO71lZ
	 UpaE4REe7nc0lwhpQl4JZxnIkYPWCmdLeFFZsaOLXIC4LYakvv94i6/T/sB3nJvT5UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215178;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=85bBYG3VIpqcp7C4O2NgvUy8UspzddhHd065l6+rO0Y=;
	b=jJRgA1VgNbGPCzNL6noUPPxBk9uIDF4vejyArQ0VQJB+GVMz6m073EKregzpeZTolzKv
	 dpsXTJIJxHgFr+s1tn4riC91jOC9n+kIEZDOmBf5zNit85kuxlwm1WLUwMvVQOv7GDHwR
	 HCqfcTxxZhUbAkbyJECdeTU0KuPonJxrGLOxHGm+e4SISnW84LLOYbyW5bFUW14s0deKc
	 3Jg34J694ZF3QzTwzUYLO5uFgzrPAD8xH6BUhXILIMmYn4gFDERTVRkliP4vOGdhWP8Yk
	 SM0vwZOjNNPoCyccr3si9lBH3zyHvy4TRV8sARYprmVZEW1I95OoKKLOIsKBQT2OhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="y9F+/I/Q";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0i8FWQCc;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A7606D807;
	Mon,  9 Nov 2026 09:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251A7606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=y9F+/I/Q;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0i8FWQCc
Date: Mon, 09 Nov 2026 09:06:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215176;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85bBYG3VIpqcp7C4O2NgvUy8UspzddhHd065l6+rO0Y=;
	b=y9F+/I/QE20or1EwqyIbE0hCzv3xJXntlVsn+2YpKcBjE67xdG4LErQ4yDgLI6kK4UsuSe
	VxYEIiK719k+6PRITzIsrWwC7xls4r8UkBvDNR0oyiFDmhSJSgTOVh8AAmk+EGtYD4tpus
	9oQODYD0IFY7a0auIlIfE+gKDfm+TLcfpgeMiCMpeIdaR7IqRkOKNlCjP00DmHgEhe0Pxn
	MZr/rI7dipZogW3XdV8l9pDA2bzsOXQrm9g7qNp4woT4wD/PcFMUXgikLU2adf8RcW1pc9
	KHkFTZ4BL/Tu0yt47Uq5UpZqdhaTHqKfF6I7lDTc0XJnnCKlU5EOtd9E/sjGRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215176;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85bBYG3VIpqcp7C4O2NgvUy8UspzddhHd065l6+rO0Y=;
	b=0i8FWQCcTjDzj2antmmSlZqRn4l3VUpj1P8IujS8QXqvNJ07+Xm28qArfpXQ42AK+0TpRx
	hj5iwIbMsGsVb2Dg==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-4-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421517455.2093942.6984969553888023835.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     ab8ffd7003a268b4b98004564bb1c04d98dccd79
Gitweb:        https://git.kernel.org/tip/ab8ffd7003a268b4b98004564bb1c04d98d=
ccd79
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:51 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:07 +01:00

irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-4-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 766756e..b9ea1e8 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -272,14 +272,13 @@ out:
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
-	int i;
=20
-	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
+	for (int i =3D 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
=20
-		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
-						 NULL, NULL);
+		irq_set_chained_handler_and_data(irqsteer_data->irq[i], NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
=20
 	irq_domain_remove(irqsteer_data->domain);
