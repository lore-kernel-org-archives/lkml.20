Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18638911E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806609; cv=none; b=ntWSxGV2VNR10uyNVMxlVjZ1daikVRjWHh5d2tnxOtoTu9UXYGlh1p7mAmlRBkpjbpqfcukkwMWLVxFSgEk5z4uusK3+EtJ+EmuMQ5yxNoLOORqQn4FvbUCBcdOq0lXLo/olRTUtww5pBVvTRGHrTTSbR+mxNUv1GXN++zR6kh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806609; c=relaxed/simple;
	bh=Gi/YTTxDQpJJ+XrY86NEd38Z3gq+FJIVfsaBUTWEgTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VI0jSvx8UhgApHBRWZHm0m/Frk8P489Qz+T0fiQnRhSDc0XzmluMrtKw2HwOw8osr7XtTnEbsITFaMLEwdAP5Rao1+FhcygNv9GHG+Y4KPfg93KStCbETRIaDoZCvPQBJjSENJ88XzDWYcPzGvDr94aDYhRClDV7XfarEo5Hmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeYbGVL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeYbGVL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886B31F000FF;
	Wed, 30 Sep 2026 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790806608;
	bh=bKfS95qw0xVuAJ62DwKyjVKJp3rN3ck2tJrkFz2QJ2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HeYbGVL6kEkcKlv23rqlas90U3F16iuEW0NK7BWD/wrYvBBQWcxn8U27GalYALFDZ
	 mVsRDXMTHZWzsR8slkPrHzIE9+hOhG6Fp04fxFvy2ADaf7bqbQb1h3Ngx/GiFy/okm
	 Lp8mB8LqLptl8zJBhaiEi9E2VKSb5SVLo2EqNlto8SCFrZ6EnvL723nZza1xOWRvkX
	 iVIx6tZyTzCJJo1l2vDvAnLAiFmbY6tjjq30imA916oIbtstYylNuAzaV9Bl9m0W0G
	 dK+qk5yUs68n+lmhGhfQl0hx6KvX1BO6YMOZk07Mis1bGfe8jBbtHlmeZeGQ5xkQb1
	 gLErbWBTnx9YQ==
From: Thomas Gleixner <tglx@kernel.org>
To: paulmck@kernel.org
Cc: Kunwu Chan <kunwu.chan@gmail.com>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
In-Reply-To: <43ac14e7-8d9a-4ff5-87ee-55ec3c7cdeb8@paulmck-laptop>
References: <20260920085434.2918331-1-kunwu.chan@gmail.com>
 <87qzici6yb.ffs@fw13>
 <43ac14e7-8d9a-4ff5-87ee-55ec3c7cdeb8@paulmck-laptop>
Date: Thu, 01 Oct 2026 00:16:45 +0200
Message-ID: <87ld8igzaq.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 30 2026 at 13:00, Paul E. McKenney wrote:
> On Tue, Sep 29, 2026 at 02:21:32PM +0200, Thomas Gleixner wrote:
>> On Sun, Sep 20 2026 at 16:54, Kunwu Chan wrote:
>> > tick_sched_do_timer(), called from the tick interrupt handler, sets
>> > ts->got_idle_tick when a tick fires while the CPU is idle.  The idle
>> > path reads and clears it via tick_nohz_idle_got_tick() to detect
>> > whether the tick handler has run.
>> >
>> > The flag is accessed locklessly from hardirq and task context.  A
>> > concurrent set can be overwritten by the clear.
>> >
>> > Use READ_ONCE() and WRITE_ONCE() to annotate the lockless accesses.
>> 
>> The following scenarios still happen:
>> 
>> A)
>> 
>>               if (READ_ONCE(got_tick))      // reads true
>> -> interrupt       
>>        WRITE_ONCE(got_tick, true);   
>> 
>>                    WRITE_ONCE(got_tick, false);
>> 
>> B)
>> 
>>               if (READ_ONCE(got_tick))      // reads false
>> -> interrupt       
>>        WRITE_ONCE(got_tick, true);   
>> 
>> #A is harmless because got_tick is already true and #B is harmless as
>>  well because the got_tick read result is only a hint for the next idle
>>  invocation.
>> 
>> As this is stricly per CPU the READ/WRITE_ONCE() does not change
>> anything in terms of ordering. So what exactly is solved by the
>> READ/WRITE_ONCE()?
>
> This is a step towards allowing more-strict KCSAN checks to be enabled,
> namely data races between base code and interrupt handlers.  KCSAN has
> found a few bugs of this type in RCU over the past year or so, which
> suggests that similar bugs might be lurking elsewhere.
>
> Yes, in this particular case, current compilers don't have a huge amount
> of freedom to mess things up, but the standard really does permit the
> compiler to use a to-be-stored-to location as a temporary just prior to
> that store.
>
> This is like the situation with lockdep, where we tell it about
> deadlock-free situations that it does not see as being deadlock-free.
>
> Seem reasonable?

Yes, but then the change log should clearly state exactly that along
with a corresponding comment in the code. These boilerplate copy&pasta
changes are annoying as hell because they fail to provide any reasonable
rationale for the proposed change. See Documentation/process/...

I'm refusing to accept this slop whether it's generated by humans or any
form of tools.

That said, I further have to say that just reusing READ/WRITE_ONCE() for
this is completely wrong.

A strict and harmless per CPU modification/race is very much different
from cross CPU races. So avoiding any potential confusion and thereby
allowing tools like KCSAN to treat them differently is useful.

Using the same annotation for something which is strictly a per CPU
situation prevents to detect the accidential cross CPU access which
might not be safe at all.

Even if the momentary implementation falls back to the same mechanism
for the tools the value of implied code documentation is valuable. It
avoids extensive comments and it also allows tools to differentiate the
meaning in the future.

READ/WRITE_ONCE() are just non-distinguishable "paper over all race
problems which tools might complain about" hammers.

But we all should know by now that "Birmingham screwdrivers" are more
than suboptimal.

Thanks,

        tglx
