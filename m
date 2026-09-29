Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2754705E;
	Tue, 29 Sep 2026 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708732; cv=none; b=RdZcdSWPMveqqUiuQqHoWnCxo7T1Vt8jzoebI8xnUzznRVjR82qK8CB3pd52bawWRSRWimcgmQuRa+3OaUNgh6ueN4wnMVqwW7qx2VA59oMEObDbg4uPVE3hao+z7Qa8mSkqLGGLp2GLgGuysYvm4cHaHBHDA6NI0nw2uqLP41A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708732; c=relaxed/simple;
	bh=KwYEK3Zr0euo4ttZ+wMsodCialYivf3teQnk7KuKDHM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CFVRWq1Yzf6zFG+wYEi+auoIISMBsz0dS9UyHq5nhHyYwV66a1Gl+R5Telhpnf8A8rDYX1WTKH9CG0eslE1RkQIRPVslzSqZuabwvYm0ehSpyJa+PetgZdunUzQY/v1LZMBGsrqoftQXNIoipJ+7C7Bd72/iZlJnDpZqYwdduBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=js/WEViD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qq5OJLsB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="js/WEViD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qq5OJLsB"
Date: Tue, 29 Sep 2026 19:05:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708729;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCbA89g+dcQiTuzNLASyNknO5ocoNIc5wMckhbuHAdI=;
	b=js/WEViDwkYTAEQz+KM5fnQwJC+yW7YwLwXTTm99kRn0HvVhzmDDx/PxiOSDBAMBR+9l/I
	zb8XXcoaxbNDMehdpfHzAMQ8nqpClXIk66cY6mVyKxdFNS5/vHxsOjyjE3Je1NDE4EDk5L
	DrgBwPO/ccGptwR2FN9yeyokGgQrefu0dnEYf/2WjAMNaaHe2TiQ4qEIBBWNJ97x2LTf+U
	FfM9IyLe+oeK0lfPa+X5tIGI9SJYWGkJsGuShVPBT/SpBoJhah9PKXD0hpTJB6I0SC9QOh
	YK8f/DbOLchkkPPvO4j9EW6xO0HGu3Y0CTy54is5kPI18fopJwA18fEBb+j91g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708729;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCbA89g+dcQiTuzNLASyNknO5ocoNIc5wMckhbuHAdI=;
	b=Qq5OJLsBf3lI6GUJe+DalULjjOZkH1t0SuHCWZMEkNYsQVABbHSwjAmR7Sks4hog5r9xCK
	VgUaFfqlnmUldmBw==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] hrtimer: Apply READ_ONCE() to lockless base->running loads
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-12-paulmck@kernel.org>
References: <20260919001428.3133388-12-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070872705.3910103.7700190620711790090.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     5dffe33bfdafcc768d090c55479f515585509ffa
Gitweb:        https://git.kernel.org/tip/5dffe33bfdafcc768d090c55479f5155855=
09ffa
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:28 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

hrtimer: Apply READ_ONCE() to lockless base->running loads

Updates to base->running are protected by the hrtimer base lock, but some
loads are lockless.  Therefore, prevent compiler mischief by applying
READ_ONCE() to the lockless loads.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-12-paulmck@kernel.org
---
 kernel/time/hrtimer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 2054064..17dd38a 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2004,7 +2004,7 @@ bool hrtimer_active(const struct hrtimer *timer)
 		base =3D READ_ONCE(timer->base);
 		seq =3D raw_read_seqcount_begin(&base->seq);
=20
-		if (timer->is_queued || base->running =3D=3D timer)
+		if (timer->is_queued || READ_ONCE(base->running) =3D=3D timer)
 			return true;
=20
 	} while (read_seqcount_retry(&base->seq, seq) || base !=3D READ_ONCE(timer-=
>base));
@@ -2041,7 +2041,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_=
base, struct hrtimer_cloc
 	lockdep_assert_held(&cpu_base->lock);
=20
 	debug_hrtimer_deactivate(timer);
-	base->running =3D timer;
+	WRITE_ONCE(base->running, timer);
=20
 	/*
 	 * Separate the ->running assignment from the ->is_queued assignment.
@@ -2100,7 +2100,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_=
base, struct hrtimer_cloc
 	raw_write_seqcount_barrier(&base->seq);
=20
 	WARN_ON_ONCE(base->running !=3D timer);
-	base->running =3D NULL;
+	WRITE_ONCE(base->running, NULL);
 }
=20
 static void __hrtimer_run_queues(struct hrtimer_cpu_base *cpu_base, ktime_t =
now,
