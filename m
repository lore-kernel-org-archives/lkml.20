Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2142E23BCF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270904; cv=none; b=qvXOPHgtnUuAERr41x76YAWROzh3BpMtwFAvG+owPXC3Xu3IbXNWaRDi1Ml4FbS/VXeoxtnSDmwq1CxCGTrXzUAT+sry5mJYm6CsyJnrUW1ZzjOpFPMslx120LS/QFg9i2cvlaSVIZSxBThLgF0t2p20dbpWGv1kVXDMkdW6Fy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270904; c=relaxed/simple;
	bh=j4+PtI9N/R2jRNsJWHXVxsv7DivcZFQ/KWA44rI8BfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJnVUCIbkU7Tb9727WEcjFO6ZDiUa2sQzTvS0GXt85Wy2eS4lTD3lHpSLew8zBXmOLMz+6XuADGLXhzoy6RDXJQ2kOMj/0NR+7lhpLGWuDD/v3TIgHUv4lpBWiEbIIBfi0GrfDXa5uPG/N7uYj2nt1qDpWWPo+NpsT/l8fi5IB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zXwrdLHK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oLIlpaxH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zXwrdLHK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oLIlpaxH"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788270901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+JQ21gRjnOvRW7EQD2bTY4sf0RSX0VwaabZKMNpgH0=;
	b=zXwrdLHKfBcyaequjOfWJidicsaCX3fZOj/ddL0qj+QgNaZF5VokAaTvVB1Uy6iT6a1ixn
	dazHt/OVF5/Ps9ILHZ2LwZg7/9o+J85pstl3zO+opMPzOEzSHDZCM7CfQowjL3et/kXF8h
	9iMNLNOFygK9ulnNWTIuvRzkXNmtD7Xw+5BaWU38oTaxWq3lxaz9y+qOruK8fSWXLo7KFQ
	OvytiV33Bt2RPofm7rmk24lQsPNvbwNzYZWFKYDaxN+G0s0t9lLGgK4IeFIxijr+NuBzAe
	JfreggKuuuiFD9r1zb82x2qQAOkFvya97ca/3JFMS/baSpDy7H1QtR9wmH91NA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788270901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+JQ21gRjnOvRW7EQD2bTY4sf0RSX0VwaabZKMNpgH0=;
	b=oLIlpaxHIDEVJlUsQmEVzWNFUrU0cJJmGEeViazBRUCjoTgsoP6m9ol7lBIoZg2LNQzDLu
	nuvufE0OJisVPnAw==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Yao Kai <yaokai34@huawei.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v4 2/2] futex: Prevent rcuwait use-after-free during requeue PI
Date: Tue,  1 Sep 2026 15:54:52 +0200
Message-ID: <20260901135453.3121948-3-bigeasy@linutronix.de>
In-Reply-To: <20260901135453.3121948-1-bigeasy@linutronix.de>
References: <20260901135453.3121948-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Yao Kai <yaokai34@huawei.com>

On PREEMPT_RT, FUTEX_CMP_REQUEUE_PI can trigger a KASAN report
(slab-out-of-bounds) in futex_requeue_pi_complete() invocation of
rcuwait_wake_up().

The futex_q used by futex_wait_requeue_pi() is allocated on the waiter's
stack. An early wakeup can race with a PI requeue as follows:

        waiter                          requeue task
        ------                          ------------
futex_wait_requeue_pi()
  futex_do_wait()
    schedule()
                                       futex_requeue
                                         futex_proxy_trylock_atomic()
                                           futex_requeue_pi_prepare()
                                            Q_REQUEUE_PI_NONE -> Q_REQUEUE_=
PI_IN_PROGRESS
* timeout/ signal wakes waiter *
  futex_requeue_pi_wakeup_sync()
   Q_REQUEUE_PI_IN_PROGRESS -> Q_REQUEUE_PI_WAIT
                                           requeue_pi_wake_futex
                                             futex_requeue_pi_complete()
                                               cmpxchg Q_REQUEUE_PI_WAIT ->=
 Q_REQUEUE_PI_LOCKED
    rcuwait_wait_event()
      if (atomic_read(&q->requeue_state) !=3D Q_REQUEUE_PI_WAIT)
       break /* no schedule() */

 /* q.pi_state->owner =3D=3D current */
 futex_private_hash_put()
 /* return from syscall */
                                              rcuwait_wake_up(&q->requeue_w=
ait)
                                                /* q is gone */

futex_requeue_pi_complete() publishes Q_REQUEUE_PI_LOCKED before
calling rcuwait_wake_up(). The waiter observes this state in
rcuwait_wait_event() before invoking schedule() in rcuwait_wait_event().
Here, the waiter is free leave the syscall before requeue task can
complete the wake.

To address this race skip rcuwait_wake_up() in the Q_REQUEUE_PI_LOCKED
case.
This state is only published by requeue_pi_wake_futex(), which saves
q->task before futex_requeue_pi_complete() and wakes the waiter via
wake_up_state().

This wake is intended to wake the waiter from its futex_do_wait() sleep.
If the waiter is still sleeping there, it can not get into the
Q_REQUEUE_PI_WAIT state (and require this removed wake).
Should the waiter be woken up from futex_do_wait() by other means (as in
this example) and sleep in futex_requeue_pi_wakeup_sync() then the
wake_up_state() from requeue_pi_wake_futex() will wake it, too.
Should the waiter task terminate before wake_up_state() had a chance to
wake the task then the task pointer does not become invalid because the
futex_hash_bucket::lock is held and the task pointer is RCU protected.

[bigeasy: Updated comment and commit message]

Fixes: 07d91ef510fb1 ("futex: Prevent requeue_pi() lock nesting issue on RT=
")
Signed-off-by: Yao Kai <yaokai34@huawei.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/requeue.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 79823ad136830..b3f4a4bccb126 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -154,8 +154,16 @@ static inline void futex_requeue_pi_complete(struct fu=
tex_q *q, int locked)
 	} while (!atomic_try_cmpxchg(&q->requeue_state, &old, new));
=20
 #ifdef CONFIG_PREEMPT_RT
-	/* If the waiter interleaved with the requeue let it know */
-	if (unlikely(old =3D=3D Q_REQUEUE_PI_WAIT))
+	/*
+	 * The waiter in futex_requeue_pi_wakeup_sync() can interleave with the
+	 * wake below: It will assign Q_REQUEUE_PI_IN_PROGRESS and here it will
+	 * be updated to Q_REQUEUE_PI_LOCKED (locked =3D 1). The rcuwait_wait_eve=
nt()
+	 * will already read Q_REQUEUE_PI_LOCKED and skip the schedule() invocati=
on,
+	 * leading to an access of futex_q::requeue_wait after the waiter returne=
d.
+	 * In this case only we skip the wake here and rely on following wake in
+	 * requeue_pi_wake_futex() to perform the wake if needed.
+	 */
+	if (unlikely(old =3D=3D Q_REQUEUE_PI_WAIT) && new !=3D Q_REQUEUE_PI_LOCKE=
D)
 		rcuwait_wake_up(&q->requeue_wait);
 #endif
 }
--=20
2.55.0

