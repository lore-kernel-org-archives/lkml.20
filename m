Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC84470EAD;
	Tue, 29 Sep 2026 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708736; cv=none; b=UuuJ+D8Y9o/1VjSJ5RL1awJVKhaIK1u5uNXb8URxQuNR7NQNZB+cIgHMiIElfCiog7Hov+U8ywGcC8mxQIUyU8JdzPloVpJO1g8jyyQ9dSsyVn0YgnormEvjkdYqv0f6QjHOJ7Rcx03GbcJRP8kC1WUAyDL0jmkPpIuH+o+Qf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708736; c=relaxed/simple;
	bh=VivM6E1A+EastVv8gp2A8WlhRHEKbh2rmE2zPYbtagQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=fEPELBLAvB6VfWKJgFJ9gtubfKl3WSNVstufGxx/kUOmqJ4byY5tkZW/fsD+KZSYkOVX3vBEhTmHyKqjAaOXG9/YH7n3ikBEAAkR1dYQn15XZSk5h4d5g+L3FNLhqf2kjSpQAGrsOjj3U/BTbi9w5h0dHaO9czFg/r80o8TZe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XoET5kz0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l3w1AQjT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XoET5kz0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l3w1AQjT"
Date: Tue, 29 Sep 2026 19:05:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708733;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfKGKv00zDu04cGrYMeI5Kt5EisLSK0UP1APsE8T/PM=;
	b=XoET5kz0HQ8qfMCinKV5ZtATLS25KMcIhHa0Y4/YJnfIfvCzECiiLlywLeU1HSNvJTsD+l
	sJ+GH+leOo+tWAdTTx4Q8dgwjbFAkMYnTUZBGrw97SiQrFMeGOVBIJqnajOT7GUy0Jl+qc
	8S8a+L+hMEKdBtK6cVy1em5Ni6FZY63WEq2fYxtEdmzIBRx/PMeXJ4q0kgipaH3hdF+2DY
	0NSg4B9fH80aBapm8zKfOrdqVaGxuDGqMkFW+a4RnP5Stkxr8TRlazJlDjFQyxWM9hHH+S
	609844w2OdpFQQaRaSHCpoj+pqeNSmJiRPoTR3MM5RnpRSFmL9uFTTlskrrKaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708733;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfKGKv00zDu04cGrYMeI5Kt5EisLSK0UP1APsE8T/PM=;
	b=l3w1AQjTsdfmNImZZQxHTKCuxMaOZKXFgu4qPPPfJcbuRxzT3/XZhwNsdCILlhb0EkXGlD
	uw1nmc6lpKdywHDw==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] futex: Use accessor for hrtimer_sleeper ->task
 field in requeue
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 andrealmeid@igalia.com, Dmitry Ilvokhin <d@ilvokhin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-9-paulmck@kernel.org>
References: <20260919001428.3133388-9-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873170.3910103.2354000697072716824.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     7eed1771a6e84101c7cdf8b7d487f01b6420ba8c
Gitweb:        https://git.kernel.org/tip/7eed1771a6e84101c7cdf8b7d487f01b642=
0ba8c
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:25 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

futex: Use accessor for hrtimer_sleeper ->task field in requeue

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to handle_early_requeue_pi_wakeup().

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
Link: https://patch.msgid.link/20260919001428.3133388-9-paulmck@kernel.org
---
 kernel/futex/requeue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b3f4a4b..842d852 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -744,7 +744,7 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_buck=
et *hb,
=20
 	/* Handle spurious wakeups gracefully */
 	ret =3D -EWOULDBLOCK;
-	if (timeout && !timeout->task)
+	if (timeout && !hrtimer_sleeper_task_get(timeout))
 		ret =3D -ETIMEDOUT;
 	else if (signal_pending(current))
 		ret =3D -ERESTARTNOINTR;
