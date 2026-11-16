Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824483;
	b=0PI9O7uF5NAqtDo0I79jbKj9LpIAir/DdpM8h/kY+NYA9ipPMj2zAxghEwjVGdK6dPaa
	 95OXg7Dq5wp9RTQIIkZfHMELXfhTmkeXs7YTadFF6ycWoY0kEfevP+yK187iKa1xTQG5C
	 dPO2GZZu1F4U8bDoU01t0biPj4yTsSRYVQv/XHmZK91MNU6gkuZgrFAEDW6TyGAHEgasQ
	 D1HOLubm3HFByCN06Dqx9Luqk5SQqq0VS4XEJ438XY0/EahYP2ZIaql1HzqP53LUQmfgW
	 N6u2ecrP5vzaONcwyTQU8LtLEEfxP4JGedTiVQUJeCDvOLlJClcMqTI5oKhp06oR5EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824483;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TtB6NVTta0tvsTqH3AzztjW+y0F8Qfmd7U44QxV+Lc4=;
	b=m5+f8Qdzh01V6lPTsWkDECPGiAOL/8fq1i8obvfMRYgN0wH9G1L7c77W7iH8qgwDwIn9
	 7j+YuIzaVwNB5+wRXtmOWYraGxHB66OvLts/Mqa0RLii/g3duaMh1y3wmjaOhoBrpA06E
	 rB4sYaISaKuq9Gn6pwR+DkJxqy9OnXvr5msgX1fYDKi08SnfIdofVYP5j6V9RB0yecLo1
	 qE/yN5wmDqtkHn4MYYmipTBiZjdMnlfU1v3fA6kyzaVIQaO4fTZKYcDYeit4ZqvemrC5R
	 kCyqJ7uPFF26GXWip/CVKeCJKmKfCzWTvZwQgucCBhuT28cBbDvVPJVKSMceFhORKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZY6mCzKY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qccX7har;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C3B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C3B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZY6mCzKY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qccX7har
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794824481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtB6NVTta0tvsTqH3AzztjW+y0F8Qfmd7U44QxV+Lc4=;
	b=ZY6mCzKYslCYVCgoiHSIHDP2myLAx44R4RcbutjRjjKpdhoxsbYjQyMas6Rc1LYlxsML6b
	J4fH+hbHYEOS1gF7M8+S4UlrQD14Fx6Hn3cz4/LAnvHSQiiOMLX0tZKKee6iUWVwzCupAa
	/z6xAqHMwhMO+mM0ETrE3rGz/JkyvDg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-6X6XKzOaOXyrT2LVCaYoaA-1; Mon, 16 Nov 2026 05:21:20 -0500
X-MC-Unique: 6X6XKzOaOXyrT2LVCaYoaA-1
X-Mimecast-MFC-AGG-ID: 6X6XKzOaOXyrT2LVCaYoaA_1794824479
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49034831bb3so2202823f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794824479; x=1795429279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtB6NVTta0tvsTqH3AzztjW+y0F8Qfmd7U44QxV+Lc4=;
        b=qccX7harUwf8eiayr+DfzPEQNO8jtBu0G+uJB5TxwXa2l30hixqgX8IQihn/zG3p8r
         HinAWqG7/9eDvncHZIxEd9PMMgvtJgrOL4NpfP8hQO64ilyrx2Q7KErbo5E0+ixYqpoC
         woZDv40aalCfcg9ed56J1SMUDiua7kEyFjc5w0LN7AXS1hV7JYix3yWmMRoIM219PUVK
         g00YxpfaEWiNOFAIX1NK6TlH31PG4Y3p42EujrYRyfFgf+MId6UJP974D5XgG2AUuCtq
         c47WKJNQ0HeL1trBXI/OavSD7hnR09k+Mel8LAeHyqxrlXOZgdfcednP7c3xzBs0RvKq
         9A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824479; x=1795429279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtB6NVTta0tvsTqH3AzztjW+y0F8Qfmd7U44QxV+Lc4=;
        b=tV1Heh9Batqm+ClQIQeRMeEBYpxFoGOWWIdNcdUNjQxyKF8QF3keDSKQ8fCBU2xUXm
         NqUFlOin1UPr9jwz8V60dhukvZYY3bais0inQ3karyyPZesjBZ7trpLtIhRpHa0zVzhS
         NnAur0M1slYaap0ohmvEYKSWRxA48Mlgz923PiStnCDMN73wyqgfETVKtwWqBEbLRs6g
         2iab8HBLb25AXt9qk6wE+AI8LE7GuOexDR3VrMaGaX6GFGmHEnZ9btR9JhcZSMN3Fw9z
         nyM0hEN7CQXNsDrwcSfDWtHde/t9lLd/Sosz7ijDUDmYicVLBts9b+Bl1RQ0W6D6QYWD
         JfBw==
X-Forwarded-Encrypted: i=1; AL+hErF8vGe+bgcE61f7Boq5RdfN0JOedYM6Cc7UqdJ3ZHFlrGS/znTKrLzZAd/cuHV/HtCTg/TCEymzX5S6leQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SqBxYVID3fMC0+Ljw8ZwYo/9fP7RbuhxvkkvvvXQq1qCjSiOI
	KI8uA7rbx4m7jWEGakd5du9IV6jApVwkaFniBh2zS+geBVvDd4wXdBt04eFvNRj1huOy63bxZUZ
	6iq2HItK2JUVKPTdX/y5XVVNfsS1GskgDi6YzT3zUFai4DY4ih79o3s4jXw3To5QO/w==
