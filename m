Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D546F482
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784049; cv=none; b=t4y4Ko6qjyJMloWMIm9UITo37YeOQZ/+dUXeFoTBsBS1U+4tZVPbJnWLNLdUawnelhF06rukR2do8/IpFZ0zDPXolGIxrtDveIZ9iWlsGaFzjf4PzIhYnBqC3aChdQb4C06Nh9+l2AmnEWxriThYFzU97kr0jXS6tZLaGMNnYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784049; c=relaxed/simple;
	bh=1NHzeHZoMnU25BV6rQbk//q78rlK+Vlft55l/u+2GnI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DYn3vsgKKe122HFCiQDifz+iFVxGbMEN1iZmTMhkj0oVX1Z3t4m5iv7VmT/jKd3eMv2Ujt4nd5gP+EvZtWRlkHasnvJIOf2Ot/DDZye4hJqSeYV1/j617uSTWND1SnwfqQ3QNhG2YOLIIQ8+v0w/SHY81IL7HYi682nCTUySc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlMnuaDp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlMnuaDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287281F00A3D;
	Mon,  7 Sep 2026 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784047;
	bh=0qSu3OjHkaTRHcKbbYxOQ0XFipAs4gqfp4Le2yb3N+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NlMnuaDpx9mQ7xUql5LFmTLtlCbk1zFcmUd21F2yijqWQNyIwHrdrAGFBNn+SPkpw
	 XWuD+PRFfjjrty+zlTW9y6iRD+U4z6Tg4xPh29WmO8x0ERtd/zVSkQgvzKdxu6bh5H
	 T9KHniNuXZnu5jwYhZcEZvle4UJHhTU+FpxEFbPOGUtS9G5x1uKAPlKYd9p6zQUh/4
	 5uzX7xcl2OdLcINzB0RPtgak7+JNclfmhq2SNby37CbNb6vvbzYo6tbNw035auucQw
	 W/vrTYfJyMEPlQ4TWzoGVHRM8DFQV6hd4AxNyi+FO71OGwQmLXo8woh69UaK8OrW6Z
	 M02izj9RJQ4hA==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Cc: Hyunwoo Kim"
 <imv4bel@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Christian
 Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, John
 Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>, Alexander
 Viro <viro@zeniv.linux.org.uk>, "Eric W. Biederman"
 <ebiederm@xmission.com>
Subject: Re: [patch V2 8/8] posix-timers: Handle exit in do_exit() completely
In-Reply-To: <ap2XdXRXRG0ABl5n@redhat.com>
References: <20260905181551.738186850@kernel.org>
 <20260905185840.033154049@kernel.org> <ap2XdXRXRG0ABl5n@redhat.com>
Date: Mon, 07 Sep 2026 14:27:24 +0200
Message-ID: <87tso12qmr.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Sep 06 2026 at 18:40, Oleg Nesterov wrote:

> I am still trying to understand this patch, one question for now.
>
> On 09/05, Thomas Gleixner wrote:
>>
>> +void posix_cpu_timers_exit_task(void)
>>  {
>> -	cleanup_timers(&tsk->posix_cputimers);
>> +	posix_cpu_timers_exit_work();
>> +
>> +	guard(spinlock_irq)(&current->sighand->siglock);
>> +	cleanup_timers(&current->posix_cputimers);
>>  }
>
> So it calls posix_cpu_timers_exit_work()
>
>> +static inline void posix_cpu_timers_exit_work(void)
>> +{
>> +	/*
>> +	 * current->flags has PF_EXITING set so this can be done lockless and
>> +	 * with interrupts enabled as PF_EXITING prevents the interrupt from
>> +	 * scheduling the work.
>> +	 */
>> +	if (current->posix_cputimers_work.scheduled)
>> +		task_work_cancel(current, &current->posix_cputimers_work.work);
>
> ... which does not clear ->scheduled
>
>>  void posixtimer_exec(void)
>>  {
>> -	scoped_guard(spinlock_irq, &current->sighand->siglock)
>> -		posix_cpu_timers_exit(current);
>> -
>> +	posix_cpu_timers_exit_task();
>
> ... and this looks obviously wrong for posixtimer_exec() ?

Yes.

Thanks,

        tglx
---
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1270,6 +1270,9 @@ static void posix_cpu_timers_work(struct callback_head *work)
 
 static inline void posix_cpu_timers_exit_work(void)
 {
+	/* Canceling the work is only valid for exit() but not for exec() */
+	if (!(current->flags & PF_EXITING))
+		return;
 	/*
 	 * current->flags has PF_EXITING set so this can be done lockless and
 	 * with interrupts enabled as PF_EXITING prevents the interrupt from


