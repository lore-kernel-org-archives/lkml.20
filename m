Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215174;
	b=q3aT7+YkbEvFFMrdN0ahNQAbLhWk7kGBJJQdrvlFIK3oWSC7KxaiOouo8dVjKm5nPR86
	 lIqsVj1jqUXG+6YLZ679WhGW9dH+9/vJRmKaUJBXjG6rhWf4NAJw+dwP/DNeLQwnvkniM
	 U7ElylxSWKUCxIFYaICsCxhToA/AuPpi68vFDIPPBcmcZuVmFSrt4J7NJTO4x4s6I0vl8
	 pMSjeoLa5ipm+ozAIHKOJK6Nng0soLF9n6CxMn5upArJc+qHxfgLxbJtxPwtg7yqq/VMh
	 2jYqXAnT9RZcRZuk6AGJj8jRtXTrNK0kTuUP6Mpg937pGK3PxHliBvq0B69ujvxn23g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215174;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=jzEUcszVsZLLoGeYeJNsDdC1//9OG1FdGjllJmgVc6I=;
	b=us0pW40JpMSMQEUtvYgH4XPC9OU7nFFBAsbePwjkuhepcHoV7+jDxXUSUmCo2Y5YsK4E
	 HGJ9ydiwhZQyh3IQQqwNb+X2IZ9FpV78rtCl7NEU9Wrv2dXuCP7jsw7PoA/wQO9k1rqEV
	 fYqvbu0+0xWlauVt97MpE7hVXOh6JXyqXZP7UIBxb/xeDOaGgSWsEd3I3YDglIujh1H5N
	 Kb7lKX9v1ypXB4GU7ycBIMOEhecYnlEoF1f0sT/BGmuqgi2duzjV4d3SGJn5HWDI18234
	 qwXkDb3m3xsZqGCxjuLYFwGAvh1HAsie1J0SPLDPyYaY6BUk/HIhs4jqzw9e1clUQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cry8EQOv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="awd25Q/L";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA04606D829;
	Mon,  9 Nov 2026 09:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA04606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cry8EQOv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=awd25Q/L
Date: Mon, 09 Nov 2026 09:06:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215173;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzEUcszVsZLLoGeYeJNsDdC1//9OG1FdGjllJmgVc6I=;
	b=Cry8EQOvJPX640X6e/p6IxSh7xfSFXbDQoLz0B5AfNkati4s5Dk4vaF3p2ZvAEOJBDh6hZ
	b/vtN+mZXl7Gf3NcGyxZtjbEA1SeUXm7iixMyNQ4Xz8Dx2KOj/6Ily+1IMKkLx5TxwZq1R
	aHbHAKp4ZYTaQuL4Ud3Fzj7G/sJV5Ezcrl86gaX5jALwLV3Svjhgnh1X6Rj0Txy+S+ibKa
	VK3gKcFgZ/mCmwhpGd7c3XJEUUbF69vhPotjOMwWIDLrF3DTmeqeGlAk3Wn/x/fsEUGHCD
	HKXj+bvSxe6qlT6MsuKw8W7lgD2Pst8v7c/XvmNZUL5bWy9SWaMg/yOUsM26Jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215173;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzEUcszVsZLLoGeYeJNsDdC1//9OG1FdGjllJmgVc6I=;
	b=awd25Q/LUOa7TFG3MgfsBMxzEbfpFC2rwm7aR7CRxIzgM1aULSbTWm/fTTz4wdjI6Xfrwn
	qUrVbD70S2tL64Cg==
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
Message-ID: <179421517137.2093942.15604929734468265700.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     875a585ec41b7d8e20e82fb66e544800dae28c3b
Gitweb:        https://git.kernel.org/tip/875a585ec41b7d8e20e82fb66e544800dae=
28c3b
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:53 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:07 +01:00

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
