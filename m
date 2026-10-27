Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103239;
	b=WMjnzRQ8SGEE86bXf9uphFCzQ8NtHbQohX+bWMbhIsxi74HVE8lYe+oz+AGMQNjI79zG
	 eslH3fJ1l9lPa0g0f6Ms15qqzaOubQJiOCOS1Zdw6z4IF89nCDyyZdN/6NK3w5wzCOnod
	 nPo/HpP//s7lPoNtLje0C1fX+ru9Lt426yPhrc2HqTCxHlXbYpGVZP4ChZ1UTVS5JekDH
	 PB/Jj5pOhW1qeRF2juSs+LCkBRKT1o4PzkD1q5BFpf8gX1QOwSEimIyDIV6u/C9MKUviw
	 rQA+L0MgkTQQKhQCjEmlSuJ2LsX9XOKmUCnRXWGd9jtp4AVnr7/iQ0QAHTD5PWAZBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xKqTN1rXNXn1T9BNGQp2krfxZ2HSL23OeA9Oilwd0FQ=;
	b=W8NLKToRGzO5KHW4lMSG1mbtCyTwcL64zY4qpnHXwGuJL5n1arLeYu5lUANeXLwBmQ3n
	 6rdekGded91SOjuyMnHQLoDsxPyKmJzH5J+6CnwXrLKMq2obdzvs1bpCPnDdZ+cLMkehG
	 QZF9Pgn1z/yr1CXaCKXuFp8mdrtjuqg/fGzUPIrOGoyRC8R5qwNo7dmrhAqyMqTARWsWS
	 dgtzDLskaItEnX9LJvy1EVdsPGNHVKoM3YDSoZdcUSVQBXVFpf5LFhr+9oCG/3YdZA8Rz
	 W6RJcOsOjaL8eA07eKHvX4wluzq5lmklayCXGNuIOxu93mj636w56WaXjijqGtdKd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="MDr+E/rN";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C0760A261E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C0760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MDr+E/rN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso8053705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793103237; x=1793708037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKqTN1rXNXn1T9BNGQp2krfxZ2HSL23OeA9Oilwd0FQ=;
        b=MDr+E/rNiNXfwRsti47ZdXX1RmfkUCnEtk3RdDscQI0Bdm01hh2PXR8NEcr+HiGd6y
         CkB3T5vHFfY6iRAwU9z2NMNSVgdWsCR3wW4+17IQhyPw2WeyfmyprGNC/JjrXB06+f4L
         M+7Zlgq/59oBeWMQiVkl/1ildcKVcPLtbNTDa/6Z7U2o/twqeK3JRdIruWEInOEEB+U/
         7R3Ou23E8QndIhgClseGXpVPNtaJCRmbrjiYxmBEs8Ds5BL9Dv3i67bPQRlRb3vU3gan
         C+i3cKR1HyIXmq+2j0RO30OnB5WpR/iEpfF1X3YYbYdvWoBB/bJ6nriJdYzbuo+Gg1em
         9vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103237; x=1793708037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKqTN1rXNXn1T9BNGQp2krfxZ2HSL23OeA9Oilwd0FQ=;
        b=iM0xKmqVSrsg4xphhnnJgO6/8EVcWAJrDIf5V5etwOkTHkN+PzFRkCJ/I2SqQmNWFe
         EopWPf4ERVGGleEiiK8AmWFhScOHLAg5R/s/fMuOd3KOQ5CIOxvUVmpNqTIrj7IG63FB
         2TiSRqMU3RFINf47VPLfQ70oOPE9lklwNij27s5sH1d8jrYHcOz4F/HoXVhDj3ywHY3i
         nFjS5yLhEeB8WpUYcJNWXUXYV9an4peLSU76UmcKpNqLoPayoLBBTKwKbY4s0rl9RcuA
         /x6/J++NjU+dENZY6NbcwNyXyLHPzANw0bVmrlEa3BybLbgGSBkHoa6pGw891gJYCL/7
         sIQg==
X-Forwarded-Encrypted: i=1; AKwUvByW85P0Ilk8AMz8RFlHJi5oepyMA+KMpWuYJj4pXJJFXhYKNddJBq0ykYjinmpdntOFeSogLEy5csoV+Vc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL7S1uNaSCyPocbHMjovXUue/vo77fqu3kKiJfpbIs+iS9glDU
	CU2HV+axwg6X8zsF6Xzzh5lbMeWm7rBGzCSPbbTiIJYDNZftlIa43jma
