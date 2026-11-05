Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876351;
	b=UXBjdOA19EhI235z9SYp1l4EKW7uO9cwYxGWMQYnireKVZoF5dPjHIZhRLVvONLf8GiX
	 BE+9Bitqkti5j6BJIOVGjMqWXY48RArfGAQR+W2lt4f2KXNRhvwt+wKtCeNstYmKBenQi
	 ERnRhOO6glxcU1Y4zP3OvY/qXrs2c5qLUou65rgidlZKJDVWn4Ugk3N+cu8LdaCKnIXF5
	 CMAtBmZkN011Xcli7/3wu3l9aXuV3e2MjS+V/oUZ2V2rgjFbxEOwU1Zz8tC20Q9xOzEEb
	 qyvq8TyfXCqfvjt2qNbGGS7zCufYsxm223B1P/9DNslAPXQN8F2y75cYS/7Rfa0Dt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876351;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=k3Yuvf9z7zZ5Cr9KTGLsQRZgSogo1eRFiTuXrCHvMe0=;
	b=5RXKml8iTWrBbrMlOE/1AmI41t6XoHl3Yp140BY64cb79JDsHMtIu2yXn/S9OQrgq5L2
	 nL/2kQZQA8zzW0CggN9ujhj0eqSJ5TvtHgbbWiao09v7Q452x+oQKlVFx34kcHFn2yEv6
	 JrllFUBhTbDt7cNBailz8JwKJ9IzWmCaYQ9wCHBXE/6HBEsMwKxz36PDBPKkqt8SyqcuB
	 ELmi6mUCGvGhYTXXRhDUtldAWqJCShm0b7A0eCsCStoMGSut0h8JkAqJ7qb5Sflcy1p7x
	 9J20wKJhDG7LjExkvuSAjvjvu3GeeGb3MisFNJQ4wjS/IY2SJLIVZYgRRCUDzWJt8YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yv+m2WQL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=y3dfJnvE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE79606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yv+m2WQL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=y3dfJnvE
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793876347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Yuvf9z7zZ5Cr9KTGLsQRZgSogo1eRFiTuXrCHvMe0=;
	b=yv+m2WQLxpYouD9UhlYPRxIyg1TZffMfj+4mcsY7r/iAdykOqbdjEl3C8V9JaGmvv97HKz
	yaXaeF7qfAdhZINBtLyVPQFxSmWEN5VwdqCpe4skSv1eNglR/dV6TaNGdQc9XGco/pLRE+
	qbm7Jt1IaxOsvl1/JctOBaN5FPUwPHKrRyV4kDtOTeDIBTLAtdNCSUDSO6ZaYtvwhZk5O6
	ZLWTT/kTZUPi5rakZufhxVZmh7hDJlgTDFW0Nx3vfxq5PFCen3wqSfiI0xnRFWijyqqc3b
	xldneswIULdOlIMIs5OyT18tiAPhdj/Lb++WPoXCwj6rrgxTAozI/grwX9YB+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793876347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Yuvf9z7zZ5Cr9KTGLsQRZgSogo1eRFiTuXrCHvMe0=;
	b=y3dfJnvEr/EYagb8S2CqkrVZEmGHX7sRl2H+Z4gmHkchPZn3BqheTh8zMHGPmZBl9uXj81
	czp1FvojVCfWKwAg==
To: Petr Mladek <pmladek@suse.com>
Cc: Breno Leitao <leitao@debian.org>, Marco Elver <elver@google.com>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 kernel-team@meta.com
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
In-Reply-To: <auxTn4YuYHUOt4ml@pathway.suse.cz>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
 <87v76cahn2.fsf@jogness.linutronix.de> <autB8IxyWgtaH_oE@gmail.com>
 <871p90psjl.fsf@jogness.linutronix.de> <auxTn4YuYHUOt4ml@pathway.suse.cz>
