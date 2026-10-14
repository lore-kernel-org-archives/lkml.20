Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE74A99D5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009251; cv=none; b=gd8PY9SpjwY958wss0Q4u7/GNFahjvBUFJMSeyv+lBJTpJbwiEIp3BM2TQ2biFpkhJh45EyDMqlh+hUkJQQyBKSmbNfD3qvwkJIfgznMAMIML70Jut6/nalAsYU3Om6kwCmkTRQ8nktlVWUbv6gZZkqXBpsgRCxg+i768OOC7nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009251; c=relaxed/simple;
	bh=McA14YaWUl1UWCI+tv7fdrnCKKMMmGiILDSENOfbmKo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=eXojfzMH89EEriAGnMNYxoksr6O0F8lHmCMbHSsyxYqNop/cyaSS2CjJlK1ndIXsMPYlIUD9hKJX6PrB8sLAPw5r7bBq1KJHQh0HuHKhLcAp2ajsstlW4sifzUAwFT8SCYy06olMLHy7aTxYd/3uYnF+5MT/oPdhwoqWIXRAhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sYcjhdLV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=65JC8hu0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sYcjhdLV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="65JC8hu0"
Date: Wed, 14 Oct 2026 20:20:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009247;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUZVNA6YWPiqXdsWRl7PXADR0Is9wsE/dC9juVPtdZI=;
	b=sYcjhdLVeOmquXOBlTxhKtOQL2ZfiAhoOGA9IlZQWPCS8weIJVT/QTRhME9Yf1OkHJvkKC
	jzon+DJgHqaK+jEJGXDRCbrRJazzlk7h0UTfCKjtvUOnIIMNxFElT2+4qpbPMkRgYIMsbe
	2o10N6sf7KkQa/BsQiwdDhReraOOSgcjO6O+OgwGk4b97m0bHihTdBoJm7khVcSMn9ilT7
	V0Wg0KleVcBczcJCT0rlQGoNc3idPQIG3MzRJNQIQ82BflSFNg1qg2gAzOEguE1gPhZl9j
	O7WvaFyDccDGJxIoYP3L5zsr+Hss+dDgzY5uDT3B8SmgxCTWgxqSPp9CfI/WaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009247;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUZVNA6YWPiqXdsWRl7PXADR0Is9wsE/dC9juVPtdZI=;
	b=65JC8hu06Mn1jLQEV9OTx0XOsjmIOVw1v43dgHT6SKKP8ggbU16aJkFayWS8enWbM+UVaM
	T9ikQ13G1er8N4Dw==
From: "clocksource-bot for Wentao Liang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-econet-en751221: Fix clock reference leak
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Caleb James DeLisle <cjd@cjdns.fr>, daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20260915054552.1729612-1-vulab@iscas.ac.cn>
References: <20260915054552.1729612-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200924610.2666337.1817311872626639838.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     36790ef57803400339d8ea4081d85483264dbd6c
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//36790ef57803400339d8ea4081d85483264dbd6c
Author:        Wentao Liang <vulab@iscas.ac.cn>
AuthorDate:    Tue, 15 Sep 2026 05:45:52=20
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 07 Oct 2026 15:46:14 +02:00

clocksource/drivers/timer-econet-en751221: Fix clock reference leak

timer_init() obtains the timer clock with of_clk_get() and only reads
its frequency with clk_get_rate(); the clock is never prepared nor
enabled. All four return paths after the acquisition (of_iomap()
failure, clocksource_mmio_init() failure, cevt_init() failure and
success) return without clk_put(), leaking the consumer reference.

Drop the reference with clk_put() right after the frequency has been
read. The clock enable state is untouched.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
Link: https://patch.msgid.link/20260915054552.1729612-1-vulab@iscas.ac.cn
---
 drivers/clocksource/timer-econet-en751221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksourc=
e/timer-econet-en751221.c
index 4008076..1859335 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
 	}
=20
 	econet_timer.freq_hz =3D clk_get_rate(clk);
+	clk_put(clk);
=20
 	for (int i =3D 0; i < num_blocks; i++) {
 		econet_timer.membase[i] =3D of_iomap(np, i);