X-Gm-Gg: AZFdTZcG+eM1EdTKgoS2Fam3hyCleMeNr2wg6iD4qxQB7+xsa14TIC5AONWNEnK5Rmp
	MHtFB5EPbRGfhAe5v2UaCj5IxSZ+0q1Wlf2uwKKDHBSzJDjqz5gxbKDbmczPmulbVslJVxudPD5
	/UU1/5yedHeBMUJILQ3s/L5Lpdr6SBMFxbOaBrq5SMJ+KHCsF2cJJrTg48Oe+CKzk5yovFoOzvD
	skWacWHkExPdH8dIOANwa5Uifdm41MAxY/O/G0EfhzqQt4SbGVsl70MFrHV8YkCcw62nZBT5ga9
	1t8QUtCuWJi5bjR8yLnS2iib4TXVitQYGXuk+7Wqkc0AU/k8JLB8fOzTesDfhP+vyU1f9KjJi8l
	zNIgW5E3aVR+9fFla2dLJgj+vrqO8RUvqpNQgnzCxLauoCrisUkMItmbc7Zcd8zp6/L9fQ1X2A7
	JtpiA=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20874716f8f.45.1794824478817;
        Mon, 16 Nov 2026 02:21:18 -0800 (PST)
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20874640f8f.45.1794824478326;
        Mon, 16 Nov 2026 02:21:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm20991495f8f.32.2026.11.16.02.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:21:16 -0800 (PST)
Date: Mon, 16 Nov 2026 11:21:12 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
	tglx@kernel.org, will@kernel.org, boqun@kernel.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it, mathieu.poirier@linaro.org,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 13/29] sched/deadline: Keep departing bandwidth across
 a root domain rebuild
Message-ID: <avrZGPNdCwZMd3B4@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-14-mathieu.desnoyers@efficios.com>
 <avRmoK08LoIeySBL@jlelli-thinkpadt14gen4.remote.csb>
 <c3e7054a-486c-4e5a-a646-eee42e815ce4@efficios.com>
 <20261111161912.GP1779021@noisy.programming.kicks-ass.net>
 <83b2244c-f68a-4af3-9c8f-0fabb4eacbb4@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83b2244c-f68a-4af3-9c8f-0fabb4eacbb4@efficios.com>

On 11/11/26 14:19, Mathieu Desnoyers wrote:
> On 2026-11-11 11:19, Peter Zijlstra wrote:
> > On Wed, Nov 11, 2026 at 10:35:17AM -0500, Mathieu Desnoyers wrote:
> > 
> > > Measured in a 64-vCPU guest with sleeping deadline tasks:
> > > 
> > >    tasks    today: rebuild, longest irqs-off    single list, all irqs-off
> > >    1000     0.75ms, under 0.1ms                 0.12ms (0.19ms worst)
> > >    10000    7.4ms, under 0.1ms (0.3ms once)     0.9ms (1.2ms worst)
> > > 
> > > The rebuild itself is 8 times shorter. That comes from updating the
> > > extra_bw of the CPUs once per root domain, not once per task. But the
> > > longest section with interrupts disabled grows with the number of
> > > deadline tasks. I do not think that is a step forward for a real-time
> > > class.
> > 
> > This is domain rebuild? Do we really care about performance there?
> 
> My worry is not performance, but rather the contribution of this
> "iteration on all tasks" on the irqoff latency of the system, which
> is relevant for RT.

My take, of course let's have Peter keep me honest here. :)

> What I don't know:
> 
> 1) is 10k deadline tasks something that we should consider as realistic
>    for sched deadline, or it's way beyond practical scale ?

It doesn't seem a very realistic scale to me. Yes, I've used this kind
of numbers in the (far!) past when running experiments with DEADLINE,
but I can't think of a real workload reaching these numbers.

> 2) is a irqoff latency of 1.2ms (rather than 0.3ms) something which is
>    relevant in terms of irq off latency on a preempt rt kernel, or is it
>    in the noise ?

Very relevant I'd say, but 0.3ms, unfortunately, very relevant already.

> 3) are those domain rebuild expected to happen with a live RT workload,
>    or are those operations expected to never happen on a RT system under
>    real-time constraints ?

In small systems, single workload with few housekeeping CPUs, I would
expect the setup to happen only once before the workload is started. So
no worries here. But we seem to have people interested in consolidating
multiple workloads on big machine by, say, using containers. So, in this
case there are several exclusive root domains each running its own RT
workload. It would be undesirable (to say the least :) that a
reconfiguration of one (or a subset) of such domains could potentially
introduce latencies on all the others.

All that said, I now wonder a couple of things (which can be addressed
separately as an RFC if also Peter agrees we don't need to tackle this
right away):

- The 8x from updating extra_bw once per root domain instead of once per
  task does not look like it needs the big lock? Maybe it's a nice
  improvement we could have on the current scheme as well?

- The deeper issue the scenario above exposes is scope, not lock
  granularity. I wonder if a rebuild really needs to re-count root
  domains whose span and membership did not change. Maybe some kind of
  re-walk of only the domains that actually moved CPUs would shrink the
  scope making reconfiguring one partition a non-event for the others?
  Again, we can think about/tackle this separately if it makes sense.

Thanks!
Juri

