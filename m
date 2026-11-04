Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803335;
	b=X8SWm00hj7go3FrRP05ESTMWa2XC7AaalInQlrJo/PeaND5yEI/b60/7Q6qHoUm6IjSg
	 2ngiE1G5KekZTeardj6QjEmugtTf5OMTt4o7hR6NBIdDyAaC5BEJYw/7RQwslnEfeIdA3
	 0kd8Uhp32sp6LaXKLm89hvvZbkSLM6VBDPTFRmpV/1NczJokToi16yLMNKSLh7sxOn8hw
	 aZlWEwh/biOnl0BLgScEj6ezFX+o8icqmEZUJh+lI/E5TM3HLUoip5kfHbNTRKZ2HvfI8
	 1QcEvrRQc1uBAWR50k0wCJuLVqj3ptYKER9+ZHPYfxwuDYjWpX1Vod47eTQ4a6SFtPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803335;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Fl1gbLhBQfxuB0Za0lmrQManNOX8Zck/p2HtBIvRL8s=;
	b=ZlUhPsTcSOWbqh56rcikHhar/IRy6D4v2RiOlCzvxQZgK7TXBp+Do+YICXFGz/fgPnka
	 Rw7N8a3NmruW3jxyP9W4YoD28LRSHa6esxasMjYsXPjKhJQJpcjTBQf9++YBxuQu9U58e
	 S5rt6mBY6aIj/7UEQ+0DimAMgg4/Gu7+Zr3PUtWtQ+2RSWkvOuw98IziS8P2jb1K1C4oz
	 Sq7hEYWOzco3x84BkDwUlsyQoaaomfDzZOjflcS0v4qga3HCsEyoVJLI6SBaqrlpOHH5K
	 RdPQ7NMguUWV4W3tdJI+o9/F4DyraSVNrBsj/MTKNtVHl2Uhsru9532kVKNtXsbsQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3OXSg5DX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8sSG0Qq2;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9713606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9713606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3OXSg5DX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8sSG0Qq2
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793803326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fl1gbLhBQfxuB0Za0lmrQManNOX8Zck/p2HtBIvRL8s=;
	b=3OXSg5DXF+Q8bYnZn4ubic7S382+ZMoVMVKjLabNvLANRBMaClCf76C85U7esjEf5noumQ
	NHzkVwiKxfd87KwNQYeMnrJ8QAG56nQivOJ+Brv/GugNaQ4RI9kPzPhuFUHIkqRK546KbD
	GKXA+iYcnFRHaIxPFJZJ8sMF/t1MMYXn4vD6IdWbqM5xF8vxqIvlyWm3IcUMfMubppDUid
	b7S8OrAcRL2Ee7ZBEL9JJITQqv//8uoSp4Q25phkyMe0NMOd4d3JZGGQOTssx0ZQyegt6f
	rNpkpTk010jAX9wVIH3wdjffkmztTI2Ebp+yDGOGe+ZLnCjki9vvfTEUxRQImA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793803326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fl1gbLhBQfxuB0Za0lmrQManNOX8Zck/p2HtBIvRL8s=;
	b=8sSG0Qq2MI4SgahfhyqkbYBy9/x20pnevwNV+nKRQ8DinEJYgdSsYlGGkHPriFvP+l9Qmo
	ByUPZnKBCtVW/IBQ==
To: Breno Leitao <leitao@debian.org>
Cc: Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 kernel-team@meta.com
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
In-Reply-To: <autB8IxyWgtaH_oE@gmail.com>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
 <87v76cahn2.fsf@jogness.linutronix.de> <autB8IxyWgtaH_oE@gmail.com>
Date: Wed, 04 Nov 2026 15:48:06 +0106
Message-ID: <871p90psjl.fsf@jogness.linutronix.de>
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

On 2026-11-04, Breno Leitao <leitao@debian.org> wrote:
>> Wouldn't the below diff be the proper fix?
>> 
>> John
>> 
>> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
>> index c3dc84a7cef26..71f1b4b8f06d5 100644
>> --- a/kernel/locking/lockdep.c
>> +++ b/kernel/locking/lockdep.c
>> @@ -4245,8 +4245,6 @@ void print_irqtrace_events(struct task_struct *curr)
>>  {
>>  	const struct irqtrace_events *trace = &curr->irqtrace;
>>  
>> -	nbcon_cpu_emergency_enter();
>> -
>>  	printk("irq event stamp: %u\n", trace->irq_events);
>>  	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
>>  		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
>> @@ -4260,8 +4258,6 @@ void print_irqtrace_events(struct task_struct *curr)
>>  	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
>>  		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
>>  		(void *)trace->softirq_disable_ip);
>> -
>> -	nbcon_cpu_emergency_exit();
>>  }
>>  
>>  static int HARDIRQ_verbose(struct lock_class *class)
>> @@ -5797,8 +5793,11 @@ static noinstr void check_flags(unsigned long flags)
>>  	}
>>  #endif
>>  
>> -	if (!debug_locks)
>> +	if (!debug_locks) {
>> +		nbcon_cpu_emergency_enter();
>>  		print_irqtrace_events(current);
>> +		nbcon_cpu_emergency_exit();
>> +	}
>>  
>>  	instrumentation_end();
>>  #endif
>
> Yes, but it was unclear to me what were the invocations of
> print_irqtrace_events() that needed the emergency turned on.
>
> how did you decided that only check_flags() needed it?

The emergency enter/exit's are intended for lockdep splats. AFAICT
check_flags() was the only call to print_irqtrace_events() that was not
already in emergency state for lockdep splats.

KCSAN is not the only non-lockdep caller of print_irqtrace_events(). So
my suggested fix applies to the other non-lockdep users as well. Commit
59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats") was
only intended for lockdep splats.

John
