Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174585;
	b=zFEswvqSOn0abVh8ssLktHaGFq+WGhp7pwYlEtUr5MpeP+pKNBnp8YBcvNKkIV3gINEb
	 9GUYhTKv7AMagzKlB8CDZVZW7BOH8r8MKvMSuz+SfPqi0EVbLHw3pITXh++AP1Gfhi+TZ
	 q5GRlwMobK3Yu8FTZRSFBPhXMBj3ym5YLCzwuF6x17tcC9TnkotJumkNWn/1CjDIlp5IS
	 IrXC6Az0u/R6OvC3zBDsFrorV9uMdeqxZfLomjchBXPXv+hzk1oBBKFKjMHSwW/LeNydl
	 U8tINphrKgTSHb7QoZxLZt2bCjJxhhDsGOaCp5J+InVdQ09IQMelJKZ/KBDovCssHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174585;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=BMX8ZOHMOC61gpRQOKmRVk/VSqO+Sw4o2ZTX99qhB/0=;
	b=izg87gVneVCPv/V87uNJyggSUkeCaFgLgXd/mQ7utdWW/iulyCAdzu3PHH1ORzwpwV+r
	 JVtLeeWwuFmZRdJPR3Upc0ZmcthCwfqApMNosKU88eXUQla9l4LXVeGhzxM5f3hWY8OHN
	 J1Dtl0K46XlHzi2iX7rZfs5o45FVZuzdskpQt5kkCPhB0n4I/7fBKEaAVZxAdnTQ1EoEl
	 GxnXUIXwCriNYdg876qPmdANx0z+HTzLntCDmOLPp5HFoGcTylr/JrUNQlenpDptrIrHi
	 S6xdlKOPZZzMwPjkTgYi4BTHwdAYkQUJxNbO0pHlgVGan1woS4iQ75w/9f7G2xc/tTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HbMZrAxt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jud7y31g;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290A606D82C;
	Sun,  8 Nov 2026 21:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C290A606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HbMZrAxt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jud7y31g
Date: Sun, 08 Nov 2026 21:49:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174583;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMX8ZOHMOC61gpRQOKmRVk/VSqO+Sw4o2ZTX99qhB/0=;
	b=HbMZrAxtCsF6QFN+NNVovJLqyoVjot3yl72FCat4OdTJv4fG/SXlfskj47YNKBwUHZHoRz
	QwxHZZZbihjANcqxnXhak4lBVWG1AeLGHehkDhM9XEYdxeDka8SeprQDcBEZ5oiomtCVlC
	qqAkQ3yjavRE8LJ9TamgbnaUG5p5e0/io42YJM3mga3CTlXq+CXx3gQY6Trh696MuFIFPv
	xZAMGK40Fi0hJnKzu9u2o+7llxaC1j6i72lu5vm4VWsOjNx30wkfaZr8kof0frZ8r6YIov
	6rDtCMerEbZxsjtSCueBlWWkJCjb/XxYjMeADejKegjYWanHE38sjffDvDD0NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174583;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMX8ZOHMOC61gpRQOKmRVk/VSqO+Sw4o2ZTX99qhB/0=;
	b=Jud7y31gL+EBrLN4d6sCrw5hjtkO8yald/e5RC7NH1bGxTyXzQQM+WF4jhMfw3O8+dquI/
	V5KEKeVne8QJkgCQ==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Call chained_irq_exit() on
 the handler error path
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-2-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417458134.2093942.18043225376910890919.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     7f9b59f3447ad278768ad775c1753f82e720798d
Gitweb:        https://git.kernel.org/tip/7f9b59f3447ad278768ad775c1753f82e72=
0798d
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:49 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00

irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts suppo=
rt")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-2-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 87b07f5..1b8d0c8 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *des=
c)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
=20
 	for (i =3D 0; i < 2; i++, hwirq +=3D 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *des=
c)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
=20
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
=20
