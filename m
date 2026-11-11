Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389434;
	b=WiJcf5qGaLUGy/KabyrCf+OZMcls6c8TS5ayDdJz66u6tam5ovz6hn252QqCpPIQA0qy
	 v8JfWks9xy4p0/Ib0OkKiGLfeAIFUVVx6oCme8FwKjGbXsZMLPc4635VXfu3bx9if9plS
	 wOMlsBU4h00RtU9b5IYH/CBFDpjhoa9do6K60peJC52oNpOrsY1kqZOaQSUWgAEFeO/+y
	 X6mL0e0+kJ6aVg/sp7oAO0iAMFvf6ElJ3PXCvHganvjkL0hnQXga/hDrUadn4eXxnmsfB
	 bMNPgBeiuk1uNGCm5BXE0bmMRk14H5QhV926Q2EElIe0R35SjNg/uhcsnetbSFsxBiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ps3gDcvNwJjXoCzLSLfFMwOwMQ5OQSsnttkC3qI2NdA=;
	b=fY6XzgJnwBqAxPXD5w5VeCeSNDNseXF3vQ4CJkMbvFrK5hZ7GBji1jsdijLPWODiS5kq
	 kFF1lJDcJYq3RVJiln3NMj2fugzVrCZWtx7u/1CRefZugo0d3vivob2FQwZtvlLRcnGBm
	 o2jt6tdVYzz26Va+E3JrNv3bp6Ga9iCb9COQ7E2Z076RZRtKafyI2QzV43/2yGgQv9ABX
	 XXWDpE8BbNqCywK7sEhXdjpyZ5ZTBD0YKm30m/rUPJAHIHvNmp+7VmMrGhNXB/vEq7Gm5
	 9z9u105MGKVc9Z7dq+yoIkvvLWaYjk9QyjkBBf77mlzt1iVwPAjsoeH4nZVclqu9Pjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6TsuvHB;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D10606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D10606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6TsuvHB
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490b7266f7bso6124f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389432; x=1794994232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ps3gDcvNwJjXoCzLSLfFMwOwMQ5OQSsnttkC3qI2NdA=;
        b=F6TsuvHBpiPjUFKlfjnDMHu4aPR7JZf3Cq8IK9BJuwRcV2eubDi4zS+tdVA04laq1C
         zSr47lbygMsh2sw641i6yyaFqOOwF5SPU/kpW1VBNZU1sYz4pmHoBAaKx4/lhcK4WKkD
         C3adKU2ju/CIdhWqVaTZQDsQ1DF2Dg7enIIoETW2fQ9l3akIyIDc2n8kp/Frnp6P2JPi
         TyekyPl/pvbn+o6PY/0RGNeahNcvW2Uz2rSh4hBUrckrQzC+L2mfLdDtudw6RCiAm1Ck
         uPvS3gMmv1+S2IM7UFW2134p58LSksL0+RIc75hxcXrzSNEfyT3Om/8Cl4q2pD91Kksy
         6mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389432; x=1794994232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ps3gDcvNwJjXoCzLSLfFMwOwMQ5OQSsnttkC3qI2NdA=;
        b=ASa2y7fn2ZTEnDlAcGqBus14eKu0RJ9F71dH8hri3GQo+SKuwYzeG4wrDR6wJy/1MC
         6xD+m/mxe38X99oVATph1cQcmDoOb+nJ7Dn/met6WnIrVUgOn76NKg/bYeuK5pRgzHj3
         O8XL9ZHteshtPaHT1OKqYrGEeQ3cAuZ+iYM0A8cFVrEaG4W/b0mLwYXYjwKKVyqG9JAc
         O/YOJOcVvBha9L3ZemZdP8RqGMEPDxv+ydJDh+Zc7Ix485idgX9wL+6W47OPjiwYzFEg
         9K0Cvo3+oKEJI2vcx9RzB37CJ5zKBhatoYLh4OFvsspLm2afM6syWjbKrLvOq8YEmuhl
         35EQ==
X-Forwarded-Encrypted: i=1; AL+hErFaVE9O4VLkdfKPwxHsSdxtr9/Xd7ivjGTlIV8y10M/OPznZ0i7mNl4j9rRGcvfYIKGrLiY0U56OJ3OELk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cd4nbyuT6nUzFfttI/q/ZpHU0TjbjY/sJd7waxg+gcpQv5OER
	/LQoJD1Bfaxcmmes17u1Jg+QAJNOuPork2E18oFAjBp+z19SPAA6EIfb
