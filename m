Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1E470EA4;
	Tue, 29 Sep 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708743; cv=none; b=Q35aUa/xF/p1oz2Qn96t+cNd4MF/ICrLePTsN8ReDILx8Ot5STriuSKUG/oFgBBVqmAr+y30dLVdJwx1wOK5B/E7G9U9fbaHewEy+7x0TpRHgL1kCaBmJx+m8UwZ6Bqmn5H4CW+SqCSyR1J2XuXP0LO9smRZLQCQGeroxMKzjE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708743; c=relaxed/simple;
	bh=FpMZyM8n8UXfqiD0Q2KKJ3lFd8drQ2NrtZKrlo/jvDQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ttD5N3mHOfluRe4APguNtedZ4fdqadw7eU/gWyppVwBL8x1mbuV8qVUHZJjQc6vdm59g4CngOrBMZIv4cph3GUn66WJzJGU807DqoGt919UWlccp6qyxOJKyGA7z8rzNCVobisWBECNvtQuqzq6GnHaMavqQwY/SGLKwI3Fkn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CTzftz+e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1YxXcSKb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CTzftz+e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1YxXcSKb"
Date: Tue, 29 Sep 2026 19:05:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymkuWyIFMeUsFYEiT3mv/pl9o7e+CmmbEzqtXXO19f4=;
	b=CTzftz+ec9qnE9a+bCqn97VbV6uLrvj2k0g46kU/15ZXw1ObuOVrFMeRC6BFQnTccpooFS
	uumzHpR0p+WnkMfZLbIroiAb4ovrI0F7Q35GkIhn3s/kl+07ck0dy4nvvKrPTqjzwRp2cl
	Pg88O+lpDf6DBSsgpl/5OmvN+/Azb98OGDnF7ZINrAMXu1bMUjGwC8POcBSuAmXl6WgXbu
	5JjJZEShCCEuQ63rjRXDP54lnIDrOgMoo1r8IGqjab90R8NzjHNl9/N8Vw0KIlJ4ReSLHa
	DWmN2GSMq1pt/5NX2JZ4q2rPgZpTIg+j1U8nnS8l0XrOpSK9oEo7/X3vUFYAUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymkuWyIFMeUsFYEiT3mv/pl9o7e+CmmbEzqtXXO19f4=;
	b=1YxXcSKbkz36nUxqDDw9ZcEv4omGCRzPUx69NYtrLnOc+74Y/rfEXB6APL57UkA4TuXLys
	zGzPoJEU7Er7gJBw==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] futex: Use accessor for hrtimer_sleeper ->task
 field in waitwake.c
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 andrealmeid@igalia.com, Dmitry Ilvokhin <d@ilvokhin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-5-paulmck@kernel.org>
References: <20260919001428.3133388-5-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873790.3910103.14516152283497989878.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     fa3d486086d6948a6cf09b6d94cb1f56df2b1a6b
Gitweb:        https://git.kernel.org/tip/fa3d486086d6948a6cf09b6d94cb1f56df2=
b1a6b
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:21 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:51 +02:00

futex: Use accessor for hrtimer_sleeper ->task field in waitwake.c

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to kernel/futex/waitwake.c.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
Link: https://patch.msgid.link/20260919001428.3133388-5-paulmck@kernel.org
---
 kernel/futex/waitwake.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d4483d1..cf18309 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -383,7 +383,7 @@ void futex_do_wait(struct futex_q *q, struct hrtimer_slee=
per *timeout)
 		 * flagged for rescheduling. Only call schedule if there
 		 * is no timeout, or if it has yet to expire.
 		 */
-		if (!timeout || timeout->task)
+		if (!timeout || hrtimer_sleeper_task_get(timeout))
 			schedule();
 	}
 	__set_current_state(TASK_RUNNING);
@@ -539,7 +539,7 @@ retry:
 static void futex_sleep_multiple(struct futex_vector *vs, unsigned int count,
 				 struct hrtimer_sleeper *to)
 {
-	if (to && !to->task)
+	if (to && !hrtimer_sleeper_task_get(to))
 		return;
=20
 	for (; count; count--, vs++) {
@@ -590,7 +590,7 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned=
 int count,
 		if (ret >=3D 0)
 			return ret;
=20
-		if (to && !to->task)
+		if (to && !hrtimer_sleeper_task_get(to))
 			return -ETIMEDOUT;
 		else if (signal_pending(current))
 			return -ERESTARTSYS;
@@ -725,7 +725,7 @@ retry:
 	if (!futex_unqueue(&q))
 		return 0;
=20
-	if (to && !to->task)
+	if (to && !hrtimer_sleeper_task_get(to))
 		return -ETIMEDOUT;
=20
 	/*
