Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842278;
	b=X99QFHO/WdI9+8bcADej3y+7sM87WoMMp/MRV1z4x0cpBOQtnKT+WDgbNei+tFKXoObn
	 EZeVxTrb3FgPkL/i5Qfr+oWiEcrqRCMVpuiGkeE8zB6td59DyRHQDO5Ie+UFpVw0I+eD3
	 I8iXzqCM96lQ81PS/MVsXufw8cq747NzHxszyavIraYq98D1gbkiXgnB23iENUGK7OrB9
	 w4RrRgaTbalzu4o3IoMi05uUooMctGidVZI3UT4smy57t5qIrI/GAxdlICmJGAZRoWmRW
	 +6YI7yiRu2hXj8by+0+R81uVpYf70LA7D8K0HbY8V1T2ASOJa8YJHvYcm8aophZjZfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842278;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jLen+4rDC32UYCvcKVrdm6E0bIihSpeiFP037txZfKo=;
	b=CPPQ5JRIlrOzfbD4LVk/47AmYDwC2Paso3cCbYDz4abd1NdUQdchfPLUavHnhbVvkHsh
	 3IfYTlZmnlhArL0UdMn5WT9Olm6I5IqlrXgiV3SanGoE3Q+6EAyBP1V+9kUWWFSUI3oWV
	 7ljWS/lZ1sKNXF4z2JODMr//gN5hlYxg59bDxCj0Cniw9OUm0F9SJW+73gOq3YQQoJhZZ
	 rCWcfUDUt7tuSP53b2Sm1s+lPJaS9qXY6SniZZt9ObSqsdPfRJntzM6Slq/MADBt/2jqq
	 PXh6ca4EsSjBuwyfj5+zixjdt4CAdZ9FNH+BkoReq/Q0YVrlmFxoCXAxXKWo7hzH9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SINVicXN;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7665606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7665606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SINVicXN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jLen+4rDC32UYCvcKVrdm6E0bIihSpeiFP037txZfKo=; b=SINVicXN0CIeMi7mgdZF8fgOtM
	oirDC/WsEQvV8eV1usEo3WVt6Tgss1xtV+w2H1JQyF0DC3f08qe4ILtozw8KbGI/x2A1SDbfkc/gj
	ip/Cj3EFnhWia49/+zAFjEzEzhXszTEWM+i8CUv8LUyGlJevmiDJoSlMtAnmICrIKL29Np+OlTV92
	JP36HaYbLu+P8qUrf7Hck24SpDpUlIm5dlZyA4jCH7U5ZrnhsN0gOk40St7DLQx43M04QCtTEmLUY
	DvI+CwIK2ou2iTd5XTRDElRCKiO4G2jdW1BeSusRpdYj9fH4QRA7HYhXIEs0NVtHVu/WyApMWcMSQ
	5OdHsCMA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKaAh-00000002V1h-0oQI;
	Sat, 24 Oct 2026 11:44:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1BB6D300DB9; Sat, 24 Oct 2026 13:44:22 +0200 (CEST)
Date: Sat, 24 Oct 2026 13:44:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	David Stevens <stevensd@google.com>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags
 on off-CPU sleeping dequeues
Message-ID: <20261024114422.GA6775@noisy.programming.kicks-ass.net>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-2-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023220431.1106611-2-jstultz@google.com>

On Fri, Oct 23, 2026 at 10:04:12PM +0000, John Stultz wrote:
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98e..20820fe1021a1 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
>  	 * Do nothing here.
>  	 *
>  	 * In the SCHED_PROXY_EXECUTION case we may do sleeping
> -	 * dequeues that are not followed by a task switch, so check
> -	 * TSK_ONCPU is set to ensure the task switch is imminent.
> -	 * Otherwise clear the flags as usual.
> +	 * dequeues that are not followed by a task switch. If TSK_ONCPU
> +	 * is not set (meaning we already switched away while the task
> +	 * stayed on the rq as a blocked donor), handle the sleeping
> +	 * state transition here so sleep-persistent states (TSK_MEMSTALL,
> +	 * TSK_IOWAIT) are preserved.
>  	 */
> -	if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
> +	if (flags & DEQUEUE_SLEEP) {
> +		int clear = TSK_RUNNING, set = 0;
> +
> +		if (p->psi_flags & TSK_ONCPU)
> +			return;
> +		if (p->se.sched_delayed)
> +			return;

Must this really be sched_delayed, that is, cannot p->is_blocked be used
here? I'm trying to push sched_delayed into fair.c if at all possible.

> +
> +		if (p->in_memstall)
> +			clear |= TSK_MEMSTALL_RUNNING;
> +		if (p->in_iowait)
> +			set |= TSK_IOWAIT;
> +
> +		psi_task_change(p, clear, set);
>  		return;
> +	}
>  
>  	/*
>  	 * When migrating a task to another CPU, clear all psi
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 
