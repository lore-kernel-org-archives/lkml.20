Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103208;
	b=R0gUUmpu2i0zN6zr6fkYkI0wzHb1I5lbyr3t44um4oUTQ4Hpk+boLw2MWSEsYeiU3Vc+
	 D8UdXGf3pCXFBXpStCOXg55lXy1Yb0YUQlqz6Bla4fhasXYvksOiGO/xno9VW8zUWYp+k
	 K8F5+kSpRgIL1TfKG//jg8HG+03+jJ11SH2nWTYZkwVFOnIb0LNn8RmEQ4dbvPSEVeEj9
	 reIlgjKjCbGowXT86X2tidwlx7MUMDhhfkXG/mATRVy2NpnduuRkliNKkJki/6Ip1gU07
	 2IdRLRX6Xt1gWH9HFAlqn+6xjhzE82fAInEqerH6/aPUa1SHEpUxuHiiEprCH5QmGRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=El9Ghbfi0RZqUfS8yaXKboE78ZEctno2TtXNQL9csq4=;
	b=FvMwQrWInEvmCeItsjxFzypmjxc3m0ohjIgyHuOy2Thho46e8ZPnhh09Ekak8jtoNnZS
	 L3u4ZmP85U2tHbkzhQ5DwDG0W7P1vR2/wsOpa3WuwO85P3kOULibEBBJGsFjPcKFr7FEm
	 d1Bk7b1ZkENGL1YrAPOQvVbCzXKRpoezQkzp/p60Mfu55EXVdz1WCHK9w1PRwOmoa5tFP
	 N6e6jBibCJD4LLrheYdcJZA19izIsuX742ny1JBWaB6LmoR+N4Ks8t76reVhwQ/0/mqUi
	 sDQB2F6x1ML/X6viNzRqnelOPexgsFmGQRwcIIqp6v0w8TZTBuy48L9JtZPgBLKc6cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z4NyKn7h;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D1E60A2625
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D1E60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z4NyKn7h
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so5414475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793103206; x=1793708006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=El9Ghbfi0RZqUfS8yaXKboE78ZEctno2TtXNQL9csq4=;
        b=Z4NyKn7hvn/fUtWeRdB9D/BdAg6eynaGums1gMjXPm1ZHs3y1+nELPxXul0faHoFtb
         84zuMEUpY9f7MJQpWVEnIld8xb/1CttxvR3HkSHdXxwF2Oj6zR/YnIEzuwk8yBeJ+PK4
         5jkr4/WgmG1fTB/b0J0IO4AbRgJC7jsl8bLBOASavc2VBwdef2iEHGcRNNIAIHeQD/Kz
         fBM5tbvfTocIgQiCqxzA5hT7t6G7ue0ZK5dd+OfE68oPZzG/6SQaEdJo0YNJVzAWhAzc
         olHGeQwOdbFmnvSUZBEii39oq9pLC8/4EkDz84MMpweGpyhP6Eqd12KOywupuGJkwD7p
         bGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103206; x=1793708006;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El9Ghbfi0RZqUfS8yaXKboE78ZEctno2TtXNQL9csq4=;
        b=kZihlvif20YD98/2s36laI6Z1T61zL4KCmMzUNIff6o0auRQ6fyDowi9V+qZwcDrox
         ezdTDAD7U4i1ErxGwimRMTxXuakqLTJ7/FXP0W4xPm957ElkbUGatJOeD4XQY+sGeoS1
         Ir9EPKuIW6JjbLtKRBaf+UqAU59vqQuYThL39rVftwhosAY8sNUF43NrpFqkenZmJWQM
         X9H6gx0L3RgqlhQYGV4nnBmX/uuI7D+FBvDF2wNib/qtsCI8c+wQ2dv6WY85kLmAIxUa
         1AA0VHCtj/3/F98V85HM4btX6F2VlUkzeyoAx3Nro0idsqweSlMEnv5MBk7/vJHBsecZ
         ax5g==
X-Forwarded-Encrypted: i=1; AKwUvBwegKWCNxxJwDCMdDdGtw9kNR4WvypBJpn58topX4Fa/QFEYABspqzUFGoFzU5FUsPTYU8tUCcIkSZSYH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGrq4XK0hOsYouUhpPDsGb93uJ4TWS0YL03CyqJTAHSdkHrzBE
	7Or4S5zKzKibtA+bZMMxRoXF6bS6+xMYt4ZBnZ94fuTI+3124ykEg/pakwId6KWt
