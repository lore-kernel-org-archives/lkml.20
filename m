Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CDD513558;
	Thu, 15 Oct 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058102; cv=none; b=VxnYhACVd7Y28O7rLA8rdR8VpCUBKybWZKWJXMGk4cGae2YM8gBs30JIRgzL0UtqmsUZfHWAktHihpDuezh1V6qms46wvhskyjvsZBDbvBQb+n+WAneDvs3JZDS2B58Shz6VkJrVLYDjZH0logSGikK2XYezrlpFd6VaDNBf+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058102; c=relaxed/simple;
	bh=OY/C6UIC9bPNyxZV6Da6l/UGXyA8ERRzA6D7FheysQ0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RxjbGOxxkmNQhqZHC3apCYokpJEYVGat4T7SDTcncfdGffCkH5aBeDHu4L/5Lm8AHIoH1319bOVOwKxLue0rzzNVLWRl+QdmAxJvYYpz/jlfIqdIf5jXdRonYwjKnKgBh5ng9xLdOTjnPXJGzTP4nOLWV2m1kiVPLPWr8v5RE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fi3BIN56; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p7rYv2VA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fi3BIN56";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p7rYv2VA"
Date: Thu, 15 Oct 2026 09:54:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058092;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vigKIP1mwK8lerqLJ2uM+sXJqG/5AnVheyysTci4nAA=;
	b=Fi3BIN56ONxDVO7Jkdt+PKYEujcXpgaRr/HbUAsFWv1ez04N7d4GfhteamiRkNuU3YOT1F
	TMjSs6O12a7ZWme+H5ycJtipI8coNSNO1wuXkPCqFcG9GvL8PtaAOuCGg4kQDm1GJC8b83
	rCU+mR5ZkgYuvjzRA2D7XlDmQJ7Sxa7VjnJKMOmcOHF2snd74CNEMootfjekF5fPMiHla3
	P5OvatKgn2KHn5IKYMXL+oYByhP251Bh4azQJa8/yFTDbEoKvPKWGyJsXEa5E8nTxX70QY
	Hv4iRS1qO5fQhMM7wtPeIaQnaEAXX8L9SNyzn37x6hs6D7+L54B+Fa8hNP6Fzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058092;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vigKIP1mwK8lerqLJ2uM+sXJqG/5AnVheyysTci4nAA=;
	b=p7rYv2VAaXiGVIw9MHsBEmFIjED0WL1nHKFvEsQpkpb1MLvtb3vyFIZknYlTaaF3/DnvDS
	l4aIZ5DmCdqYy6AQ==
From: "tip-bot2 for Triet Hoang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Cc: Triet Hoang <triet.hoang.dev@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917013835.223139-1-triet.hoang.dev@gmail.com>
References: <20260917013835.223139-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205809064.2666988.2020892854881598940.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     e571b39dedb10e64ee97f43e2f51ec918089a0dc
Gitweb:        https://git.kernel.org/tip/e571b39dedb10e64ee97f43e2f51ec91808=
9a0dc
Author:        Triet Hoang <triet.hoang.dev@gmail.com>
AuthorDate:    Thu, 17 Sep 2026 08:38:35 +07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This allows dropping the __maybe_unused annotations from the PM callbacks,
also reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260917013835.223139-1-triet.hoang.dev@gmail.=
com
---
 drivers/irqchip/irq-st.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
index de71bb3..fef0521 100644
--- a/drivers/irqchip/irq-st.c
+++ b/drivers/irqchip/irq-st.c
@@ -157,7 +157,7 @@ static int st_irq_syscfg_probe(struct platform_device *pd=
ev)
 	return st_irq_syscfg_enable(pdev);
 }
=20
-static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
+static int st_irq_syscfg_resume(struct device *dev)
 {
 	struct st_irq_syscfg *ddata =3D dev_get_drvdata(dev);
=20
@@ -165,12 +165,12 @@ static int __maybe_unused st_irq_syscfg_resume(struct d=
evice *dev)
 				  ST_A9_IRQ_MASK, ddata->config);
 }
=20
-static SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_re=
sume);
=20
 static struct platform_driver st_irq_syscfg_driver =3D {
 	.driver =3D {
 		.name =3D "st_irq_syscfg",
-		.pm =3D &st_irq_syscfg_pm_ops,
+		.pm =3D pm_sleep_ptr(&st_irq_syscfg_pm_ops),
 		.of_match_table =3D st_irq_syscfg_match,
 	},
 	.probe =3D st_irq_syscfg_probe,
