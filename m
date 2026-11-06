Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990373;
	b=gDRq2Xvvydi1y/7BqLWvJmlJHsUCHi/rHMl3oOaDC2JkayVHRjVIvRZymGIc2TiF6zXZ
	 Mv6gtUCKMIqDMq25AFDHvYw/NE0H5AWEjRuJ2DUYf8vC+OrJsPohVllblZ+smobEHIqR7
	 7zInHjzh8NVfk2YEuXRO/YUCPrGcDUNL/Qb9vTNicHP9rgEeRB4hEiGMHL1o+MPwx4zKx
	 wBiJXNqalw7CsdUJ3tlO2DllybW5ORAzXJ1gijvQ/3HyTupV7HTKTe/XzmwZnFFGuVCIv
	 Zy7UmEw/Jjp3RSoxqzXYULu9Jz2R0B0rP+JkoowB7YtGvAdZ1q10uBASedNKNCFaEBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WIwS4OC7s3U8Z4r3z87plyGX8aJlDTv0Ul5Ftw3BSuw=;
	b=yqEox1qNaWl844Fo+BvSVtDYJGONv1nHHA7FZ/tK6DXdNzYEsVsU7uUeCusEV045gDPm
	 ZSustcACtji9MBrkah4HsJWtnPZN+AsC8E+3kTy5KVOaqM0WEyKvEUSlDcYho6m5kVeYC
	 mHuVk4Ty3bBY+WdrUuDM+7SmRUL4BMjVfdhFj5Qnp5QzmzbG5TZvmzXUOH+9MlOZIHWOj
	 enGa4p2Si4Y3K4zHqUmiTdGXaTFIY8mpjRFiQEmfW5gSdv+EhYefSEGf/HIok0RwLyuPg
	 M859n2EyureRAVFspklig90rZxUvnwmnC5f2LnkFI7yYEW6uhQNcs6Ggy2c4wppPGzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tN2ltPKz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3402E606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3402E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tN2ltPKz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so1040475e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990371; x=1794595171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIwS4OC7s3U8Z4r3z87plyGX8aJlDTv0Ul5Ftw3BSuw=;
        b=tN2ltPKzR2Z1JRfPyYauSTPlV3eJeerY4K9aVMlRbW24glYzYkMMPHCOXFG7NV7g38
         OYl/se9BorEGj0ykocHcjmvQddONJjpdmQ+8x3squcv2FKwnd7KGQV9J5Xreznu0ikWy
         8swdkv6ZYPpCfpq4iAeDG+tWGO6COV2v6feJObwpKdEqmW/YyHKUdg2669ClmQVrMTxt
         b7N+huwnpqpnrkPeMpJHAjQP+4sFm9RUlbE6WN5cQm2Z2L817m6l7Tc0uQk0EkJAgyNN
         QakNzJdw6g+i1egEIy7c8djK8pR09egrN7lAkcheS956aO5WBhTVov08XV8Oc4WBxoQd
         duOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990371; x=1794595171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIwS4OC7s3U8Z4r3z87plyGX8aJlDTv0Ul5Ftw3BSuw=;
        b=FxApXX+eEsWYX8eXmOxTp0k/cFK7CJVc/+lknZOYGi61OlPN7j5y6KFa8AFRZ9SKJ3
         H0qgdSAhCX4ts77iM6nAsOGKnVnguK7VlkkNugQ4h6yOCsky4evtNLPGaU3FaRPDckUa
         oknsPNryIUcEf1bdH8Y13cDSKJpbhlF7uxhglf3VdoihpmwGpadeISZsZpOGESOYx1kO
         CI+7oZzhzD1vsJZMMIrMQI2hPVERwAAIogSWao0/nv8yb7E5zagG4lHftNP+9orUYAIU
         DKdVtBPSvWvb6iDQ17LAisP6JwTbyY5jmITxRnxHFkrUdYzt5qqTwJUgz8bzAB2SLq+0
         LbnA==
