Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247852;
	b=KYsC33L+KkfJFVjoR6Ezg1uPqudDMKUatQfQM2U9M19o8p+wZFl3O0nR7+H/rn+AeSnP
	 r8Jxpva/pZACXDV2YpzGlZYKvl6Tq+6S/nlgrRsLAv5E9AJ0P55DVop1eQ65H2iUQVCBB
	 v4/DV1IF8zJW2NgL3pUF6+W4SSHV0gGiKDN/WaUjcDu2VEsNcm8pCn7gQOpczbkikPd+V
	 qNTWkCZgp6ABND5U8bLrdHomGsh2Nlug/7KQlZyOPId7jqcmi1T+beg1kZOs5mMrwhr2I
	 hBcY04il63GAc9aBJFalCy1VYVR3IOA0z1H/+vW7rRwqHGtToC/NGfjESWgCGzFEMXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e45RFk16pVtHRw4POJeV0tJYnsVxnXyFVLPbGCd1TJQ=;
	b=IleOHp+XprWLo6xJChoXbeVnqrc1piKPQNd+9NWHMxjJNXs1Oyv6amOoQuMEn26VlFji
	 fPvQkTfJd1Z2G/MjBljQgvP9j0fAI4Nlk9OhldqyFLgM46UBKjPcmE0KBEWXV0p3VSqE5
	 c67r3JnZG5ODC50nE+1vc4tRd8rgoBYjySicD3XfgELTrOs96kHHRmRMbv7bR4znoCSsK
	 b7knmDbPNDz5jT+ea8Zmkk9cl8x6nNZgeW29gHr8lkKBRFYwWB44lc1gwevtG6ZSB1ydg
	 kycvKOmmDMNq7Aq9TVbJntia/IngKJWhP9afr7281e3XwhTZ3TOOofk32UvYLw7u3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGSfFxkl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF96606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF96606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGSfFxkl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so1376505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794247851; x=1794852651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e45RFk16pVtHRw4POJeV0tJYnsVxnXyFVLPbGCd1TJQ=;
        b=kGSfFxklm0uRXgoHEHjaOYtftTdrSz+ppQWByyE+/IOdJzpTqghpWwswCJqan4BGWS
         QWVjbob1PCr/xmL4IQexIPF07FDXWOoAyytcEjsxJLNdzjWH2/e5Pw94AiP19syXGpVk
         kvJFuFbB4ZPun5/iBg26evPsV67WRTHj/BR30H95ofO8Qhou7NiOCMVJwgab38hAMh6d
         oldVBDwhL9cK7NYzQFoJV3p4VfWNLmgpgHm94GY+1iYccFqbuiPyWCPy01SN86iAaVV0
         i+eCsvwSmYT+dlzQ48kmoy8kLGzB+qmhiKLEHZ3m0rkHEsJq0y8tV1dEodkVZWqoewXP
         7o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247851; x=1794852651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e45RFk16pVtHRw4POJeV0tJYnsVxnXyFVLPbGCd1TJQ=;
        b=SsOjZFw6kUDGbQV92nV2REUc8HHsm4HCTIb4HhH+GR13h9GPHQz7XiMHQpr6o9enbI
         9JP6QKvyAGul88EqGZYHq9+RmagG2vNqaogO7/ePpc6U+L+aYojbTsY89B8Fc/vpSN9l
         5cxyHRTlpuzSZ8WyK38kTA+GP47H5nfRZuT7lAWci/2Cv+r/AhzJBq+DIfPiRdQMMyOX
         JsB4Y6P+KQSV55tuScsvsVmPq493r2HN89L4/0YDeaqwc3fazPh+y5edjvg1ktIMiGKT
         ND5yd7phWhw16vjSunGpfWu70rX2N+gGl1cqfO99W+NnCqLKX0uwY7afBjj9HoS8Ulom
         XXGg==
X-Forwarded-Encrypted: i=1; AL+hErG6qmnCIn29clQju/xsFZ0km54rgo808BRy2wCfdhrvGI9Mu9u96J4OuTtbN8hd8uoqRCkhMf2elFGuN0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bP4A625SRXTI/oRmtUF6p5tMZWs/U0VJewTEi1TRE8V4gyMSK
	XlLMeu06bgc+P16Fklh+VI/LsShtq6fF0EEg6C0mBo7GphudVwg4+eGD
X-Gm-Gg: AYBFou3YUo00yZ9kSstyWrzcGxM6A0zTm/Tp8qwuxp8dYIl5W85Zo5EPMW4DNUPY45j
	pJhXMySg0K36MjIN3ZZtCbBK23Uq5ICvcI5PpC1UaWUfZKt6ISrxuryQWyy/sBb7v/cvLNidizc
	SwWZzLYbtHJ/eNyAj5V/Ef4aTDb+Df6hsBqkYQEwc4UM0LO4Mro9eWb43CBJh3iXX5TAesK01ye
	6Pw5xCwTd3yQ5Jo3U+OxhOHdppZZiYAyV4aVKv4z9sTuKp+rvqVmVB4Llbtsp2eyj/giaXLCc5K
	6q4e0/HsEuDGWqdgwga/nUgua2x0Hb580oz7CjywmSyP81g/R/bGJQwg1RQj8MFRC7y9vUwF7ei
	w5bw8JwuT/vhIkwIdjaBoYzSa2OMUrb9g72eL3K/qAhX8O7GpFgBClsBtQMCjqlz5hR3yK+PSHI
	UEeiMHfZ87hrq2JjbilCIUCKR891jKyCZ9nt09sZ78Enso7NFOHjkX0bppOuhm1X3wzzCmNZ+jp
	M/seg0TCOTEOD5SD9iCw5jpB08s3TBHsHD+PM0a5hK99V3iTCAvDDjidfdT6jzGYC2cQM/tipeV
	evci151BCfz9ZudzIhIPzStducrgMimplhWN5YfzUiIt7TTqIGH1T1LA
X-Received: by 2002:a05:600c:4709:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ba022c8b5cmr1865955e9.0.1794247850515;
        Mon, 09 Nov 2026 10:10:50 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm3183375e9.12.2026.11.09.10.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:10:50 -0800 (PST)
Date: Mon, 9 Nov 2026 21:10:46 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] sched/fair: Skip sched-domain traversal when wake affine
 is disabled
Message-ID: <avH3rQ4W6d4jfny2@scheduler.schedules>
References: <20261109120522.1704752-2-srikar@linux.ibm.com>
 <avHZrLRHmIgRu-a7@scheduler.schedules>
 <avH1WCeG9_O83U7N@linux.ibm.com>
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
In-Reply-To: <avH1WCeG9_O83U7N@linux.ibm.com>

On Mon, Nov 09, 2026 at 10:01:20PM +0530, Srikar Dronamraju wrote:
> * Kayra Cizmeci <kayracizmeci@gmail.com> [2026-11-09 18:09:56]:
> 
> Hi Kayra,
> 
> > 
> > On Mon, Nov 09, 2026 at 05:35:22PM +0530, Srikar Dronamraju wrote:
> > > In select_task_rq_fair(), TTWU wakeups for which wake_wide() returns
> > > true, or where the waking CPU is not in the task's allowed CPU mask,
> > > want_affine is set to false.
> > > 
> > > For these wakeups, the scheduler does not perform wake-affine placement.
> > > The existing code already treats this as a fast-path by exiting the
> > > sched-domain walk before locating an SD_BALANCE_WAKE domain, ultimately
> > > falling through to select_idle_sibling().
> > 
> > Not before locating. If it doesn't locates SD_BALANCE_WAKE in the first
> > check it just leaves.
> > 
> > AFAICT SD_BALANCE_WAKE is not set anywhere tho.
> 
> from kernel/sched/sched.h
> #define WF_TTWU                 0x08 /* Wakeup;            maps to SD_BALANCE_WAKE *
> The code searches for WF_TTWU in lieu of SD_BALANCE_WAKE.

Yeah I know. But I couldn't find a place where SD_BALANCE_WAKE gets set
in the domain.

