Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981078;
	b=CI9JDIcVa2X0eSxWLXR5cfITKd1e6AS9Z5cCgdyzk0iosjbnRpsVaRrhawRfzhCZbWQX
	 CpBwHBTOwuuUUqZoZv7jgCOZAaSxFu2c2cmtN0nr1rd/pT9gGEATy1jyi4E3y+rM4+Vwd
	 vg0gn/yRkQZj7n1UC6plz/qCmThyak2MFo+lmk3QO7vpybwFwDZQ+DjK/CQ3UN3tn6/jd
	 wsI2bR3JrtO+c70lm2sRNz2zdalmCH3q+tdbgnM9EiKwN75V0zzDqw6z/qjG11XEeWpLf
	 xB5CltZVyUQLsZxzg40+WENDYVrYz6AyHEH/RlOicOrY/TScBrtDxzUTA0KnFQ3/Dcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IygM6K6pbLrcby+wD0xt0Kg6olbGMtkNBhuq4agOYJg=;
	b=5d2k0fVz5sOLLsakTFv/Ef/UW1VChm0Ft1AEFRrE7VFemGUtuTvN4lS5Avb4T10tZQF8
	 LWELXK2jzrEYcy09Km4zo9H8RtI3yYThyFI+oWAOBqzwbfzW8WNt8C7bbyD5dOicK+H4E
	 XWNort9Aizf1rrjj3E8yAk837jH4hBZd1lPpqKGTmyL+zbmHRD8FyuwCm4BfjXm2G5/sg
	 7kUylDsbSoETs8YAMExvLCo2FT78bgrYt7AX0KFF/qCj0+weTGZxMCUm0BGwYpAX3bhGU
	 wVnItE2ZYfyxK//Xk0yqTn/ajDPwjd+VEDmhUISgzbEXa5VDeHCqroFqLk7YVqFyRQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WQBGRmDT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCB1606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCB1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WQBGRmDT
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so853229a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793981076; cv=none;
        d=google.com; s=arc-20260327;
        b=NeHpQOLBjPIGwAcFAbNYl3w7w02fUq1Z5UNX5Gol7tOgv+6tAc5kGlfNSRLLRfknmG
         ioQ9W+kN2Rd2GjOo7Jf07VZcgzJt8mAU9gs5OIKMl1fum7CeNI7nGoVOA0Pko0vneCfj
         L9uZloXtRtuy7w+vKn2WNtzGRYs41VEnaKxhMIKVOdLLQ3eBs4pB/+NsgGs8AY5efyW3
         Cd5bGtJsNm4rGqkla7L05kmSGZWZyKi6OiseYSwsBWTYUurycpJcmO4VA41+xkcfTEcG
         YlLZP9qKoAKP/gVw/TjxstDLT0ssXlPPwXHHxkz2WVMJRUDLcKARuN1OkgD66kd8kweH
         0OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IygM6K6pbLrcby+wD0xt0Kg6olbGMtkNBhuq4agOYJg=;
        fh=350vh5Sm8KGqMifG2mZ9OL5QZZHImo8ECl4ollBVFS8=;
        b=FWO03CiVY0v6jmHw6aSrADDy46xDhLZ9tYK+KMpt/l6rvmiBCQpGuEBhYY2sOi+p4D
         uaOtq6x6in4dKyOWMzsUl9WDiBLqmK5tldYir7hTahjmBS+HnfNydarHfELAG46Tdjib
         qMRpMaLxLluOvEpQSQD4Tqa2d7GlUzlJpoiSuGqtkovQfyVvyeGFBMPi1tE3ENDpQBMq
         sFqUKSR51Spd6B2O7AvXobi82jJw/pBN8xiu3FEKlBhB7pNuQeb+/sI4mAO2loyQMNgT
         63BEqbN2fG/FXGFaC1DOQCA8NQjggZOvu9fc4b8gf9UC0NNyJ9TJ7E1uW5nPpgVKvLrU
         zw/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793981076; x=1794585876; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IygM6K6pbLrcby+wD0xt0Kg6olbGMtkNBhuq4agOYJg=;
        b=WQBGRmDT6kw4B4IFw7/K21g7m8QT0DcBRqL16QsXJJaTgbw6C3D/+ZnqNQfhh+nqat
         dsaxpSWazFRK8cGp6ArT9fLL+C0s041WjnQQHzcuRTaGpYTgPb8cr9+oBzX05TP7LkwF
         nXudolnwpDjqNPFe7GFxB1/307Zih40uP/dS/q2WE5mjlNJ2hftJsNpcryYWh/QPqqwX
         tZpPNq6kNglOfwfExmjj8mtJ0XzLXKVuDUhhJYvPr3cKyzVAU+9cuYQ5suu49dQW8M8F
         Ej7y8bQlCiT0ZmdAzSYpCLmSBr1G9h2TBLOyL53/EcNe0qgBFeyKqbau6BrPTPVbheGE
         MGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981076; x=1794585876;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IygM6K6pbLrcby+wD0xt0Kg6olbGMtkNBhuq4agOYJg=;
        b=MubJHW1rxWLFcjJcl73f11Kn+OWk6FvEQJn4pPmKjN87HdGbtM3h8KErGgY11HZ6Uf
         EseW9zWqocnBK69mE207ukgDSgti2xxhm9j4/4dJOo8NXvrfRkQI0rZWNeu3NTNp35xK
         ZxRaAr6jiPywXDa0xklMIK2SVhhxTWuqmCRSy4G//RFTtcglkYBqYXVZDAVi3BjR4EJm
         68LN39cZsgnpnra17bI45KO4Wq6Q+jDGT5zfW47zCHT31qVr0D0vNuqAdNaG4xsc6dIc
         DHceuc/XS5VcgkV2KrezHamb4onNuWwk4MgiC5/K/7/syqlvlAXdLN1NPG7wMqVfK6aq
         YTwg==
