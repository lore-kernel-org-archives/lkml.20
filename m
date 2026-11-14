Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664181;
	b=2vc5p4xwysp+d6z6vpS6PADotBBQqBV/J/WGQ1NlpmsER6fTn43qCP8NnVDMYxW9lXNQ
	 Tx98dUxAzVrimKhWy+3vYsVb3yhdXt5l5wHPpm4WSrWU4/qBrdCI2Jw0PFltdKQtQNB4t
	 DkSx2MVk7duh7TwcQQQ7Wx71VxnuPznmr1K00z5LFbLPJEQCqDYCBYoF3njpZB07cYQdG
	 3JrksI/ABtFX4ilb4Dbeo36k1TtUDWsLnfRQrtXRIGht8whJfyOOVkc8MF5BX9L4zu9T0
	 8acAfJ8nBxjyciGqV3dtohU87KWmJfYPydOSmR01TmiBhWWyUi42FVaBq8YWnECnSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VdmR1vgzD8EXG0p3zX71bhTWu9AEw08/jpCgsMG/r4A=;
	b=BOLzxHRlTHUvCBCNKCWS7uI+8MfB2Wzp3hw/pVt94msO1ZjjI9jgiSY786SQJlQR0np1
	 /Xer3ueQNS5lktJmtpArThc0TMWOgxT5FfPqjACkn97EdPA6WS1z+Pyok0dR85QDXmtax
	 KaCT+oykfGJf5n8dXI0lwkBWpS6q+3Xh2mxaOmsaa3/3fomAeuC4Fr4cMAYjEI+6Hu7fx
	 Gz+vCfAWmm9yD7aCAKEDHr07daZOl0jTT0oP3RofLvkoyH4eYeU10yFWiKQroaWFY6dAy
	 gBcmaEJdajNYIywjNZzOMwzqxfXKX79EIQnVPw9npq/zG96UjKuou/ZczNrAutTX7CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aZHEs+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FAD606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FAD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aZHEs+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5f0c5348so653845e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664179; x=1795268979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdmR1vgzD8EXG0p3zX71bhTWu9AEw08/jpCgsMG/r4A=;
        b=w6aZHEs+7M3OugoDTGLmB9RsE0bNlRrOdRsIlsQt9tkGN5YVN7v8CS0xRo17ZWH5um
         voPU4UQAIqTwzHDbwXpDYFt662OiesEcZ73M3lcfNtgp7ewSBaEbO7YI1qW4dhAyAZun
         dc/NQowHSvWGqenl9envMbukPnCTKLmPSL7fvHITYiyTjsWGzsFVx5y9zcdMshZkas4G
         lLBOz+hdl14r6AAUXt/y4wT/gnZWaK5qwbxby4ZxGiVjFj4olFHdOps+3pomvvnmF60E
         r5aiM6RrA0fNvlse9zZf2eLOhpRTdrf11RnsJQyNKUodWhuUT7CMJZR9zd9b/1ZF23Jp
         I0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664179; x=1795268979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdmR1vgzD8EXG0p3zX71bhTWu9AEw08/jpCgsMG/r4A=;
        b=RZABfIAxyvMsyk+d3Iid4TQSbdHzckcQAIHOv00ybG2lxDUfvj3UmdWar+ga63s/22
         aK87ErYodjfwr1cfG4KBZMKUiE9AMLFm1V6shvz8seIRuiPGNS9MxEl1NbF3IQ10FmgM
         T9RjuLImNp8246gDxpaXu2k5sqvgEKw9Uvot6a4jxDgk1s+YvaeEN8Ez2auIqVjWi0t6
         Tb6UjCZrgaNcFfMXZuqQ9xu6d2nhDnX2qPcdbVsHL/X61sEkF6uagIdO63YyWuZirP3Y
         0ZRgBOKpu9QIzQpL2Deaim7vv44/KyNO+eu4n6yUgtByCDU0g3AEtkvX2jXycbTq9wMB
         Ca0g==
X-Forwarded-Encrypted: i=1; AL+hErGaRszf//jdH9rUbLlbtVkp2hYyPoQVjCrQ/iPM2xhiUeJj89C0GK4+N8bgqg5U56Cz5kziuzXIWU0iVCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+ufW7yzBKlNjzJ8TaW2bEhl6RmqOkX43wzjNQ+XOpCTqBAqL
	+xMWhAaQNfwza/ZRS8APJ31qPgW858gmtABEZqJEQmiSSIf1kl7uIpRH
