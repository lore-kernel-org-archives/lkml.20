Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C7645D1B1;
	Tue, 29 Sep 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708743; cv=none; b=qSIullgHzgF21ag9t4y+xBfkNhz9wzHSVLPNOmH0tMDKawVI+76bKH+VbT/UUgD8i6Jdhs3U6ATrOKCNpMPDdJBzaOE+6W229PegDH8WNtbW8HgRoxFiInfs7lm7nJgo80GNJEclGN6H8kOlqeC7zyjUMXM8n77/kvR3X6wJbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708743; c=relaxed/simple;
	bh=gAmvXG+jm9Ke2W7Etx56qmYVJcDV9kiWi9uOkyJ46+A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XNNJPpY/QoUcGiBGSJpMGXUMdsw63RIOnhuJuchMLI+qOTKXrZOMRe90iCMR9aAGYtmsGjaJ0JdW0hetWLrP2/WZS/PvLiL9TUe+elWUdBzVLSGqDH7LgMxrDhL7iaKzPeXE0TkDFKKDGH5mTP58Ce7nAYOHOF38m0hgCPue/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WqG1aGco; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6ElnMunb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WqG1aGco";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6ElnMunb"
Date: Tue, 29 Sep 2026 19:05:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU/lGrh3mOPG95GFiPUV/Bds4F3nZj0Rr3tUXy0tCi8=;
	b=WqG1aGcoHHpvnhfy4tpqvZc8BNqhfrp9ps5E9bLH6cGHfKhzLFVqTTgq/XrgwGiWncUCRP
	Y+aoQO++AF1LgaPoWLiBYWQ4IKjUsPCwQps2I6SOTFlI92ucKCygiR8f6noJblQOSfTh8W
	iMiuEY5bTfby8Slp37u5FP01OHoqniGhWWqskfSE9SjpUsUhlagNoKk8O9OIE2VZ2lG5XU
	tyduRvNYNwvMdxxRAIwqp09YpLKLqPyyWfo+foF5l2dAaXslEC2j/rurjD+4X72UnA6xAL
	9Nz61kKBHNOWYlu4I21CZRo+tMTWdcI0QKVNgL4AJb80QHzSk6qf5B74mM3HSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU/lGrh3mOPG95GFiPUV/Bds4F3nZj0Rr3tUXy0tCi8=;
	b=6ElnMunbNT9XyiRjepfI/238gZkbxeW2fsBEMXxU4BOuh5mswHKgZyImhQusNKSS+tQOxU
	dwJhKPtH30P1K5Bg==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timers: Use accessor for hrtimer_sleeper ->task
 field in sleep_timeout.c
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Dmitry Ilvokhin <d@ilvokhin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-6-paulmck@kernel.org>
References: <20260919001428.3133388-6-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873623.3910103.2480527277700498080.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     9b7bcd671e9c979f16c48589f4b9b6c684ab052f
Gitweb:        https://git.kernel.org/tip/9b7bcd671e9c979f16c48589f4b9b6c684a=
b052f
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:22 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

timers: Use accessor for hrtimer_sleeper ->task field in sleep_timeout.c

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to schedule_hrtimeout_range_clock().

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
Link: https://patch.msgid.link/20260919001428.3133388-6-paulmck@kernel.org
---
 kernel/time/sleep_timeout.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index 3c90574..ad8c415 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -212,7 +212,7 @@ int __sched schedule_hrtimeout_range_clock(ktime_t *expir=
es, u64 delta,
 	hrtimer_set_expires_range_ns(&t.timer, *expires, delta);
 	hrtimer_sleeper_start_expires(&t, mode);
=20
-	if (likely(t.task))
+	if (likely(hrtimer_sleeper_task_get(&t)))
 		schedule();
=20
 	hrtimer_cancel(&t.timer);
@@ -220,7 +220,7 @@ int __sched schedule_hrtimeout_range_clock(ktime_t *expir=
es, u64 delta,
=20
 	__set_current_state(TASK_RUNNING);
=20
-	return !t.task ? 0 : -EINTR;
+	return !hrtimer_sleeper_task_get(&t) ? 0 : -EINTR;
 }
 EXPORT_SYMBOL_GPL(schedule_hrtimeout_range_clock);
=20
