Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215181;
	b=KSk4YjQVyOKDrYFHJ0Gz4GWL+bOnx/KlKCVwAsIMnT8TrzXe9H3YT74B60/OFWqHixBp
	 aICdAtfeAGrnKw0lkj1HaBfUf1QmldsD4yh8eldNE7eI1IxYv50v/vLBrjj5JU7kSm+oU
	 xOgyvRQYlLnqbSvdzbQu7s7Qot7h41DaD1TGxpLlSZLqRoDlp6WWeo64IY0lonaIsc5ES
	 Pnejs85uIgqCsVCPT/Cmq9okEl3iDiJywS0i3aBn+keVRrhkCu9Xzio5o6F1PAeOOXkhb
	 U6rwru/OB0ZK8bfadiz5wtBxuidOYlspYp7DSTJGQs4yOXLdmGkQp6I1axe3axjKjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215181;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=S5/ESW5GDOsCHiWZnBwFMrvHc59LNyO1Ink/NIKeyyo=;
	b=3oCvc3G12iY0lGgs64UfnA7W0Ir427JiiH3tmvAFjjQkOzQB6Dl+YmcGtNaLdWzpjT4X
	 UKkI+wcUTpUj2AiDqndZxdKkf5TWURWGMgNgYI+QXYQmq9q+amG7HoQxdYGzA5ahUGnA/
	 aCdYe0jLt99VK4k4B7aEM13Sl+Ttw9xUCHlnwsyRO0XUQxN3WcUxLYBNqIjX40qCIUIw4
	 U+S4VY1VSuJ4hXwXzVdC+uEs2dd81oXXz3cuX2f256ag7QTmaM8+fEoV7Mnqx5DwoL5Tb
	 KFXIi5WqbxEAMG9u/1XlBj0/TYf/HMAQiee73sFrhXiQ43vXGXUgtTgl0D5jyhdNiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="R/ggmFrI";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kQjizvIf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415F606EEB3;
	Mon,  9 Nov 2026 09:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F415F606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R/ggmFrI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kQjizvIf
Date: Mon, 09 Nov 2026 09:06:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215179;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5/ESW5GDOsCHiWZnBwFMrvHc59LNyO1Ink/NIKeyyo=;
	b=R/ggmFrIXb6z+LCwmvw8rDYy4MEV6MhM4eXDhc3nBdzFMvSfo5maXFIPdbOx1/qMT9Aw4E
	kVeRybLKKBJNkDa6WKRa3G5l3tBR3I28lbAkWTqjAQxYaWf9FNSRAkYXkS9ph7j2rcqjTC
	wr7+MDrY9NbqGK3499Ik3f/2I87qBNhD36eDzk5AMbYbG+tRTTjNZr7s6xj0LjJuPYjB+Z
	8jlUzXytSXMDBFMeY9JbigzWbWHM/28IWsXyA51u7FAbH7vNx7P2MrPlbruOw30WOpxbhK
	GWTs+pEDYeRhDQib5rAvBd4/RPrFYy7dLIfkidv0CAnRlN/Qa0JQuW8b3pZzow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215179;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5/ESW5GDOsCHiWZnBwFMrvHc59LNyO1Ink/NIKeyyo=;
	b=kQjizvIf8Cmv2U35vRMLgUaKaurbsMlxMXFA+cZEf3ZVOMbp96arfrO4Y9IlZkgRcaiq65
	rTWdu5iH1I0eP0Dg==
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
Message-ID: <179421517774.2093942.11509815958082503513.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     6731bbeffac13ca8143e4803e08c83c237334e74
Gitweb:        https://git.kernel.org/tip/6731bbeffac13ca8143e4803e08c83c2373=
34e74
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:49 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:07 +01:00

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
