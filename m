Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B44C3C9886
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819862; cv=none; b=cNQSa3g9i1ayRbXBFUsN+NgcKaIV0tpUOXqHbEnkoV5I4726qKNBi5vWIDb9boLwh0YpOjEiE+KBhg4Z6vKifVmR3caZeafCUv6Ym9fDY64MJd6DPek0USTyeqBJMxngGEWoJ+8udKDJE5Lw+gYE8T9OaS/ejTzHgs2948+tuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819862; c=relaxed/simple;
	bh=uLDJDHDq7131vcScWYDOdh9QqsBxxkSTjHkeHvBlQWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJcYtXwKyzfZMwHWU4uXuqD8jhY8hwq368Ois/z2IH4tAAEcLwpSgK+CByfvFlQYUPxoGPcbkr+yt4eAoTMON9hk+rfqPJc/KHr4uz+GOjqCd+mVcE+200CkJvpcxM11LLfCpizpfcln2Z9z7DBJsE4RgNFkyyjVFTjPxxMmNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ickLu4H7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D1HUkaI0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ickLu4H7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D1HUkaI0"
Date: Thu, 27 Aug 2026 10:37:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787819859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSLMOLZbaUgpVe/4MzjSC3H0CElONzcrnF1acij8DHM=;
	b=ickLu4H7BHPk4yvoAl9zVCpXnS19K/JEPu6ZlDscGDc0un3qtR89V47DD901lS3OODO3lp
	Y9186W6muVsGI+XGP19cNNrBePoLKOn4nLgkLz4lhtAgdOb/hIJ8ufCcW1wOzadM4FxJW+
	4IycDKaGPErP38Bl5K7JG6dyrIT+OS54fqJ1cerxvTfHAoGI19k4IuHuo6m36z5QFRXih4
	rVakGmWsawhfqE1WAARkg7X6ABJPCw6r+bZ5yabNzSUZTBMa7fK7T3uIHSK9cOsMttKwEl
	jooqAvz4nK9EOJHVGssaAoEY4wnx2RFyuwY15xAEF/QOGE+vuSdExuMXhAUmDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787819859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSLMOLZbaUgpVe/4MzjSC3H0CElONzcrnF1acij8DHM=;
	b=D1HUkaI0YP5VFdDp2mTgGwK1ZRcHqJ7YP2rmmqAXdRaJb/3IUxMaGFc2F7HZgSLB2dHK98
	uDgIrTLwHtP1ZUAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Yao Kai <yaokai34@huawei.com>
Subject: Re: [PATCH v3 1/2] futex: Add missing rt_mutex_.*_schedule() around
 rt_mutex_wait_proxy_lock()
Message-ID: <20260827083738.-6QSwUwb@linutronix.de>
References: <20260824125544.2353006-1-bigeasy@linutronix.de>
 <20260824125544.2353006-2-bigeasy@linutronix.de>
 <20260824132334.GI687043@noisy.programming.kicks-ass.net>
 <874igghi3w.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874igghi3w.ffs@fw13>

On 2026-08-26 20:06:11 [+0200], Thomas Gleixner wrote:
> On Mon, Aug 24 2026 at 15:23, Peter Zijlstra wrote:
> > On Mon, Aug 24, 2026 at 02:55:42PM +0200, Sebastian Andrzej Siewior wrote:
> >>  #include "futex.h"
> >> @@ -865,7 +866,10 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
> >>  	case Q_REQUEUE_PI_DONE:
> >>  		/* Requeue completed. Current is 'pi_blocked_on' the rtmutex */
> >>  		pi_mutex = &q.pi_state->pi_mutex;
> >> +
> >
> > 		/*
> > 		 * Since current is doing the requeue, it cannot also be
> > 		 * a waiter on the same futex.
> > 		 */
> 
> Current is not the task doing the requeue. Current is the requeued waiter which is
> blocked on the rtmutex.
> 
> Though the change log is confusing at best. The whole requeue explanation
> is not really helpful IMO.
> 
> The point is that _all_ invocations of rt_mutex_schedule() must be
> preceeded by a call to rt_mutex_pre_schedule() and followed by a call to
> rt_mutex_post_schedule().
> 
> So this code simply failed to do that, which triggers the
> lockdep_assert() in rt_mutex_schedule().
> 
> And it's obvious from the surrounding comments how this task got there, no?

I would suggest to strip it all from the futex part, not do the flush
and just please the assert so it keeps quiet. I did some explaining in
the v2 and then Yao suggested
	https://lore.kernel.org/all/5df8a43e-11bb-4881-877d-40034c414984@huawei.com/

which is what I had in mind.

Sebastian
