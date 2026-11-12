Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794481414;
	b=JtpEBYf8H1r62BbJzJrkkjj2iRg0IgUmzzmbi1FDyuYR8+O+2oJFXJkJNzaQNQbln0DD
	 XKTS8FZYPhQ4vbOLmQ0//QGGA8uvsEH7JUiuafEF2tfSLPjGq3upZVFAsQECYA79eIha9
	 Bx/6fk43DTP4nn029GzvQudxZ5wx2msjMBrFy6PJb5alC/7CPUUEm0Psnzm8CQ3cXRacx
	 HeRC5CehFVNuSFiSyAPqURIS2uMJzYOxI82DgjFsC4Zas/wTLtYVQnTOb5PKOOSQw1OBr
	 vWxHnWNeFa5DY0XDjHShueSH/vmWLkD4VnUtIityn81w2hoXsiiY4ZF6cIKajDCBu0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QDokx6lDmg6FMP0/3Nuvn8ZV/jYdhXylaz0xMFxLtRU=;
	b=xYCr99NlTO9pAqKmqP/FUv4Nbc0JJRaGbfLQonXtN3J1hMUD/mH+CmnFyEIw6H3SMczn
	 XpMNMFhI1Z/qu/TT/BN2lKoNCb3D5iW+QpKjYrj2624n52odAAv//vTyJON+G8A3AXMzP
	 VwpuiYeKAelO+C2w8H+8ZUimey7VLqByDNWmJyJXsMk/eZPe3a3qBGBMxlpHJ2IF7IMpx
	 EudF27sH7hHOQ/7sl6k20rOR7hxIDpuUs2h8Jj0bPhmEsJPSyeturSAkjPEVpJSV+y3iB
	 w/IVYj4DhsmyFluc3WZnt1dthYtCmKgBm96gJqUoMpkaL3wGTAvE1X0FfEuKJ/LBVXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HqTHbmdq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A39F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HqTHbmdq
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso1458191a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794481412; cv=none;
        d=google.com; s=arc-20260327;
        b=eyADGJfdrSC/ALfSi6tX51itex3yRX/QldiF6sJCpAEcIVhmiuBCWmNZwn0ppTqPAt
         EJmcnWSsCYxZFQxLqu69ss+61x3ONoyQqzvRcXMoWlZJyCSRzYRW+T8c5fC+hGYtofvQ
         CoPP+rZY+tOo1Ox/73LauncJ9ynCFaxQsU2afVpfZ9ZoStyxJhKmfOv2FerV59+sMZ+L
         CvMfam7FPM9DHBAevgM9FSn1qNzuAKEca4TGe/JMXsRW8uMqac28SuSdIcXoTP9VM+5m
         /HPRey9KgfKHCEWunskGSvT5rGzMDGcL8pFYaTEAJ6gaaAw1gG1Gl6awec47FlxZnrtQ
         v5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QDokx6lDmg6FMP0/3Nuvn8ZV/jYdhXylaz0xMFxLtRU=;
        fh=7wZYh8ALyW9P/H6hU9C9CtF+4NRJ1r1wQMrYd+RcQDg=;
        b=Ec2KNZmuUh3kXD6TqiVCQM56Vo5IpNKXVC004SvYFj8x9uRalsQk+sKMzCJUJVqotn
         xp67aSmYYIDWHjc0K7182wFZQ1Qs2xu41m5lGYXcIOxQiQ6LM1iENDdEdc8Kf8PlBc1Q
         gqB+cXxUeX0jA9ID4WTn094Ay9oG3d7qU6u/V06TxOtshEijmw+BzPFTB1aze7f8iRlA
         cUpDznqNrG3HCGBTaiTYa/ML7BQoWKqyJTVKkLXk1jCzJztGTqZi0DzNWAGvoX+uQz92
         bjKvPH3npGzPKqRCL3lGX1be/HQL79fsmbwQclD1R7vXeOgU7rFEQpTl36LaPPR2Fx98
         eJ3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794481412; x=1795086212; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDokx6lDmg6FMP0/3Nuvn8ZV/jYdhXylaz0xMFxLtRU=;
        b=HqTHbmdqGcsd+Ajhp8wxInTGFj2DFQMZDTU3BwKsN1jrw/3wArhMv+Ip67f86/l+5m
         SbJQ8uU3vlMnNr/oeyBW89aTiSdh6+RZeAxpZrRxHTy4YdI8kaP5YCPhfuyh3g3gjumT
         xvUyRokh2KaCTFD9gN01aq0jzar8oxNVIxlznAhaXBV9bC5CNpu718yUyWp9pyEM8dA0
         EbxKReC2hM5GwXOI+PyGgEAeXZzfONZR1yyQ/jPPTRed9cacpAW5slGYqajIniBi/3KK
         wqAtl0Xv8BbF+cTou8KMO8j0xbDX0GAbwbA3YKg3EYb7/9KEM3mpOhRPyTmheSopT8YI
         y4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481412; x=1795086212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QDokx6lDmg6FMP0/3Nuvn8ZV/jYdhXylaz0xMFxLtRU=;
        b=iGIadRjKOakfpp3W00zJtxxiUazzinZL96r74MRRhdd+FDBSSQNBkCZDm9rMoGjmdz
         /6CqOWajEKg1Q1nnGDZFpO08VrADDdT3e0qmBhxzPCrHPKsLwYPk0FzKTObXZVE+UJ37
         2gCFcoJXxyTqyW3IqLY0iVy5HW0mhbyZgqdzXmQTkVjY0ePoCmRPsfZaHUYC/H7G37zD
         jZrWYDMTRH50PBrWWlfHRxuZYYBYjemm5mGi4UdLPJbL7Op2VD1A1ei2mlZFw8UyZv3/
         Win5rb5tmrax3W6tMmoo2G/F7sHtATnaQa1nQFZTo6kqDz6IDAtwtuxZw4ueSP7Cr4XX
         Wc8Q==
X-Forwarded-Encrypted: i=1; AL+hErGApFAP9I/yghrB+bnRIHr24jMJJoxCdEqCwj7klRPrYYF/CdKbCOXviqdt9FrS/ljzKKeCexLOHzjvESM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZIUbkDYFjqa+oEboV0CZJPmCiAlJTmn1e73+SFdAMtOIA3Awu
	48wfIJcqBVBkyGB7TPEU5hlQF+hmlJgYU/CuMDzonODVrnV2WM1+HwK86SjQ0QyIsyL5aAbxHoH
	6q4j5F/o9R4jT7a0gF5iSpxAlBLOX83h2FyHOSGs+Lg==
X-Gm-Gg: AYBFou2HnxKIGRxryTW5SsrTRa2YvPndcnPp5jHpSVPJKaNhNK2JNhl5Tobd/MvAGfO
	5GgMP+gEUA1Y30ZSKPtFMxerPpvZ/6zihcmfSU3+aBQbSY6ftA1EAN9KcIsanYT+GW5CvoUkYEC
	8Lj7ji4NUWqhnE6Tk0EpTg7fx0TaQB4vj2SFsLp0yg7cVSxFUiO4cp3GJEGQg52NfzyWL8pGRxh
	qR2Frj5KxoBNcrvBwe0xRwUiQT2O5hziP7wkS/IZuYwCygMMaCZibBAA7EvRSJxhvsTlZoBsmbn
	/n8RJzmlLipYLa7CyBr6UNr36Pqj5dyqNkOp1PwB0OmVrQ31nzBvBAIfok1QwVsjab4PZ5wvhjc
	iJhTsfMzJwH4+daBi3ZttF42TUi+hpMIxeogjRpRBjfWTi9PnbodWxS0mARzVzTDbcQOm9w==
X-Received: by 2002:a05:6402:a150:b0:6b3:cfa0:77cb with SMTP id
 4fb4d7f45d1cf-6b79e07eccbmr1108582a12.10.1794481411373; Thu, 12 Nov 2026
 03:03:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103154603.1893325-1-nigro.fra@gmail.com> <5af4860d-096a-4e9d-a3b3-0b8277924146@amd.com>
 <CAKfTPtCGmZQ9XVYJL_5f603qTf6_CdeKsq_pAYM_Ldqs3NaXaA@mail.gmail.com> <20261112093613.GJ2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261112093613.GJ2668804@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 12:03:19 +0100
X-Gm-Features: AclHuK8Sr9B3BKdtYWhzEUcJavKjNWqYDLDaTDdTrbMIU8RDvtjNpcnMG7oQ-T8
Message-ID: <CAKfTPtBFRTA-xcBU8xQTXzrAEp7iu7KRA88ChJXB0f92ZT_56A@mail.gmail.com>
Subject: Re: [REPORT] sched: ITMT + DELAY_DEQUEUE: woken task waits ~1 ms
 behind another task on the preferred CPU while allowed CPUs are idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Francesco Nigro <nigro.fra@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Mike Galbraith <efault@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Huang Rui <ray.huang@amd.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 10:36, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 12, 2026 at 09:59:02AM +0100, Vincent Guittot wrote:
>
> > If the root problem is the migration of a delayed task during
> > newly_idle load balance which transiently make the CPU not idle
> > anymore for another task waking up simultaenously, can't we just
> > prevent migrating delayed task for newly_idle case in can_migrate ?
> > Migrating a delayed task to a newly idle CPU doesn't really make sense
> > because it will be the only task that will e migrated and will be
> > immediatly dequeued.
>
> In fact, I would suggest just dequeuing it right then and there. If it
> were actually runnable, it would get to run on the new idle cpu.
> Therefore it is not contended anymore and its lag can be dropped.

Yes, make sense to go even further

>
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -11771,7 +11771,7 @@ int can_migrate_task(struct task_struct *p,
> > struct lb_env *env)
> >          * 5) are cache-hot on their current CPU, or
> >          * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
> >          */
> > -       if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
> > +       if ((p->se.sched_delayed) && (env->idle == CPU_NEWLY_IDLE ||
> > env->migration_type != migrate_load))
> >                 return 0;
> >
> >         if (lb_throttled_hierarchy(p, env->dst_cpu))
>
>