X-Gm-Gg: AYBFou2jbzCDJyIt3Xhx/W5qMRc5Um1VyMb+0r7AL7noXuVCToSTigIaoEgc9cZNUs6
	gWWeO7DZ3G5tH+GgMVOFkMkdq9QsKNJXY1ObchVTnvQS36hekPHU9i4I9h4EGnfBpYJslin859C
	kUO3qt7rdGVMM7cL67+1yOc3S1oQ3T9o742Y7sajbrV/xhzAb2o/CZcYOHYBeS+fTtv5nI5h+J/
	o9se2D5rimVJUt1+h0ZEN0pAcSwoEviNNLkIbVJ4XkJqR+1uDP/nqf+kajW2ZjpykqUpO7hs1+M
	VpModJsrWVMKf7ip6GJ060m8EwcvG/xpLfr9l6FtUV6cDM3GLkkwsjnK4ditTBCfWrYjaiLp7iy
	NCfbjGsvuUIJ63kx+ak2OwKF2okO4BWEdxwLeX2d09YrXTFW7n0XOjs6x0guL6Q7uAw+KAKnWFs
	facP7YwRU0FraoomQ0IYz2DqFdhIjusyPw71UDDFdWzgPt1X4XrcnIPxuMrHE+jxckzrneF332i
	LTbdT/XldDoGvQf+rkWG9C+7lTk5OAeHIXeUYHZqN//wLayf/IDhSyKX0lh34BIi/M4fDQq+5g4
	SrR/tYMF3NLVZi09CUYPaZxbVf3tOCg0PwWRI7LSNIjwwVe1eSrJ22JS
X-Received: by 2002:a05:6000:4020:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-499c434b84amr2742023f8f.2.1794389431893;
        Wed, 11 Nov 2026 01:30:31 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284cce7sm10241570f8f.8.2026.11.11.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:31 -0800 (PST)
Date: Wed, 11 Nov 2026 12:30:28 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Shubhang Kaushik <shubhang@os.amperecomputing.com>, "Christopher Lameter (Ampere)" <cl@gentwo.org>, 
	John Stultz <jstultz@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] sched/psi: Preserve PSI state on delayed dequeue
Message-ID: <avQfCeibnuffnZUE@scheduler.schedules>
References: <20261110-psi-delayed-deq-v2-1-17ac1688f0e9@gentwo.org>
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
In-Reply-To: <20261110-psi-delayed-deq-v2-1-17ac1688f0e9@gentwo.org>

Hi Shubhang!

On Tue, Nov 10, 2026 at 11:09:59PM -0800, Shubhang Kaushik (Ampere) wrote:
> EEVDF can retain a blocked fair task as sched_delayed until it becomes
> eligible for final removal.

Yup.

> 
> On the initial sleep, psi_dequeue() does nothing because the task is
> still TSK_ONCPU. psi_sched_switch(..., sleep=true) then converts the
> task from runnable to sleeping, retaining TSK_IOWAIT and persistent
> memory-stall state.
> 
> A delayed task can later be physically removed after it has switched
> out via:
> 
>   wait_task_inactive()
>     -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED)
> 
> or:
> 
>   switching_from_fair()
>     -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK)
> 
> Commit c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy
> Execution") made the DEQUEUE_SLEEP shortcut conditional on TSK_ONCPU
> so that post-switch proxy-execution dequeues clear PSI state. However,
> a delayed dequeue also occurs after the task switch, when its sleeping
> PSI state has already been accounted by psi_sched_switch().
> 
> Consequently, psi_dequeue() clears TSK_IOWAIT for a still-sleeping
> delayed task. A later wakeup attempts to clear TSK_IOWAIT again and can
> trigger "psi: inconsistent task state".
> 
> Keep PSI state unchanged for DEQUEUE_DELAYED, as for DEQUEUE_SAVE.


So something like this happens:


We enter delayed dequeue. Then for some reason we leave the delayed
dequeue before we really wake up. Then we enter psi_dequeue() and we reset
the flags. Later when we really wake up and enqueue, we try to reset the
flags again.

With this fix, that doesn't happen since when we leave delayed dequeue
without really waking up we don't try to clear the flags.

> 
> Fixes: c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy Execution")
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
> Testing on 80-core Ampere Altra:
> - On v7.4-rc1 (6628e7d4c6b2), switching a delayed direct-I/O task
>   from SCHED_OTHER to SCHED_FIFO triggered:
>   "psi: inconsistent task state".
> - With the patch applied, the identical test emitted no PSI warning.
> 
> Changes in v2:
> - Correct the Fixes tag to c2ae8b0df2d1 ("sched/core: Fix psi_dequeue()
>   for Proxy Execution").
> - Clarify that the regression was introduced when post-switch sleeping
>   dequeues began clearing PSI state.
> 
> Link to v1: https://lore.kernel.org/r/20261102-psi-delayed-deq-v1-1-8cd517c8fe51@gentwo.org
> ---
>  kernel/sched/stats.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98e733af9f576033a0f8da65757f08..3e3f5cf4524d281816b01ba8165905fd1cbefc87 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -164,8 +164,13 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
>  	if (static_branch_likely(&psi_disabled))
>  		return;
>  
> -	/* Same runqueue, nothing changed for psi */
> -	if (flags & DEQUEUE_SAVE)
> +	/*
> +	 * Saved dequeues retain task state across a dequeue/enqueue pair. A
> +	 * delayed dequeue completes a prior sleep dequeue after
> +	 * psi_sched_switch() accounted the runnable-to-sleeping transition.
> +	 * In both cases, keep the task's PSI state unchanged.
> +	 */
> +	if (flags & (DEQUEUE_SAVE | DEQUEUE_DELAYED))
>  		return;
>  
>  	/*
> 
> ---
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
> change-id: 20261102-psi-delayed-deq-9535d7ffd138
> 
> Best regards,
> -- 
> Shubhang Kaushik (Ampere) <sh@gentwo.org>
> 


Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>



Cheers,

Kayra
