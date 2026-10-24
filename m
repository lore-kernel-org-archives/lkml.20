Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849489;
	b=sjPpEcVWhiMWMrv7cAmtEBeITN1IuGTZCOirdKOOCBPpqo4yrNkXo7rAdXz3S6yquBlr
	 1vDAiIKq8iQlNSvcMkumHyMq62pVKgNoRWB6dm/bb4h2po1xNgBE8jiyEhR28J7a4uABW
	 sQ1eHi9tdkB0A+ivYYP0lKI4Qv1JK1JhQXFg1qoWMpZiT9+SZIDIrp15GiTxULZcWQXrE
	 de2EhPyh2Bt+HYz1UTYy0DRWVuLDTbRW26vee0I1IpZEmT8UKM3IwNjGDm1/y6g2rYtv/
	 WyGTz02ZGmkSAlbTDPzcuuL416NAZZh/2qPF5NxYD5563MjoCq6felcLq5HaAVZlh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aROUo2JdNxrk3v6gleeS3tzw0XZVRatW1plcoMobNY0=;
	b=c79m4buEDqd/r33tPRtghdlRvci1eXvqFKfvB8+giIV7DlqkASuIht3pfCvi4sGj8mw4
	 B7Tt4RG606qNur3juJ1yh1k+NoLtbE4SW9flX7AAiWVQLwvUpFSNlSpF0woowfWWPzHmP
	 opGMkZQUspJpBx5dkOa2ppgRStYwt4DKUd3LHAw8HVOh2a+vaN+eQQ87svi7MyTVK9S8M
	 b+Lj5GECtVmyM8WMi3rOwQ7qDzqGmujPRySo+d/b0PmZPI2MyMRHIkKsasJTyg/u7ubOI
	 L8pcwL3TI3ipRy0Tr9fg8tT7S06QqRIs6FjxSmIMyv4FD78xu2T2MDts2XZ7ZFk2y9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n3olhXxs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB51A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n3olhXxs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20be3b39eso2182715e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792849487; x=1793454287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aROUo2JdNxrk3v6gleeS3tzw0XZVRatW1plcoMobNY0=;
        b=n3olhXxsc2JP72kH/HnpS/Zi0Aur3afyaewHWsisT0peNTRFNZTa4QKBJZo9cKgU7R
         FrC4om0tqab8PmiNmTSfBPs65ZxdQB0PIjMiJJzdiFVgCsykjxxS9FCuk0in+3jDtYyk
         NZKVms7Am5UJ6Nj4tMUDowu3CvsRqSQ1STwmi92cj5658BThQTtCp3UZK6htQYUyRfA5
         URwSy5OF/rV7DdUuAC2n1z5qciGk3FAI1u4IkNZioKOnUWPO2/kGKSRDg9PsO8/ZBYvV
         Rj1udupdNSYSnslitMp+sLDbFtC5UWNZbjrzDRaTgXQVoozOCcXGkr6AYe/Ye7ZH+DuB
         TyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849487; x=1793454287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aROUo2JdNxrk3v6gleeS3tzw0XZVRatW1plcoMobNY0=;
        b=YpeznWcTvDNBM39XmBQ3PAzDtoC7SfR278NUaEgo/UnCvfoqk6xzSNShQXTp901nlX
         H0XwHShBxQK7lD0At0GRZNddi0QYdYng02nxHSts3KQ8ezS3q2w5dD9DgG0//GJJJZ3p
         mIRkYtxjWYecJ7eIPYKTl689GQmL5q1c0S6CqqDVFdU3z9I+lkjLU9RW0/Q062IvcJeb
         TXiQL1dYS3pDTBFe6oT5JB6lO170m+QVhC9trTTLPNLHhyNDyED3RZPFvf5qj/0jolAz
         LUzC9RpY8vEYj38Jinz/5LpPhizBJZ+O10D4pPU6EEzdom/OMsDU53YFbmgYMuuwOTr5
         zSuw==
X-Gm-Message-State: AFq9FYLZkuy0CNJ8r9NofshpKIBn5xI6SYMMiSROuOIYLAfT1KUrU8ev
	fRLKIDt78ILaG5qVrKjYeQV2M4FrHlyW2L6x1JyRgzcI4z+hO6AKIXhh
