Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254010;
	b=u0LCLipBcUtNqWUZiUFA7A/SjzyCXYxBQ3cw2gCbcDnVOpxrqKRXxL1bYtvQCn/9APth
	 QNfi8xFoI4g/c+q7Ti42TSz+0Njdm15PIP1m46G+jwjQQgNHsWhnomOrimauuXG6rDXpc
	 t7fP90b8yP6kukQY9Ptck5FSPWZMnx8JkxD2K6pkYcXfUdStID/VoKxlO1JVhfkdrePuO
	 wrHpnQ83+3yLD9kRfTT+pFONY/k3t7uL+Z6m5hIGMARtO973pFQOD74W5tYvaI2nuX9Rg
	 SJC2fzr796SH3wa9rtFxwylll+rp7Fkd9YtmTcZdoUmTGmFqj601Y+3TA0RCZ4vJtbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254010;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=eF5uqyDisdinAndB6bHTVRQqFayBVgPW+e94lRxXAH4=;
	b=mVihBixEnwLrOqBU79+Xv0HXsGrasy1D3pkuBeqgiQCPLWRtqD7cZ67syiY720aKROX+
	 uB3HTPzVkI4f3rTfrUYAoCeNzDHr/gE4IgHKjarSCGVBv+jUazbSJ1RcMU3pUfB5VyDGd
	 cpWksnchiMij+PXd5JjvvcWyiv7WcvbiRpSUXwOXOg7zzFN2cmvywbI2pz9SdtfWZlQEE
	 Tm6/rpJ3j2y0h7fyyi665FL1FY55K7THgYdqHW1T/2keeIihYKjO09SxY0ddDmOp8NHAr
	 fJ2qZLFfYLtGHuQ53Lq0OOwM1O0W2bFqi/hkehu7ePsHrrxd3DDGnIvs8PrZTvjfB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bHwVulgG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fZ4AVGVC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917760A2633;
	Mon,  9 Nov 2026 19:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5917760A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bHwVulgG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fZ4AVGVC
Date: Mon, 09 Nov 2026 19:53:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254008;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eF5uqyDisdinAndB6bHTVRQqFayBVgPW+e94lRxXAH4=;
	b=bHwVulgG4svw9FkL4p3lXoK6Q7nPmlnXDbmROVaTvRVCrOxRgXACCH9YSCXmqEf8JLn/Mf
	FkpeC0NdvRR96ipWYRwIhD9NXFNBnR03/ekbK9aEKfnBYMUCCdY7Yn97zjVK/2zdTckyzZ
	chLcu5u6zSgOIKOpUj17ykqoUMBP3s2ynysSG4fUISKhqmElEZV2Zj0Iq/Fb9cbi1ZBZoO
	HO2iQ45LkZdJNWeO/xFB+E48hvdIW7u64Qp+m9BGnU6JCUc8nJnBJdNhqfAx2tR5yW0cTq
	mwcQQgfbqoKorzlmDicv2xocuCjExpBbrcf9SFu3tCagH3lGgErNuWGGEOGP9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254008;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eF5uqyDisdinAndB6bHTVRQqFayBVgPW+e94lRxXAH4=;
	b=fZ4AVGVCRiKETVZlGGiizw+t75F5n+LodN70C9vSvLCmxFe9oRosCFY5kV/i6nEu8XcELB
	5k3NhXT99Yd6GdAQ==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timer_list: Stop hrtimer queue traversal after
 seq_file overflow
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103103438.2154751-2-thnkslprpt@gmail.com>
References: <20261103103438.2154751-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425400722.2093942.9976833909891564962.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     f6fb9be3bfc9a42e478e7fd7e37408be86a95b9d
Gitweb:        https://git.kernel.org/tip/f6fb9be3bfc9a42e478e7fd7e37408be86a=
95b9d
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Tue, 03 Nov 2026 12:34:39 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:25:25 +01:00

timer_list: Stop hrtimer queue traversal after seq_file overflow

When /proc/timer_list overflows its seq_file buffer, seq_file retries
formatting with a larger buffer. print_active_timers() nevertheless
continues scanning the remaining hrtimers, restarting its quadratic
traversal even though the overflowing attempt will be discarded.

Stop traversing at next_one when the seq_file has overflowed. Preserve
the SysRq console path, which passes a NULL seq_file pointer.

In a (virtual) two-CPU KVM guest with 2,048 timerfds pinned to one CPU,
median reader CPU time for a complete /proc/timer_list read fell from
51.1 ms to 14.6 ms. Repeated tests showed no material slowdown for
non-overflowing reads (13.7us before versus 13.8 after). Short reads,
seek-to-start, and SysRq-Q tests also look fine.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261103103438.2154751-2-thnkslprpt@gmail.com
---
 kernel/time/timer_list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 0406bf4..84275b6 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -64,6 +64,8 @@ static void print_active_timers(struct seq_file *m, struct =
hrtimer_clock_base *b
 	unsigned long flags;
=20
 next_one:
+	if (m && seq_has_overflowed(m))
+		return;
 	i =3D 0;
=20
 	touch_nmi_watchdog();
