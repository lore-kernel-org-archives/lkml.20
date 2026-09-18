Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092054704A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713026; cv=pass; b=hM3gtOUxfONNV+3twxm+BG7a/h039g3MlnsLy4CqFM8Qh7ghB+4cLsygTjlFxpLmRGItYZcY0i0EFQXSnA8XiuUH4pRZfdIMR5gUVBfa4BLxOZ+ecuIv4kUJ4kiUBdkduZxnGh+mKCYgDNyapZOLJOulRBVe0V43QV2ucJFqe6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713026; c=relaxed/simple;
	bh=KTQVfji2f/OGosmpxpqpiilh2dejGoY55VBH2mBIO80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soYpmaJ3/NpputHLRsYYj4h5Aa6bAJ+VUMMkSNMeCsDawk3KRXCFgKOvQFlRkcAuRyHLnzjbjBVh4KYwkbDdvmIb1OF9/5pyNzhfoXQQ9EQDmyMPPW23/arD7Eqh2qbzq7BFgm2e64eHgAmJbcFubGXSXwHfDchpX/1RT7Y0mSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f/07Uhvx; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f/07Uhvx"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca02so4571881cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789713024; cv=none;
        d=google.com; s=arc-20260327;
        b=OXOCKpU1kyA9A1zv71EJKFuAaUolw5Kl6brd98bdn39ewQGyuVw0jqY0UqoWg8DLnY
         VCnVMZ2GebaLa0LRsF7FxZah8x7FfGjmOb/0DCiE+TYNaJr0OYSM+nZDx6EXPYjYg0xF
         D2WeP3bL5lg0lmPsNkWy5pc/r8Pu6LwZcBDjL1cvTpjoar1eNmQ2P3j2BEAIpzNZWrJj
         qt71xEinNA32fSj4R7ccQdfiWW+DkRUYYEUaptlUp6h1cMgocFK8cZ0WTS7mN3bNwMUq
         MsQqLmPxalDJoqZ60r5YAmUNambGb2scF+GHeYFuVf87foMrivSspcksPO2W/nKbAm6r
         kiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QydxB03YQjqGjKAOBqEMtxXZkjxNasuwCBd0v5rRF4A=;
        fh=G1W8uFr6ExBjVN9mmX1nxPpBBMMH/SnGsiw3NprlzLk=;
        b=IfPeojSPDt/wl3jfQPix5UZHOnWl60wFT3z7GJsKqIVjM+FhE2y3SRAigq4DAFj9uy
         eVUJUpanV74FzngoNPrTRHlck5LFdGQvb7q+OtQIKX1TB9R8v591XgaBDPLqf6T1thKg
         SoOqp/T6ehaxkX9XMVvHZOj1pszPQRTErbqFcaCsFc2NqDbl2UEItB3H3Q7n+vy4USj5
         l5I4c+1lYtNfrq853DG7AzVzPoOT5Nhw31j10abAxOvdE5A1F9ZU4FgNBsceE10hi2xa
         tbRiGXSpuGxZ5K796AOx/w/Qh/2VpXp9GENGUwWYrP9HVq3he5eosU9rC4sDLFySe4xh
         X49w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713024; x=1790317824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QydxB03YQjqGjKAOBqEMtxXZkjxNasuwCBd0v5rRF4A=;
        b=f/07UhvxMgMHRzv6/6Qc/RAkdJzWqYnS7gNjJ2lMIXCd722NQJhsRurlMnpU4OxKgA
         PGqySc1jiUwz+IuS1o7rrSKFmqOObwc3JOs+Svr9ugWEpElA6BjvC8j0NN9g9EqY97PJ
         cTGDIZzd98W8sd3hSogftcNjf/eTIiRfacauuSo0VgoeZ+fUZPZnmpnJvKn+zMf5ZYpE
         taVJSsxLMp5f2er9BM3QTupXozwvwB2rlmrRuHvG651cp7nhWTlA5CNE9v9vcnjTh5ni
         AmsBJ1C8YyEOi1HxViDdhUw78VbJJUOZ8ARC9qBT3eOYyigk3HeXoc8M7tCe57cMCCP9
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713024; x=1790317824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QydxB03YQjqGjKAOBqEMtxXZkjxNasuwCBd0v5rRF4A=;
        b=BPz618uADB5OTC34ftyrWEFpi+DHOGFeqwzD0+bmmfJM+OofoXaUhOClVpo3Ri0uk6
         ddin6AKgMqibEjU6noX+tlDly3uhk0iPhlB2r88ld61m/K7SQLsi6wRXpqqX9zt4qGSi
         m/tPimU96srRkoTyrfpR7uYZoDDttDCTxOQARxw9VTjC9AyxIeYGkHzNrmKk4Q2lWY/s
         8RoeMIP3W30ktFpxG6XesHuwl7SLpWtFtEnV7ZUvBf1QXo1ToWf8eWRmcfrjBqeSCyVJ
         ixh0NKNu88XQNB8kjFXMhhSxCklLU7xzt5MyRS8PTvRqguNHYLT46bDlaBjOoE4B+Wzx
         ti+A==
X-Forwarded-Encrypted: i=1; AKwUvBwcuPShkqS6t1YLo7hkjRNopxYnbMPd5DSo/rAlVScdu3uspznMSh3xseSaXMrJJ8ihpyPsJbP6ekrU2U0=@vger.kernel.org
X-Gm-Message-State: AFuF++kh5BA9pCbemC8pYQVxloqDC8A4xKRIZPgRE/cFKe5fKAVwAadq
	27iBkZ4Jjt+TOl1JI/FZjceYg5eYnVTAvvt1amGvJ8CCel0NlYfKVIb8rBpQO6BocLn06hgd8+M
	AmPwKvadGmKzS+J/Jse5fOv0XAGudhyUpCm/dA5Fq