X-Gm-Gg: AYBFou364pdvhsu4HhEuo+foF6+DjedevdBZMPiNWeoAwkJt/a3hS0K9xR1SD3XtXyK
	yoGN/lXata1gp1DV5unw3lW57XRkK2bC038UG43PiKEXs8ud8DEITQGeYz9GJqT2oeU76ErN4JV
	Y7BKKxwiaHV95MjQlA99S3kuqaWqkD/8wB4czoT8CuwMPBlZW+weLPfFlAbDlcMJLBPPHj0/BQ8
	HBBVxdLTTZB0NCMCamlMOm78SJ9r7CYlAfeGz5rGnSxYF4KF0RjQQpuPwp7vaSHKViWuzqlTJa3
	prv6GfAcXER9hEPoEcMsrZ3CZTanA5Pa0lu9anlIhmJnUepyB9UuJFrtaTRGnqzp4usRsfzpMOB
	+/mPMf41j9nwYaGx9QMdj12HC8N9G5PxgnSz4yBxzN4vxs8IRpxjnhT3Tl+wJlzQe704y6qQ22x
	7LXO73kCzNvvKD8te66nNRlE1yzE6LVBl3hB01yMSeqmQDEyqTNW3Oh5r2oqP94kmCbOtnhhZVo
	YFHf1TUjYb0Glmz0b54CEqDoacIlZ7PbxY8jlWiRw13CGW0/o42IVFEPiY2bX/SxIXA11BiCcJp
	o+UL0Z5NvGKJrGj8SXgSHbuQ2pPFOV8kYSI4Vf4syoaQo/c8G3GX3h/iQQwh
X-Received: by 2002:a05:600c:1993:b0:4a7:72b1:c8bd with SMTP id 5b1f17b1804b1-4a7c1b8dfcdmr53534025e9.15.1793103205975;
        Tue, 27 Oct 2026 05:13:25 -0700 (PDT)
