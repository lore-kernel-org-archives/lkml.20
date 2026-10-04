Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFF330D25
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141504; cv=none; b=uESjQVYBQh5yOXk6u2se7i0Prwc10MfJuun6bGOEVyqAeA6RsnTRrfawuZ8jM0GBI3k0p+22jUwwX5cCSIoHx/KUGo6oAzFrOlQFKeQcyIzBbVjRnfnMCcXFGCSt3q2nqPHkGUxFUX3a/e7qsMJlAIf8VyqMpUkrq55DWWVZwcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141504; c=relaxed/simple;
	bh=cxqvPvmP5LEKCuOrQcNT+FDABIRF0pkCGT0tYhdiTXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZiK9Gx8HpV028qwkvo4mSeNqvSaadX0P6SekI1WaVLOnbdPu/sB1NS4EVTGKPsDqFHfh5HbzOof4IoC+Fsn7YUyMbXecIVEANLhkRRU38aRglak9fXOwXWb8roXshHQ/DlUbj/l4Wm9sT0671j+2hhqIA/KdM8ekjhR+OegKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3pUI4+v; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3pUI4+v"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b02f47696so141693f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141501; x=1791746301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPTMVIIAJFn9U/eu7HQEBuEphGxHwxWPSlT9dvO4lqU=;
        b=m3pUI4+vtvXlwQQ0prQwLq01IAmQ8fmp2mggHNRBhGAiIsGmoRgOZcbKFvToxZPUyI
         sHbu2g+6yzTceF8Wp1eHAa/+4klY8uk/5W9VATtIHFrkmfRCpXEEjvebsrhZZd1QTyT1
         TBh1JG2CuC9fE01Ic+80bu7WETTe4d5fneZpQmd5WVYgDtUqU7tRQ+Pd4etAtxYeRSqF
         ZDiwV50tRYY+9yhfJmsvbZL3VVeeZsJI4QELIpofmo1nFx8zBQtGmMBdDS5bPiUO+BUO
         EixWplPNN/v/arDaBg2hVw2p6eFsqfzvDSVEdb7Kmxs3HBdNhnnPJhvYdgwh1npO45YT
         w6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141501; x=1791746301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPTMVIIAJFn9U/eu7HQEBuEphGxHwxWPSlT9dvO4lqU=;
        b=AU4M7m7r4rGvjlGOglkwO4aBOSTCTLQQEsI5EGF83zO2J8RhXXGmFuHg9848SfKMVv
         iYqL9TZcxrX2ZCd0XZRuu69YxLSHT00x+T+gH9/eziOVuM5JJ2R1mKmkqaiWC4ngOiZz
         rKF/gBfPeoU5B2eVdMdW2ebXzRRvZVxpN0aJ846pgvpbGiVm3gpybsKspjAPaMhoCDY8
         YZmbFU0RJFUatqVuOoAH/qv1pf3rXRPOUDs1waGNl5itAGzkggQ8kxdtDAY2zDJQpiGi
         6wyebnp0NVkyx0X/xjx3eNFqR5CJ4+u4QwYPh5bBB31Yyt/oUVgISAclQfJrNwGDY/HI
         kH0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyhMQ5QnRpogEsVZyfpf3lBgUDZGDdgL4rRKkj4XQPCXdCGgpW1tT6xxfxPXg0QtEECSgXUJTDT0nWfPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nLin+LWOE5Pnws/3NicdWVZBqc2CrlUeo9zVb1VemGmHcmdxdf
	XH2XGhphnHltooYTtAtUD1a2+RNI9VlJBYOZp1hARgQKoHGkWxfVtO0s