X-Gm-Gg: AYBFou3kR+p8FElYfAAyreqDMNPaz5+4LI7LbaUwg8B+Ra+iwMZuOnvKHUVkjPB+18u
	zCqaD7uh4ugY94aq8m2w1i+f5qM8IP93buvICe57kG9zaUVV06ZySpHucICPTdsj6rUPaqLKF1h
	BiAKC4V711GmgYZuhuAa2BijtoJRWZiglfpRgt8BWKaKFGGDQP16J1HbQJmY83mz4Jh6WtEdUmL
	5TYWVH3LTe9UEV4FPnkynF+8UDDEv1pshBrB6StzTiPZ626wMIYJ9PA9niZxKogoEB5M3rbG07Y
	WSksMXovFrj1YbO9HuUf1jm3gpc7MqkNfSC4LmVEKs426ReZzFJLb8ndFOAgDfBw/SGdLXXWSng
	UCmvJj/Y6WAvj8Z+5NAdUfgSQ2DnlyaDDns5xFEXOXisv+DJQOdFNcY1cN2XBRnDCHxPBp1yBzk
	+MTkIOqLcebXnSS6vKeXgldBfLhNfiQrvcrspCcRCuoke6Q5UUls2v3/0c7zP2A5dAJIuGT5Rzo
	6wc1cSDj+qkimWN7sXYwrRd3UcQa71/TKLC+zirfFYL/t2T4JBky0hpMYHIVQ0+8FdCLOc3JmXs
	b3Y6orLBGbkvWkkzW+0g7B5M5q3dSKCHsSgC7uTwBukh0VNskATcHHa/HA==
X-Received: by 2002:a05:6000:2212:b0:48c:698b:502c with SMTP id ffacd0b85a97d-49c6d54973amr12451052f8f.1.1794664178706;
        Sat, 14 Nov 2026 05:49:38 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm10515226f8f.21.2026.11.14.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:49:38 -0800 (PST)
Date: Sat, 14 Nov 2026 16:49:35 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH v2] sched/stats: Fix run_delay over-count for tasks
 parked on the runqueue while blocked
Message-ID: <avhSzH_sRtg4g_Gs@scheduler.schedules>
References: <20261114092637.3206631-1-albin_yang@163.com>
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
In-Reply-To: <20261114092637.3206631-1-albin_yang@163.com>

Hi Wei!

On Sat, Nov 14, 2026 at 05:26:37PM +0800, albin_yang@163.com wrote:
> From: Wei Yang <albinwyang@tencent.com>
> 
> A task parked on the runqueue while blocked -- a proxy-exec donor migrated
> to its mutex owner's CPU, or a DELAY_DEQUEUE sleeper migrated across CPUs --
> is re-attached with activate_task(rq, p, ENQUEUE_NOCLOCK), i.e. without
> ENQUEUE_RESTORE. That arms sched_info.last_queued although the task is not
> waiting for a CPU, and sched_info_dequeue() charges the parked time as
> run-queue wait when proxy_needs_return() dequeues the donor (TASK_WAKING)
> on wakeup.
> 
> Use p->is_blocked as the primary indicator: sched_info_dequeue() drops
> last_queued without charging while blocked; sched_info_enqueue() refreshes
> it on every enqueue while blocked, so the stamp ends up at the real wakeup;
> ttwu_runnable() adds an explicit sched_info_enqueue() call under the
> existing !task_on_cpu() guard, for wakeups that have no enqueue of their
> own. Delayed sleepers also have is_blocked set, so both cases are covered.
> 
> The p == current early return in try_to_wake_up() now documents why it
> needs no sched_info_enqueue() call.
> 
> Both over-counts disappear with this patch, and run_delay still grows
> normally for a runnable task contending for the CPU, so the counter is
> alive rather than switched off.
> 
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> ---

[snip...]

> v1: https://lore.kernel.org/all/20261025130740.3324391-1-albin_yang@163.com/
> Full test results and the discussion of the split:
> https://lore.kernel.org/all/20261101143101.353033-1-albin_yang@163.com/
> 
> p->is_blocked was added by 4c2a20413d7f ("sched: Add is_blocked task flag")
> and is only available from v7.2-rc1. The DELAY_DEQUEUE over-count goes back
> to v6.12 (152e11f6df29) and still needs the sched_delayed based variant on
> older stable trees; that is a separate, independent fix. A second Fixes:
> tag would make the stable backport machinery try this on v6.12.y, where
> is_blocked does not exist. Hence only one Fixes: tag above.
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1a088d4576f5..bb7914b713b1 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3962,6 +3962,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  		 * it should preempt the task that is current now.
>  		 */
>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> +		/* Start accounting wait time. */
> +		sched_info_enqueue(rq, p);
>  	}
>  	ttwu_do_wakeup(p);
>  	return 1;
> @@ -4357,6 +4359,11 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		if (!ttwu_state_match(p, state, &success))
>  			goto out;
>  
> +		/*
> +		 * No sched_info_enqueue() here: current is running, not
> +		 * waiting for a CPU. If preempted, sched_info_switch() ->
> +		 * sched_info_depart() arms the wait clock instead.
> +		 */
>  		trace_sched_waking(p);
>  		ttwu_do_wakeup(p);
>  		goto out;
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98..84d1fb208740 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -240,6 +240,9 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
>  {
>  	unsigned long long delta = 0;
>  
> +	if (t->is_blocked)
> +		t->sched_info.last_queued = 0;
> +
>  	if (!t->sched_info.last_queued)
>  		return;
>  
> @@ -290,7 +293,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued)
> +	if (!t->sched_info.last_queued || t->is_blocked)
>  		t->sched_info.last_queued = rq_clock(rq);
>  }
>  
> -- 
> 2.43.7
> 

So I see you removed some of the comments from Prateek's diff.
Is there a reason or you just forgot to add them? :-).

The diff is here:
https://lore.kernel.org/all/4c8b0413-2ade-447f-9313-ff51dca7c7c4@amd.com/

And what is your plan for v4?


Cheers,

Kayra
