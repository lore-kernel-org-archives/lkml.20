Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01B457E6B;
	Tue, 29 Sep 2026 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708749; cv=none; b=YKHB0qGQpV6iSWDw56zM9GFBZU3hPvVgS0cjbY669HNVF3TFoh62HMdENoIJixxABgQ4+tj/UprFYUDrOT9nf7YnkBBQ3OCPGEUA1aiAqSD33KyJTYUcMUBB2RWRyPKPoRhGHovFkrsiAFldd/5Bxy4qT6WG5ke5NNMxsnbCzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708749; c=relaxed/simple;
	bh=lCqisUaKsbxT4HS2570wk9o8pucO19cJvLePXT5Baxo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cSl6aslMzXl9Z9NOq5spzmkmPvK0ZjZECOvkK9DS1UJAybvdL4bRo7s7BymJPm5Rh36twO3RVdWHawAYVCaNODRmFLmXIhDB2WCrV2NGcfgOWJBJhXghOvf70aRgAqBihR7RpuLaxFM+hgTaTZa39HCVfmJry/HzRXvBY3EGFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CXWz0LFh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=numxk2u+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CXWz0LFh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="numxk2u+"
Date: Tue, 29 Sep 2026 19:05:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708745;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C33Engy2NQa5zpxG+cmY3qX4n5ppePsxaG0Hxz+lbA=;
	b=CXWz0LFh5RUAH2hzatIrZSMZx+Pcx6TyTlFst7kxFezYDwsmbQtNsPIf9pRPql2COIxoZV
	QmSTZIs3znyZ6GsEOiES9+OrH7GjMWUca1/tDGmvys2fTTVGfMq2YtFr6u7GK5XE+lT6X8
	R69eH8dLJ2eFSP5mr/mdD1rAszZ4vuyamHXrZQzwVsC9ti5b4hIq4HQywHFHmqLHJUtP/z
	3o74u4uPCLGJ7pKMgGAjo2Q4qJ2MTlDIMnk7Do1R+GxVTOCTSEW9hY++8JMWa+iN20P91r
	NEfPKYLKfAvSH5ps+D7XfKoeIZ3GiNDur7rZ9mmCT30XdYrwDyFJDC3qlhMraQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708745;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C33Engy2NQa5zpxG+cmY3qX4n5ppePsxaG0Hxz+lbA=;
	b=numxk2u+98FOvLvTxcRe0HMaUGqkPntXlmI8yxTkD7bSYUlr/cmYBQuhVIEEIPOwnDKi8/
	i2XFblhZj+jV0gDA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] hrtimer: Mark data-racy accesses to
 hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Dmitry Ilvokhin <d@ilvokhin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-1-paulmck@kernel.org>
References: <20260919001428.3133388-1-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070874406.3910103.18309920693350591605.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     d166a1cd901615280be050929e5a5c9e4d300a62
Gitweb:        https://git.kernel.org/tip/d166a1cd901615280be050929e5a5c9e4d3=
00a62
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:17 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:51 +02:00

hrtimer: Mark data-racy accesses to hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However,
that is no reason to let the compiler introduce additional confusion.

Therefore, mark data-racy accesses to the hrtimer_sleeper ->task field
using READ_ONCE() (using a new hrtimer_sleeper_task_get() access function)
and WRITE_ONCE() (using a new hrtimer_sleeper_task_set() access function).

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
Link: https://patch.msgid.link/20260919001428.3133388-1-paulmck@kernel.org
---
 include/linux/hrtimer.h |  8 ++++++++
 kernel/time/hrtimer.c   | 14 +++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 29072d8..d44549c 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -320,6 +320,14 @@ extern int schedule_hrtimeout_range_clock(ktime_t *expir=
es,
 					  const enum hrtimer_mode mode,
 					  clockid_t clock_id);
 extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode=
);
+static inline struct task_struct *hrtimer_sleeper_task_get(struct hrtimer_sl=
eeper *sl)
+{
+	return READ_ONCE(sl->task);
+}
+static inline void hrtimer_sleeper_task_set(struct hrtimer_sleeper *sl, stru=
ct task_struct *t)
+{
+	WRITE_ONCE(sl->task, t);
+}
=20
 /* Soft interrupt function to run the hrtimer queues: */
 extern void hrtimer_run_queues(void);
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index cbf1693..7b44a35 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2323,9 +2323,9 @@ void hrtimer_run_queues(void)
 static enum hrtimer_restart hrtimer_wakeup(struct hrtimer *timer)
 {
 	struct hrtimer_sleeper *t =3D container_of(timer, struct hrtimer_sleeper, t=
imer);
-	struct task_struct *task =3D t->task;
+	struct task_struct *task =3D hrtimer_sleeper_task_get(t);
=20
-	t->task =3D NULL;
+	hrtimer_sleeper_task_set(t, NULL);
 	if (task)
 		wake_up_process(task);
=20
@@ -2354,7 +2354,7 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sleep=
er *sl, enum hrtimer_mode
=20
 	/* If already expired, clear the task pointer and set current state to runn=
ing */
 	if (!hrtimer_start_expires_user(&sl->timer, mode)) {
-		sl->task =3D NULL;
+		hrtimer_sleeper_task_set(sl, NULL);
 		__set_current_state(TASK_RUNNING);
 	}
 }
@@ -2388,7 +2388,7 @@ static void __hrtimer_setup_sleeper(struct hrtimer_slee=
per *sl, clockid_t clock_
 	}
=20
 	__hrtimer_setup(&sl->timer, hrtimer_wakeup, clock_id, mode);
-	sl->task =3D current;
+	hrtimer_sleeper_task_set(sl, current);
 }
=20
 /**
@@ -2432,17 +2432,17 @@ static int __sched do_nanosleep(struct hrtimer_sleepe=
r *t, enum hrtimer_mode mod
 		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
 		hrtimer_sleeper_start_expires(t, mode);
=20
-		if (likely(t->task))
+		if (likely(hrtimer_sleeper_task_get(t)))
 			schedule();
=20
 		hrtimer_cancel(&t->timer);
 		mode =3D HRTIMER_MODE_ABS;
=20
-	} while (t->task && !signal_pending(current));
+	} while (hrtimer_sleeper_task_get(t) && !signal_pending(current));
=20
 	__set_current_state(TASK_RUNNING);
=20
-	if (!t->task)
+	if (!hrtimer_sleeper_task_get(t))
 		return 0;
=20
 	restart =3D &current->restart_block;
