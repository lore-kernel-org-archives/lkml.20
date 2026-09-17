Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6B515965
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664125; cv=none; b=rqH8Rrci9Edxq1Q13TSEPYgppz/rgq9R4kft0MlQ1uygdK4dRiG8olUxa2OlP8m6rhsVoW2rgDLxwNDaexYXfrOikpL3pY4hxDYzMi2k8og+pUVJm/ENAphEYtrD1+4gKrpGmPFpq+ZEC3ckL3w+OxHJKQ4D0j6L1vGH5CDqhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664125; c=relaxed/simple;
	bh=uFM67cPKfLWYr1cknpbN9X9bmeZeaeA+iW34fETQrrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZd8geJjSUlG1vF0MTxtzZXS52zbQI5JkLeac3orTNAbm2bq0O0GyaTR4CyfMz3mZA1kc9A+OlLgmWccPjZsOlyJwvsvMq42RUxVjmOm80HXombOy9IZjRvUgPOI//Li/ynGZ7XnAgeCuBj90bwU3fcMeTlPxMJtSK1k9HadLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW18vsR0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW18vsR0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbfe95bccso414935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664119; x=1790268919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZbqUQvpZjEYHw5MtCigN0b4pNyWyct+Z4yS5FcKJMw=;
        b=MW18vsR0iglh15TqKDzSqW15Bd2M4tdv8AtJYDouPS5lI2ibF04w2biaJeB2EsKjDn
         lAJLPw/AfjMmC0nkx2wGTl488idH4UjJrdG5IQd6Ilx3vF37VRpKcQJ3ZXlmoXHv9MNb
         ESEVIqhpYxeo/j6oTgfjESz/DhxOA1T/E9D3mfY0XjSNFIIZ6TbUfJwW1GNu7Sk4Hgj5
         DUgjGSlgOdlbHb9lQnVpmUCG4vESkCab/QnNTlEGFFpXy4UhfGd3bV6r4/hh+mVLImd0
         LwrxsiKTJDLjV9Z1QytkcjjM55DNLxZjVOjGMYryoi9iqT7DCBbLDY+69XujnkKexFNy
         1Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664119; x=1790268919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZbqUQvpZjEYHw5MtCigN0b4pNyWyct+Z4yS5FcKJMw=;
        b=tEBOEimpQyW2cPx1AjAlyv4GUxjv93VqBagaMAIqK4hHkEKFUY0BLKy+A/MzHq+CAE
         v7I9WVTM7DJ7QH8tQ5ZY4qzmSy/R0MN/sJg+mMyZkNKLyCwlOdXib/56denYRA/DeZNI
         rKafAYWRTilkiBuVrSC6NnH67pYKzlW52aIVvYvAbNcrw/CDcKO27Gp3oKsQAuuyLiKF
         N/NcehrGBVf/xGeqEmG7KPDoA6YwfCnpXM+UFewEVrurcj9VJ1UmU6Sd17BGE4aS7mcX
         V3puTQHeBZcxZV/6vzXg4aCJE35rVocLej0bYRf4nOp/sASsRGelRKmjLshQYmXQNLUn
         uNDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0sUbGoZjEzi3orQIFuSPBG/4pUBL9DkKi3vhyoYW/bWP11DZWreMtu4DHoJ/gASWejMG+rY+Nc5+vlio=@vger.kernel.org
X-Gm-Message-State: AFuF++kzhv1UZYIJfdIapB9DDtgsDrSZXKCoBoMeopfKAvbRiYJNkD8I
	VosjZipqAqnT1J/pI5yFapRk2liUzJma7f0CbL99hX+ZPwSDDSZ1vgaX
