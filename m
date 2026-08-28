Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2E37AA9C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950221; cv=pass; b=PlZh9KoK9MFOx00mO5M4A627o1x7G6kVKESTMwxAxgPe9LHSVKLmXYPRf36YmodL4UW+iRnJUg14pHKXZySmQS9pfRKQbQ0zGdAbHaYxdL0vwEzkMFmudvZAt3ghtT6NCQKY6tKRhXI+SW8Ee6hA8uke6JPR5FIy677wwLuKY/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950221; c=relaxed/simple;
	bh=VCTTpD8pvxJ1f7angD6R6tXvCBNfl8EVF0KiF5vqwec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbAeCvsh0CvdVIo+swR0V4I1r2xJlXFghaYZ7/Wgzs8htbiyKjlJnVZKN56vJlCUPwRSB6kOhV4ioy1E1rpzavcZdSC6M4LWmch7XaNs1xzNphO9zKwOjeu3mYiwbR9gkee6RHzyNEZJT5wyiB0mwutf8JKOe8/LsJYPieBFX3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=to5JxWfG; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="to5JxWfG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498012a61f6so11275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950218; cv=none;
        d=google.com; s=arc-20260327;
        b=nAYTfuaNO3FdMBZL0cDyixp/JFA/4DZ8a+ncnoZ5cukCLRCAqLk9/ZmPbvhAxqM+59
         eRi7bI+lrYKSRokgvvI6W9QIVuGPpoG9OMaRr3q2/puh8bdmR77hbXS45IafuyPxY/7S
         nfuI2EzRDMvPz1QdI8rbVNkBXVovhLeu7eqksr1J1T5q8DPFUb7siUh8F+JjhtECrG3j
         DhhT7rZ2YOB3tDbftMfOXKwY0FwWrSy5wRqnuuqtFzMBJclWettkBK7r3umafwqJY3wa
         4jqx6Xh2VXhA3PWb6YPacho6hlK/KJb1/OPP8xhqKwsHDNHv88AOJrgtEh0x5aSLU14z
         aqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        fh=d/MhKSb58BXw4TLF1s5szF8GSr3q2nwJTxIEvhq2FV0=;
        b=n6xqJY73yLGHMXIxppKRudRVl6NFBF3/OyHYYCtjvMJj5YVW8ML8DdqfR2Tb/tfCAt
         hLjMaCzgXJNTgADrWJPJ7N87waHCYXKbRZf1Hs9Srlze7V63YaTqD0paVjA4Go21BWvi
         9tRiBpzaScajX8t6amrnILkMHlIiP2d82mo9JmRlpGceSmUve74zIeTuUf8hpOZzSh1u
         jZu4tD9b2vCW0u3+8+2NENqsSTVhdkFa0xeaBWom+e2wSzRAR+ZAfkUyGlOBKh4uQv0n
         ci0ojYhabYvTf0QWDOZvhounIs80sKqjlXHouNJG3nMOn6PXeOdWpM0tPHIx5g2fNB7I
         tHtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950218; x=1788555018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        b=to5JxWfG9RYGd3XVT7SUz5CNQp1jFCTUA2KB/fm93oZP/4UVl5vpPEiQ1f974WEz/u
         Ynv2Ugx4K4veCn81x5nrNp4tpb4vDRAM4yp1SRY0m0gYJByXWFe29Nwe3rw1hWQ4kwhc
         6ePor7Ext+iCWSqD5/Ck9RuGs2oS8vfm0qGM/h4JZTFDn7eLqjA9gwLSbJ7QfBwHtSpE
         R5M6E0S4pRxptBVnUFAdrElbXUTDfk4MQ54I2TQoNOoqKp/+fHZuBwHmna/5CNG0EyjT
         G7hYlMQzvMMGmTC+MksB7CVu+92GaIFmjSXQyvSKqcgJhjqcKJUEC+GSbZRV64V2mu9I
         SO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950218; x=1788555018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        b=YaVUAqW4Gk4cF9bO3+kbnsiYd5M36SiKGzluIPh59AhFHsfzNwX0B6ge+GAnlTda8U
         dsWsQ2ODtocS8Bwi6/n52eSna9QRW+TVKxKNwbbGQjqYWrnqH1CdX0F4V76SlxRWkXs4
         2b9d+e5OtEIWBL3ZphATIWyOIQF9VaCbMpE/eti/SegpbiF60OOc8mUOLvImhlTvxYjh
         oO+DdNREe99E7pLxGrT4dq/cxO3hPlkygQmy6Gq771/9xPI7yyRe+iELBMMIf8gFzZJU
         cqBTpqfIQRb5gNAtJxiCaHRaL1uXfKuqdO1T55zRcCjkxrDjUmnUz0UKjjTVp2eWaood
         Yw6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoW6U4WeJX4CL/+q7omRp/FCsKj4eX2EJRO7/qh/oCboXXlFh/60qdd2uaR/lvSNHtGV7wZ+tmzONfGGhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ma3blRK1J4p9XqtMu9tS2798uK7mAN3x6BQl8XXC3hEHR5mob6
	YhDMnqLeetmbdbTHRK6GSpp3baXpY9XT1fNU4fdiPQYXYNmRUasWvu26MXNJAdo/agA8sHJ7f2b
	Y8iWlmtEhj2jH9JZJrXbDIyJleRiQOqIzPAclDOD1
