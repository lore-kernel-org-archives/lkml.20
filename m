Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983423;
	b=nUQ2uaveQYk/hasDKPAqCS9kxqpycJQp93zZu2hzfDnZzj2HDjwRIf8F/3ObL/q8ljeO
	 ezQFOC4Cu7Ia164Z6mwLRjMlhic7mzQiF7c6PqBLDbqmmVfhkg9j20xCQv4UJ3iWcaA5D
	 TgVcoZxGHfOJhwIdZ5KhQlesK2+IYRLnmONzSyJu1mXgjqrxAGCuszcIKrzt7gOIRRfru
	 ZG7q+O/7l7FpyvoUNltj1Pz4JesiZNwLtsGXPgYm+R4NXOAwOY/DtQ2+i6lU7+ROwjrRO
	 QcqljgA5jPPqAggfFNHELE+X3slSXOmkihZbLzxe37qU5l+Hz8N5MCHTN80hd2hIUMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tMALTkMSIX3ME5CabQqRd1nuB5iY+47EVIa07+/bvI8=;
	b=1KyAD6LDZlwtQ4vfFSFtjL3xDcWDiERiRNY/0rXnAPSc1KpERrBafxaKTpHh0kzf1R+9
	 Ro+JdbLFTLfVmpMJTpeUs+IadatpwFg62tx7SxTlJ8X06ETfTrYEYBHKEu7EnIT0ogkAV
	 1OAEa//0B0qAsYOecH8clYpU3UvjeZWxj+YLNWAL2BwIWYfw9uXspg8IKVfJxFiCkpX47
	 zX93cI3aZCuxMTbukbBnvlgw3F4hdcfAZs0/cxWDYEi/ADcUwFB87PG3x9z4UZg++BBs3
	 A2MHdfMVFsNDHeO/bKt5+7Js2CKBsJaSY9kYJhyTdv4YPHTeLOv1bNiNLxK4RcllJJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uaWwPo4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E31606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E31606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uaWwPo4P
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1011184a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793983421; cv=none;
        d=google.com; s=arc-20260327;
        b=cq7h7t6/S3oeXDj7Cu4vbGLzlW54IshbvLj4bbPSPunVBbFkGXS1zffVUFQ/g9Ocwx
         oNHw+a3cjrStFpjUMOmrlO+KhwIGFIFCMy/xJX0HOy4w4kHfulDWDdqshvJamLqf8vd0
         gE002Kf20mNQwCPqAyJG8cv+SksptAsYtv3Af1xYeXDOWyMyskkVioc8ydfFCZjfctnu
         Eiqke0gsJ3AlOnLM1JrDxqMgElpb1Oij6eZ/q7KARLPMHypQa9AxHU/gNYZQllOtamLC
         gqI//ge/fKGqUcE6ZJ3Jjp63ohNvAkS/jAZBkBil3gCT+hdL6SyJX3WhZFYlsTla9hsp
         FZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tMALTkMSIX3ME5CabQqRd1nuB5iY+47EVIa07+/bvI8=;
        fh=TvOPQyUQS4bL4eDK5hSAbB94S7pt9KP0K9pSr693DhM=;
        b=JEmxiZ+uuaCcCJvmkBr0rF8+opcrt2a7DUoXfx7ZfyeLWvD09dgbYXO0Iu4HjlkJRC
         SU9kkwQXIRARNoemkm/6Lt8Lz/SPUL2not2aemunByeY/3U0QZTlX9Bd5XXzk/GTQPzw
         cnKTV7IkH8G1REvszpxwD8WtFaoJdLarJu64rwqZ5aPnuJef4MkfFGyvzO4XCIaaZj3Z
         vhG0lJyFRBtDL7KOgS0DGL3odWYZdG9awMKjpX7GGGim3qQX8n/rO7ttic3J5wI5m0Up
         pJqj58g+2bevwskKPbt/pxde+S3wjA0sKOGYHq9Mbt3M8O90DY+JJWjhRmeD5yGzUt3W
         BtUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793983421; x=1794588221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMALTkMSIX3ME5CabQqRd1nuB5iY+47EVIa07+/bvI8=;
        b=uaWwPo4PNXumAn5F5++/JBucJVmBGf5DrcZX8G4qSUDHJqnupBOyH5baGwJN1LNzQy
         F7+FSppVU6Xjwj84O09nWVm2jsfjxC4WTsRasQ1M/T6cYplCGrX818lp6PbMNpGw+YnK
         IbJTR33IKCkt4vhZidsIWUOGatYSaBaRHt8Htzgv0EHW9+Kgz48zZK5qbE/8n2Ymn6Uo
         Bi4BB0CieSQjBRD1+kKm7dJL3kG/BejC999zF776fS2RLQvO2iaVrfHiQ0UQ3l57Z99F
         D+dxl439N1XWz2B7zAAJAZdS/beoOlO51FPIePzu26fXxr044m9qraE5+vAgOgGfL76A
         /DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983421; x=1794588221;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tMALTkMSIX3ME5CabQqRd1nuB5iY+47EVIa07+/bvI8=;
        b=CaMFSyOwo630HKBuMk4rxCIYGlaSSeK/Zi1Poyog451uksNhx2nWMvWtn6XVqYm9JH
         pBdugALSW5SmYQTNUaYd0bDpb4h4Px/Gu9itRFrFReTM1/Le+4MZjZmDr4EJ2sNVQvOX
         2Rxfi6KiRFG+WMgB5R5Am8LhUIenC9rJMiikwitWh7H3lTay391GJ4Ae3ZUpKHsb3S1H
         0XMkxQJ6ilQVgt2DZPie2wmfpOPalzEhYa7A0hkwm8ZZhEtJJ1E7R1mzPbjI9rF3TD1e
         68/5iO/JGq+v5Drr9gQyey0jY5vsObLJXwoD75oURYS4QQUNV0BAR4D4gxIUqspc14Lr
         qdWQ==
