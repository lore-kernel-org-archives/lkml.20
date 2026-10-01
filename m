Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8004C17DFFA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863569; cv=none; b=PmpTdXQzOqxWnIKYJnWvFhao0t3PKyiIkVxVq0Em0/sQ4DwYRIDak0ufeHgcl9Qr2xFZPbaEmkoIgGVidArfH8260dqIANrqlWLOw0SWfANfM6VgaY6zNR7VTUlnpuoelC+R4P/AdOigq83lnIwL1ljD7nU7GwLWUmGJJIKfVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863569; c=relaxed/simple;
	bh=Q8UxeeUWMe3ls+DQBPXpG4NwR/CVeQmhJnt2bDWbj80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OSc85VBrrWDNhuF4VjRgEIZH6607nj2B3hnL7dS5BPoPWw15sa9cIgNUhsXeTyUIpMF2vqdRhjsvXwnOWyL/g3BJ90YKdsQwMTCZCtWfrYNsXEa+d86qDJCVGuggF2fEv8r4NpipCaKJR6ArLLWhWIABqQKXSE/VWEdKGPJkHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFqGo66f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFqGo66f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB21F000FF;
	Thu,  1 Oct 2026 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790863568;
	bh=GlBsyDi3v037S/+A51t+R4V83U5chlLKxAGjEid58AY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dFqGo66foOYfDkpq1gkN0NM3fWXS9q/SxlVz1bLYHJ1qPZI7DwV6ec1F2cAEoEOYt
	 NUMe6l2Gtd7j1nwdd32Tmb+WPCyk7DduK+Eb7c4hUwp580pIBNuUeT37UTWD70TEC8
	 jsMl63F3T1OD35/Sla4Q2JWSkAUJrXOGDrczIYuUSI7XlcnwnY3U+wka3/+c60Bnrw
	 jK6wYy9cmQ7GUpbCpQ6sRn6019wK63ZwIrFpfjVjy5p8OlWa6RdJi+swSuq/mrLtW1
	 ZnCMrPTh4EkbvwLw6aj2D0oDIW4KOKuISWWFe99CnCGiO0W0IyvJPF1KY33oPLyOBw
	 2n97hJre94FzA==
From: Thomas Gleixner <tglx@kernel.org>
To: paulmck@kernel.org
Cc: Kunwu Chan <kunwu.chan@gmail.com>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
In-Reply-To: <0d74e178-274e-4555-b904-23bd1910020d@paulmck-laptop>
References: <20260920085434.2918331-1-kunwu.chan@gmail.com>
 <87qzici6yb.ffs@fw13>
 <43ac14e7-8d9a-4ff5-87ee-55ec3c7cdeb8@paulmck-laptop>
 <87ld8igzaq.ffs@fw13>
 <0d74e178-274e-4555-b904-23bd1910020d@paulmck-laptop>
Date: Thu, 01 Oct 2026 16:06:04 +0200
Message-ID: <87cxtth5wz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 30 2026 at 15:30, Paul E. McKenney wrote:
> On Thu, Oct 01, 2026 at 12:16:45AM +0200, Thomas Gleixner wrote:
>> That said, I further have to say that just reusing READ/WRITE_ONCE() for
>> this is completely wrong.
>> 
>> A strict and harmless per CPU modification/race is very much different
>> from cross CPU races. So avoiding any potential confusion and thereby
>> allowing tools like KCSAN to treat them differently is useful.
>> 
>> Using the same annotation for something which is strictly a per CPU
>> situation prevents to detect the accidential cross CPU access which
>> might not be safe at all.
>> 
>> Even if the momentary implementation falls back to the same mechanism
>> for the tools the value of implied code documentation is valuable. It
>> avoids extensive comments and it also allows tools to differentiate the
>> meaning in the future.
>> 
>> READ/WRITE_ONCE() are just non-distinguishable "paper over all race
>> problems which tools might complain about" hammers.
>> 
>> But we all should know by now that "Birmingham screwdrivers" are more
>> than suboptimal.
>
> Yeah, if you hit something with a Birmingham screwdriver, it might not
> quite realize that it has been hit.  On the other hand, if you instead use
> a 16-pound (7 1/4 kg) sledgehammer, at least the fool thing will *know*
> that it has been hit.  ;-)
>
> Back to the topic at hand...
>
> So your thought is to have a KCSAN annotation that says "should be accessed
> only from the corresponding CPU".  Or maybe "from no more than one CPU".
>
> That would certainly be useful, easy though it is for me to say.
>
> Marco, is something like this practical for KCSAN?
>
> There are quite a few variations, including "written from one CPU but
> read from everywhere" and vice versa.  But maybe start with the things
> actually proven useful.  ;-)

Well, written from one CPU and read from everywhere is what
READ/WRITE_ONCE() is for just with the extra twist that the WRITE is
bound to a single specific CPU. But that's not the problem at hand.

What I meant is to have something like this:

        WRITE_ONCE_THIS_CPU(...)
        READ_ONCE_THIS_CPU(...)

where both operate on the same per CPU variable and the race is between
different contexts, e.g. task and interrupt.

That's first of all useful as documentation for the reader and also for
static analysis tools.

As long as KCSAN cannot make use of it the macros simply fall back to
the existing WRITE/READ_ONCE() so the problem which the patch under
discussion is trying to solve is addressed. When some future KCSAN
implementation can make this a special case with actual per CPU checks
then we get even more benefit.

Thanks,

        tglx
