Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794041839;
	b=zR4BkniQqdGsgUAVLuRRa+v5r/fgd5CQKuldxUHBuUvycMVkeJJFSBR3wE6j7ph7y7lE
	 ISJ+d0L/wBQhB9N8CYj/8zCfb7vZj5qpWi4G4X1E3vX6wKO7XeM6OVtzYph1GTjdw2Nk7
	 dhowJPrjYBD0zNqCOA7NNr0476Rwzelufr+CyqiDeCPlCLS5WbkeVH/t5//JTHRISHSRw
	 p3LS8UNMqC+XQYI85qvwZFOgomKI+EFz8rUEeUH7e4ksG/DyaiHnDXxCKvwqm3TXn7bQ8
	 y2h9gfPg5VSln31v9JpBYA2C9h7aKSe5JORApw7mDPRmcdVa9jg7eXiG0ofbl/MtT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794041839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=o/S19kSM9lYLAGwga0DXgPXg/sfdJ1jaylcSZ4R6Qfs=;
	b=skFp/It988Mq8SRYSsWH7ShhP9TUpMl97dvtF5xGnGbveC5tscc2YnmqoGzEf5RTFJfn
	 HtO+NBJtRROA1Wv65UiSttx6a2Q5KGrrhqkze3EsYxHLapz6OafoZyvEIp7YSoGdrczIx
	 UXNfx8Q4VkIuv8e8LlGoV70M9QPMHhKJK0mvPvZA/pXSUgqRCUc6Devhr3e7sJvv8C8ae
	 WYF6Ynlx/M6PLG928+Rg2wW+IMaJu2fGTgLM2cEnF1enePxtqlrwBH2lLJYQSm1EpQUdl
	 KKtDGBq25ZpYCbsrSfg/AS9jrdTsCGpJOJWVjsm0hBovLXGikyfhp13ADfi6vv8uiZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLuvHpI3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE34606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLuvHpI3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4af520023fdso3447285e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794041837; x=1794646637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o/S19kSM9lYLAGwga0DXgPXg/sfdJ1jaylcSZ4R6Qfs=;
        b=gLuvHpI3QeuqX8VNFvkKvk4IcSBzjZUXZoeyw2xWPagKIGXAZu0KnpfluhyjvKZKG9
         XY98Xl/pynZD9DbfYI4FvEnzBVwjszStlXb7wHZo9YVgyGr9iPWKUFzuCtjidgMWjlPg
         OfTS8uktDVyikS2BPb/KPieBiuhObpMxTzGwtOsOIQ0vszbLxdbyvMxq4Djo6yM6YL5u
         fKATF3pvYP7r6dXYZUyF3TOntuAOAXwNDsfKSJJJhtp7yrTZzNTHfiC3gWbYqq7Q1RAX
         1/7/cg3ODZpF6eC4YESITncxvJ2BDm1EgRDP5QAZMxUNu6aN6wAXqmWdyTTW3wPeDdLF
         2zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794041837; x=1794646637;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/S19kSM9lYLAGwga0DXgPXg/sfdJ1jaylcSZ4R6Qfs=;
        b=yF2XDPpRKni+VUaO+eM+1MR3OfaK6ZiOc+TynFswVoQssjbJyMVw5MnPcm5FVCdh65
         Tw/+pDluH+xW6zIjaSSgelY5++nVT3Vs5pvp9onD7vw5uEjbImktozxohe0DJwO4iARo
         Auk2HMOvh4iPvyf/vdS6CbTf70ZoUhH08cLXBWEuloRpJ/xHp/E0/F20I8dWViCJUrE+
         cHA48RkXkLISU//LIhv5nEA8GHgsci9fbtbMSrcJVcwxAyyBxSnJwqNaoV/OYYgLZvgU
         5nlOafQ5Bniy9oAcqJHK9P+jGEo1dkvCwSSCVXNqfT/x1dsfMuCjcdJVu6p3md9QCzeR
         H1Mw==
X-Forwarded-Encrypted: i=1; AL+hErF6xCy7gKi2IjsrxAjdd5yucbBzuk8HIfoPHSx1nBX1HPrT/3WhVn6D0eT9pZnsHAnK++pRXPuQlKUWauw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iTvxsr+KZ4EIOwaj8yR9Kf1D6d7C7EXn7tibVd4RHnA2X/5E8
	+M2ocUCgiBc1ck2lDJ+1tyKrxc3gCdculm+kW7D70tCFEYNHKv4l7wpR
X-Gm-Gg: AYBFou31Hm6ObmoOiI9TZCHDvnjGlVUgPWXNqg9H4Qg4MuG48nZXREV4zPY6U0t7YjS
	vEw6LkAGEhzQqJmMwH5Ovpg+xJj6vLLCxkYaiUz6oVFxplFkLMedY5Duq5PhpENfT+XMFtm01TL
	+bgbbfdTA3Tq6okmrSHp4gGDR3EK2DnoJS8O2Ka6O/SFkHU9+aBPdIo0DZQ3PMD99lgBgSryvMm
	ABa6nNoTUhqtYan/SBkwIUVV5vJRozRhhSdnJDzRUBsQgESss6jcghZvyGRhasmbSzvyypmfbxE
	GfmukqMMoT65ikks7NXkZk3CqqHMhFFU61GvHwdnZBINzI3TwLfY4z4V81XMydoNlTPh3+CKzps
	Zb1MAakB8UaFFTJ2vl4PeXQeZYsZMKJXdSUfK5E2nPpBTBkpJAzWzyw/fgaTnDP1V0Uzd4E8qSP
	FJzRiYdQQmWb4aSy5K/MnFooWKdrOlMWyFLTFOgTcjw3Fey5t/5ubmE0dYd1x2aB8/vpvrtk4ai
	zYHK+l0VLWcsgg3eCl9g/LunLtUaMeDYBsO2EkQjuXnb8zerL5wUPMhGXgCW/YvIYmhdz1IJwVw
	fEXWfEhvCQXUUl5YkJr17vzLyQDvwxY7PTqWaeWMrC4YSAfcucOsE/0=
