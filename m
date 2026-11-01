Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515820;
	b=WNVyAx51aw5GS2FobdxNd58GbExewrR2qFhw7izgcnHww2BeY9zqkEelDPQ+VDkX6Xd2
	 1UZQfBMUoa6y34hMWdV6A4lFfT/U/OOSo+3UOrt+hrwYiLMIcHrIiK9MHIn4dHZYQnVsP
	 exYAFvsvMqpyhm5fel1tvkd3ui1A8kUlCqhoJhTyWP5f5Br0sl47LLZH13lyGPH4N2Ulr
	 blHd4lWtj0NZJBEwjY8b2DOOaivQb5/M8HsUVEWNIHjHpMSubob8BsSaTrI3EkmGgjvbC
	 ejXJaDlUtHYkLXrMms22YdL/2pbGSDoykVCmjUfw82Jtrl5SMdiNmm337NxNF4+5E5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515820;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=UQZfGIaTCarvVMDojBbXVimDrqEzqvxfF2captCvic0=;
	b=SmCZ+UxW3On1fCuvilodw9GSU1OXmxjv5cRxMjujrLuWgCWBndayaEk49EXRRTDUD5wl
	 mKK4VWnCrLcTVq0HYLGXrl6x67ASvBUQrp9v5KRWyfJfk6vqDVrvA3Dn0q1z6QdZoPCIq
	 SREb8mBgdjgHnsfW8wFQuRaaHro28BxrlsXiLHCNuhae29s7YfvUwY32WKbQ1qO6qL81h
	 fMF+yHy69fMcNwpCuPkGk55eoZt8fohjBdzUCjd8BSpgrjPspZZrrvW+CG7nQ72LBmKPK
	 SN1VXrHpZ2vQPL27fuFgccrgZkCTEihw/hKqEza48g/9LiIEAYoZVR9NrHy2DM+toMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EdM44Ran;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qTSeW6R4;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9C606A324;
	Sun,  1 Nov 2026 06:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C9C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EdM44Ran;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qTSeW6R4
Date: Sun, 01 Nov 2026 06:50:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793515812;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQZfGIaTCarvVMDojBbXVimDrqEzqvxfF2captCvic0=;
	b=EdM44Ran1m4K5cDw2QRh4qsVmh1cZ3Ue36XMO4iqS/uZvKzk93lQEfAsFJHi6/d6YgQCsC
	3MkJ5WIwATay5VdmNrJjEawbifTFhj7d8n9V3qgrUNMXyv6T8MDQAttLz2IdxWxhuiFIvc
	3TDGAQODaI12UyDaPwNKBV+bP7xrqmSQ+F1jJdyjhBaSlDlg5AfZcWyEZgJljjiCEyl3sB
	In6JFnEljQZThqETYckscpX+zInuSjOEiEKEG36K89lAKHmGYUqc0MWcabyNe3w50w5qlW
	Q8dkFcZIUl47a2eYz8HIpEZbN7TWaXXigsyTTXfLdxMZ99MigVM/HdxHLjuXUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793515812;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQZfGIaTCarvVMDojBbXVimDrqEzqvxfF2captCvic0=;
	b=qTSeW6R43raptgAtGh355ij1352auiHQDWdgwEQab6snfWkBqUcBZGMYlDZkLyXZVyEL6a
	gPfytHi1+ot1U0Cw==
From: "tip-bot2 for Stian Halseth" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cputime: Don't warn when the tick period
 starts after idle exit
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Breno Leitao <leitao@debian.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Stian Halseth <stian@itx.no>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261031081408.3378884-1-stian@itx.no>
References: <20261031081408.3378884-1-stian@itx.no>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179351581025.1009794.16515060709486846102.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     b327e63683a2b894b500027375342c25222b58ef
Gitweb:        https://git.kernel.org/tip/b327e63683a2b894b500027375342c25222=
b58ef
Author:        Stian Halseth <stian@itx.no>
AuthorDate:    Sat, 31 Oct 2026 09:14:07 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 01 Nov 2026 07:32:38 +01:00

sched/cputime: Don't warn when the tick period starts after idle exit

kcpustat_dyntick_stop() warns if idle ends before the tick period
that the next tick will account has started. That happens on x86 in
a CPU's first idle period with the tick stopped, right after the
switch from the jiffies clocksource to tsc-early.

On the jiffies clocksource ktime only moves at the tick. When the
clocksource switches some time d after a tick, that d is lost: ktime
continues from the value of the last tick. The next tick comes
TICK_NSEC after the last one, but ktime has only moved TICK_NSEC - d,
while tick_periodic() still adds a full TICK_NSEC to tick_next_period,
which is now d ahead of ktime. When NOHZ starts,
tick_init_jiffy_update() rounds it up to a multiple of TICK_NSEC and
the sched timer is armed there, up to nearly two ticks after now. A
tick stop saves that as ts->last_tick, and an idle exit before now
reaches ts->last_tick - TICK_NSEC sees the tick period in the future.

Nothing is accounted twice then. The first tick covers a period that
starts after the idle exit, and the code already handles it. Drop the
warning.

Fixes: 96a494c9cfd8 ("sched/cputime: Don't account idle time twice after dynt=
ick-idle")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reported-by: Breno Leitao <leitao@debian.org>
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Stian Halseth <stian@itx.no>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/all/auTCQauaU733PY5z@gmail.com/
Link: https://lore.kernel.org/all/CAHk-=3DwinC2u2D1FAX5grfq9F=3DbxmARxhuiQ4Mv=
HAiJFu3iF6gw@mail.gmail.com/
Link: https://patch.msgid.link/20261031081408.3378884-1-stian@itx.no
Closes: https://lore.kernel.org/all/bfe9b14a-6e65-41c5-b638-26f6e033788b@molg=
en.mpg.de/
--
 kernel/sched/cputime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
---
 kernel/sched/cputime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 9e0fb86..17f3cbd 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -478,7 +478,12 @@ void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 			kc->idle_tick_overlap =3D 0;
 		}
 		tick_start =3D max(tick_start, kc->idle_dyntick_entry);
-		if (!WARN_ON_ONCE(now < tick_start))
+		/*
+		 * After a switch from the jiffies clocksource the tick can be
+		 * armed more than a tick ahead, so the period may not have
+		 * started yet.
+		 */
+		if (now > tick_start)
 			kc->idle_tick_overlap +=3D now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick =3D false;