> 
> > 
> > So if you wanna do this, maybe you can do something like:
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4cc0caee626..b40b2eb5e577 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -10016,6 +10016,9 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  		}
> >  
> >  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> > +
> > +		if (!want_affine)
> > +			return select_idle_sibling(p, prev_cpu, new_cpu);
> >  	}
> 
> Yes, this also has the same effect.
> 
> >  
> >  	for_each_domain(cpu, tmp) {
> > 
> > > 
> > > However, select_task_rq_fair() still enters the sched-domain traversal
> > > only to break out almost immediately. Avoid this unnecessary work by
> > > jumping directly to the existing fast path when want_affine is false.
> > > 
> > > As part of this cleanup:
> > > 
> > >   - Move want_affine into the WF_TTWU block where it is used.
> > >   - Skip the sched-domain traversal entirely when want_affine is false.
> > >   - Remove the now redundant want_affine test from the
> > >     SD_WAKE_AFFINE check.
> > >   - Remove the corresponding !want_affine loop termination logic.
> > > 
> > > This preserves existing wakeup placement behavior while avoiding
> > > unnecessary sched-domain iteration for TTWU wakeups that cannot make
> > > use of wake-affine placement.
> > > 
> > > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > > ---
> > >  kernel/sched/fair.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 3ebec186f982..58ff55e093cb 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -8832,7 +8832,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >  	struct sched_domain *tmp, *sd = NULL;
> > >  	int cpu = smp_processor_id();
> > >  	int new_cpu = prev_cpu;
> > > -	int want_affine = 0;
> > >  	/* SD_flags and WF_flags share the first nibble */
> > >  	int sd_flag = wake_flags & 0xF;
> > >  
> > > @@ -8841,6 +8840,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >  	 */
> > >  	lockdep_assert_held(&p->pi_lock);
> > >  	if (wake_flags & WF_TTWU) {
> > > +		int want_affine;
> > > +
> > >  		record_wakee(p);
> > >  
> > >  		if ((wake_flags & WF_CURRENT_CPU) &&
> > > @@ -8855,6 +8856,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >  		}
> > >  
> > >  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> > > +		if (!want_affine)
> > > +			goto fast_path;
> > >  	}
> > >  
> > >  	for_each_domain(cpu, tmp) {
> > > @@ -8862,7 +8865,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >  		 * If both 'cpu' and 'prev_cpu' are part of this domain,
> > >  		 * cpu is a valid SD_WAKE_AFFINE target.
> > >  		 */
> > > -		if (want_affine && (tmp->flags & SD_WAKE_AFFINE) &&
> > > +		if ((tmp->flags & SD_WAKE_AFFINE) &&
> > >  		    cpumask_test_cpu(prev_cpu, sched_domain_span(tmp))) {
> > >  			if (cpu != prev_cpu)
> > >  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
> > > @@ -8878,8 +8881,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >  		 */
> > >  		if (tmp->flags & sd_flag)
> > >  			sd = tmp;
> > > -		else if (!want_affine)
> > > -			break;
> > >  	}
> > 
> > 
> > This just changes the behavior.
> > 
> > Old Code WF_FORK 1, WF_TTWU 0:
> > 
> > want_affine = 0, so we skip the first if block in the loop then leave
> > once we find a domain without our flag. And go with slow path.
> > 
> > 
> > New Code:
> > 
> > want_affine is moved away and early exit is removed. So we enter the if
> > block and try to find a domain with prev_cpu. Because WF_TTWU 
> > is 0, we just return new_cpu. Or if we can't fimd the domain with
> > prev_cpu, slow path.
> > 
> 
> When WF_TTWU is set, we are always suppose take the fast path.
> slowpath is for WF_FORK and WF_EXEC.

I know. And that is the exact problem with the above diff :-).

Like let's say prev_cpu is in the first domain we are looking, the
domain has SD_WAKE_AFFINE and SD_BALANCE_FORK set and next domain has
only SD_WAKE_AFFINE set:

Old Code:

sd = first domain and we enter the slow path with the first domain.

With your patch:

sd = NULL and we return new_cpu


Or am I missing something?

Cheers,

Kayra