Date: Thu, 05 Nov 2026 12:05:06 +0106
Message-ID: <878q371r45.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-05, Petr Mladek <pmladek@suse.com> wrote:
> On Wed 2026-11-04 15:48:06, John Ogness wrote:
>> On 2026-11-04, Breno Leitao <leitao@debian.org> wrote:
>> >> Wouldn't the below diff be the proper fix?
>> >> 
>> >> John
>> >> 
>> >> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
>> >> index c3dc84a7cef26..71f1b4b8f06d5 100644
>> >> --- a/kernel/locking/lockdep.c
>> >> +++ b/kernel/locking/lockdep.c
>> >> @@ -4245,8 +4245,6 @@ void print_irqtrace_events(struct task_struct *curr)
>> >>  {
>> >>  	const struct irqtrace_events *trace = &curr->irqtrace;
>> >>  
>> >> -	nbcon_cpu_emergency_enter();
>> >> -
>> >>  	printk("irq event stamp: %u\n", trace->irq_events);
>> >>  	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
>> >>  		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
>> >> @@ -4260,8 +4258,6 @@ void print_irqtrace_events(struct task_struct *curr)
>> >>  	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
>> >>  		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
>> >>  		(void *)trace->softirq_disable_ip);
>> >> -
>> >> -	nbcon_cpu_emergency_exit();
>> >>  }
>> >>  
>> >>  static int HARDIRQ_verbose(struct lock_class *class)
>> >> @@ -5797,8 +5793,11 @@ static noinstr void check_flags(unsigned long flags)
>> >>  	}
>> >>  #endif
>> >>  
>> >> -	if (!debug_locks)
>> >> +	if (!debug_locks) {
>> >> +		nbcon_cpu_emergency_enter();
>> >>  		print_irqtrace_events(current);
>> >> +		nbcon_cpu_emergency_exit();
>> >> +	}
>> >>  
>> >>  	instrumentation_end();
>> >>  #endif
>> >
>> > Yes, but it was unclear to me what were the invocations of
>> > print_irqtrace_events() that needed the emergency turned on.
>> >
>> > how did you decided that only check_flags() needed it?
>> 
>> The emergency enter/exit's are intended for lockdep splats. AFAICT
>> check_flags() was the only call to print_irqtrace_events() that was not
>> already in emergency state for lockdep splats.
>>
>> KCSAN is not the only non-lockdep caller of print_irqtrace_events(). So
>> my suggested fix applies to the other non-lockdep users as well. Commit
>> 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats") was
>> only intended for lockdep splats.
>
> I agree with this reasoning. Well, more messages might be printed
> in check_flags(). IMHO, we should print them all inside
> nbcon_cpu_emergency_enter()/exit(). I mean:
>
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -5769,6 +5769,7 @@ static noinstr void check_flags(unsigned long flags)
>  
>  	/* Get the warning out..  */
>  	instrumentation_begin();
> +	nbcon_cpu_emergency_enter();
>  
>  	if (irqs_disabled_flags(flags)) {
>  		if (DEBUG_LOCKS_WARN_ON(lockdep_hardirqs_enabled())) {
> @@ -5800,6 +5801,7 @@ static noinstr void check_flags(unsigned long flags)
>  	if (!debug_locks)
>  		print_irqtrace_events(current);
>  
> +	nbcon_cpu_emergency_exit();
>  	instrumentation_end();
>  #endif
>  }

I had thought about this. But there really is no need for this because
DEBUG_LOCKS_WARN_ON() performs a WARN(). Also, I was concerned about
nbcon_cpu_emergency_enter() causing some side-effects to the
flag-checking.

> And there seems to be one more lockdep-caller of
> print_irqtrace_events():
>
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -4649,6 +4649,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
>  	if (unlikely(!debug_locks))
>  		return;
>  
> +	nbcon_cpu_emergency_enter();
> +
>  	if (unlikely(per_cpu(hardirqs_enabled, cpu))) {
>  		pr_warn("CPU %u left hardirqs enabled!", cpu);
>  		if (idle)
> @@ -4656,6 +4658,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
>  		/* Clean it up for when the CPU comes online again. */
>  		per_cpu(hardirqs_enabled, cpu) = 0;
>  	}
> +
> +	nbcon_cpu_emergency_enter();
>  }
>  
>  static int

I also had evaluated this. It is not a lockdep splat, but rather a
warning (not WARN) about inproper cleanup.

John
