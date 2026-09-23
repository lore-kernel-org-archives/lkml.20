Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA931B4F09
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122583; cv=none; b=r0vNu6BsFbAX758IN90FbjvIz8bv/M7LMxdif775VBBroQsPzqATY/OxMnvKjWGEfHfeZwuazjQE7Lby6hl6630Rh2jlPjOzqcI8yE8xI6NPsSSH6PrZ7Jg/plieDh6Z6QiwC2g5Qjbh9vYFUsxegAu5UqBbFOSPojqVoyfKRXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122583; c=relaxed/simple;
	bh=QpQJ4P+1QuwFIytToYpQ0l1bkWL7uzAhHzRmI1lxObo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD3yyLKAUE7krGwpI+Ml/t3KUSAppYcpCcg/q2oUmdRArrMzAAgD+5OsSKOr9v50M++O825nmPZr+yEm5dTbaLN8/0aZ78WnJI/XCDqNq6U5D5po4lZ2TyGZRGlcLjqCa0obq43kJD42PxTF/48JpfZYS5ST46+HEuC1acTc0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOukK+D0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOukK+D0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so226757f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122580; x=1790727380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGaf5/XDGDoLwT4whw7j8UodAPOmfiavhJ5qJSDxFhs=;
        b=KOukK+D0aEuKjK+fHlc2gPYwXyMVBnURNmBGHL8EZwYmewqytZtpFXUpmuKLP78JBQ
         BwZBpiVLrB+ieQoxcWvzSzFpWYprzgUeRMO48gsacPmh2lSF2yAAO6HzBff+t2LgQWxH
         jPg6r1CUe3AN4gjrTeRvpvWgi1uPIg1tkPTnfCrMXWc95U2QmVpbYu5hJFtZN6bZ18PZ
         CokieVb1syjwyTKhsTfdp7l3RgGFqV7C0QZeWhd+PjowATYVw8DlKlduftS+gIajcy5J
         X4F64QadL6aLFdlBDNfWqDrmKiPSrZhqW+dYdOOpUKnLBtkGBS4lr/L6JhKMP9BePMLf
         +VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122580; x=1790727380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGaf5/XDGDoLwT4whw7j8UodAPOmfiavhJ5qJSDxFhs=;
        b=bo5PiITLRNds6NUiIE2BrZT/88FAfkU8KpxgTWA4kYJ67KKbP+za7PN1b7KSfyzbhd
         rAaYPQAFQGknudOx6X7YXuHFEV1qnA8KXUakLJrn5TncLhjq75JxCzPQHNeAiY43HbaG
         YtIdtZQeQfYqy443fVCzYijwsPFaAfLcEnNl5+0jTcDNR0Qq2sBlrj8qbMNRt5siQSTL
         Tsz0ebGQ14TKS+pYiTg5LWaqCyYCbeSPTpmOoePSfnoMWRC16fXLAE2hAXchYImzkx3H
         T3izkhl+RQbyl/ufUuuPBDXIWtWimxwbsE2/mY8aeRXP4fzoggVcCS40dgqOyanmoDnk
         AnBA==
X-Forwarded-Encrypted: i=1; AKwUvBzpLmvYZ96ik3O2JkJbKvHqLW8me4mw1ae1VFg5DFiggkfWPbYPtY7fyDI/kQVYaD4EMdy43Vnj/3V4GCs=@vger.kernel.org
X-Gm-Message-State: AFuF++mgh4lOjcc+Si5E6Z1sMSdnax01filGi6gTDnS57q893Ps4he+y
	iA/WAaQh0d/xNuJO5aEd+mNlTKiWcBG8FEorNB4cgleLdrieg0ew0Qbi
X-Gm-Gg: AYBFou36txrd4BxCe0WBYk49riw7UD8OQxY193KkFgCyI9IPaf+IyEdUCMPcHlwQnwP
	iMg+idp1Kt9xJNfjDApaALNzsPBAz6pa2LFaJnJ87m5yZWyUgfZaiuCsi72x/uFqorQhbaq3y/u
	VH4ISIEPO2VDphmyiyYDH0RgM8/H4BivhLUKx2YDGMd0nWrGRlHRN+l86BryKv5GBNUTVhDmcVl
	29lEv9EtlgZ3TQM8UQ1P7K0dKb1vt29F/i30GsDYh6p+rjvtV+fX8+FA9hweBtUv0+0wNAw+feZ
	Njb5T9Hbiyl2p8GRH0jgkQ0dikyZTnAzpJ+G6BIhrbQ0RemUwa+G98WIq1piMsDio/iqMGBUxFr
	T5+kbFZVhnpeGLLDgA5Zf3Ot22RuLzWDzRFnAx48GyLetb7Rpg8qm85SIvEQ3oYAUKYtnEXS0Cy
	cjNxL9nagfJBIO+kOklrDfc+FXjXX2/PACiglxiAkty0yzQkuHPKUcgZ9snbTpmQP2C+RHmdw2s
	xPdscLu7hzfmMcPL8vCtn51IZjfaAu4FWKHQUTPJQ7Fe5TJEziFkSrtZg9QLx8boxRu61esDfJe
	j0n/Dc81HodLHkN9QtlE+kGNu/DeNrMYay8jNLXsLimtdPqztaQuM/J9b3kqCdtQb670MjlPU1A
	fzLnR