X-Forwarded-Encrypted: i=1; AL+hErEAQPEdOudGKMvmoqbDf+AnohGNp0Dmu+T5SZo28t5pR7xGqyyY0YNjQDSAcx3U2BToVL/NjdlwJZBiPlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z95dSoLFAl7W4CGbhA/aCJhkxAV1kqPD2h9tB0sDiHfSgdE2O9X
	L4m58kn1K9//oQpFBhrOuBEO5xPwP9A+lD+IDk4UziGzXuQzWAirh6Y41lcDpEKSCTuF8wp4fte
	C6ZulCF+BLF0dSFbHea1JvZf7d1Ek6MbTrF8Qzj1Q4UcwNfwzI8msl4Y=
X-Gm-Gg: AYBFou0rKT5X4oEZa+WQzqhS4Xj1nrMjqP3rw4e/V2xT2BUF9qKZh2tRuki//quGekT
	VHKdOk3X+3yukh5Ld0qOGw6KWNBlqspZ0MCbP/YRXJlVmBdzpxdJTLNLTIQVAY2D9ijrM4sjplX
	ThT7KtuDw8iPqOWkshaD5hRZ3THd4ILquGVsyGmNfGtSjHgiBG41oToz1PYmAV476HfcMjka9Ui
	iTptcByBHvIbOl3dn2L6Gh/8jKwOAglxhk+mw9ZiOdg6gtnhZ4NbGr3ph5VcNdt8QV2hB8Rft5V
	kZTSTxLehjmhfOrBvsBSTWzHPDW1NEyYMtZcZml+FkPUrYLvZ49G5d9GYZtmyCcIH0UEcwvsnX4
	saRQ+m1u6XwEA8VB5MUoS004sO78CWQxoHVKj7wNuuCPtAliLgN7w9s8n/guK/5kO0eAU6Q==
X-Received: by 2002:a05:6402:2809:b0:6b5:8247:7bd2 with SMTP id
 4fb4d7f45d1cf-6b59752e5ecmr2382134a12.3.1793983421020; Fri, 06 Nov 2026
 08:43:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
 <37fb82ff-ed5d-41d7-91b7-afe4379a636c@linux.alibaba.com> <CANGjgdkx8DJLjD-j86p7pUqY+uNukSHqHyOFuMfK5YqSAX6knA@mail.gmail.com>
In-Reply-To: <CANGjgdkx8DJLjD-j86p7pUqY+uNukSHqHyOFuMfK5YqSAX6knA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Nov 2026 17:43:28 +0100
X-Gm-Features: AclHuK83tz4prU1XgdIH6VmPsnrpjq62FwhlAceTLKXcfpxZGT4RYIeIEQa_8X4
Message-ID: <CAKfTPtCJVBpZNm7bVUSQZ01Q-iStNZvdz6BiNw1NN9+7y0+=mA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Tianchen Ding <dtcccc@linux.alibaba.com>, Mike Galbraith <efault@gmx.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 10:46, Chengfeng Lin <lin2530632123@gmail.com> wrote:
>
> Hi Tianchen, Mike,
>
> Thanks for the suggestion. Disabling DELAY_ZERO also improves the
> 15-worker pipe-handoff case here.
>
> I tested the same v7.3 kernel image across three fresh boots with
> DELAY_ZERO on, off, and on again. Both 333238da9a19 and DELAY_DEQUEUE
> were retained. I ran context_switch1_threads with -s 15 and -t 2 or
> -t 15, keeping the native CORE affinity on the same eight P-cores.
>
> Each entry below is the mean of nine runs, using the native 15-second
> post-warmup measurement window. Throughput is in millions of handoffs/s:
>
>   Workers     On A       Off       On B     Off vs. mean of On A/B
>         2    1.156     1.159      1.158             +0.17%
>        15    9.172    10.425      9.165            +13.70%
>
> The largest within-boot CV was 0.60%. The 15-worker on-again baseline
> was 0.08% below the first one.
>
> GNU time's counters from the same calls, covering the whole invocation
> including warmup, also show a change in switch types. At 15 workers,
> the mean involuntary share of context switches was 0.36%, 41.48%, and
> 0.36% for on/off/on. These results are consistent with your handoff
> explanation and Mike's point that the added accounting changes
> DELAY_DEQUEUE's behavior, beyond the cost of the update itself.

