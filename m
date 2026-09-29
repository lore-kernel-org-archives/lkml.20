Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872945561D;
	Tue, 29 Sep 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708738; cv=none; b=W8NlFdlgYr+rxNB3I08ERrSUwedvErt1JR7AO582u5X7VjC65Y2gHRMU2etpgnS7KoBU2hEbVTpM3ij4UBUPi4bVs9HC1LaOcgkWW75rLV8rWPq1HjEc+12utQ9MvNkHyJXFwD03gtVoJktdgvGke6r8faNx+FXBumxtOXa3dWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708738; c=relaxed/simple;
	bh=ZtYhKlHIIGsa67zh5vaWcRE3PnqmnxsGI2YklmaVwnI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=is5qIXMo/NMZAIg0AxWnl1dTvnkie1PM5ZvXcKeDL2igZf6dx0/3F1dmGpdS4nck9YlDB5WEuN7Bxvhm+CdjomffPBYpgJS3whoroAeOY6NZhQUKekZaL3TZKiyxoRV5hT1bIBZ5/1HagSYau/lmmLR68w5Ih45Xrok6zLxCJ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dI+4MssS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7hn9KfNb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dI+4MssS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7hn9KfNb"
Date: Tue, 29 Sep 2026 19:05:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708735;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3nGjGmeXgn41tNTn8rFcWspGvPtOW9JUAHp26CK8Hs=;
	b=dI+4MssS3cH+9RZ/+VwPIiYSvaEXHhL5AXwDGuascq7vvqU4UMm1Hlp64HgPdPluCs48PX
	OYJEd/7jff61K2lRZ4gp6WCrigTgKol4GNhlIb/1wrOgEl21Qpa45kZecyN0MXA09bV/9s
	SnF+vfUlV7B8mSFzuuXqJLqi5taTLkHVx2N425sWzN4c/1JXDMV8C2GwtxHvrCzvIRooF7
	uhfsWGXEjVCAno3906XWf+6ogJNY0kWrEBEIsHDOLJ0kPxkGavZA3w0WzPR4kFFSK0mOzg
	Fi/EhhCNc1d7Za8AG2+tm/JA7FAxsyKo4ppDgASQfNBqjb305akIV4El1KBXGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708735;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3nGjGmeXgn41tNTn8rFcWspGvPtOW9JUAHp26CK8Hs=;
	b=7hn9KfNb6HODIhxeCojT2MPb47MwMxWd+ycj0cj+QcBXUDEZ9R6dbnNThPFTBjyMTvA6s2
	L8cULZ/6uJaBRxAQ==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] rtmutex: Use accessor for hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Dmitry Ilvokhin <d@ilvokhin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-8-paulmck@kernel.org>
References: <20260919001428.3133388-8-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873338.3910103.4211026926507124570.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     9cd2f4e304d921459a9348323aff518aee7fdc06
Gitweb:        https://git.kernel.org/tip/9cd2f4e304d921459a9348323aff518aee7=
fdc06
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:24 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

rtmutex: Use accessor for hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to rt_mutex_slowlock_block().

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
Link: https://patch.msgid.link/20260919001428.3133388-8-paulmck@kernel.org
---
 kernel/locking/rtmutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 4728631..5a9534c 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1644,7 +1644,7 @@ static int __sched rt_mutex_slowlock_block(struct rt_mu=
tex_base *lock,
 			break;
 		}
=20
-		if (timeout && !timeout->task) {
+		if (timeout && !hrtimer_sleeper_task_get(timeout)) {
 			ret =3D -ETIMEDOUT;
 			break;
 		}
