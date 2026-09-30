Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304C2429CD2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798432; cv=none; b=liCueVe5zTSY95ltbGpqKhwKm0yl4EnAmaEualyVNOtSFK/9kS4JAsqHVdwS55hm+8O9N8Qy5v3NDygwAHrFP2AwSpMSf7CPcwYSMC9YtLu+ZsPfQq8q4YT+nOVSwpixgiyI0kcaz3Dz6dJ7UPejmvdu85F8PtNdQGLNxSc2Z14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798432; c=relaxed/simple;
	bh=o9TauT6cSBu+/oizFGZrpYAzMassZtdlZ5r7Kobu1Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ry4vcfXfGRmbv2P3eriHPP/qiiLjESwZyvxOGFH8Ac5zI5cVnOz1/ecsCq/i8QdB28fHoNpT6BYH/VEEsPpRB2jfHUBHfaMo+s5vfkI700BIOKeobhySbSfxY+kRmB5PSzvsH7Z0TzIkVzq2SjtqmWgBxXgF4pFunZt1Wu+mXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig5QIdi+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig5QIdi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EEB1F000FF;
	Wed, 30 Sep 2026 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798431;
	bh=GDhnGpUyHchRkQYAkD3wVf/L8GBRqiE0Gf1ZbZuSLBM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Ig5QIdi+Yoh/0HmRP9VCYE5HBT2VTWu0jv5cpp2sDOh/ug4kqd/JTzPDiECGptq6N
	 mocIbqaJV6w00LOpvdl8+BYCRINSR5eKVdL5fq05/0iQhQu+iiCPALKW7+ieCw+lqy
	 pFdEaoi4lNTPzo9Pe8LBaQaUctkKNo4vOrq2Ja8NQS+LTPq/g5qwo9SgY4s8L+uVrf
	 Ac8iKeD6Ggfnew1b4S7PMz59Joi6oRZg5S9OFmksA1n7eF3kLlyQ6AdHhS1Ylkt/Fb
	 pVR4mqMWMmXXQJk46lqNanEjX+WfChZ3H6f8fjln80nqLYDq2TGWKaBVC0BMwdIx0h
	 jsSCZc7OWbgCQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8771DCE097C; Wed, 30 Sep 2026 13:00:30 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:00:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>, anna-maria@linutronix.de,
	frederic@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
Message-ID: <43ac14e7-8d9a-4ff5-87ee-55ec3c7cdeb8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260920085434.2918331-1-kunwu.chan@gmail.com>
 <87qzici6yb.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzici6yb.ffs@fw13>

On Tue, Sep 29, 2026 at 02:21:32PM +0200, Thomas Gleixner wrote:
> On Sun, Sep 20 2026 at 16:54, Kunwu Chan wrote:
> > tick_sched_do_timer(), called from the tick interrupt handler, sets
> > ts->got_idle_tick when a tick fires while the CPU is idle.  The idle
> > path reads and clears it via tick_nohz_idle_got_tick() to detect
> > whether the tick handler has run.
> >
> > The flag is accessed locklessly from hardirq and task context.  A
> > concurrent set can be overwritten by the clear.
> >
> > Use READ_ONCE() and WRITE_ONCE() to annotate the lockless accesses.
> 
> The following scenarios still happen:
> 
> A)
> 
>               if (READ_ONCE(got_tick))      // reads true
> -> interrupt       
>        WRITE_ONCE(got_tick, true);   
> 
>                    WRITE_ONCE(got_tick, false);
> 
> B)
> 
>               if (READ_ONCE(got_tick))      // reads false
> -> interrupt       
>        WRITE_ONCE(got_tick, true);   
> 
> #A is harmless because got_tick is already true and #B is harmless as
>  well because the got_tick read result is only a hint for the next idle
>  invocation.
> 
> As this is stricly per CPU the READ/WRITE_ONCE() does not change
> anything in terms of ordering. So what exactly is solved by the
> READ/WRITE_ONCE()?

This is a step towards allowing more-strict KCSAN checks to be enabled,
namely data races between base code and interrupt handlers.  KCSAN has
found a few bugs of this type in RCU over the past year or so, which
suggests that similar bugs might be lurking elsewhere.

Yes, in this particular case, current compilers don't have a huge amount
of freedom to mess things up, but the standard really does permit the
compiler to use a to-be-stored-to location as a temporary just prior to
that store.

This is like the situation with lockdep, where we tell it about
deadlock-free situations that it does not see as being deadlock-free.

Seem reasonable?

							Thanx, Paul
