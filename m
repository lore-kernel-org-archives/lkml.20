Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778301;
	b=IjI3W4tMAQMKNHcHO3uLR+Zif3LyhAEYGftP1u/KPPMgovp/yPhWglg1W1z+dG+BLVe4
	 UOkXXlnCKJZAkQ/7WhAs9MlUIrBJvZbgymrs4z242/NbjPbXa8z2WU3gQaQPjfmkO0/3+
	 aiggc88w8tcKoUX0uZheSMmiS61PULna35lXIt6Uqf0gI89H25I65lQjNcDyBa55Uvwwa
	 9UYUcowtL52NpwAPHubV6+4eTWCwxPPcTjqeCT4onqytqvinxmTMyI1hniOzxj0S19N2e
	 350XE7cFM+bo2icdlVzWIEVGAEvWi7jGuy609AnjmOpnh1ActShev1qpbeJsmzlnSDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778301;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vMsv9Srk+t4B3MryjiQ53/dMFv1ASgegPTBxzhVKIB4=;
	b=PtFrZwNuDwTxc8UcIARobo1A8mBkcPWgTWC2xL5ACoIGnkh6vIf+4Y+sZOta+2bL3/A/
	 JAhETF06Mp1GWF37fHFksOEwQvTevGxIQ+mGcnqbuNVDmTAZ0KBSjGJSqPeCNXICqGj6J
	 sw7qjgktkW0cepHwaR26Ve9O4eQ+cfSDHnycew11CxQuZqwiQIdUOTK/3BEmBKX6Lk5wD
	 bH0y/PKUKjz4WxRWF6R9yBcp/FZFV2tpoqeyQSLl5X/DPi/i3OZqhZGK7aVFFBEX62lg3
	 GWF1P3mZsZDkxxAh3/FGrIsC78xc3agNjbTrn44XcWvjmZJFc6nm1z37W3qJ3r9g3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ipgWTCkf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=A7zfDkdR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C51606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C51606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ipgWTCkf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=A7zfDkdR
Date: Wed, 4 Nov 2026 08:44:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793778299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMsv9Srk+t4B3MryjiQ53/dMFv1ASgegPTBxzhVKIB4=;
	b=ipgWTCkfpW8enNqz2DbzH9+CXnAv0PNx0OAbYZfb5LGIL5ruzWU6r3Nrw1E8GneSrcC/dx
	jpOsmMvGCcTofJtqfsaa7riCtrCZPYBQyv+u6Xl/6ewegDNlwNaW1fLHrt2amQwXYcDcgY
	4Fll+dMxst5L3Lu1A/oilJ4YE3Wo6PNC51wl0u5IMEM+MEDOSesKWL2VfYvydAfw4fhxuN
	Hoah5sAPVHy2NpXsGe97j92mggLFrvavVZV4EU8s7C/MbV5SALvsxP7CwL/tAsk/bkeh2b
	CgVVc1OW/FqjqRDLZ6PNCn4JAn1ck4dAqF8o+syK+MLm4gh/zVxW6+dJ2l6ghA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793778299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMsv9Srk+t4B3MryjiQ53/dMFv1ASgegPTBxzhVKIB4=;
	b=A7zfDkdROZCPoEEqZWNxW6Y2NYBCe8dvx7XztrkNOVpGkIe890JtGb9C0SHM36V1JhON7z
	Qd8ZR3i6+n58kVBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mani Tofigh <mt4022@columbia.edu>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	tz2294@columbia.edu
Subject: Re: [PATCH] smpboot: Run the thread function only once before parking
Message-ID: <20261104074458.J7ugpo2w@linutronix.de>
References: <20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu>
 <20261103151525.Mu-hc07d@linutronix.de>
 <cdbb5dac-210d-4c75-810f-2f99e22675ff@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdbb5dac-210d-4c75-810f-2f99e22675ff@columbia.edu>

On 2026-11-03 16:19:23 [-0500], Mani Tofigh wrote:
> > Would avoid it. On the other hand networking has HP-handler which
> > ensures that the queues of the offlined CPU are handled.
> 
> True, cpu_active() is the better check there (and the RFS check a few
> lines up probably wants the same). I'm happy to send that to netdev
> separately.

No, I don't think it is needed.

> It only covers RPS though. A NIC IRQ still affine to that CPU, or a
> tasklet that's scheduled while disabled, keeps ksoftirqd busy the same
> way. So I'd keep the smpboot change and do the get_rps_cpu() one on top.

softirq/ ksoftirqd have an abort criteria so they don't run for too
long. If you manage to come up with a case that softirq/NET_RX
processing stalls the CPU bring down then we can think about it.
Otherwise I wouldn't bother.

> > > --- a/kernel/smpboot.c
> > > +++ b/kernel/smpboot.c
> > > @@ -119,9 +119,12 @@ static int smpboot_thread_fn(void *data)
> > >   		}
> > >   		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
> > > -		if (kthread_should_park() && !should_run) {
> > > +		if (kthread_should_park()) {
> > >   			__set_current_state(TASK_RUNNING);
> > >   			preempt_enable();
> > > +			/* Run pending work once, new work may keep coming */
> > 	/*
> > 	 * Run pending work once to handle queued work prior the parking
> > 	 * request. Don't try to process everything in case new work
> > 	 * continues to come and the handler has a hotplug notifier for
> > 	 * everything that was enqueued later.
> > 	 */
> 
> Thanks! I will use that in v2.
> 
> > The thread_fn should only run in HP_THREAD_ACTIVE case.
> > 
> It does already, should_run includes td->status == HP_THREAD_ACTIVE.

Ach, indeed. Then it looks fine.

> Mani

Sebastian