X-Gm-Gg: AYBFou0LYhfjLsq9rBX84ii8PSuX6f5yxvgTwXicEuxzd6mTL0LT+GzsWtraMsP4ifZ
	+cwKgIgVhcG2ezXlhirS/zpdY5CNC59akFMK/RpcEfTYX1Df2jz0gc0lqqWy6uLnIMzgg3tqRZ0
	bNiHsEphmjh+6PSGub6ecjG79I7oK7oDGxIv8khWNBxpKJJKTyat+1jTaXRq/LH5zH6lNqyitm5
	d8NSzXQWRxGLllcH3Bwrjn63kJ8kICsG/z8XKqwBLDxhzqEyAAzhtgbFjZrczwX4a4YnodPdHNr
	YPkd9sdRYHm6b5f5HEzvd2A0GBFwJOLXBHZJykwZkIBIeObFvFT1lcAxP2lEZ3ePTVL/E7yOoGP
	qBoqK7cLicPIczh0pjPYVRSiqXDEBB+CJEYj5iWTxAJXlqXVaHGUWuKrHe94YkM4xm1CKXRaGJc
	6SiL1jFUZj27rRXCRJkOURV5QnZOBBKigvnEHm+9Y+sgIUARZM02ag+uS12f9o0r0Sn1nd3F3ky
	fX5YGJI5Pjv00Zp3Zq3FmfB3qygd+S5uUrfSQOcByP7QgzJXxyOV1V8xz0HXIO24EbEdnK1fVTD
	0bc91rA=
X-Received: by 2002:a05:600c:6206:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a35ac6fe89mr29801975e9.1.1792849486910;
        Sat, 24 Oct 2026 06:44:46 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d238sm50433745e9.14.2026.10.24.06.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:44:46 -0700 (PDT)
Date: Sat, 24 Oct 2026 16:44:42 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, 
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, 
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, kernel-team@android.com
Subject: Re: [PATCH v33 2/7] sched/core: Use the scheduling context for
 remote ticks
Message-ID: <atyu3qw5gzbgxq1x@scheduler.schedules>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-3-jstultz@google.com>
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
In-Reply-To: <20261023220431.1106611-3-jstultz@google.com>

On Fri, Oct 23, 2026 at 10:04:13PM +0000, John Stultz wrote:
> From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>

Hi John and Shubhang,

> ---
>  kernel/sched/core.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0ab15f03cb947..729ebaca35e1a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5934,26 +5934,20 @@ static void sched_tick_remote(struct work_struct *work)
>  	 */
>  	if (tick_nohz_tick_stopped_cpu(cpu)) {
>  		guard(rq_lock_irq)(rq);
> -		struct task_struct *curr = rq->curr;
> +		struct task_struct *donor = rq->donor;
>  
>  		if (cpu_online(cpu)) {
> -			/*
> -			 * Since this is a remote tick for full dynticks mode,
> -			 * we are always sure that there is no proxy (only a
> -			 * single task is running).
> -			 */
> -			WARN_ON_ONCE(rq->curr != rq->donor);
>  			update_rq_clock(rq);
>  
> -			if (!is_idle_task(curr)) {
> +			if (!is_idle_task(donor)) {
>  				/*
>  				 * Make sure the next tick runs within a
>  				 * reasonable amount of time.
>  				 */
> -				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
> +				u64 delta = rq_clock_task(rq) - donor->se.exec_start;
>  				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
>  			}
> -			curr->sched_class->task_tick(rq, curr, 0);
> +			donor->sched_class->task_tick(rq, donor, 0);
>  
>  			calc_load_nohz_remote(rq);
>  		}


The old code already assumes that donor always being equal to
curr. If this is not true, patch is needed. If this true, patch
doesn't change anything since curr == donor. :-).

So even if it's true, this doesn't messes with anything.

And IMO, using donor instead of curr is already cleaner than using
curr. Since we don't need this WARN_ON_ONCE and the comment. AFAICT
more robust too.

So...

(Dramatical pause, important for scenery.)

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Thanks!


Kayra