X-Forwarded-Encrypted: i=1; AL+hErGegGGdX8ffyW/+Nn1gB9Y4bZ8I2vJBUiz6rtlGjAnRVAzf1nARXlESAFXauymusNhU0QS0VjCNRfSt/3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AEE/9frFver+A7mWr7SR6//Hd5c11IdBhLcpm4OCafqqMN5mM
	fuGiK5tlMChSYEgJr/AKpNw1YgHhXFPmrMsEb8mg2ndR9R1uHcR1JfJzd5a5L1Z8Nq+D2Ppw1SC
	drdDX15x0/ci0rHVTlE4YIx51QStLEdG4d4BYcFJHTQ==
X-Gm-Gg: AYBFou1OiKSE7DGC8JyowOWwn8IovEgoy8Re78CFgbrbjhLyhSzgRQBiIQMBQ2/t6ax
	lajq/6DIbdOgDU6FrS672eoYUMhuFN5MBjLZTOfm9pIlPPGWsUdTuvoP9AVb3y2GmMW89KIld9A
	E1H7TNIODTUzrX91XT1CVVR9BQFoRJlcwKKuua5y2SDLZX9ItP4BhmHCeRP22Z7NuiWeKxNzXLC
	rGRJwmL62XqKayZ7W1KMgdxuYAVmKtyteob4SC3N/RcdnFMcYIt2Y+Z0kdhMUsbcU/us+Lf8AYP
	cny+wmtm5N+jM9BLVdD5Kpm7C4+hj3WSTD+lTJvaEI/keTmoqphxluHvuLjGyt2B/fZbrxLFZPn
	/ANw+TA90pKSb82NGviCFOOdSbFVUtMX+xj2nZKw5dV+Wbyj7pooXy0C2F56BSK4wbloLAQ==
X-Received: by 2002:a05:6402:d0d:b0:6b1:e097:559f with SMTP id
 4fb4d7f45d1cf-6b5977f1543mr2086552a12.18.1793981075818; Fri, 06 Nov 2026
 08:04:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.453569788@infradead.org>
In-Reply-To: <20261105170157.453569788@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Nov 2026 17:04:22 +0100
X-Gm-Features: AclHuK-rU7FQjIZBAgRP0w_2HxD51sMcPej3SDh3WCYbbFei19JOiG27JaU-Rk8
Message-ID: <CAKfTPtCtEXmhi-b1kjmzJ08anyLUwqJKMGtGnVKBaEZ=hufThw@mail.gmail.com>
Subject: Re: [PATCH 1/3] sched/fair: Use guard in sched_group_set_idle()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 18:12, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Cleanup the code by using guards; prepares for further changes in this function.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15790,12 +15790,9 @@ int sched_group_set_idle(struct task_gro
>         if (idle < 0 || idle > 1)
>                 return -EINVAL;
>
> -       mutex_lock(&shares_mutex);
> -
> -       if (tg->idle == idle) {
> -               mutex_unlock(&shares_mutex);
> +       guard(mutex)(&shares_mutex);
> +       if (tg->idle == idle)
>                 return 0;
> -       }
>
>         tg->idle = idle;
>
> @@ -15805,13 +15802,12 @@ int sched_group_set_idle(struct task_gro
>                 struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
>                 bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
>                 long idle_task_delta;
> -               struct rq_flags rf;
>
> -               rq_lock_irqsave(rq, &rf);
> +               guard(rq_lock_irqsave)(rq);
>
>                 grp_cfs_rq->idle = idle;
>                 if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
> -                       goto next_cpu;
> +                       continue;
>
>                 idle_task_delta = grp_cfs_rq->h_nr_queued -
>                                   grp_cfs_rq->h_nr_idle;
> @@ -15830,9 +15826,6 @@ int sched_group_set_idle(struct task_gro
>                         if (cfs_rq_is_idle(cfs_rq))
>                                 break;
>                 }
> -
> -next_cpu:
> -               rq_unlock_irqrestore(rq, &rf);
>         }
>
>         /* Idle groups have minimum weight. */
> @@ -15841,7 +15834,6 @@ int sched_group_set_idle(struct task_gro
>         else
>                 __sched_group_set_shares(tg, NICE_0_LOAD);
>
> -       mutex_unlock(&shares_mutex);
>         return 0;
>  }
>
>
>