X-Received: by 2002:a5d:5a45:0:b0:493:9233:ce65 with SMTP id ffacd0b85a97d-4939233ce93mr4171013f8f.0.1794041836979;
        Sat, 07 Nov 2026 00:57:16 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d6085asm11840800f8f.3.2026.11.07.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:57:16 -0800 (PST)
Date: Sat, 7 Nov 2026 11:57:12 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting
 CPU
Message-ID: <au7SabL5pfbsApyB@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-7-vincent.guittot@linaro.org>
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
In-Reply-To: <20261106151947.3991524-7-vincent.guittot@linaro.org>


Hi Vincent,


Sashiko reviewed this one so I'll just put here my own concerns instead
of repeating.


On Fri, Nov 06, 2026 at 04:19:33PM +0100, Vincent Guittot wrote:

> Add a new level for selecting CPU when select_task_rq_fair() fails to find
> an idle CPU. This last level compares the min slice to select a CPU where
> the task could run 1st.
> This helps a waking task to select a CPU where a longer slice runs
> instead of one where a task with the same or shorter slice already runs.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/core.c |   2 +-
>  kernel/sched/fair.c | 157 ++++++++++++++++++++++++++++----------------
>  2 files changed, 102 insertions(+), 57 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 031efe7d49fb..d71da9069218 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -9012,7 +9012,7 @@ void __init sched_init(void)
>  		rq->sd = NULL;
>  		rq->rd = NULL;
>  		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> -		rq->min_slice = ULONG_MAX;
> +		rq->min_slice = 0;
>  		rq->balance_callback = &balance_push_callback;
>  		rq->active_balance = 0;
>  		rq->next_balance = jiffies;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc99b94d9ce..039dce244aaa 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8842,11 +8842,25 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
>  	return new_cpu;
>  }
>  
> -static inline int __select_idle_cpu(int cpu, struct task_struct *p)
> +static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
>  {
> -	if (choose_idle_cpu(cpu, p) && sched_cpu_cookie_match(cpu_rq(cpu), p))
> +	if (p->se.slice < get_rq_min_slice(rq))
> +		return true;
> +
> +	return false;
> +}
> +
> +static inline int __select_idle_cpu(int cpu, struct task_struct *p, int *slice_cpu)
> +{
> +	if (!sched_cpu_cookie_match(cpu_rq(cpu), p))
> +		return -1;
> +
> +	if (choose_idle_cpu(cpu, p))
>  		return cpu;
>  
> +	if (*slice_cpu == -1 && choose_sched_slice_rq(cpu_rq(cpu), p))
> +		*slice_cpu = cpu;
> +
>  	return -1;
>  }


Look here:

CPU1: CPU2:
FA    RA
      FC

CPU2 has 1 RT and 1 Fair tasks named RA and FC.
Let's say RA is running on CPU2 and FC's slice is 10 ms.

And let's say FA has 8 ms slice, and a fair task named TC is waking up
with 9 ms slice:

* We look to CPU1, 9 < 8 is false so we return false

* We look to CPU2, 9 < 10 is true so we return it.

But the problem is, CPU2 has a RT task running and we are going to
compete with the RT task. In that case it can be worse than CPU1.

So, I would suggest something like this or so:


(My editor got crazy, so I had to copy this diff :<)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 262626455497..8b0dd858f332 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8876,10 +8876,8 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
 
 static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
 {
-	if (p->se.slice < get_rq_min_slice(rq))
-		return true;
-
-	return false;
+	return p->se.slice < get_rq_min_slice(rq) &&
+		READ_ONCE(rq->curr)->sched_class == &fair_sched_class;
 }
 
 static inline int __select_idle_cpu(int cpu, struct task_struct *p, int *slice_cpu)
@@ -9193,7 +9191,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	bool has_idle_core = sched_smt_active() && test_idle_cores(target);
 	unsigned long task_util, util_min, util_max, best_cap = 0;
 	int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
-	unsigned long task_slice;
 	int cpu, best_cpu = -1;
 	struct cpumask *cpus;
 	int nr = INT_MAX;
@@ -9204,7 +9201,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	task_util = task_util_est(p);
 	util_min = uclamp_eff_value(p, UCLAMP_MIN);
 	util_max = uclamp_eff_value(p, UCLAMP_MAX);
-	task_slice = p->se.slice;
 
 	if (sched_feat(SIS_UTIL) && sd->shared) {
 		/*
@@ -9260,7 +9256,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 			else if (fits > 0)
 				fits = ASYM_IDLE_THREAD_FITS;
 
-		} else if (fits > 0 && task_slice < get_rq_min_slice(cpu_rq(cpu))) {
+		} else if (fits > 0 && choose_sched_slice_rq(cpu_rq(cpu), p)) {
 			fits = ASYM_BUSY_THREAD_FITS;
 			cpu_cap = get_actual_cpu_capacity(cpu);
 		} else {



Cheers,

Kayra :-)
