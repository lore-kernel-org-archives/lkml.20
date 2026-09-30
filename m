Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E2405C35
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807450; cv=none; b=tcNvc92cbSFy2aNqDMQ8KiWi83WM5AGhulMFm/aT7ySx+F7AsPzXIqYGnEAY382Q9iEYzIcucOXXES917SHQmrUIagtqiIdUWwdKKyKOX8QSl9uxPHr+/uK3VFRr29A9OrLr8mpYKWSp5iNlZ41c5k94MXgrPumhzb+HI/D3bXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807450; c=relaxed/simple;
	bh=7EM2sZjSffyGc6DM30lMcI402+fkx1useqbOm9nOHlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htHYB+oVWB+l3z4/6STjaHxMfKK/pPfSe143KcT5Hgs+R8qXPt1BiWgvFuF/r7FtGHHMb+RUqH3iGFdjcrwIT/+w+di8BjP/ggfoERj8/jJOJWZawnpcdcrKTXnUNKs1D3onsUsYz7U0StPYxHVqD+a8Y4q7WABJF2X38e7QiIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqTa3WYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqTa3WYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9E01F000FF;
	Wed, 30 Sep 2026 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790807448;
	bh=eHBan9sa1UBFCREMupzf6PTajSStxJbR7Kc75ofdSjA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PqTa3WYfEPBtpWbcK/Y41rSY0qh9Bp3X+8E1SfdT4NNPOYnAqP0DbonIyv2p2O5id
	 Af3+OLTVf6M8Uds/osSy956KToj1fqkvuYonoCSE7oTHSe/LrZXX2st57CxEbY3kD8
	 6Ehq17z0ypNV5wOT5ec/8byHTE1t+vyvb5oRIn0FVEzjBnNI86uzSokIihTG/k/wyS
	 Zf9b48buGGx/uT88C04trOcV2BQZy8CAocy5TKA/8LoCEwJN6xZAxMqymH1r89SApF
	 MkpmIzsd39qRZ27etN/a2XNhrW16kG1XHuKNusX0+XPo4PgmhE11tMsgvGAV000IDe
	 PeJsjL2YT/Xmg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 19699CE097C; Wed, 30 Sep 2026 15:30:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:30:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>, anna-maria@linutronix.de,
	frederic@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
Message-ID: <0d74e178-274e-4555-b904-23bd1910020d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260920085434.2918331-1-kunwu.chan@gmail.com>
 <87qzici6yb.ffs@fw13>
 <43ac14e7-8d9a-4ff5-87ee-55ec3c7cdeb8@paulmck-laptop>
 <87ld8igzaq.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ld8igzaq.ffs@fw13>

[ Adding Marco Elver on CC. ]

On Thu, Oct 01, 2026 at 12:16:45AM +0200, Thomas Gleixner wrote:
> On Wed, Sep 30 2026 at 13:00, Paul E. McKenney wrote:
> > On Tue, Sep 29, 2026 at 02:21:32PM +0200, Thomas Gleixner wrote:
> >> On Sun, Sep 20 2026 at 16:54, Kunwu Chan wrote:
> >> > tick_sched_do_timer(), called from the tick interrupt handler, sets
> >> > ts->got_idle_tick when a tick fires while the CPU is idle.  The idle
> >> > path reads and clears it via tick_nohz_idle_got_tick() to detect
> >> > whether the tick handler has run.
> >> >
> >> > The flag is accessed locklessly from hardirq and task context.  A
> >> > concurrent set can be overwritten by the clear.
> >> >
> >> > Use READ_ONCE() and WRITE_ONCE() to annotate the lockless accesses.
> >> 
> >> The following scenarios still happen:
> >> 
> >> A)
> >> 
> >>               if (READ_ONCE(got_tick))      // reads true
> >> -> interrupt       
> >>        WRITE_ONCE(got_tick, true);   
> >> 
> >>                    WRITE_ONCE(got_tick, false);
> >> 
> >> B)
> >> 
> >>               if (READ_ONCE(got_tick))      // reads false
> >> -> interrupt       
> >>        WRITE_ONCE(got_tick, true);   
> >> 
> >> #A is harmless because got_tick is already true and #B is harmless as
> >>  well because the got_tick read result is only a hint for the next idle
> >>  invocation.
> >> 
> >> As this is stricly per CPU the READ/WRITE_ONCE() does not change
> >> anything in terms of ordering. So what exactly is solved by the
> >> READ/WRITE_ONCE()?
> >
> > This is a step towards allowing more-strict KCSAN checks to be enabled,
> > namely data races between base code and interrupt handlers.  KCSAN has
> > found a few bugs of this type in RCU over the past year or so, which
> > suggests that similar bugs might be lurking elsewhere.
> >
> > Yes, in this particular case, current compilers don't have a huge amount
> > of freedom to mess things up, but the standard really does permit the
> > compiler to use a to-be-stored-to location as a temporary just prior to
> > that store.
> >
> > This is like the situation with lockdep, where we tell it about
> > deadlock-free situations that it does not see as being deadlock-free.
> >
> > Seem reasonable?
> 
> Yes, but then the change log should clearly state exactly that along
> with a corresponding comment in the code. These boilerplate copy&pasta
> changes are annoying as hell because they fail to provide any reasonable
> rationale for the proposed change. See Documentation/process/...
> 
> I'm refusing to accept this slop whether it's generated by humans or any
> form of tools.
> 
> That said, I further have to say that just reusing READ/WRITE_ONCE() for
> this is completely wrong.
> 
> A strict and harmless per CPU modification/race is very much different
> from cross CPU races. So avoiding any potential confusion and thereby
> allowing tools like KCSAN to treat them differently is useful.
> 
> Using the same annotation for something which is strictly a per CPU
> situation prevents to detect the accidential cross CPU access which
> might not be safe at all.
> 
> Even if the momentary implementation falls back to the same mechanism
> for the tools the value of implied code documentation is valuable. It
> avoids extensive comments and it also allows tools to differentiate the
> meaning in the future.
> 
> READ/WRITE_ONCE() are just non-distinguishable "paper over all race
> problems which tools might complain about" hammers.
> 
> But we all should know by now that "Birmingham screwdrivers" are more
> than suboptimal.

Yeah, if you hit something with a Birmingham screwdriver, it might not
quite realize that it has been hit.  On the other hand, if you instead use
a 16-pound (7 1/4 kg) sledgehammer, at least the fool thing will *know*
that it has been hit.  ;-)

Back to the topic at hand...

So your thought is to have a KCSAN annotation that says "should be accessed
only from the corresponding CPU".  Or maybe "from no more than one CPU".

That would certainly be useful, easy though it is for me to say.

Marco, is something like this practical for KCSAN?

There are quite a few variations, including "written from one CPU but
read from everywhere" and vice versa.  But maybe start with the things
actually proven useful.  ;-)

							Thanx, Paul
