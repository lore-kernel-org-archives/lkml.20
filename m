Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413D644607B;
	Tue, 29 Sep 2026 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708733; cv=none; b=st4WF0OSz97RU1XbB0p38tCrqb52mW+xb0xuwYf4/jiUuynCHGS6wMmTlj+HVaQd1XzUnj+DtR3wBJT57o2zEdDxT8hUMNZLehD1Z9cq1z+CG8LTzK1h5NztI2kDX/U4dBIMcKkW0nyFODbpULaCXl9rjT6guVq/Lz8YgsYM2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708733; c=relaxed/simple;
	bh=E2bFBmwAX0qhC45LVt1GOXtbZKI5GV5seBBa9sXwG8M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Qj7nH9/GSC0PRHTJTvS3QWtwNVewyD+RAFkwkpPQeHAJfjaFTYRMCyQPPr7WL+YfNz5lvfbg9hVvfnWLQXlHV42nP+RSSb9aiVf8yNANwdbow5PyzDAJas67NcZyYbqYohqiPZJ8HuZx5cMnoZjUERrvc4zZH2PrhGOCeJndhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GWMzPQdb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=loZg+zAd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GWMzPQdb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="loZg+zAd"
Date: Tue, 29 Sep 2026 19:05:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708730;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT1QtQg3ene8NpUDio4Hday6ymZjTkrMPCcu+T0lluw=;
	b=GWMzPQdbQj1eauE7IZ476/qz2pddfc7PsapmmnzIjdV+wl6hcY6KQdl8tNDNxQF1kuez5j
	BfZtpXMu9LRbj0KXefkwFSfLdBKzp9Zib0d2neArwfhpSfgyO+SsR/ZFyk7gjkYROvPZAl
	f54CwTO5Rskii4lUsUEVO7BJlb69nTJH9ceUKo3e/0FiPGEO56R+yq44aO75dO4mneMP01
	1XVh27rTS2GwDqTru+9Q5YGRixffYBKwUbGALklLQ8/bJrR+Z8kkEE4ueAvpvp1W46liGA
	dignV8TSrMZBCq49RkWVRO/nUBUOziWe+Yy2G2WcERSoh4NMSz0KoRDqXJL5vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708730;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT1QtQg3ene8NpUDio4Hday6ymZjTkrMPCcu+T0lluw=;
	b=loZg+zAdCeLa56QP0dx2nS6jgYQHoo5/ytiFUi0x4xOAQQkGcFWy+OQQm47UKzHHKiMXkG
	ZG7GoMRT24FaYYDA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] hrtimer: Mark the hrtimer_sleeper structure's
 ->task field __private
Cc: Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-11-paulmck@kernel.org>
References: <20260919001428.3133388-11-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070872870.3910103.9491389633733465542.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     ad80926d780340ab08799cdb38be010e0dce8ec0
Gitweb:        https://git.kernel.org/tip/ad80926d780340ab08799cdb38be010e0dc=
e8ec0
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:27 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

hrtimer: Mark the hrtimer_sleeper structure's ->task field __private

The hrtimer_sleeper structure's ->task field is now used only by the
hrtimer_sleeper_task_get() and hrtimer_sleeper_task_set() functions,
and there is no reason for it to be directly accessed anywhere else.

Therefore, mark this field __private and use ACCESS_PRIVATE() in
hrtimer_sleeper_task_get() and hrtimer_sleeper_task_set().

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-11-paulmck@kernel.org
---
 include/linux/hrtimer.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index d44549c..cad8482 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -72,7 +72,7 @@ enum hrtimer_mode {
  */
 struct hrtimer_sleeper {
 	struct hrtimer timer;
-	struct task_struct *task;
+	struct task_struct *__private task;
 };
=20
 static inline void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
@@ -322,11 +322,11 @@ extern int schedule_hrtimeout_range_clock(ktime_t *expi=
res,
 extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode=
);
 static inline struct task_struct *hrtimer_sleeper_task_get(struct hrtimer_sl=
eeper *sl)
 {
-	return READ_ONCE(sl->task);
+	return READ_ONCE(ACCESS_PRIVATE(sl, task));
 }
 static inline void hrtimer_sleeper_task_set(struct hrtimer_sleeper *sl, stru=
ct task_struct *t)
 {
-	WRITE_ONCE(sl->task, t);
+	WRITE_ONCE(ACCESS_PRIVATE(sl, task), t);
 }
=20
 /* Soft interrupt function to run the hrtimer queues: */
