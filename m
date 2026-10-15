Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6954EDCA9;
	Thu, 15 Oct 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059110; cv=none; b=UUqYRoQx3P5E0p2Gvs0T3Pchx+7YYP4erVNehjOtXdXEYeH3ob/sxv3kXrqNYhTxOtMtR4S9u0NyXBssxehZVk0kpY5IThDwOONew4UHP+r1HBomi6XJf611XcIooOCFtLR84NvGl+IX+PxyjjoK6GQBb1vcBJ1tq8bMGe63mvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059110; c=relaxed/simple;
	bh=b9OcI0YlePHBv1+TtWllODhy2ZFgZpRZ9SMfllA8Ors=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rWWcmTNBsSGerMjs2Q2URjFfC+Nxb982+XWlqP9tHdOCUnQZ+ojYTNJK0gbLDQiA1HbhPWvOXm+N4v9q8bq3/UW8VCx0orQr8Dpqm3yalDCRZbk2WLT5eU1rCOY9d6PFdlbL4GJjEZK7rXqgJc2sbF8qv9ZcQgopVW11hKqbmPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VBywO9dT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KZNUdr9w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VBywO9dT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KZNUdr9w"
Date: Thu, 15 Oct 2026 10:11:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059107;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIHkkHO0jW0iYe7wTKsIofNUJD2tp87VFqJa+vJrDSg=;
	b=VBywO9dTF+S30328mpl/a8/FxbmT+ZwFjY9UZ/8lj6gUNJlu1kg47WNPcvlkSwyBy/tZwM
	41GqfKy7a4XfJTJzkareBd9IDh+H5WWph+MMAzKzDSVcJyCfORr/o0zjxq/fJC/D+R3mFa
	dMtpzUo6JP6YHhcogWWYTZWXSqWjVwjWW8Je34dZLXuJxGK5Al2V3kb8UMq0gcqZjesk9E
	ECmoxUaSNzktE6QQenS0ViwDbTgLaiU+x9CEbI4XK4xOFY7vQzjS5NPP6PtNSChruvu9XN
	d3vhhvIv1yUh/PGoQ0/lJcCqJe17plaYxWDXo6gKhj2VBDD6UYgkcHE393HIbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059107;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIHkkHO0jW0iYe7wTKsIofNUJD2tp87VFqJa+vJrDSg=;
	b=KZNUdr9w7nqvHttkYDw2DrjBRDxQxB4ocugMu5tq1snhXWFsErimVN/Jk8x7IF/rHzofvA
	zuUZArh7XnSJPVBg==
From: "tip-bot2 for Igor Velkov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/meson-gpio: Allow the GPIO interrupts to
 wake the system
Cc: Igor Velkov <iav@iav.lv>, Thomas Gleixner <tglx@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
References: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205910581.2666988.12781833288932853374.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     5b6e2a46b80ddbc93e72eb4f01519b0c8c3e0ef0
Gitweb:        https://git.kernel.org/tip/5b6e2a46b80ddbc93e72eb4f01519b0c8c3=
e0ef0
Author:        Igor Velkov <iav@iav.lv>
AuthorDate:    Sat, 10 Oct 2026 18:20:30=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:07:02 +02:00

irqchip/meson-gpio: Allow the GPIO interrupts to wake the system

meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
so enable_irq_wake() fails with -ENXIO for every interrupt routed through
it, and such an interrupt never gets IRQD_WAKEUP_STATE.

That matters for suspend-to-idle. suspend_device_irqs() keeps only the
wakeup interrupts enabled; the rest are suspended and masked by the flow
handler when they first fire. A GPIO interrupt that fires during s2idle
therefore brings a CPU out of idle once, gets masked, and the system
sleeps on. For mem the firmware chooses the wakeup sources, and this
flag changes nothing there.

Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
would end there anyway.

Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
controller: with the flag the alarm wakes the board from s2idle 4/4, and
/sys/power/pm_wakeup_irq names it; without the flag the board stayed in
s2idle past the alarm until a power cycle (0/5).

Signed-off-by: Igor Velkov <iav@iav.lv>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patch.msgid.link/20261010-meson-gpio-wake-v2-1-790ecc6df792@iav=
.lv
---
 drivers/irqchip/irq-meson-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpi=
o.c
index 91a9c33..e0329ef 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip =3D {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
 #endif
-	.flags			=3D IRQCHIP_SET_TYPE_MASKED,
+	.flags			=3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
=20
 static int meson_gpio_irq_domain_translate(struct irq_domain *domain,