Received: from [192.168.0.135] (95-24-172-184.broadband.corbina.ru. [95.24.172.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm214822695e9.3.2026.10.27.05.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:13:25 -0700 (PDT)
Message-ID: <b3629b01-9be6-4785-af35-e75e473cfb11@gmail.com>
Date: Tue, 27 Oct 2026 15:12:55 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: perf AUX: race causes poll() hang
To: Peter Zijlstra <peterz@infradead.org>
References: <CAE7+JAnhZSuMMG9+0pZ2G6ZBR-OAC1hHptkr=T=x5LK9n19vOQ@mail.gmail.com>
 <20260518094121.GT3102624@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Konstantin Mikhaylov <mikhaylovkonstantin100@gmail.com>
Cc: adrian.hunter@intel.com, mark.rutland@arm.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260518094121.GT3102624@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/18/26 12:41 PM, Peter Zijlstra wrote:
> On Fri, May 15, 2026 at 01:35:48AM +0300, Константин Михайлов wrote:
>> Hello Peter and Adrian,
>>
>> I'd like to report a potential race condition in perf AUX buffer handling.
>>
>> AUX tracing is designed to allow the tracee continue running when the AUX
>> buffer fills. The PMU driver must disable tracing when AUX buffer is full.
>> Typically, it schedules IRQ work to disable the event later. Meanwhile, a
>> typical tracer's workflow looks like: poll() on perf FDs, consume the data,
>> re-enable the event via PERF_EVENT_IOC_ENABLE ioctl(), then poll() again.
>>
>> Given this, the following race is possible:
>> -------------------
>> | CPU #0 | CPU #1 |
>> | tracee | tracer |
>> -------------------
>> |   **   |        |   tracee fills the AUX buffer completely with some data
>> -------------------
>> |   **   |        |   PMU driver updates aux_head accordingly and schedules IRQ works
>> |   **   |        |   to disable the event and wake up the tracer (setting rb->poll in
>> |   **   |        |   perf_output_wakeup() along the way)
>> -------------------
>> |        |   **   |   tracer consumes all the data from AUX buffer,
>> |        |   **   |   thus clears rb->poll in perf_poll()
>> -------------------
>> |        |   **   |   tracer re-enables the tracing (the event is still active,
>> |        |   **   |   so ioctl(...) returns immediately)
>> -------------------
>> |        |   **   |   tracer starts poll()'ing the AUX buffer again
>> -------------------
>> |   **   |        |   IRQ work handler finally disables the event and
>> |   **   |        |   wakes up tracer
>> -------------------
>> |        |   **   |   tracer obtains zero rb->poll and continues polling
>> -------------------
>> As a result, tracee runs without PMU tracing, and tracer's poll() will
>> never be woken up unless it has some timeout.
>>
>> I reproduced this on an x86 machine with intel_pt and kernel v6.17.
>> Reproducing this race on the vanilla kernel is timing-sensitive, so I added
>> 30 ms delay in the error path in intel_pt_interrupt() when
>> pt_buffer_reset_markers() returns an error - this delay widens the window
>> between aux_head update and actual event disable in IRQ work handler. I'm
>> not sure that pt_buffer_reset_markers()'s error means that buffer
>> overflowed, but this error branch is taken sometimes and all needed IRQ
>> works are scheduled during a call to perf_aux_output_end(). I also added 3
>> ms delay in perf in __auxtrace_mmap__read() before itr->read_finish(),
>> ensuring the ioctl() falls into that window. With these changes, some perf
>> runs collected smaller traces than usual. I added traceprints to intel_pt
>> driver and enabled tracing for sys_poll and sys_ioctl, which confirmed the
>> exact sequence described above. The problem was sometimes mitigated by
>> tracee migration to another cpu (as perf creates an event for every cpu,
>> the event is re-enabled by kernel when it is set on a new cpu). Otherwise,
>> tracee stayed on the same cpu and tracer hung on poll() until tracee exited.
>>
>> Could you please confirm if this analysis is correct? Should we move
>> setting of rb->poll *after* the event is disabled in IRQ work handler?
> 
> I *think* (its been a minute since I looked at this code), that you're
> right.
> 
> Does something like the below cure things?
> 
> ---
>   kernel/events/core.c | 54 +++++++++++++++++++++++++++++-----------------------
>   1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 7935d5663944..490407618f36 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2677,6 +2677,9 @@ static void __perf_event_disable(struct perf_event *event,
>   				 struct perf_event_context *ctx,
>   				 void *info)
>   {
> +	if (event->pending_disable)
> +		event->pending_disable = 0;
> +
>   	if (event->state < PERF_EVENT_STATE_INACTIVE)
>   		return;
>   
> @@ -3278,32 +3281,37 @@ static void _perf_event_enable(struct perf_event *event)
>   {
>   	struct perf_event_context *ctx = event->ctx;
>   
> -	raw_spin_lock_irq(&ctx->lock);
> -	if (event->state >= PERF_EVENT_STATE_INACTIVE ||
> -	    event->state <  PERF_EVENT_STATE_ERROR) {
> -out:
> -		raw_spin_unlock_irq(&ctx->lock);
> -		return;
> -	}
> +	scoped_guard (raw_spinlock_irq, &ctx->lock) {
> +		if (event->state <  PERF_EVENT_STATE_ERROR)
> +			return;
>   
> -	/*
> -	 * If the event is in error state, clear that first.
> -	 *
> -	 * That way, if we see the event in error state below, we know that it
> -	 * has gone back into error state, as distinct from the task having
> -	 * been scheduled away before the cross-call arrived.
> -	 */
> -	if (event->state == PERF_EVENT_STATE_ERROR) {
>   		/*
> -		 * Detached SIBLING events cannot leave ERROR state.
> +		 * If the event is in error state, clear that first.
> +		 *
> +		 * That way, if we see the event in error state below, we know that it
> +		 * has gone back into error state, as distinct from the task having
> +		 * been scheduled away before the cross-call arrived.
>   		 */
> -		if (event->event_caps & PERF_EV_CAP_SIBLING &&
> -		    event->group_leader == event)
> -			goto out;
> +		if (event->state == PERF_EVENT_STATE_ERROR) {
> +			/*
> +			 * Detached SIBLING events cannot leave ERROR state.
> +			 */
> +			if (event->event_caps & PERF_EV_CAP_SIBLING &&
> +			    event->group_leader == event)
> +				return;
>   
> -		event->state = PERF_EVENT_STATE_OFF;
> +			event->state = PERF_EVENT_STATE_OFF;
> +		}
> +
> +		if (event->pending_disable)
> +			event->pending_disable = 0;
> +
> +		/*
> +		 * Already running, nothing to do.
> +		 */
> +		if (event->state >= PERF_EVENT_STATE_INACTIVE)
> +			return;
>   	}
> -	raw_spin_unlock_irq(&ctx->lock);
>   
>   	event_function_call(event, __perf_event_enable, NULL);
>   }
> @@ -7612,10 +7620,8 @@ static void __perf_pending_disable(struct perf_event *event)
>   	 * Yay, we hit home and are in the context of the event.
>   	 */
>   	if (cpu == smp_processor_id()) {
> -		if (event->pending_disable) {
> -			event->pending_disable = 0;
> +		if (event->pending_disable)
>   			perf_event_disable_local(event);
> -		}
>   		return;
>   	}
>   

Following up on the perf AUX poll() hang race reported in May. Your 
suggested patch does not fully fix the problem: the hang now lasts until 
the next reschedule rather than until the next CPU migration. The 
problem remains, but I lack the skills to write a patch myself.
