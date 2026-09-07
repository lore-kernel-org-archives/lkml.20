Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D421254B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783612; cv=none; b=evj6zkJHtOAdp6ZgQeXfJFsSDKov5s1+FT8IzS+WaAe8A+s//xjze7L8KGjwzg5udGIgT7wk57gYCA+fxsTLbbodfy70CcTc4Py/62VX4s1WLDJeneWpR8mjhr420AOzUMGQ924Jhj1V7AdI5lhr/9gGZVgI//ubWLbchoozl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783612; c=relaxed/simple;
	bh=94cHty+KFqD/5T1pyyn1givXkTxo3vTfcSCreHdtruM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVaBvntyt/zfKPSWgEu97FdJ3Llt/e73OsXc5rBjOn21a9bfx6PXINIX6UlN7x7K8DQNd8WrbFJkaPpC4oXjy0dQhBYpt55hpeX9hA5gf9b/Ori9r020yQO2MfLDeLAHM/v6wLO/NgrnyJTbIGfacfj6YzP8hx6P1SPGjDhKNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyUmtQ8B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyUmtQ8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA921F00A3A;
	Mon,  7 Sep 2026 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783611;
	bh=HDWHrMi0YrCAPEA1eb80xymhZRKT0qCRP+dcWYLwHDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DyUmtQ8Bi7NzYSSFACY/4IT9QxmkGU20h3mzofuKMRTaM7lU1n0gb5yO6Qi/5pjzj
	 w4JKCEeHVPVeQnSWRw4aiWHHGJXcHPz7aAg03+i2ewZW4oKrnYm+QCgr31RVXtu+ZJ
	 m03H6/RYcotFbYZiY4QiezmBt0ATiAY98MkhWM3mc2T1NoBmQf+a45Icmr9r48ZWcO
	 jiy4N1iLxAtn0loXtXYSLFEldEHC5zcItcLVKP5k5rzwA7dh1WX5ffZ0eMR/QMcriC
	 CWaOE/ZU9luv7f9TIs4ISFcc4e6EznbLqmmrpsd1gVJZOWBQ9ThrgG7AJ2FZo/hojp
	 U7IU+xW4m9xeA==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Cc: Hyunwoo Kim"
 <imv4bel@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Christian
 Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, John
 Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>, Alexander
 Viro <viro@zeniv.linux.org.uk>, "Eric W. Biederman"
 <ebiederm@xmission.com>
Subject: Re: [patch V2 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
In-Reply-To: <ap2UK_7yQkJqDzVG@redhat.com>
References: <20260905181551.738186850@kernel.org>
 <20260905185839.972374320@kernel.org> <ap2UK_7yQkJqDzVG@redhat.com>
Date: Mon, 07 Sep 2026 14:20:07 +0200
Message-ID: <87wlsx2qyw.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Sep 06 2026 at 18:26, Oleg Nesterov wrote:
> On 09/05, Thomas Gleixner wrote:
>>
>> @@ -684,7 +706,13 @@ static void arm_timer(struct k_itimer *t
>>  	struct cpu_timer *ctmr = &timer->it.cpu;
>>  	u64 newexp = cpu_timer_getexpires(ctmr);
>>
>> +	lockdep_assert_held(&p->sighand->siglock);
>> +
>>  	timer->it_status = POSIX_TIMER_ARMED;
>> +
>> +	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
>> +		return;
>
> I can't understand why does it check task_can_enqueue_timer() after
> setting POSIX_TIMER_ARMED. This adds the new armed-but-not-enqueued state,
> afaics.
>
> I see nothing wrong, it seems that this can only affect __posix_cpu_timer_get()
> which checks ->it_status, other code paths do not check ->it_status.
>
> But I don't understand this code, so let me ask: is it on purpose? I mean,
> is there any reason to set _ARMED unconditionally ?

It is intentional.

The problem is that timer_create(2), timer_settime(2), timer_gettime(2)
and timer_delete(2) are "functional" today as long as a task is visible,
i.e. hashed. By some definition of functional.

Since f90fff1e152d ("posix-cpu-timers: fix race between
handle_posix_cpu_timers() and posix_cpu_timer_del()") an exiting task
does not expire timers anymore. That commit used task->exit_state, which
is set way after exit_signals() in do_exit(). I made that earlier in the
previous commit.

So while timers still can be [re-]armed they won't expire which means
that queueing them in the first place is pointless. But I kept the state
modification to avoid behavioural changes. The current state is that a
timer is "armed" until it expired and the signal is queued. I just
preserved that.

Of course one could argue that once a task reached PF_EXITING, timers
armed on them don't matter anymore and simply return -ESRCH, but that's
a user visible change which I wanted to avoid right now.

I'm happy to stop pretending that this "works" after PF_EXITING is set,
but don't have strong opinions either.

Thanks,

        tglx
