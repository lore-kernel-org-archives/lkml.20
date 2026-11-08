Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174587;
	b=aQx1KzokpilzyKjU5M0kXXB4hF9U7W4JyTmBfk8YnPHGkftTUsb8Dw36Q6MvrO7xWGjU
	 6sLSJmtVBAdF9XZEAjc3OYQOq9Mp730L2uLwwwKfld11ZiFjD59/U1NxG0wpN1PSHJvk2
	 1FwKclJzfloJ7IwJm5na4pCly+yj/i83Cj24D3bRphex/bc/3T5jdTEUAJcHTlTyg1j7W
	 ay2lYEvaEgKQ5HoMRkAFeXXqQzVF1MUMLjlXWmkA35BHJdHn6757cMukiGOuXNqC6FmH8
	 3bh/0+ES4KBlM21N5R2Vtgv7jJ3H8iXi+HAWZjO/2C60YWfaVJdwy1Vut3JeHT9z4+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174587;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Ds1vGYi06IDtrERMc8egowDuQYn1y7mXhqlbOZvkhvM=;
	b=R36tGviOTb38Go9S4fMI5zXM/J/FQRPH4LhECzS7jW+XG81OR/M12Zv7XseJ2ZXAfGoD
	 ojZm4I+pDhGoY3EFPFQxDM4Mz/yJKQqZlqoo2rspE6pwieV/M0xkIO3WAwWS9A1e6o9V9
	 bcrVX0FB5SO8QFMqmhbEsFaoqTd35zHvlDsiO/FR1PhqSmf8KhzQl6Eidal9ub/uQaxnq
	 cIShMXV2UbGgHW4RKN9Hd8s+Id88kKK8Im3QAVV8c5pk4WTkTWBoayFOjWw8c4NELa0qq
	 uN/ERCTElFBRIOEo2HEUx+QtjVNOdbvv33HWii6t9f4Z0vqk/oyrJGgc27m1gnoYfVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=n6ipgnkr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CSCNo8Mf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A3606D80E;
	Sun,  8 Nov 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295A3606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=n6ipgnkr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CSCNo8Mf
Date: Sun, 08 Nov 2026 21:49:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174577;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ds1vGYi06IDtrERMc8egowDuQYn1y7mXhqlbOZvkhvM=;
	b=n6ipgnkrk5qBOlnp03/HfZUzswsPs7reM6y1VL1qy3mp4LaFo/j3/Jvkw9EZ9ovdpLhfOU
	cUpJQvrA6H9Z+TFx5ho1eUok4Vqwyn9Mw1sNd3n837qndVppYbAJaosG5UYUi2Uf66XBO8
	iks2b/GAdli83gGWSSkNPemL+KgdQXiR6TmXhQtuqnqbJI3co9t6pMxtV44ccUKzTxcuBI
	8BzbqvtS60Y/BhIUB4JMvJtJ+NL1TWM8oWOuxd4hJWVstgkJ9eMaDcBNeOzQb3F9yNHOnt
	X2yHp+Og9WnzGJetOTjjiEhFmbC+etZI748Y+Gc/bi0kYxdxADWLl+CMttFflw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174577;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ds1vGYi06IDtrERMc8egowDuQYn1y7mXhqlbOZvkhvM=;
	b=CSCNo8MfDZRnDW+pQc3oexVZkBuJ2AXjFObXZlZO6O8jVUXyz+LZOLV0djgMoIcaf0Eihm
	LCB/+GP/3teI86Bg==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/imx-irqsteer: Mask all interrupts in probe()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-6-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-6-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457566.2093942.10211601329840267009.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     f98835ded6dcbb9df327023320d1947fecdfbff5
Gitweb:        https://git.kernel.org/tip/f98835ded6dcbb9df327023320d1947fecd=
fbff5
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:53 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:44 +01:00

irqchip/imx-irqsteer: Mask all interrupts in probe()

probe() sets up the chained handlers without first masking the input
interrupts. For a built-in driver this happened to be harmless because
CHANMASK resets to all-masked, but once the driver can be unloaded and
reloaded a child interrupt left unmasked at unload time survives in
hardware. On the next probe() the parent interrupts are re-mapped and
unmasked before the new domain is ready, so a still-asserted line
immediately storms the parent with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers.
CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which masks all sources at probe() time.

Masking is only done in probe(), not in remove(): the next probe()
quiesces the hardware before it re-maps and unmasks the parent
interrupts, which is the only window in which a stale line could storm.
Masking in remove() would also mean touching CHANMASK while the device
may already be runtime-suspended with the clock gated.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-6-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 9bf739a..7451c15 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device *pd=
ev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
=20
+	/*
+	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
+	 * has inverted polarity (a set bit enables the interrupt), so writing
+	 * zero masks the source.
+	 */
+	for (i =3D 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	platform_set_drvdata(pdev, data);
=20
 	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
