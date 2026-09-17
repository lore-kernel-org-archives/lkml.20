Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67F3C2B95
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619651; cv=none; b=Cu2aSqEebvUljdQ6OnhbdRC4/YjMG19j1joveqgAeA9VGkfH9hpMA+D+izCVy9P+1DVjvGdZXrU++xrxLdakUMZaNNF5/paPYcOe/03m42cZ/eydT1TVri+paAUfJHIUYc55C6ONyiU0C1783lPlcvFVZikhC93byAggCHWm9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619651; c=relaxed/simple;
	bh=UoT8lmgVGUsVGRmIzQcQADrCNDlYHVGbUsQfdt5hgd0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WCtfQFC0BGimIInP1eWk70GEXWQYaQOQWULMHriz9hMT649qGYA1du22uztzwKpk4/llhHZa253G11pGEovj2AcX1h6MG1EpYn939D38n68pvnexeAOTDQuYDGcrrpRLfa2xGKH8HBOfhLmdudVCTy0O8U3l9MaVLrp6obZJrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tmw6n+zp; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tmw6n+zp"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso526325b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619649; x=1790224449; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjRJ7qIcoyYP80tPA6wEvSZrR9vPCGZkyHgHo5ANiJY=;
        b=Tmw6n+zpZu9RdbbbEan/2F55NeEHNnQO2/cjoTtzKeX+hMawJ2s5I3MhVQ+bMrd393
         hzu56a+drw5AtiNtgpu3Cj5XGO4Mf2cZ5zo3ySBuUb0j8ly+8BmrCiVxP2eXu26I57M+
         sOPb6hlrucnOAAg+vEHs3sLcRnNancw3q9oTGl4enKB/1R4FCgBmkVbX2dDB/abHqLu/
         GSoo3QOBFvXZrhRd0Jx+OirN1rtB7/ph0XPJJKZ482bB/SqBniLa60KprRpv1fu5K8y4
         RQRzhuiR54bhbfKmvf7lCfp5cugO8syhfhCnYsSiIy8VJvGHBevu0ASufW6t69riCKsC
         RYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619649; x=1790224449;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjRJ7qIcoyYP80tPA6wEvSZrR9vPCGZkyHgHo5ANiJY=;
        b=kKTt0EInU0knZ+FFA8jFuQtCvnQXpNY+eMZo6aiRGcuclJ2s8VXmIp7gy7ub6eaBfP
         XdCX1N01OAIfRAp0YSvhPxiuBG6BozNakIhyzKvOztCy6sHXAaEvMFFr0Px0EPHu4uYg
         IeavZfAXTFs3CYs0xTNM2k8arNTZyiXCl4EFp6qq6tRijShvgGAHi0vCWrii+Cc/x2JJ
         mt83t3I4VOH3wU/5nx2SplIN5h4bgIn6S3YGUFqAsY/24KzQ2L92wjTOXgupRWIaQ+Is
         AxaxfxZ/MwbsHCDyQjiiP6msepcTC0B60ppvJHYNdj7q4ukFc89UfkIx1YMK25/GsqjQ
         Nyeg==
X-Gm-Message-State: AFuF++nE2cYw3yr/tnO81t1ndbHb/YpdxhtP+CeWJSMihrZA4mfAUeli
	vZ2KUdGPrO6vAXORtu2Bc+E4UsIDBTmOswuobkWjFzHzLEBtAy7MoeFVV9O98UhElTbmDoLAAI2
	Ov5XH/DZfmhWLYsPk+EUqLwGvfi0KrG29jZSVPAAA548W8ZuyqghANnK7lJir1NhYQdGKaZ23d6
	EdTCiovNur3yW5cLEz2kV6vMXcdaUblBJCVP2i/3VSr42mRhLcF3JnXg0=
X-Received: from pgy13.prod.google.com ([2002:a63:184d:0:b0:cc5:120f:c9c0])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d95:b0:3d1:d188:b0fe with SMTP id adf61e73a8af0-3dd5f5d62e6mr12887707637.13.1789619648572;
 Wed, 16 Sep 2026 21:34:08 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:35 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-12-suleiman@google.com>
Subject: [RFC PATCH 11/12] futex: Allow userspace stealing for PING futexes.
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"

Similarly to how the kernel part of PING locking can steal the futex
from the top waiter, it is also possible for userspace to also take
advantage of this and try to steal without going to the kernel.

When a new (contending) locker notices that the lock has been stolen
from userspace, the ownership of the ping_state and the ping_mutex
are fixed up to the real owner.

