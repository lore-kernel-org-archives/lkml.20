Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856054;
	b=ifgd33VCZ7vaL/9d/KW0wW49vfRe+qPfhnViLUcBlTFADtdDcLDLBPvX1c2+7jeFXB22
	 t1rH03Fp2qZwP2ktr+gebTE0cqBQUt6N34NuDhRR31JmOZYGAe2FDC1QOw5JG4Uf6WIfw
	 TMw9ulq4feOkGsDNIjAYMsebfpHf++yTuFz2UmqvJVm6Lr6f/YxrvR6SrriBG/SZH8O6k
	 CjinJRD/effTTMK2zeOcNkJCxvQCFEdLGnJM/mavcpfCv4xilOJZeMwx11n+7vSbPIIfy
	 x+kiyx16/hpdE2P+7eZlIReaPDEHovVu+E5atOKfnCKqjUvm++G1MW3vo4hudSLBxCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UA9c6KHU3aURhg21JRzdMyAd3FV39prv3wITG4EAQv0=;
	b=y/3th4KDXe1QSL/B1m4MK24oBz8lu7IZ5c1FII32wJAT0oOSYKs0ffjCuXslXyqcUFdp
	 66kvXuEy7chIiefsXQgl2hjv4sFK5HHSGjfZHKhEgGjkivRBpox3hxvcp+FLnfDlIVbd5
	 u7uIVNcyV4scaeZZ6EApwYv86ZSX+5Q84vXQxL8EPNcqTG52G06Ydr6c+L27cQ15EJSAj
	 /pN9I8xO6PoiOIXnNAIp5SuFpiwiUcl+OhqQ9JvZ0tW2TOA1Ek1StgwBwknNkYMnaJQ7/
	 1vU9bXoq8YHMKOGNcycqnPYXaR8DiQeGtsr5stv06if9uKOkYkgwiXmu2YRbVLXCQ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=brKhDpN5;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=brKhDpN5
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so293086f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856052; x=1793460852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UA9c6KHU3aURhg21JRzdMyAd3FV39prv3wITG4EAQv0=;
        b=brKhDpN56QxL1JykW9ZWnR5hmnpJvqkjctnYLYUXxrL0Hq44ycq6hv2AjDr6vkYy6N
         FGu+EkUUYIMW9x8His65apwbuPjyeO/HPcR/i1sD9mhyHULVqfxzp7QRKbfGfvdIDj/X
         EBBfwkN+NhD1M5NWRtD6LqiQjyIPCBqWJjmiUFz6pZGo15TCJyEvPLQeY56OOhqFDlnJ
         0xtnX2LvTQcwKcjmpCQwWO1DdPjzlRkO4w5s/X7KaeGne7bietMzC62/rzIIxOMhx+rU
         0huqUbsscKKpmWBi6BlT+3oKoTu/xLKe6qewMzH38Hh5EbpfyzmtA3XDM9ZWBOCiVUFc
         H75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856052; x=1793460852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA9c6KHU3aURhg21JRzdMyAd3FV39prv3wITG4EAQv0=;
        b=LSw0zb70vtuFz7yeHl668WYuhCqhBCQaRRoco2PyT5olWXHXeYuARaV+eWy+SiAdai
         Y5HDOWcEc8g6psTJY5j9+g5KzR2trHqK+zNQ8rzSwYpABsstmfVfyzOP+wkaUSMkhewg
         qeZd36hCmdrR3gVxWfDaMgag6tKDTtv97emr2p9GGUGzGh87N+djVEex1IaqxTEc0TLe
         LgMhC2zjt3mqi7f3VRzTas03cF6esuuRnHFHhiouBCU3pQkR3cwWYy0vSk1WVEWaQ5Yo
         Jtd59BoEw60hmvar5kV95pb+4uB6Eaa4St9Y9WiwtD9FMNcnGYVTfgfbxV56CmnN8Tfn
         odiw==
X-Gm-Message-State: AFq9FYKcdWmyNmqidAi0CIhq40qAfi8pXmhp20ujc8wrJzmXlj5jEhhh
	RaTpoKIiDgXtyx+8m6XXhlOkJlv93dCdmA+erA3Mo5TDwlrMvjkTSurd
X-Gm-Gg: AYBFou23pkRBexIySCulDB/ZLlfwkCxUY12E/b6t3sOz4tV9R+TAVPdNXMNkB08S437
	Tk4akQEQLqHfPUztS0IqL7EChn79xemLpRMLcIayaAdbNUTBQXQPonSLq6FhTMJYbgequXEqZU0
	T431fPcUXZuonqDyo/TuPl3ClM852xcgDTF4qXcj6M68OF29Q+MAHjgAFYvxBLcdmcgaCFhFZTg
	KZTMf45R1peqpwszyCW2ElplvsDbyufBxNISsgaii5THA1eEGZotE8n+UCjjRMMRZX5MjErAJqV
	NHhmHoZMHLQe9Un2nE+WmOZg/Nwd2cVyQW9P2pGHq8y9zCfXoBml2pI20AzVNBRLBb6uBHjEadY
	DGyo6wOk6nzTPD03QOaONuGxtzrumGBRrP7BmAB1AbJKGuxOStyqfmA0tg/B5YrCI/MrFwMWRaq
	MDVJzHl3vE1roSWKU2Fk8zv28+JuIs+DQjAMJ5dChmK8MTzUwO0RJAW5F1mViyNpHOBS+v8dB/m
	lwB+MCWZJ7gR8GbTJo/3Vn03/OPBYZxLbpFbuMl/DY/Xv4fbvUBsk7aMLUHr6dWUiH5tmSS8qm3
	JTAqspc=
