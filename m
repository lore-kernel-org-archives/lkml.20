Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233755;
	b=16yS33F276Qn2FIIFpMGjE48xENFEUJkpPp4M6i9HAWhX7/6Tf7EXLtorsV3Ak3D4NFD
	 s0qYYuTsQMoOEgWh4P992vEYATyropNqEOvLwrGyLAwwtZA0Br0X7xxyr+4gjcVawqHp+
	 1lON9QrFEppg6b3RYK5Fyf9PnrqmTWdJfQU4v+O4shJH4H4booH9se//hcNnlGVjLUmiW
	 KW3Z3Xt1GMCyhRbF0XmbsKuO/Yy6DvssxJEs2jXnUIcJIT1dkGrEBe+EkKA/Yu/SHsACF
	 bEzSh7rp4oNV/uwjLx/77sxLFhPXY4E0XbcLGlLQngFgWU5gU04SiBdBCuyEBPE34GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BRzYSlxPXB9SayIbet1ssxpRWLhzXzCtSQdIz3Apaiw=;
	b=JmPkzDS8nToxWYWpl/xkUUSBPEno4UcF8VYwR8I6jJVdMN5hKP38/cUdNCghR7G75r0I
	 OZ0lc5bIlXdtogq+CQ26xH8Achz2NtK9mZP5qA8cS60fITYHaEb9MDmhKE8DNPjP6F3yF
	 Gn7u4PzE6qrctyLEGfNZ7ctmranbqvJKsmoKHpSja44WIrN3VpvjFV5mZAspOqsNmfMHP
	 ocZIX6JD+EwPBM42mse+RuGYSgYAhvRdbJW3nqPYz9mWPvSOMeXxX/aHykMCZi5cPs4K9
	 hUJ3FXv2TOcLbVCETsdM1PWgckXGUv+xGxjeLJQh2ne7o7MlOqpuUU00W6Q5jOlm3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HVWEf1Ho;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A76606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HVWEf1Ho
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490380c73fbso18974f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233753; x=1794838553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRzYSlxPXB9SayIbet1ssxpRWLhzXzCtSQdIz3Apaiw=;
        b=HVWEf1HozV7xPNGU2o+rDt3myeLyN86ifegA2DnnFH2fnxkqpp8ACtc/UcqYnLLmF6
         MkuqR7zOAQI1T/BlqOhQ03kJ11hJfI3YQFZ182AMWimkbpA4HMsck/rT3Goo6dUB0iJa
         d3UK6GI88ejCLl093/6+BxtyG8K0MtEhNvkATo5TQGJ7YXyczmbofwhIHhDO+WKPLzfF
         IA+wMR49GkiQqIOEP4W1shBAm8vFG3JnWpgA92H37H7rfxWAt5t/C+u0GH3N3uz4TKCM
         WaVgxacHYvgShMR+TUCTmS1lRlUKGZlytIqhjL48l0kmt1WGZVpUC5kc9UAT9L6r2rbi
         p+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233753; x=1794838553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRzYSlxPXB9SayIbet1ssxpRWLhzXzCtSQdIz3Apaiw=;
        b=QCvSnd8SDmEof62IDd3q9Vc3Di1IhKiIFfupE4NyLHVfUTlTWUgUvhpAXIiSn78l4F
         bY60WMjLDhiBCkDjPvAGkt8Pw21HclLOTLMhwUbqM35cIEGj4RTePCvtKtWJ4m6HgUfd
         QJUE7UZwoNQGaYiafIcIs9gWs/iSVDqxzbaV+90Ew03y8fnVidqn6QfNX6FIBlD1XdsD
         iyhNygJIeC0i99s5OZKVN9l2cROia7QQivnIVP3g6NeLtXab2/+6gAusLGCpuSTx++Jt
         0phcHhNkz486/lfBfVRA/nFjy4J07aKg3NZWwozJf+bwj8uN1IisyEco4ywSO2AGU5w9
         BDZQ==
X-Forwarded-Encrypted: i=1; AL+hErE7vs3HtG2gFI6WzsBxXq7NE20zoO04GSSbF6bGTiUrfp+dSBC+N0GyWXcWlwLwCbryPVzHSytOQI6Du28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qYAMd84YKMLPKKdDvb+DR0AxZeTc1bA8ruY6TE+1aaoQGi7qL
	9ydauu0te0qbig5jOWg9oFyt0zbjtr353MC9ylR7iu64LgduhGX5vxYw
X-Gm-Gg: AYBFou1z8J13FSrEkh7ZRw6S5bHqApAQCuwoZhyQ3PHCsdSBdZeifKoR7vPdqFxdJ7u
	kGvlBS8+MVvwKy1kuonm1cyRYgUaWXd9KyL9o43gPLnll/wDuxe539Fdhtne5d3D78qDMYIrh4I
	5/FaKltJJZ5ZPFaaIw235PGLe0aJvojPxtp47vrmpg6yY13AxaZzBYAWk+c9wBerN5CC1cdhz4f
	zQ39grduhrYdiUfEzeQXN1V6PlnsR4LaN0mMEiIOm6vw1Jn06o4E9OnPpC/ngww5ozGBNJYy3Dt
	FP3RGfevIJdlQhgtQi54iYmonUDjlgU95CK76jxnNVVRFmfIWPh2PaDJgoMW9mCFx2u9X7HatfY
	K6Ke6JzJolretQXlxP8xtj+DxZiBjvgCxdKqEJnZXG2KmZKqW7NMQrBfQmqlaM1SwCqFJS2N9Ez
	YHqcd57YUirR6Ks6eKoMIgeV8ozOiknar31OgySkzVg4pmpnSb3B2A605NjGy+ROoNmSndFKtZf
	OTR2ald5pss0C53YOMfFkoiR8UwdGlAEaI2qWvwFBeNZLRJepiOFIh0FJtDcTeH5nrKOAly5yNV
	nzd3iSe3NCGA4v0Ri5Ou/PVoGxQ37eDkVsJUd09p0RB6H42Y6PEH0OukbOCdulblGhMHD2ZzatC
	n
X-Received: by 2002:a5d:6f04:0:b0:48a:f5c5:d067 with SMTP id ffacd0b85a97d-495810d5813mr7394605f8f.2.1794233753069;
        Mon, 09 Nov 2026 06:15:53 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f36besm9520949f8f.14.2026.11.09.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:15:52 -0800 (PST)
Date: Mon, 9 Nov 2026 17:15:48 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, 
	tj@kernel.org, void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting
 CPU
Message-ID: <avHR3lIV2TB9SWSZ@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-7-vincent.guittot@linaro.org>
 <au7SabL5pfbsApyB@scheduler.schedules>
 <20261109135553.GC2668564@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261109135553.GC2668564@noisy.programming.kicks-ass.net>

On Mon, Nov 09, 2026 at 02:55:53PM +0100, Peter Zijlstra wrote:
> On Sat, Nov 07, 2026 at 11:57:12AM +0300, Kayra Cizmeci wrote:
> 
> > (My editor got crazy, so I had to copy this diff :<)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 262626455497..8b0dd858f332 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8876,10 +8876,8 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
> >  
> >  static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
> >  {
> > -	if (p->se.slice < get_rq_min_slice(rq))
> > -		return true;
> > -
> > -	return false;
> > +	return p->se.slice < get_rq_min_slice(rq) &&
> > +		READ_ONCE(rq->curr)->sched_class == &fair_sched_class;
> >  }
> 
> that wants to be rcu_dereference_all() or somesuch, rather than
> READ_ONCE().

Ah, my bad :-).

> 
> The think I noticed is that it will only select one slice_cpu; it will
> not consider another once its has found one.
> 
> This means it picks the oldest option, rather than the most recent one.

So you mean by the time CPU loop ends, the CPU that we selected
might not be a good option anymore.

> And given this is all racy as heck, the most recent one might in fact be
> the better choice. It will have had less time to go stale.
> 

Makes sense to me. So then we gonna overwrite slice_cpu everytime we
find a new one?


Cheers,

Kayra