X-Gm-Gg: AYBFou0BlyP5ik3UlHn6l7vYBAqHcup6mcMAnqFuFaJAmIyEsibqDQB4EVc9wCcqBS1
	uZgnRWhAp3yd32BJd6uAiIAvVvlt5XewcT02X5h1hUHJ7sbnKsH2XmJqEpnYswM99wIZAEgZEdF
	xd8KYdFj8dBOk3Qoq0ufhX8JwopPaFdkKfR3xvq+U0nHEiSt43qGRRgKK6eQH8XeWTolYIcxCx9
	ZdfDtExT0ZKVZkumCROlB09OWCXg74epgk6D+7dWF1imHZnYOQHx4Ecb141cgmjzz5VN5r5HwHQ
	OFOCEbJGUFz0oiM4iLSF9uwKSkkOSfXMbCg0Jz9EA7uPoX2a2gXoi/x5laXonTJe/J66ItkQY/B
	MQRzmDSSMGA==
X-Received: by 2002:ac8:6f05:0:b0:532:9adc:63b5 with SMTP id
 d75a77b69052e-5329e526895mr27152201cf.70.1789713022923; Thu, 17 Sep 2026
 23:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
 <CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com> <20260917145124.43eb2102@fedora>
In-Reply-To: <20260917145124.43eb2102@fedora>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 18 Sep 2026 15:30:11 +0900
X-Gm-Features: AcwNN1WGdJTTm6Zj2BbHQwKxrBaOmNmoykDjNNwiv9DLkaaNRpE-AHBuL9B8xX0
Message-ID: <CABCjUKDg1UHooKa3ju5o9oM3oFY7mhruXSbTH3sMFt5gdWAo=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy Execution.
To: Steven Rostedt <rostedt@goodmis.org>
Cc: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, zhidao su <soolaugust@gmail.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 3:51=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 17 Sep 2026 10:53:47 -0700
> John Stultz <jstultz@google.com> wrote:
>
> > Indeed, moving rt_mutexes to proxy is a goal.  Though the performance
> > concerns from FUTEX_*_PI have to do with the semantics it (and
> > rt_mutex) promises: strict RT prio order handoff - esentially FIFO for
> > SCHED_NORMAL.  Not so much the mechanism it uses for boosting.
>
> I started working on this while still at Google on the
> ChromeOS/Android-on-chrome team. The biggest issue we found with
> FUTEX_PI was that it forced all users of it to be fair. Even
> SCHED_OTHER which did not even benefit from the PI code. The result, it
> killed performance, and nobody wanted to use it.
>
> What I recommended was to have a new futex to allow SCHED_OTHER tasks
> to be unfair (just like rt_mutex is in PREEMPT_RT), and also to allow
> more to be done in user space and not require every contention to go
> into the kernel.
>
> We had a test (Suleiman, can you share that test) which emulated the
> code in Chrome and by switching to FUTEX_PI the performance dropped by
> a large percentage (I don't recall the actual numbers but I posted them
> internally at Google). By switching SCHED_OTHER to be non fair (that
> is, when the lock was released, if the next waiting task was
> SCHED_OTHER, and the new SCHED_OTHER task coming in could steal the
> lock), and the performance almost went back to what normal FUTEX had (I
> was assuming that going into the kernel on all contention was the cause
> of not getting closer to normal FUTEX). That alone was a big
> improvement over FUTEX_PI.

Your test is here: https://rostedt.org/private/lock-test.c
Your PING implementation is here:
https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log=
/?h=3Dping/test

>
> There was talk about changing FUTEX_PI to allow SCHED_OTHER to be
> unfair and to steal, but that would change the semantics of it and
> there may be some application that requires FUTEX_PI to be fair for all
> tasks, even SCHED_OTHER. This is when we decided that we need a new
> FUTEX_PI (new generation, which I coined FUTEX_PING, but kinda of a
> joke so feel free to change), so that we could change the semantics
> without breaking backward compatibility of applications requiring the
> current behavior of FUTEX_PI.
>
> But FUTEX_PI requires all contention to be handled in the kernel, where
> as we can get even more performance if we could change it to allow the
> SCHED_OTHER case (which can steal the lock) to be handled in user space.
>
> I haven't looked at Suleiman's code yet (I'm currently traveling and
> don't have time until after Oct 10th). But I would expect this new
> futex to keep RT tasks being fair. Otherwise no RT task will use it.

Currently, my implementation allows a fair task to steal from an RT
blocking task.
However, I think that we could easily change it.

I suspect that for our use case, we are ok with fair tasks
occasionally stealing from RT tasks.

>
> In summary, the motivation of this patch was that we had a few RT tasks
> suffering from priority inversion from hundreds of SCHED_OTHER tasks
> over a shared mutex. The problem was, if we switched it to FUTEX_PI,
> the few RT tasks would perform correctly, but the slowdown from the
> hundreds of SCHED_OTHER tasks made it a show stopper. The goal was to
> have a futex that allowed nice PI with RT tasks, but still allowed
> SCHED_OTHER being unfair and stealing from each other.

I agree with everything you've said, but I should also add that we
would also like PI behavior between fair tasks, not just when RT tasks
are present, because priority inversions can still occur between fair
tasks. For example when using sched group shares.
The existing rtmutex based PI futexes can't address those, as far as I can =
tell.
This is why I opted for a whole new implementation rather than your
initial prototype that still used rtmutexes.

-- Suleiman