X-Gm-Gg: AYBFou0oczLKWSTBjEItuvBcP2fgrP3teHT2AHj9upmcsv9bKpxIPKn7DUXfoTVy8Uq
	dmsEVSJtRJfmymN30IoVIVahM2c3w59LCCn4HFNMe0xIC7mwYpHL9YPzMSQrHHqkKQ3ixEqfgi+
	9WHHmndOoCyMo4x/WqaMRmQ6WB2QeCXqdSINLoySeOzLyxvO5WG6dDXHdgsB7aqbh5kMdApgT19
	TXhq392ofM4Ny9TZwiOksTEDQz5T2T5t1UmFWwy136N9vZVsJvyESlP7+ymPJ/F9h9LQ8uM6Dzw
	Vqjt4burFsDDn8WltMJs/lNWruKpRqTz4Qh+ifxKbqPm1HF2y5j2M5ILyIkXmFiL/V+bAyRPrku
	X2LZDCnyvw/JfPM3gyPATDPVud1UB0n5to2K75AdOMLqtniaJDvllzx1AgTrGP5kVbjeg1Z9CHx
	KjzUMUta5qdqxO6BVlwRaNx/AnxC7JkBtTvyEokpr5G1eMbiGJL4Jsz/ozibNw8gf39HDjtRU9B
	z3aRvCBhQNdkcb++duw
X-Received: by 2002:a05:600c:46d5:b0:4a0:1ca8:70e2 with SMTP id 5b1f17b1804b1-4a02751fa7fmr143583805e9.1.1791141501458;
        Sun, 04 Oct 2026 12:18:21 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm279357515e9.3.2026.10.04.12.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:18:21 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 05/18 v2] sched/eevdf: Add min slice check when selecting CPU
Date: Sun,  4 Oct 2026 22:18:17 +0300
Message-ID: <20261004191817.20225-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-6-vincent.guittot@linaro.org>
References: <20261002154415.2270586-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new level for selecting CPU when select_task_rq_fair() fails to find
an idle CPU. This last level will compare the slice to select a CPU where
the task could run 1st.
This helps a waking task to select a CPU where a longer slice runs
instead of one where a task with the same or shorter slice already run.

There's a typo. 'run'

> @@ -8771,10 +8771,11 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>   * comparing the average scan cost (tracked in sd->avg_scan_cost) against the
>   * average idle time for this rq (as found in rq->avg_idle).
>   */
> -static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int target)
> +static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int *best)
>  {
>  	struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> -	int i, cpu, idle_cpu = -1, nr = INT_MAX;
> +	int i, cpu, idle_cpu = -1, slice_cpu = -1, target = *best, nr = INT_MAX;
> +	unsigned long task_slice;
>  
>  	if (sched_feat(SIS_UTIL) && sd->shared) {
>  		/*
> @@ -8795,6 +8796,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>  	if (!cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr))
>  		return -1;
>  
> +	task_slice = p->se.slice;
> +
>  	if (static_branch_unlikely(&sched_cluster_active)) {
>  		struct sched_group *sg = sd->groups;
>  
> @@ -8814,6 +8817,10 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>  					if ((unsigned int)idle_cpu < nr_cpumask_bits)
>  						return idle_cpu;
>  				}
> +
> +				if (slice_cpu == -1 &&
> +				    task_slice < get_rq_min_slice(cpu_rq(cpu)))
> +					slice_cpu = cpu;
>  			}
>  			cpumask_andnot(cpus, cpus, sched_group_span(sg));
>  		}
> @@ -8832,11 +8839,18 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>  			if ((unsigned int)idle_cpu < nr_cpumask_bits)
>  				break;
>  		}
> +
> +		if (slice_cpu == -1 &&
> +		    task_slice < get_rq_min_slice(cpu_rq(cpu)))
> +			slice_cpu = cpu;
>  	}
>  
>  	if (has_idle_core)
>  		set_idle_cores(target, false);
>  
> +	if (slice_cpu != -1)
> +		*best = slice_cpu;
> +
>  	return idle_cpu;
>  }


Also,

Scene:

Let's say that in our domain there are 8 CPU's and has_idle_core is false. And nr equals 4.
And sched_cluster_active is true. select_idle_cpu() enters the for_each_cpu_wrap block
and the else branch. Because nr decrases each time, and if there are not any idle_cpu's
even if we found any slice_cpu it's not set to best. We just leave the loop after checking 3 CPU's.

The same thing a bit differently happens below on the main loop too.

But I don't think is more important than typos. Typos is the reason we're here. They are the or nevermind.
This is a joke btw. (that, destroyed my masterpiece and created a new one. Saying a joke is a joke because it is,
is one thing while saying a joke is a joke as a joke is one thing. I wanna go on with this but it'll be to long. :<)

I could be getting something wrong tho. (No one is perfect, but I'm not perfect at all so ya know.)

Thanks,
Kayra