X-Received: by 2002:a05:6000:4b14:b0:487:62d:37dc with SMTP id ffacd0b85a97d-488670af97amr1253715f8f.32.1790122579667;
        Tue, 22 Sep 2026 17:16:19 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a5e6-3401-f8e1-409a-a02d-633a.310.pool.telefonica.de. [2a02:3100:a5e6:3401:f8e1:409a:a02d:633a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877970fsm2152470f8f.24.2026.09.22.17.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:16:18 -0700 (PDT)
Date: Wed, 23 Sep 2026 02:16:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] softirq: Preserve interrupt context during IRQ exit
Message-ID: <arMXH87-cd5U5DS1@gmail.com>
References: <20260905023210.82853-1-kmehltretter@gmail.com>
 <20260917152150.dvEKJ8B3@linutronix.de>
 <20260919075105.34023-1-kmehltretter@gmail.com>
 <20260921135015.edLXthz6@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921135015.edLXthz6@linutronix.de>

On Mon, Sep 21, 2026 at 03:50:15PM +0100, Sebastian Andrzej Siewior wrote:
> The "important" part is this fixing something that is broken today or is
> it just avoiding fallout. We don't have any memory allocations/ locking
> in the mentioned window as far as I know. That would fix things, just
> avoid fallout.

Instrumentation sees the wrong context today, the rest is avoiding
fallout.

There is some locking in the window though. With threaded interrupts,
and always on RT, the window wakes ksoftirqd and ktimers. The tracepoints
of those wakeups then run as if they were in the interrupted task. On RT
can_spin_trylock() does not refuse in there.

> > -Woverflow is on by default. I'll swap the operands:
> 
> Is this some gcc-17 thing? I don't remember that I saw it and I did test
> that.

gcc 15.2. Without the casts x86_64_defconfig fails here, because it sets
CONFIG_WERROR:

  include/linux/preempt.h:78:25: error: overflow in conversion from
  'long unsigned int' to 'int' changes value from '18446744073692774656'
  to '-16776960' [-Werror=overflow]

clang 21 warns as well (-Wconstant-conversion). With the operands
swapped the value is positive and fits an int, so no cast is needed.

> > HARDIRQ_OFFSET after the addition. In softirq_handle_begin() I will move
> > lockdep_softirqs_off() before the assertion. Then the lockdep softirq
> > state is consistent if the assertion fires and printk runs.
> 
> Right. I mean you have one state and this what you want test for. I
> don't think it make sense to test before and after arithmetics.
> I am just not sure if those warnings should be hidden behind
> CONFIG_DEBUG_PREEMPT similar as preempt_count_add() does it. Maybe it is
> not hot-enough-path to worry about it.

I'll keep them for now. They only run when softirqs are handled on irq
exit, so much less often than preempt_count_add(), and the softirq
handlers run right after them. With both checks softirq.o has 8 more
instructions on x86-64 and 11 on arm64 on that path.

> > Yes, that is the intent. irq_count() would skip the wakeup when the
> > interrupt hit a BH disabled or softirq serving section. The old test
> > did not skip it, and nothing else handles pending_timer_softirq.
> 
> I am slightly unsure but I think we want the wakeup of the timer thread
> even if we are in a bh-disabled section. If the current task is a
> SCHED_OTHER then the wake-up preempt it. If the thread is already woken
> then the wake-up will do nothing.

Yes. I'll use !in_nmi() && hardirq_count() == HARDIRQ_OFFSET, without
softirq_count().

> > Today the wakeup already runs before the rearm when no softirq is
> > pending. Does the old order have a reason that I do not see? Then I
> > keep it and document that the timer thread handles such a softirq.
> 
> This only matters for the threadirq case. Here invoke_softirq() will
> only wake ksoftirqd and wake_timersd() will only wake the ktimers
> thread. There will be no new softirqs added to the mask. This currently
> is an ugly catch-all for both sides. Ideally only the softirqs raised by
> task X should be handled by task X but the first one will do everything.

OK, I'll drop that change.

Thanks,
Karl
