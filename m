Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF831ABED9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270998; cv=none; b=M2xY1YC+CEi8ftwnqrj9l73ZzN3yj5qSgrfCLqhbKvfJvPUXnX41J8eFmlS0ViMqKfqRnYRCexTglHgZJirrtmiZI9aZ4HpND5u0YQ4F2nZHbVha3GUaD7BFVZVkvzRG6Xv8ExaBex56urpv2j2jmgr8is9YeFRK8KK+JFtqoqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270998; c=relaxed/simple;
	bh=2UkeVRlH4o/r9otxZthrQnh9tFl/pr5Ij+aJENpNkc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHrD21wUZX5o+CWUB5e6WfP1f7WTuH8Yc4IjqBb1Zr9DSWuElBCZergs41FxRC8xG4sJ1i/poNblDTHKvATCz+xXVuK/YazvOiagPRdEHg0eLA9Jup7A+ChzJX7HiB+BlZtSj587hxikszCp5G724fW4SF+lFp6llyR5kmrhVBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MiPThU53; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T0sn0Zpj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MiPThU53";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T0sn0Zpj"
Date: Tue, 1 Sep 2026 15:56:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788270995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Kh4vHCR8DFl1zJRV6a5XIuWnnPSg2m7aA2BtlDq5F8=;
	b=MiPThU53gTbNlQ4I1UR+sUYGGApnXjtFfHr18uHxk0E9Zby6DstGwKWLXYnSg/BqYXgPyM
	zdsi03fvRwUAsftw4goOrL+oeYgpQmgFCa+OZvsADJCXuPBwcB60cZq3WGNUt3aBszYzXr
	Huz8MXgBrraKNWZv1JncEvMmRhef6wxucSCukst77xbmuCTveyh693F4zIO5lK+fyzKR1A
	xqdOsnK0U5MeuHcICzCOQRGYLYQs0xAbuRBqitpdy2uIVaErprboqG0l8gJHclnLfPkjGf
	p4483ustft4Hhn2cb9cqTsUoK9RDccrfYKs9xixFXyf7Kg8FkNyhhaVgl1NlXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788270995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Kh4vHCR8DFl1zJRV6a5XIuWnnPSg2m7aA2BtlDq5F8=;
	b=T0sn0ZpjxeC+fXh1SywADjUJTmRvASRAkfZqguZG6xhWr4LM2nxcvQ3t1q/z1HxzGHp+AB
	LtM6/gmi+h898UCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, Yao Kai <yaokai34@huawei.com>
Subject: Re: [PATCH v4 1/2] futex: Provide rt_mutex_.*_schedule() equivalents
 for futex scheduling
Message-ID: <20260901135633.wBOUP152@linutronix.de>
References: <20260901135453.3121948-1-bigeasy@linutronix.de>
 <20260901135453.3121948-2-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901135453.3121948-2-bigeasy@linutronix.de>

On 2026-09-01 15:54:51 [+0200], To linux-kernel@vger.kernel.org wrote:
> By mistake futex_wait_requeue_pi() -> rt_mutex_wait_proxy_lock() did not
> get the rt_mutex_{pre|post}_schedule() annotation. This was not noticed
> because in this callchain the lock is (usually) not contended and so
> rt_mutex_slowlock_block() does not schedule, triggering the assert.

The following makes it trigger more reliably.

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 4728631ae7194..15037c35c684f 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1633,13 +1633,14 @@ static int __sched rt_mutex_slowlock_block(struct rt_mutex_base *lock,
 	struct rt_mutex *rtm = container_of(lock, struct rt_mutex, rtmutex);
 	struct task_struct *owner;
 	int ret = 0;
+	int first_loop = 1;
 
 	__assume_ctx_lock(&rtm->rtmutex.wait_lock);
 
 	lockevent_inc(rtmutex_slow_block);
 	for (;;) {
 		/* Try to acquire the lock: */
-		if (try_to_take_rt_mutex(lock, current, waiter)) {
+		if (!first_loop && try_to_take_rt_mutex(lock, current, waiter)) {
 			lockevent_inc(rtmutex_slow_acq3);
 			break;
 		}
@@ -1665,7 +1666,11 @@ static int __sched rt_mutex_slowlock_block(struct rt_mutex_base *lock,
 			owner = NULL;
 		raw_spin_unlock_irq_wake(&lock->wait_lock, wake_q);
 
-		if (!owner || !rtmutex_spin_on_owner(lock, waiter, owner)) {
+		if (first_loop || !owner || !rtmutex_spin_on_owner(lock, waiter, owner)) {
+			if (first_loop) {
+				first_loop = 0;
+				__set_current_state(TASK_RUNNING);
+			}
 			lockevent_inc(rtmutex_slow_sleep);
 			rt_mutex_schedule();
 		}

Sebastian
