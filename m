Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254009;
	b=GW64az78h17mU+hDv4Gi4MR9bVJUx1CIJOXcXgtylD7f53eOihRpkDQCfapk4o8VWAGH
	 hTD3k2ffBZMqTM/83BJxCfOnzB4+atW3aB3WnOW76ExOs++URi7rZFERBp2oMLcVkehWJ
	 Fo6mzmKJ+4kGqhCqc9rJBS5EvBubeXJ5FAZmW/fRIRd2I+SUmfjjCeylCxU11wIfoIVib
	 dzWjkmv7fg2bOa7Cm3DJ0/ibg+AuSwf4dDbDa8KB2Cs5N1m93A7OxuYJyx37lXPpLfWWy
	 jCQ7qoxpUgg8V2pFJKRb6VAU/e4yko5gljlt0wtLRZfpsieE7jXMDPijv/czwSyljqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254009;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=00eZo8Y6iTYx3GEpPCPOm7jULYnp63shYPGfAbzpT5s=;
	b=Cq8RLIaGZJXblVwnu5Ze5/+C84Ag1I+Wpy4HJ7kn6HMkqveqno1WdX5srubriFEVVgIQ
	 3S6bVAcFwP4bIyNMUWwxv24OnACOFVVKBinZoQwutxmYqC7bTUABf6bPI9r+QXoX497AM
	 cqp+zQxaE/4BRjGj9tExJ5EuWUyJuKr0ZkjGFvAEUxaamfJn7C8wDIuRP9oW6xS85MquR
	 Dm5ZOfHBZdOUJrI8jxUKoC9KA60na3U5MACtVZLTNeQWYJytPFzMa/1/JdWZzWu6UNcSG
	 0NVGAci5cYC/TjWugz2/QjKvedlm9UqSfuIFayY38aUCU72JqC/i4083UMqbWx+Nw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JHX9Fc9U;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Wm2J1v9H;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37360A2602;
	Mon,  9 Nov 2026 19:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF37360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JHX9Fc9U;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Wm2J1v9H
Date: Mon, 09 Nov 2026 19:53:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254007;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00eZo8Y6iTYx3GEpPCPOm7jULYnp63shYPGfAbzpT5s=;
	b=JHX9Fc9UP/gG3wa0GTKWcUAMXxHykpjJgO5OXr07xpU8oU41Mj61Etus3rXhKwC71jFEoA
	nPMsXDiddXYnwCHqE6XazDkOfqhSPTPYdeypjDNVxMsgqAwGm4ntECdrzFevDQBuq0qGYv
	y3WONzpuT0QGbhgEYKfZvoJppiqKLuUdBFhX91zfsq+9c6TuLwEYrdlMLZquf6JW2cObnd
	0zbzxHYytAqX5tok4hZH45CcYF3xRjUcKtUg/+w15VsM+/89gQosdty7ugu6TWXa4/OhKN
	nHpbSdJ8PWjb3UC+KMAo81GCDxgOEo5exTrbRDr88TK1r1uHDY18Ee8WvvUMKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254007;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00eZo8Y6iTYx3GEpPCPOm7jULYnp63shYPGfAbzpT5s=;
	b=Wm2J1v9HZMWqyCTkJNPMWYRuc6PYJtWWoRo6sHVQBY+5iIymd0xdywlI8igoSiEvbFWP+u
	bB4g/kJ5XsSEsBCw==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timers/itimer: Preserve nonzero remaining time for
 active timers
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102070148.1064849-2-thnkslprpt@gmail.com>
References: <20261102070148.1064849-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425400575.2093942.1967597616535278209.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     043c11572276048d458bee94773432241d4bdd3c
Gitweb:        https://git.kernel.org/tip/043c11572276048d458bee94773432241d4=
bdd3c
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Mon, 02 Nov 2026 09:01:49 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:50:03 +01:00

timers/itimer: Preserve nonzero remaining time for active timers

itimer_get_remtime() preserves positive remainders below one
microsecond, but struct timeval only stores whole microseconds.
So, for example, the conversion to tv_usec truncates a 500 ns
remainder to zero, causing getitimer(ITIMER_REAL) to report an
active timer as disarmed.

Clamp active remainders below one microsecond to one microsecond
so they remain nonzero after conversion.

Fixes: 2ff678b8da64 ("[PATCH] hrtimer: switch itimers to hrtimer")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102070148.1064849-2-thnkslprpt@gmail.com
---
 kernel/time/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index f7de397..38ffbc5 100644
--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -36,7 +36,7 @@ static struct timespec64 itimer_get_remtime(struct hrtimer =
*timer)
 	 * then we return 0 - which is correct.
 	 */
 	if (hrtimer_active(timer)) {
-		if (rem <=3D 0)
+		if (rem < NSEC_PER_USEC)
 			rem =3D NSEC_PER_USEC;
 	} else
 		rem =3D 0;
