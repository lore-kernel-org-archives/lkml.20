Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C243D3001;
	Fri, 28 Aug 2026 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899339; cv=none; b=a3gDqKALJISa1lK2K8DgxGTTTLxIpdezFHecYHfRVvimgrKDrYp8+xBRc5mWBHicWLxL/G1gy79bjR/r33h2d0Zm9wOr16OzX4ZX47Vy8hHvCFt5KmmYiRmLuGOD+d3lzDI3UV+ISOkeUFDWonDdqzp4eDVDWN3D/IV693WEmA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899339; c=relaxed/simple;
	bh=LI02XVFVLVkXv2S4NYk+DI6JhmW6+be1mrRG1BV72go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6SCn4JePrsvb2c2HVUu/6oSA3lyMt4fcUZjA6vAQAf/gi0ZjdqED8fgk83tKG+aQoTaae4kCvb4y2G2YOQq4qg/mkQgF4JNJZzV4J/do3/3z+L+2hMBz60arVoASVgrjsFH8ArA3uMiSFE37s6KSKKx8LN12P2vIW5nOTmLWOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uHAaL6rS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uHAaL6rS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vqMgWeHyP43n2ArwX8ag/saIUIamTcqMbAfO2NpQvk0=; b=uHAaL6rStjzlP8Qf+eUXwc5a+c
	/M5aTU1sibQVjIGLV0SMEWthaSA2n6d8A6R0HAYDTU0MeBU9Kr6u9Z2rrMfAXCpOJz88jj8NcQ3d0
	U10vQZ/ELZ1zXVIWGokhdLVUsPVsKd9HQVKLs8JQiwkWmTsKIfSS48edLj7qz9llCeZv1QXpmAY/C
	EdVqmqwq9QBqSiPFkUy61sYWte57mkmMHy6BdNoS2yY5zV4b9HcnMOeV6NusghQQBPHSYFncYd66Q
	2/bmox0jVPyJk6URBHMJ3yBiIFcGTsN00g293lf547ygG1louns9pk7BTQcobh95+v1/wda441wBO
	XK0H2Gdg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqHy-0000000EAxw-2zt4;
	Fri, 28 Aug 2026 06:42:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6CED53006FA; Fri, 28 Aug 2026 08:42:09 +0200 (CEST)
Date: Fri, 28 Aug 2026 08:42:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <20260828064209.GF4121339@noisy.programming.kicks-ass.net>
References: <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wltbdvmd.ffs@fw13>

On Fri, Aug 28, 2026 at 12:52:26AM +0200, Thomas Gleixner wrote:

> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -97,6 +97,7 @@ static __always_inline bool arch_in_rcu_
>   */
>  static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>  {
> +	__preempt_count_inc_hardirqs_disable();
>  	arch_enter_from_user_mode(regs);
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  
> @@ -275,6 +276,7 @@ static __always_inline void exit_to_user
>  	user_enter_irqoff();
>  	arch_exit_to_user_mode();
>  	lockdep_hardirqs_on(CALLER_ADDR0);
> +	__preempt_count_dec_hardirqs_disable();
>  }
>  
>  /**
> @@ -385,6 +387,8 @@ static __always_inline irqentry_state_t
>  		.exit_rcu = false,
>  	};
>  
> +	__preempt_count_inc_hardirqs_disable();
> +
>  	/*
>  	 * If this entry hit the idle task invoke ct_irq_enter() whether
>  	 * RCU is watching or not.
> @@ -498,6 +502,7 @@ irqentry_exit_to_kernel_mode_after_preem
>  			instrumentation_end();
>  			ct_irq_exit();
>  			lockdep_hardirqs_on(CALLER_ADDR0);
> +			__preempt_count_dec_hardirqs_disable();
>  			return;
>  		}
>  
> @@ -514,6 +519,7 @@ irqentry_exit_to_kernel_mode_after_preem
>  		if (state.exit_rcu)
>  			ct_irq_exit();
>  	}
> +	__preempt_count_dec_hardirqs_disable();
>  }
>  
>  /**

> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -171,6 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_en
>  {
>  	irqentry_state_t irq_state;
>  
> +	__preempt_count_inc_hardirqs_disable();
>  	irq_state.lockdep = lockdep_hardirqs_enabled();
>  
>  	__nmi_enter();
> @@ -202,4 +203,5 @@ void noinstr irqentry_nmi_exit(struct pt
>  	if (irq_state.lockdep)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  	__nmi_exit();
> +	__preempt_count_dec_hardirqs_disable();
>  }

So I was thinking about this, and can't we get away with not doing this?
That is, simply leave DISABLED_OFFSET set while in userspace?

We always exit to userspace with IRQs disabled, and every entry will
disable them anyway, so they match up, might as well make use of that,
no?