X-Gm-Gg: AYBFou0eexyXx1mp3KdPI2FvhpZVgQLQLi3K6vaBeLFFpbHFw4/QwfxDUJPeVVoROtp
	H2q4mC80ELnR0LU8bK2YC3vUo5bojSp8NUfjjGYX4IN4gn4OrIkDVrroG45ajaOABVTxI6VwhbY
	W8C0bI/LgX50VXTwSE2a5/flo30k5Myxr0t2keZVcfdTNUocyHgyhZtTmRbK5nv2OG+xF6KaOkr
	rkOXl+Nalz8Gwx0TJzxvXzMuhZuCwutFkizTORjemM6nUv/yFIiNGz0UUMO/nbxJhXig8Hz2/RH
	OggA/Wvx530DjULf5Y9iTtKeZ/7f7GqSmMqMqr4eqrARL/kKwN2PEM5ZvGATyl9dvzhqMNQeWqr
	J1o6MSAhPBT0X76XKafwubqDTzkQ60LqvvuVNzXEgvf6XlamgKFgp5nN33CTqdtAvUfLsFNI9by
	7+xsQV/ydWH7OVus3p3AJlhozzIx7B/4u8zdnLosYI/+XHpcXsnOb3jhluhoRm4TWk+uaKByysc
	VkRwbRhVZvK8pcveFcHxg==
X-Received: by 2002:a05:600c:4e89:b0:49e:745d:5768 with SMTP id 5b1f17b1804b1-49eac4112e9mr83259075e9.0.1789664119289;
        Thu, 17 Sep 2026 09:55:19 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm112722895e9.6.2026.09.17.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:55:18 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: arighi@nvidia.com
Cc: bsegall@google.com,
	christian.loehle@arm.com,
	corbet@lwn.net,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ltrager@nvidia.com,
	mgorman@suse.de,
	mingo@redhat.com,
	pauld@redhat.com,
	peterz@infradead.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	vsethi@nvidia.com,
	will@kernel.org
Subject: Re: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Thu, 17 Sep 2026 19:55:15 +0300
Message-ID: <20260917165515.17479-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917140707.3807229-2-arighi@nvidia.com>
References: <20260917140707.3807229-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Andrea,

Hope I ain't got anything wrong, I'm a bit sick.

> POWER7 uses SD_ASYM_PACKING at the shared-capacity SMT level to order
> hardware threads, and NVIDIA Olympus benefits from the same policy. Idle
> CPU selection does not consult that order, so a task can wake on an
> arbitrary sibling and remain there until load balancing corrects the
> placement. On these systems, that initial choice can prevent the core
> from entering its preferred lower-thread resource mode and cause a large
> and persistent performance loss.

> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.

> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, target, previous, recently-used CPU fast
> paths and the slow path. Inspect the lowest scheduling domain directly,
> but require both CPUs to share its span because isolcpus can split
> hardware siblings across scheduling domains.

> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.


> +/*
> + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> + * subject to task affinity.
> + */
> +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> +{
> +	struct sched_domain *sd;
> +	int best = cpu;
> +	int sibling;
> +
> +	if (!sched_smt_active())
> +		return cpu;
> +
> +	sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +	if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +	    !(sd->flags & SD_ASYM_PACKING))
> +		return cpu;
> +
> +	for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> +		if (sibling == best || !choose_idle_cpu(sibling, p))
> +			continue;
> +
> +		if (sched_asym_prefer(sibling, best))
> +			best = sibling;
> +	}
> +
> +	return best;
> +}

> @@ -9061,14 +9099,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  
>  		if (!has_idle_core && cpus_share_cache(prev, target)) {
>  			i = select_idle_smt(p, sd, prev);
> -			if ((unsigned int)i < nr_cpumask_bits)
> -				return i;
> +			if ((unsigned int)i < nr_cpumask_bits) {
> +				target = i;
> +				goto select_smt_priority;
> +			}
>  		}
>  	}

The sched_smt_active() check on select_idle_smt_cpu seems to be redundant on here.

We could remove this
By moving the check on select_idle_smt_cpu() to goto block and
adding one check before the select_idle_smt_cpu() on select_task_rq_fair(). And just calling
select_idle_smt_cpu() on here.

I also have a question, do we need select_idle_smt() call on here? If yes then why? I was really confused while reading.

Thanks,
Kayra :_:


