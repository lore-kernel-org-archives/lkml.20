Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06A1DF748
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833922; cv=none; b=SO2bjYk3xnTYkhS2ldyZfkcUgkscB9JpQobb9xsQS8Hii4EdrPOBBnva8E5DYNDphUrxC0KTKXszBDMdjz2lxXEEfzgTObt4Vqzwfj7d6vWKUxgqsmNwqG7MEPXbVTTzUl3DVO2cJMwE1l0fZk/UBIUlHJcijZySvonCJbU0ic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833922; c=relaxed/simple;
	bh=Zpuc0gcXbTFSlKBjxT+R0mVnEoN6GnkX8w5X+vcDJic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QpnTMDfqzvtnCNHRm3lOwTcfB6rgLYBiqzzrtWJIzbyyVe46OLDzYVCV+b+IMiRqyFzulmgKNgi2GUY1FwfQb2ioNSI7yoRvBf7bJPrqV8/72KdWRMbW09SZQB9FWGUzPmE2ePYGUz1LsIrmD7Zss0FCFCAZwzznFGDh41Zl/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kS7JMNVU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V2kAcByS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kS7JMNVU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V2kAcByS"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787833917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=prMo69dzUHkqktIi2MgcdWZ+eZ3K1M9LsUMPrYNj2SI=;
	b=kS7JMNVUYTeIObK+rv642PZwZ/otvvDXV6RuX9+AGnlD5FajabHdXapn3IjS5c4W2vgymj
	SPYBNyowmbD0EQPUip/S4b+KHTOaUlzNekVs6EBEMT2+QYvMjSKIyNk4dAnS4fTQ8HAosr
	LYkvqoZHPpa2H3yH/3ve3vkzR1g/fn0KIyQPfI0IFxDRFIcOPxafQG7R6GtGPZV+k1lj2M
	ziBgzp/DXRYa2SCrJvhbzMslGb1S3vQf/93nu367tLnpP+QgK2s8M4rhc/oAdSb5zkQcEL
	3fMrxRepC1CtdpKI+EM5pIIvQS4aPZNbbL9azLnT3AuGy18G0xDUt2hxmD7eIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787833917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=prMo69dzUHkqktIi2MgcdWZ+eZ3K1M9LsUMPrYNj2SI=;
	b=V2kAcBySdUGeQgxWr0iIg6ingYejyEYt5QuQ6ZbTcloXXmsm/uhXBmiH+mwWzNEgWuvlJR
	MAsjNXwV/UojgIAA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Yao Kai
 <yaokai34@huawei.com>
Subject: Re: [PATCH v3 1/2] futex: Add missing rt_mutex_.*_schedule() around
 rt_mutex_wait_proxy_lock()
In-Reply-To: <20260827083738.-6QSwUwb@linutronix.de>
References: <20260824125544.2353006-1-bigeasy@linutronix.de>
 <20260824125544.2353006-2-bigeasy@linutronix.de>
 <20260824132334.GI687043@noisy.programming.kicks-ass.net>
 <874igghi3w.ffs@fw13> <20260827083738.-6QSwUwb@linutronix.de>
Date: Thu, 27 Aug 2026 14:31:56 +0200
Message-ID: <87mru7g2wz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 10:37, Sebastian Andrzej Siewior wrote:
> On 2026-08-26 20:06:11 [+0200], Thomas Gleixner wrote:
>> On Mon, Aug 24 2026 at 15:23, Peter Zijlstra wrote:
>> > On Mon, Aug 24, 2026 at 02:55:42PM +0200, Sebastian Andrzej Siewior wrote:
>> >>  #include "futex.h"
>> >> @@ -865,7 +866,10 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
>> >>  	case Q_REQUEUE_PI_DONE:
>> >>  		/* Requeue completed. Current is 'pi_blocked_on' the rtmutex */
>> >>  		pi_mutex = &q.pi_state->pi_mutex;
>> >> +
>> >
>> > 		/*
>> > 		 * Since current is doing the requeue, it cannot also be
>> > 		 * a waiter on the same futex.
>> > 		 */
>> 
>> Current is not the task doing the requeue. Current is the requeued waiter which is
>> blocked on the rtmutex.
>> 
>> Though the change log is confusing at best. The whole requeue explanation
>> is not really helpful IMO.
>> 
>> The point is that _all_ invocations of rt_mutex_schedule() must be
>> preceeded by a call to rt_mutex_pre_schedule() and followed by a call to
>> rt_mutex_post_schedule().
>> 
>> So this code simply failed to do that, which triggers the
>> lockdep_assert() in rt_mutex_schedule().
>> 
>> And it's obvious from the surrounding comments how this task got there, no?
>
> I would suggest to strip it all from the futex part, not do the flush
> and just please the assert so it keeps quiet. I did some explaining in
> the v2 and then Yao suggested
> 	https://lore.kernel.org/all/5df8a43e-11bb-4881-877d-40034c414984@huawei.com/

That makes sense.
