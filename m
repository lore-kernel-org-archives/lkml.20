Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99B426EB2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594615; cv=none; b=V5RYtLv/p5yymg0am3cvxWxn0859/bWMAm8OStj14Ynfkzm5t8X4jwvfy6B8E3sYkQl1YTZ+uCs+ZqH5XtjA5tVZa90rxtqkkV8Y9m+Kny4HJMZ3ln3+Q2qVMje7nMIfMTRMm6oy3i/KS0NSIO4qO0cgChBNw6s7t+/IAOIv9bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594615; c=relaxed/simple;
	bh=M7oIxkZDsinP+eUkCJKpXvzllMqeqZQvNRJIy9JFz3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZKc54w0pE8J5QNFHbe4YgkKvsWulIZQxl0l7llEDogCXJLH+zziHqvZG6EGWKv75H9YFkh0p8VTXXxpXys0M6acooldukXPuPtJt82y4UtuMypycy87LLefM+x9yglGAj0nyTaMonUBqRFy+0kVcORgPzmAUvEZo1f7CN4TXdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmXgT8KX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmXgT8KX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64121F00A3D;
	Sat,  5 Sep 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788594612;
	bh=HO1kYze8PEUYZ8DIDdm3n1ENtSBCKzy3wHFxr8TiLxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WmXgT8KXvH40zlR2H/SK1Ssa78Soyj0NZWAG2lUhAMB8AsE+MjuzIOTx/1KMpp0J0
	 DlcA4utsOCMuk89wFR9nixMs5U18YsIxT5YRlUOI1qYXXfDowYh2qYsrO9/WVicrIp
	 u1HIOTSwQ/39jHdBIaERieOeXroeNzn+S9z6qXGLPG8hqFP9KUBHYSMPB8rhZJHjew
	 jX9EHm8HbOvSoiUFYnrscb4hUtB3ehsYUbC/mk9VKsi/STAfCxSXAWP11OElJaMcJI
	 aSNAnPxBHRPxaQ7qr2uNSNiUY2uXIXu8aPsWDv0tlOEXa94BVGsYP7btpkmv8QEhpJ
	 WzQ++WSKf87lg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Christian Brauner <brauner@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, Ingo
 Molnar <mingo@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [patch 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
In-Reply-To: <87ik4lauhx.fsf@email.froward.int.ebiederm.org>
References: <20260904112100.683893401@kernel.org>
 <20260904112202.400768514@kernel.org>
 <871pb9cjbj.fsf@email.froward.int.ebiederm.org>
 <87ik4lauhx.fsf@email.froward.int.ebiederm.org>
Date: Sat, 05 Sep 2026 09:50:09 +0200
Message-ID: <87wlt05e8e.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 10:47, Eric W. Biederman wrote:
> "Eric W. Biederman" <ebiederm@xmission.com> writes:
>> Thomas Gleixner <tglx@kernel.org> writes:
>>
>>>  
>>> +static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
>>> +{
>>> +	if (likely(!(p->flags & PF_EXITING)))
>>> +		return true;
>>> +
>>> +	/* Allow TGID type unless the last thread is on the way out. */
>>> +	return clock_pid_type(timer->it_clock) == PIDTYPE_TGID && atomic_read(&p->signal->live);
>>
>> Couldn't this be?
>>
>> 	/* Allow TGID type unless the group is on the way out. */
>> 	return (clock_pid_type(timer->it_clock) == PIDTYPE_TGID) &&
>>         	!(p->signal->flags & SIGNAL_GROUP_EXIT);
>>> +}
>>
>> I don't understand why we would want to re-arm a timer after it has
>> been decided the group is dying.
>>
>> Plush I really don't like the idea of p->signal->live spreading to more
>> places.  In the future that has the potential to complicate any changes
>> to the group_dead calculation.
>
> Hmm.
>
> Now that I think about it this could be:
>
> static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
> {
> 	/* Is the process exiting? */
> 	if (signal->flags & SIGNAL_GROUP_EXIT)
>         	return false;
>
> 	/* Is the thread exiting? */
> 	if ((clock_pid_type(timer->it_clock) == PIDTYPE_PID) &&
> 	    (p->flags & PF_EXITING))
> 		return false;
>
> 	return true;
> }
>
> Unless I am missing something subtle with the parts of shutdown.  As
> there is a difference between starting the shutdown, and having reached
> do_exit.
>
> But unless there is some subtle reason to start a timer after some
> thread has called exit() or after a fatal signal has been received
> I suspect stopping as soon as SIGNAL_GROUP_EXIT is set is a good idea.

I don't see a reason why that would be a problem. It puts the cutoff a
little bit earlier, but who cares. The task/process is going to exit no
matter what.

So the "observable" difference would be that a POSIX CPU timer which is
attached to the process by a different entity will stop firing a little
bit earlier. The resulting "fallout" is a purely academic problem IMO.

Thanks,

        tglx