333238da9a19 ("sched: Update time before requeueing delayed entities")
fixes a bug in how the lag of a delayed dequeued task is accounted.

Let take the example of 2 tasks TA and TB running on root

Without 333238da9a19:

- task TA  starts to sleep and is delayed dequeued with a negative lag
of -1 usec
- task TB becomes the current running task
- During tick, update_curr() updates TB and moves forward its vruntime
(and avg_vruntime) but it is still behind deadline/vprot so no
resched().
- TA's vruntime is now behind avg_vruntime (i.e. its lag is positive)
- task TA wakes up just before the next tick so TB has not yet been
updated for the last ongoing tick (up to 10ms)
    enqueue_task_fair( TA )->requeue_delayed_entity( TA) ->
update_entity_lag( TA ) -> TA lag is cleared and TA vruntime ==
avg_vruntime == TB vruntime at tick N-1
    wakeup_preempt_fair() --> update_curr_fair() -> TB vruntime is
updated with the ongoing tick, avg_vruntime move forward by almost
half a tick and TA now gained a positive lag of half a tick (up to 5ms
capped by its slice) whereas it had a neg lag when it slept. This
positive lag for TA is wrong as well as the negative lag for TB
- Because of this wrong positive lag, TB is ineligible, and TA preempts TB.

With 333238da9a19, the main difference is that we update TB before
updating TA lag to make sure that past exec time has been accounted.
i.e.:
- task TA  starts to sleep and is delayed dequeued with a negative lag
of -1 usec
- task TB becomes the current running task
- During tick, update_curr() updates TB and moves forward its vruntime
(and avg_vruntime) but it is still behind deadline/vprot so no
resched().- TA's vruntime is now behind avg_vruntime (i.e. its lag is
positive)
- task TA wakes up just before the next tick so TB has not yet been
updated for the last ongoing tick (up to 10ms)
    enqueue_task_fair( TA )->requeue_delayed_entity( TA) ->
update_curr() update TB
            tehn update_entity_lag( TA ) -> TA lag is cleared and TA
vruntime == avg_vruntime == TB vruntime at now
    wakeup_preempt_fair() --> update_curr_fair() -> nothing to do. If
TB is still protected by its vprot then TA does not preempt TB

That's also why when you disable DELAY_ZERO, you get the past behavior
because we don't reset this positive lag accumulated during delayed
dequeue. But this is still unfair... If TA has a null lag when is goes
to sleep, it will wake with this same zero lag and will not preempt TB
but with a -1 usec lag,  it will gain half a tick of lag (up to 5ms)
compared to others









>
> Thanks,
> Chengfeng
>
>
>
> On Tue, 03 Nov 2026 15:07:41 +0800, Tianchen Ding
> <dtcccc@linux.alibaba.com> wrote:
> > Hi Chengfeng,
> >
> >
> > We also observed a regression in a pipe-based context-switch benchmark and
> > bisected it to commit 333238da9a19 ("sched: Update time before requeueing
> > delayed entities").
> >
> > Our working explanation is that updating curr before calculating the delayed
> > wakee's lag advances the runqueue's average virtual runtime. With DELAY_ZERO
> > enabled, the wakee's positive lag is clipped to zero, triggering repositioning.
> > With only curr and the wakee in the same cfs_rq, this can align the wakee's
> > vruntime with curr's, making both tasks eligible.
> >
> > Curr can then retain the CPU through slice protection. With equal weights and
> > slices, the wakee's newly assigned deadline can also be later than curr's
> > remaining deadline.
> >
> > Before this commit, the wakee would commonly preempt curr after being woken by
> > curr's pipe write, while curr remained runnable. After the commit, curr
> > typically continues until its subsequent read finds the reply pipe empty, then
> > blocks and voluntarily switches out. We believe this change is the main cause of
> > the benchmark performance regression.
> >
> > We observed a throughput recovery after disabling DELAY_ZERO. It would be useful
> > to try this with your benchmark as well.
> >
> > With 333238da9a19 retained, lag compensation on delayed requeue uses up-to-date
> > runtime accounting. Should we consider making DELAY_ZERO default-off?
> >
> > Thanks.