X-Gm-Gg: AR+sD11rC8Mgg5CqRRCx/9GT/4mmoiV6pEbitKbr+ysWM2aUocjzn5vUx2/BFt31Vxd
	fQb6toU+ubA/7OaxkoRGoCPXlDPTxDeu2LgUKkWGJWWVLTj3xu/qexv6+jnDJaIg6JX8RUdG8EQ
	P3GIBcLrThh35cCStFWfpmCVusD+Or5KDoTMbkQ7KCy1fxVP63XFS+KKZrK4GJtFm+zoXETFF5T
	9VPQ2ITK3svuANHj7Q3D1+X8EYT4t2ofE6ZG66VBPeffk044bd4iy/eSLISvcG9la8l0oGA4nPE
	sLy74h3Vy+qsQ1OWnV36cF9BfH2o3oT4h6dmuwhjuzk/uwSgJoStR0YrSYofPi5s0YSLsBVgMIU
	=
X-Received: by 2002:a05:600c:e40b:b0:499:a6a5:a687 with SMTP id
 5b1f17b1804b1-49ccbab90e6mr277105e9.0.1787950217353; Fri, 28 Aug 2026
 13:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de> <20260828135947.GU776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828135947.GU776954@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 13:50:05 -0700
X-Gm-Features: AcwNN1VyWJkmCojhn4y_J0QYwM3NKcFniOfDcwtOJUcQgsmCVgZZIDC5YzitEe0
Message-ID: <CAOiLmNHrbXeTY7zoNodmaZUoMWf+NgvGvZ_LjfWD-1sKAoiLeQ@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:59=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Aug 28, 2026 at 03:36:20PM +0200, Sebastian Andrzej Siewior wrote=
:
> > On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index fa7507ac8e13..adb4a5957996 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -1534,6 +1534,24 @@ config VMAP_STACK
> > >       backing virtual mappings with real shadow memory, and KASAN_VMA=
LLOC
> > >       must be enabled.
> > >
> > > +config HAVE_ARCH_RECLAIMABLE_STACK
> > > +   def_bool n
> > > +
> > > +config RECLAIMABLE_STACK
> > > +   default !PREEMPT_RT && !PROC_KCORE
> >
> > This shouldn't default like this for RT. It either is useable or it is
> > not.
> >
> > > +   bool "Allow stacks of some blocked threads to be reclaimed"
> > > +   depends on VMAP_STACK && !STACK_GROWSUP
> > > +   depends on HAVE_ARCH_RECLAIMABLE_STACK
> > > +   depends on !DEBUG_STACK_USAGE
> > > +   depends on !KASAN_VMALLOC # TODO: add support for this
> > > +   depends on !DEBUG_KMEMLEAK # TODO: add support for this
> > > +   help
> > > +     Enable this to allow the unused portion of kernel stacks of mos=
t
> > > +     blocked tasks to be reclaimed.
> > > +
> > > +     The wakeup latency of tasks with reclaimed stacks may increase,
> > > +     especially while the system is under memory pressure.
> >
> > It says *may* increase and on RT it _definitely_ will increase since
> > there is a kworker involved not to mention the memory allocation itself=
.
> > Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> > exclude at the very least mlock()ed tasks.
> > Did lockdep see this?
>
> It should have. They're taking spinlock inside raw_spinlock and lockdep
> should very much warn about that by default.

It does trylocks on spinlocks and local locks, inside of
alloc_pages_nolock_noprof(). Lockdep considers that safe.

On PREEMPT_RT, it is necessary to skip the call to
alloc_pages_nolock_noprof() from under pi_lock, since with that
configuration spin_trylock can end up needing to take pi_lock. But at
least on !PREEMPT_RT, there is no risk of deadlock.

-David
