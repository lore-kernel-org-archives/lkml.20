Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF82D36826E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767599; cv=none; b=FxrnJRIFMLP2cuDWyZ4fwAbsgoNRWg5S7KVmoQSi6DwswUpyf2T7ckGTA1UdJViqRWK8VMoFzM/19QS4tC/K8NCqeCBAZ+deSY8rXjnAuDSp4B1mCgJKQTojDmRVDJ6dWh+vYJIUcPendS4Ms4vzGuJYnUDvxLMTSW60YgH76zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767599; c=relaxed/simple;
	bh=eF4qIAlDrNUzM2llACH/B1bkaij6S96IPRwZ4TtPt9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVTPvk+SnNlnYcID0/UcYxI+almvH3pbfWtY6jIk0AUnshVTVeSqFNusDfZ8G/B7zDOKAQXVFDMtLTtycuxfg0V7l6ooNRQPTk9VWSFlflhi+y6I/r/ohhoz7KvkVxlHCW6U02SFRh6p3v6aQzm3ZVwcJQI6A5aiePW/eQPn8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F6ACq34Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HJXSY0HJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F6ACq34Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HJXSY0HJ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787767573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xZUYNgBpfLev2IxR+h4Q4qgxto/B2GAUiR1FXHEPgC4=;
	b=F6ACq34YQTjn3A4gizM/OnqEUsK1UBadoFYWzZqsWyz8Jd/TMewV0HAoXyWfnTXKQFQm3s
	fipDX8gYXqBLKDVarnyL4wt48jm/cbPL4xt5uEEw7RoGz3ABC5WqXr5bCOg7SCZ4ljRMgu
	smQbRAEpz4Qm6Tx6LW3AN4xo4Zsw4XcvC7P5N/5vqAUtVziXIcJC/5fKSL5I11g3bKdJ+j
	4xbeLcBAabFg6oQUMbJTP0vy04s/9uJAVRXHoJYfFINu6qBNgi3W3ofsoJbarsraAHZ8GY
	yst+OjIJP85UP0Npu6waJ8KqmFueqOvbOTXkCoY8E2f89uPI3fhPUa1XC4O4sQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787767573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xZUYNgBpfLev2IxR+h4Q4qgxto/B2GAUiR1FXHEPgC4=;
	b=HJXSY0HJurw5Xz1Wc6s4RfdONzBjaymDf4ZfCMJugaljo9cHyXnBNTwRAeJaUdPMmt0uGX
	RMmxemEYLMA4nIAA==
To: Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Yao Kai
 <yaokai34@huawei.com>
Subject: Re: [PATCH v3 1/2] futex: Add missing rt_mutex_.*_schedule() around
 rt_mutex_wait_proxy_lock()
In-Reply-To: <20260824132334.GI687043@noisy.programming.kicks-ass.net>
References: <20260824125544.2353006-1-bigeasy@linutronix.de>
 <20260824125544.2353006-2-bigeasy@linutronix.de>
 <20260824132334.GI687043@noisy.programming.kicks-ass.net>
Date: Wed, 26 Aug 2026 20:06:11 +0200
Message-ID: <874igghi3w.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 24 2026 at 15:23, Peter Zijlstra wrote:
> On Mon, Aug 24, 2026 at 02:55:42PM +0200, Sebastian Andrzej Siewior wrote:
>>  #include "futex.h"
>> @@ -865,7 +866,10 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
>>  	case Q_REQUEUE_PI_DONE:
>>  		/* Requeue completed. Current is 'pi_blocked_on' the rtmutex */
>>  		pi_mutex = &q.pi_state->pi_mutex;
>> +
>
> 		/*
> 		 * Since current is doing the requeue, it cannot also be
> 		 * a waiter on the same futex.
> 		 */

Current is not the task doing the requeue. Current is the requeued waiter which is
blocked on the rtmutex.

Though the change log is confusing at best. The whole requeue explanation
is not really helpful IMO.

The point is that _all_ invocations of rt_mutex_schedule() must be
preceeded by a call to rt_mutex_pre_schedule() and followed by a call to
rt_mutex_post_schedule().

So this code simply failed to do that, which triggers the
lockdep_assert() in rt_mutex_schedule().

And it's obvious from the surrounding comments how this task got there, no?

>> +		rt_mutex_pre_schedule();
>>  		ret = rt_mutex_wait_proxy_lock(pi_mutex, to, &rt_waiter);
>> +		rt_mutex_post_schedule();
>>  
>>  		/*
>>  		 * See futex_unlock_pi()'s cleanup: comment.
>> -- 
>> 2.55.0
>> 
