Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2316E4A8A17
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009249; cv=none; b=ozpV+o3Gs+yEJnAmx1IlmOF+u1GDygvOOUYwiF5paUVEfN/ihr5MHchV9WNSvIyYv3VydXp2Vpwlj2zXpjsXPpSpFspIn33edjYldnBlJt4TLQA9EXmUeDNBryE1VxptgXfCvdUEKMPcDdinVlf7zUrX1fqXR+Br5x5R+S2XESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009249; c=relaxed/simple;
	bh=QUWYSZt6Mnq+Lk+qvi4n1AmLX7BAMEys0wZ8MsNVvx0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=JwGFtBop6N+moS+t27YltzS95/oTn7MHGAEjspXi1wroVZLBHXqVr2n2M1CIZFXmmDYjrlCivzmQLBK+Qrk/GAE457q+RWY8W4WhdIf5LLahd6WIS8MRx9CscROMNh+Bq1Rs85kp/UfhaKrJpZVtUQQeCMRRIDsZCuO/fI6X33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j6FRhSSZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RnRiUdhF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j6FRhSSZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RnRiUdhF"
Date: Wed, 14 Oct 2026 20:20:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009246;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDaOachM2UyqQFMe2bLCWLhI3vqpokzm1Xy8M/nWLtQ=;
	b=j6FRhSSZaYVmfPHg3gY3jLne2Y0CRFBCHw/iL/92zuNmCX0k9W44gshVFlDofH0N+tx+EW
	hO6Zo7z/vV+h4cV6oqSnBJsYGowSQ4wmJAsf8W9R6CSI2LQmgdhgEfgja89amfPPHq6W8K
	riaQlYvw5igNQhis5bPILUbhoY2Npr7NMEhY/exIbvXVI/qHxynq6vm9uw8HYhwBYlIhkK
	DIpiI4YO/j4Qyjv8syV3ne2sbHJOJWv1CCxO8dqdMD5bhKthv7spR9zawtLtnwa8C/9qgz
	xm9/EYQTX8osyVUZuLpcw05EgDyRFDskpL0zJrj+boGx/8CZAKELyKrWaYmlfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009246;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDaOachM2UyqQFMe2bLCWLhI3vqpokzm1Xy8M/nWLtQ=;
	b=RnRiUdhF4nXHjn1LtB1o6wwticZZy2WQvZFKMTkV8AZPiU7TI3zm49yrl0FuUrEdRhh+5X
	+LwPy+8zBwdKZkDg==
From: "clocksource-bot for Luca Leonardo Scorcia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Fix random crash at boot
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261002072115.169250-2-l.scorcia@gmail.com>
References: <20261002072115.169250-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200924459.2666337.2191849978590778262.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     8496a1d234e8cf9cb15c4282cb3a11c6550bd242
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//8496a1d234e8cf9cb15c4282cb3a11c6550bd242
Author:        Luca Leonardo Scorcia <l.scorcia@gmail.com>
AuthorDate:    Fri, 02 Oct 2026 09:19:26 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Tue, 13 Oct 2026 13:17:13 +02:00

clocksource/drivers/timer-mediatek: Fix random crash at boot

MediaTek bootloaders generally enable APXGPT timers at boot. This means
that a timer IRQ can sometimes happen between the IRQ line request and the
configuration of the clock event handler. This leads to a hard crash with
an instruction abort, branch to pc 0x0 in mtk_gpt_interrupt handler as
clkevt is null.

To avoid this issue request the IRQ with IRQF_NO_AUTOEN and enable it
explicitly after the clock event is configured.

Issue was reported and fix tested on the Lenovo Tab E7 (TB-7104F, mt8167).

Fixes: a0858f937960 ("clocksource/drivers/timer-mediatek: Convert the driver =
to timer-of")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261002072115.169250-2-l.scorcia@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index 7bcb4a3..e20075b 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -277,7 +277,7 @@ static struct timer_of to =3D {
 	},
=20
 	.of_irq =3D {
-		.flags =3D IRQF_TIMER | IRQF_IRQPOLL,
+		.flags =3D IRQF_TIMER | IRQF_IRQPOLL | IRQF_NO_AUTOEN,
 	},
 };
=20
@@ -298,6 +298,7 @@ static int __init mtk_syst_init(struct device_node *node)
=20
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
+	enable_irq(timer_of_irq(&to));
=20
 	return 0;
 }
@@ -334,6 +335,7 @@ static int __init mtk_gpt_init(struct device_node *node)
 					TIMER_SYNC_TICKS, 0xffffffff);
=20
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	enable_irq(timer_of_irq(&to));
=20
 	return 0;
 }
