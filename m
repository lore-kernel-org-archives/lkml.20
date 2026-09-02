Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597E26980F;
	Wed,  2 Sep 2026 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333727; cv=none; b=ohZWoGS0XDNI0HlnUFuF48kRXUKTrrLwey1DTrZJ+ogatQLdANTvxHX4vyeulXg1pfFLE5F4eFwezcey5nNYc6yJZxiKyQNVv0D66e3Uxd+u5D5lVwuSirt5mYUhlfAlZxBE5ZbKsd9AhDAHFgfhe7oswqzyGaTht51GVsvgSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333727; c=relaxed/simple;
	bh=ki1bU/lgCsb4ac0mNQ+pUL1Rk+0r9lTGAcGIVydj3R8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=EHueBVK2ONsHTMM9w6iKaZGfU9XH3exprhdNgtG3nTpdsZDAPeoJ2ETHTeV1PJteS4PwMMRnd3QoKiTWazibPnd7kkU71CR0d3VDI1tFEDeWyNE+Nwl/Y7GSGNrgV+5wz+8IH7im0zO5FHyxjz0O0VOwFD1Zhl9+ADhTRdRHS4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gyO8gMEc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5y0BzPbX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gyO8gMEc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5y0BzPbX"
Date: Wed, 02 Sep 2026 07:22:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333724;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqk1AVlx6CoHQb/kwlleS8wTOimQVuANPU3d7deR+1I=;
	b=gyO8gMEclcOHxjHHxih9sVlbLoLE/z/PmNp3X+h1ex6+v4ODEaF13SQfp/GzcTk00bC9RK
	braU22Pz/mx5I6r6U4wdmcgTXOk8TUw6gxhUK8wUIQz2bLMJVN+m4iaPLKSiKHyK8zrdQo
	j4RLrpASet2JqTZBUC//F0LLfEETTMbLSd7C3xkRxKZOAHDkHImCz8K4XCuHgHMfdwU1cB
	WCYjoiQkBzPzigC+h8VV+dcOzIX24an+z4jbMdVeqz1DbWm2aj75WKGBYziLVv/oub4gRm
	ZmeODAyr5ZZLm0I1Y6wVicba/3TSYnVLA+Raang/5w5XI7erXPsSKtqwMUpNmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333724;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqk1AVlx6CoHQb/kwlleS8wTOimQVuANPU3d7deR+1I=;
	b=5y0BzPbXrsBWzWmOh8gZ/mGl9bRV+Ti9aSGwxO9uprSaCRqlh5CIF82B4nyFj/B14tN/Pi
	P31DHSjwhfpbVUBA==
From: "tip-bot2 for Shubhang Kaushik (Ampere)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Skip rq->avg_idle update without a
 valid idle_stamp
Cc: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807-master-v3-1-c328354efed3@gentwo.org>
References: <20260807-master-v3-1-c328354efed3@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833372225.3717435.14998513490997823879.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     c6dcd97c8be75f052a1ca52cf79b03e7292962f1
Gitweb:        https://git.kernel.org/tip/c6dcd97c8be75f052a1ca52cf79b03e7292=
962f1
Author:        Shubhang Kaushik (Ampere) <sh@gentwo.org>
AuthorDate:    Fri, 07 Aug 2026 13:38:52 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:49 +02:00

sched/core: Skip rq->avg_idle update without a valid idle_stamp

Commit 4b603f1551a73 ("sched: Update rq->avg_idle when a task is moved
to an idle CPU") moved rq->avg_idle accounting out of the wakeup path and
into put_prev_task_idle(), so that the idle interval is consumed whenever
the idle task is switched out.

The wakeup-side accounting that it replaced only updated rq->avg_idle
when rq->idle_stamp was non-zero. The new helper lost that validity
check and unconditionally computes:

	rq_clock(rq) - rq->idle_stamp

If rq->idle_stamp is zero, this uses rq_clock(rq) as the sample. That is
not a valid idle duration and can immediately drive rq->avg_idle to its
clamp.

This can happen when sched_balance_newidle() returns before setting
rq->idle_stamp, for example when this_rq->ttwu_pending is set. In that
case the rq can switch to the idle task with idle_stamp still zero and
leave idle again when the pending wakeup is processed.

Other paths can also switch to the idle task without setting
rq->idle_stamp via newidle_balance(), for example find_proxy_task() or
force-idling.

Restore the idle_stamp validity check in update_rq_avg_idle() and skip
the rq->avg_idle update when there is no measured idle interval.

Fixes: 4b603f1551a73 ("sched: Update rq->avg_idle when a task is moved to an =
idle CPU")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260807-master-v3-1-c328354efed3@gentwo.org
---
 kernel/sched/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f782751..7472450 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3742,11 +3742,17 @@ static inline void ttwu_do_wakeup(struct task_struct =
*p)
=20
 void update_rq_avg_idle(struct rq *rq)
 {
-	u64 delta =3D rq_clock(rq) - rq->idle_stamp;
-	u64 max =3D 2*rq->max_idle_balance_cost;
+	u64 idle_stamp =3D rq->idle_stamp;
+	u64 delta, max;
+
+	if (!idle_stamp)
+		return;
+
+	delta =3D rq_clock(rq) - idle_stamp;
=20
 	update_avg(&rq->avg_idle, delta);
=20
+	max =3D 2 * rq->max_idle_balance_cost;
 	if (rq->avg_idle > max)
 		rq->avg_idle =3D max;
 	rq->idle_stamp =3D 0;