X-Gm-Gg: AYBFou31vDigVjOeOeQvi72lS+/hPsO0OALaP9rzgtk1PFnkqRMwdS76TXDFmFoQcJm
	8l6rRuLQ4GLN/VDdz1A9lp7sSyS6eanvuWU2OsvUn7DBu4avrxjK+xOCK1SQQMH1T3ORiarFmv6
	W6oaAmdlsVX5n9voLFYKyN+cjyJP8m8HTyOffD4DnAOOzSKEW3k2oxC+z6u7hM5GJDyrWHZKogt
	mdfF5kXlizCjN6UxWbq8SYhaZqc4fOMajrLx9urpxQHj49UpqfsB6nre5BAGyjv711pbJ9ZfEG7
	GzOlL1OU0GHekS49utHrFVqoDNjA7D51/w6lno0JehTT0LQoaQaDs4W5uhQKPzB/FtZt+n34Y0O
	YjOC36Mp7ticF39F02m6PCsZW2w4bMPiQXRRHbVzfQtMq7c+z0Cwumtp3piWWJ8KQKfrNk0sqm4
	zEnsdRtCoJPN2lXed1UDuFXi8wDUJkIujDsjCwMaok2IK5vKZrtVq7iPHJpIEIDouUKn0RCOlqn
	yfkINRulHNFUmLjz9G3PET74nHCsTxOjGAvxuyeD9Y2RLjSx0kX+7/K6QfeAHD4DYn4e4gnQf9r
	QX3K6T0=
X-Received: by 2002:a05:600c:a114:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4a35aae2c99mr132587485e9.0.1793103237023;
        Tue, 27 Oct 2026 05:13:57 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm291225215e9.3.2026.10.27.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:13:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:13:53 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, albin_yang@163.com, 
	albinwyang@tencent.com, bsegall@google.com, chen.yu@linux.dev, dietmar.eggemann@arm.com, 
	juri.lelli@redhat.com, linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <auCU65gKjdeUOoLl@scheduler.schedules>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
 <20261027120945.GN2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261027120945.GN2668564@noisy.programming.kicks-ass.net>

On Tue, Oct 27, 2026 at 01:09:45PM +0100, Peter Zijlstra wrote:
> On Tue, Oct 27, 2026 at 03:15:40PM +0530, K Prateek Nayak wrote:
> > On 10/27/2026 12:22 PM, Kayra Cizmeci wrote:
> > > I think this fixes the issue. BTW I think this should skip curr, no?
> > > On a case like this:
> > > 
> > > C holds M1 in CPU0, D waits that mutex in CPU1. A holds mutex M2 in
> > > CPU2. B is the working task on CPU1 but it wants mutex M2 and we enter
> > > __schedule(). B gets is_blocked. D gets chosen. We open the rq lock to
> > > get D to CPU0. While this happens A drops the mutex and wakes up B.
> > > we enter ttwu_runnable() and B is still curr. And we start the timer.
> > 
> > Good catch that!
> > 
> > > Or am I MISSSING something?
> > 
> > I can't believe something like wait time accounting can get this
> > complicated! 
> 
> :-)
> 
> > Anyhow, We can perhaps call sched_info_enqueue() in
> > ttwu_runnable() instead of proxy_needs_return() like:
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 04b62c16fa8c..d5758b78b741 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
> >  		 * it should preempt the task that is current now.
> >  		 */
> >  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> > +		/* Start accounting wait time. */
> > +		sched_info_enqueue(rq, p);
> >  	}
> >  	ttwu_do_wakeup(p);
> >  	return 1;
> 
> So the normal wakeup path goes through enqueue_task() which gets the
> sched_info_enqueue() callback there. But yes, ttwu_runnable() does not
> go through that, and needs this additional call.
> 
> There is one more site in ttwu() that also doesn't go through
> enqueue_task() and that is the p==current thing at the top.

The counter already measures how much time a task waits for CPU,
curr is already is at the CPU so we don't need a call from there.

Or not?

Thanks,

Kayra