TODO: Verify that the case where the ping_state owner exits with the
  futex having been user stolen is handled correctly.
  In other words, when ping_state->owner = task getting killed,
  ping_mutex.owner = NULL and uval = real owner (set by userspace).
  Right now, it seems like we might be doing the wrong thing in such
  cases. exit_ping_state_list() needs to detect such situations
  (by walking the uvals?) and fixup the ownerships.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/core.c  |  8 ++++++++
 kernel/futex/futex.h |  2 ++
 kernel/futex/pi.c    | 12 ++++++++++--
 kernel/futex/ping.c  | 38 +++++++++++++++++++++++++++++++++++---
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 56c7e2d5faac..023531c4b45a 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1445,6 +1445,14 @@ static void exit_ping_state_list(struct task_struct *curr)
 	while (!list_empty(head)) {
 		next = head->next;
 		ping_state = list_entry(next, struct futex_pi_state, list);
+		/*
+		 * XXX In the case when we are ping_state owner but
+		 * the futex is actually owned by someone who stole it
+		 * from userspace, is setting ping_state.owner = NULL here
+		 * enough? Probably not, otherwise the ping_state could leak
+		 * if they also exit before unlocking or someone else
+		 * fixing up the ownership.
+		 */
 		if (1) {
 			CLASS(hbr, hbr)(&key);
 			auto hb = hbr.hb;
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 113289779dd1..922d130c5b44 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -413,6 +413,8 @@ extern int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 			      bool ping);
 extern void get_ping_state(struct futex_pi_state *ping_state);
 extern void put_ping_state(struct futex_pi_state *ping_state);
+extern int fixup_ping_owner_after_user_steal(struct futex_pi_state *ping_state,
+				      u32 __user *uaddr, u32 uval);
 
 /*
  * Express the locking dependencies for lockdep:
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index e7e6e347f97d..dfd2da5188b0 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -348,8 +348,16 @@ int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 	 * state exists then the owner TID must be the same as the
 	 * user space TID. [9/10]
 	 */
-	if (pid != task_pid_vnr(pi_state->owner))
-		goto out_einval;
+	if (pid != task_pid_vnr(pi_state->owner)) {
+		if (!ping) {
+			goto out_einval;
+		} else {
+			ret = fixup_ping_owner_after_user_steal(pi_state,
+								uaddr, uval);
+			if (ret)
+				goto out_error;
+		}
+	}
 
 out_attach:
 	if (!ping) {
diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index e5765b2d3834..4cef1c46b4c6 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -96,6 +96,22 @@ put_ping_state(struct futex_pi_state *ping_state)
 	}
 }
 
+int fixup_ping_owner_after_user_steal(struct futex_pi_state *ping_state,
+				      u32 __user *uaddr, u32 uval)
+{
+	struct task_struct *p;
+
+	p = find_get_task_by_vpid(uval & FUTEX_TID_MASK);
+	if (p == NULL)
+		return pi_handle_exit_race(uaddr, uval);
+	if (unlikely(p->flags & PF_KTHREAD))
+		return -EPERM;
+	ping_state_update_owner(ping_state, p);
+	WRITE_ONCE(ping_state->ping_mutex.owner, p);
+
+	return 0;
+}
+
 static void futex_unqueue_ping(struct futex_q *q)
 {
 	if (!plist_node_empty(&q->list))
@@ -149,6 +165,7 @@ static int futex_trylock_ping_state(u32 __user *uaddr,
 				    bool handoff)
 {
 	struct task_struct *owner;
+	pid_t pid;
 	u32 uval, new, newtid;
 	int ret;
 
@@ -163,8 +180,17 @@ static int futex_trylock_ping_state(u32 __user *uaddr,
 
 		WARN_ON_ONCE(ping_state->handoff || ping_state->pickup);
 
-		if (uval & FUTEX_TID_MASK) {
-			ret = -EAGAIN;
+		/*
+		 * No owner but a userspace TID means that it got stolen
+		 * from userspace.
+		 * Fix up the ownership.
+		 */
+		pid = uval & FUTEX_TID_MASK;
+		if (pid) {
+			ret = fixup_ping_owner_after_user_steal(ping_state,
+								uaddr, uval);
+			if (ret == 0)
+				ret = -EAGAIN;
 			goto err;
 		}
 		new = newtid | FUTEX_WAITERS;
@@ -203,7 +229,7 @@ static int futex_trylock_ping_state(u32 __user *uaddr,
 	case -EINVAL:
 		break;
 	default:
-		WARN_ON(1);
+		break;
 	}
 	return ret;
 }
@@ -619,6 +645,12 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 		goto out_unlock;
 	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
 
+	/*
+	 * If we're unlocking a lock we stole from userspace,
+	 * it's possible that we don't own the ping_state or the
+	 * ping_mutex. But we'll give them to the next task here anyway.
+	 */
+
 	next = ping_current_proxy_donor(ping_state);
 	get_ping_state(ping_state);
 	/* Leave it queued, it gets unqueued on the lock side */
-- 
2.55.0.1082.g2b9226bbc0-goog