X-Forwarded-Encrypted: i=1; AKwUvBynnYrJXu6vlTnKuvc0oE9km6YVATNjNVlI8vtE/62aWMA2TGfheUlfJB+KaTqVKQH8koLQQDLbRKQrizQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OgZXSsotm9psDCJHsOdxY9mYWXuQs8XSll2WhyyPd3gn+IeKj
	gMCFfBCEbs9+EvX2fmTmLTpTeoI3xKta5bjrDdA5BZ7uHfp7OIKa/5zR
X-Gm-Gg: AYBFou0acqLk2v8tQLMHJ5DpgyT26hx5c0za4NJ/njwL9k8WIQSJRSCZ0gajoQJsDIF
	AVcTBRHERg3FM+Wf8c0RiUE+y9SKvDd/7brytjFrVimF7wHp7c9ZnIKeH22Qr1fA2n92AKchz6Y
	Z2zHBqf6nj+MAUInOOmsC31CZ4CHfPjxssbIN+1a+YZfQBa3BphQHxfBUWDWKgyHysWPTF+rEFf
	ydCP7zMOnv87JfnpuwAxtkakJcMv9lKwb0XBy+PIEQT2JPxjyTrpygK+P3X7AcoZT/7uwywesPq
	SjT5+hiXoE4Vg5dZ3tbKYqXFYDyJ1giLUtHPJh1Msy78BUOzrAzj4qJfTx3EWK1jRAOhaS4Dl+r
	N4XLHRDbg9SYjjEtOK634vYIBMfvVCoUKZPsN2DSrNrjLbcR7JVU9XvW4hJPvSRG5b9ZfT1GHfk
	i5T9nNGyi7t9v8LhEUgH59V+vyhWK6QXAOxXv8LplCnU9KnOPiaozyVoZirc6qDS5cwP5NmRCZa
	dtBgtu2IP1iVbh4XQIehfKHV3vtw6ARE7IqctpwWQTQJnY4RQ3QKKad2wAr/mpzDVfYZwARAeWv
	Afj0xdcQJ9HppCsUhvg3QFzLoOGhMSv1+J3QBon/owJpgUh+wcgwf6s=
X-Received: by 2002:a05:600c:c111:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4b6dcf861ebmr44070765e9.1.1793990371217;
        Fri, 06 Nov 2026 10:39:31 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm4128115e9.3.2026.11.06.10.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:39:30 -0800 (PST)
Date: Fri, 6 Nov 2026 21:39:26 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 04/20 v3] sched/eevdf: Reset lag when waking up on idle
 cpu
Message-ID: <au4dOi6ASp5OnBWc@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-5-vincent.guittot@linaro.org>
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
In-Reply-To: <20261106151947.3991524-5-vincent.guittot@linaro.org>

On Fri, Nov 06, 2026 at 04:19:31PM +0100, Vincent Guittot wrote:
> When several tasks wake up simultaneously on an idle CPU but their prev
> CPUs were not idle, their final vlag will depend on the enqueue ordering
> as the first one will lose its lag but not the next ones.
> 
> Reset the lag during the enqueue if no fair task has already been picked
> and set as the running task.
> 
> As a typical example:
> - CPU0 is idle
> - TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
> 
> Depending which task grabs the lock 1st, the behavior will be different:
>  - If TA is enqueued 1st, TB will be enqueued with a positive lag and will
> be picked 1st.
>  - If TB is enqueued 1st, it will lose its positive vlag and both TA and
> TB will have 0 vlag when eevdf picks next task.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 945de0215abb..6ce4162a7703 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -967,6 +967,14 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
>  	if (vlag <= 0)
>  		return;
>  
> +	rq = rq_of(cfs_rq);
> +
> +	/* You can't claim any lag when waking on idle CPU */
> +	if (rq->curr == rq->idle) {
> +		se->vlag = 0;
> +		return;
> +	}
> +
>  	/* No fast access to prev rq task clock */
>  	if (flags & ENQUEUE_MIGRATED)
>  		return;
> @@ -977,8 +985,6 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
>  		return;
>  	}
>  
> -	rq = rq_of(cfs_rq);
> -
>  	/* Compute sleep time */
>  	delta_exec = rq_clock_task(rq) - se->exec_start;
>  	if (unlikely(delta_exec <= 0))
> -- 
> 2.53.0
> 


LGTM.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Cheers,

Kayra