X-Received: by 2002:a05:600c:4295:b0:4a2:1a:a115 with SMTP id 5b1f17b1804b1-4a35aae5dc1mr22513845e9.0.1792856051946;
        Sat, 24 Oct 2026 08:34:11 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d238sm55786885e9.14.2026.10.24.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:34:11 -0700 (PDT)
Date: Sat, 24 Oct 2026 18:34:07 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hui Su <sh_def@163.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Subject: Re: [PATCH v33 6/7] sched/proxy: Detect cycles in proxy walks earlier
Message-ID: <aty_3dSObMLU4AET@scheduler.schedules>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-7-jstultz@google.com>
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
In-Reply-To: <20261023220431.1106611-7-jstultz@google.com>

On Fri, Oct 23, 2026 at 10:04:17PM +0000, John Stultz wrote:
> From: Hui Su <sh_def@163.com>
> 
> Proxy execution follows blocked_on relationships to find a runnable lock
> owner. A cycle in that chain can make find_proxy_task() loop indefinitely
> while holding rq->lock.
> 
> Use Brent checkpoint state directly in the real owner walk. Cycle detection
> reuses the owner resolution already performed by that walk and requires no
> separate preflight traversal. The checkpoint, power, and span state are all
> invocation-local.
> 
> Keep the existing owner == p wakeup-race handling ahead of cycle detection.
> Unlike a sequence-marker approach, this adds no task_struct or runqueue
> state and requires no activation-time reset.
> 
> The online walk can temporarily install a blocked_donor cycle before the
> delayed Brent detection point. In the tested recovery path, the selected
> task's blocked_donor was cleared before it resumed. A forced-stale control
> also confirmed that mutex handoff revalidates the donor's blocked_on
> relationship before consuming a backlink. Validation of this trade-off and
> comparative measurements against the sequence-marker approach are included
> in the cover letter.

Wouldn't it be better to add the results here or remove this sentence
completely? "Validation of this trade-off and comparative measurements against 
the sequence-marker approach are included in the cover letter."

> 
> Signed-off-by: Hui Su <sh_def@163.com>
> [jstultz: Minor tweaks to work with hard MAX_PROXY_CHAIN_DEPTH limit]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
> ---
>  kernel/sched/core.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 12a42252bf474..0cb41a884ea70 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7017,6 +7017,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  	__must_hold(__rq_lockp(rq))
>  {
>  	struct task_struct *owner = NULL;
> +	struct task_struct *cycle_checkpoint = donor;
> +	unsigned int cycle_power = 1;
> +	unsigned int cycle_span = 0;
>  	bool curr_in_chain = false;
>  	int this_cpu = cpu_of(rq);
>  	struct task_struct *p;
> @@ -7025,8 +7028,16 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  
>  	/* Follow blocked_on chain. */
>  	for (p = donor; p->is_blocked; p = owner) {
> -		/* if its PROXY_WAKING, do return migration or run if current */
>  		struct mutex *mutex = p->blocked_on;
> +
> +		/* Keep Brent's checkpoint state local to this owner walk. */

I think we don't need the comment above, no? Or atleast maybe changing it would
be better to tell what the algorithm does.

> +		if (cycle_span == cycle_power) {
> +			cycle_checkpoint = p;
> +			cycle_power <<= 1;
> +			cycle_span = 0;
> +		}
> +
> +		/* if its PROXY_WAKING, do return migration or run if current */
>  		if (!mutex) {
>  			clear_task_blocked_on(p, mutex);
>  			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
> @@ -7143,8 +7154,13 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			goto resched_idle;
>  		}
>  
> -		/* Limit the depth we'll proxy to avoid cyclic deadlocks */
> -		if (++chain_depth > MAX_PROXY_CHAIN_DEPTH) {
> +		/*
> +		 * Check for cycles, and worst case limit the depth
> +		 * we'll proxy to avoid cyclic deadlocks
> +		 */
> +		cycle_span++;
> +		if ((owner == cycle_checkpoint) ||
> +		    (++chain_depth > MAX_PROXY_CHAIN_DEPTH)) {
>  			__clear_task_blocked_on(p, NULL);
>  			goto deactivate;
>  		}
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 

So on a loop like this (Circle but a square):

TA->X
|   |
Y<-TB

Where TA holds X, wants Y and TB wants X, holds Y. And the donor is TA.

At the first run, we get the mutex of TA and then find it's owner (that
is TB), and we increase cycle_span by one. The next run is with TB, now
power is 2, and span is 0. Owner is TA, so again owner ==
cycle_checkpoint is false. span is 1 now. The next run, owner is TB,
and now we leave.

AFAICT this works correct.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
