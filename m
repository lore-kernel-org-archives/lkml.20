Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB93451BA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334755; cv=none; b=Hb82qSictXTju52YHx1Mcp88oeFEDft1EsL/qvr/wVBbBOjVuuc+l0E2Utwx1KEEoZQc4kE8x5CWdVkn7izC78mq2I2GlNPJeh0ebLy7XHSJFXHuy5TTFA0uGoQndLwLFkJv9TXiDONXBeFoYFcy97Tk63prwQu0O37pUS8877E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334755; c=relaxed/simple;
	bh=v8DScQa1iwxgqKw5XjPDjOk1xceI0OuFRljZc+m4qx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/jvNWAu1swZg/KUNlz15XYLy2qj83i9BlM0iKXvGWi0Fy9hAW0NO4IytuUfrxm01bjMURhBdy2Ml0rkv6yKoYKBAD+AskySRRZ++eXSLtjkyD0ZhRwtMfUI3t4FtlHMffQrqNXSlNlAGFIJU/e/Xwj2YzNUg0u0oexWG9Tujys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bryBJDYA; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bryBJDYA"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ea97b74acaso146625e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792334753; x=1792939553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFOddHII9QlG0Yo7oJ9Fyf6IJ70eJag/SjOu44LBvf8=;
        b=bryBJDYAON9+upSxJC+6akyJnXPLqzamw7CVk1ivR4q+Ws9Qi7Mv1+sd17RS11/FGL
         627lXCve16TaHFOav+63LUOOEtWTrNYHUiBscup44Drw4mYH7te1A4Vn9AV9moza92iF
         r8dq1NQjZg492EezgSKPDbOEBEdJ7jBUZgBB86D3sw5AF0EozboETb4Q8pV5OuHlIRpV
         MQKtcP2f2z3EEhoqv5H9EgUgHFAXc2vgVW46NkieGI9pte1q9eT3dXUYhc+PtbB2clsx
         MLSTqEAPNso9tjqIgl0LG/LBRZxhMZbS1ft5o4iXX7frgNG/xqa/0hUjMdiFextpfr4X
         3DwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334753; x=1792939553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vFOddHII9QlG0Yo7oJ9Fyf6IJ70eJag/SjOu44LBvf8=;
        b=wQXpTY8877xQCaxTeheQICeJa2TlzJfTa3S8cR+MYM8N1uafzvGIZt7Ms2L16UT0eS
         ICOiTioCScPgOfrFpE02JQxWumfiPoj8GjUIYqI93uXWhjEOFV6+DUEMYxlmUAoKkd8z
         RZAxBFP9vzsqUTcovenZ9tPK+UIsCr+RXoE7ABlDrsYF2gGzDfe8FcanfcbhfCKOdbuM
         v2t+opVRHpjogvrVkOS14+cpyFiKsQIEFIPJWnE2sCOGBMeFdehdsH6ucVohxa87+m3n
         sEtQBTiNB2keTX+xGbe1gNAEZWIqUlBuUDIRzwnbRjX3jGQP4vwQSRfyIEbNQ9xQ97fE
         /M2w==
X-Forwarded-Encrypted: i=1; AKwUvBzCGIbKW8A/d6ZrLmOnC6Gt9D5w3kU+wpSDMi1ultW3Tn5cmaHYxm2L64taGULTfawWvNczbz93JysJKPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK3tW8398g20bwenfOV/8j4d912IwHv6MzCT1TjHaL4q2kvK4+
	bkW5Dr1D8EIAUKkPiCi9LZz1Jk0dYqXp6m1ENr8RZFx6JP3NV050Aay6UPlXEbSLU6Q=
X-Gm-Gg: AYBFou3lh8BRa9m/KS14tMx5yD/Gch52V9QtdSgZAhVUJpi7zidqeZHQXHPVt2J7Af2
	8AMlNE188B3N5ueQ2zShcgQctaXyOyoCCsJ5JnBKne9TywwhqsMcdb3HYvQqMTXdb1KtJ3uiHsQ
	xTlQzP3+6xW19zqjoFw1o9R/XjCX0ZHPUSHVwUJj1Xe8fC0O3szou2xSNVdsHWt6GrvzVWObyYQ
	glqwYAxCsPe6Po4Y5TqMK1qig43sdFLOtRZGxKkqEgd3MJJRuSge6z72M3vcppYg4hXoAnq+Msh
	AjyQNLRvYxTFmXdtPbGZxREW5c9mCHzqUN5/CPTkrueLg1kTwBgws7CI5XwNQdPvGtjzDu5i5cf
	NmKoOl76DEMRVORGvSSLFp4mcB5A9T1nlvPtVymaVxGHlz29gSdMGBpQplPCQFemY8y7ZxZL0Xg
	1kPjzWp26V4MI0o82MT+Wckq2EXizV+3FxIFobul6g0tspQlaWg1l7GuS2GJg/o5ZURXQynPM7w
	b0xBrjw9/awg2V7hSXgATUvZjgO8VCNRR8pTjdae/Ck2Ynw75w3BheroUyQMxO0J/PkTL1ydpw=
X-Received: by 2002:a05:6122:548:b0:5ea:c6c1:8dd4 with SMTP id 71dfb90a1353d-5eac6c19257mr145098e0c.5.1792334752976;
        Sun, 18 Oct 2026 07:45:52 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaca7cc59asm244808e0c.5.2026.10.18.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:45:52 -0700 (PDT)
Date: Sun, 18 Oct 2026 10:45:51 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kees@kernel.org,
	rppt@kernel.org, juri.lelli@redhat.com, nik.borisov@suse.com,
	tglx@kernel.org, vschneid@redhat.com, kprateek.nayak@amd.com,
	vincent.guittot@linaro.org, bp@alien8.de, thorsten.blum@linux.dev,
	cgroups@vger.kernel.org, tony.luck@intel.com, david@kernel.org,
	mingo@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	seanjc@google.com, ljs@kernel.org, zhangguopeng@kylinos.cn,
	dietmar.eggemann@arm.com, mhocko@suse.com, vinicius.gomes@intel.com,
	tj@kernel.org, vbabka@kernel.org, linux-kernel@vger.kernel.org,
	peterz@infradead.org, surenb@google.com, hpa@zytor.com,
	x86@kernel.org, dmatlack@google.com, kexec@lists.infradead.org,
	pratyush@kernel.org, dave.hansen@linux.intel.com,
	rostedt@goodmis.org, gmonaco@redhat.com, jgross@suse.com,
	mgorman@suse.de, graf@amazon.com, linux-edac@vger.kernel.org,
	liam@infradead.org, ridong.chen@linux.dev, longman@redhat.com,
	bsegall@google.com
Subject: Re: [PATCH v1 7/8] sched/topology: Avoid redundant percpu
 allocations and bitmap walks in build_sched_domains()
Message-ID: <atTbn7WhHtK52vCi@google.com>
References: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
 <20261015153331.1872641-8-pasha.tatashin@soleen.com>
 <1ec1aab8eabdad173ddef7483a940bfa3f6c3238.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ec1aab8eabdad173ddef7483a940bfa3f6c3238.camel@linux.intel.com>

On 10-15 16:17, Tim Chen wrote:
> On Thu, 2026-10-15 at 11:33 -0400, Pasha Tatashin wrote:
> > During CPU hotplug, build_sched_domains() is invoked on every CPU
> > activation and deactivation. Profiling build_sched_domains() on a
> > 480-CPU Intel Xeon 6985P-C and a 512-CPU AMD EPYC 9B45 shows several
> > sources of avoidable O(N^2) and O(N) work per step:
> > 
> > 1. build_sched_groups() and build_overlap_sched_groups() iterate over
> >    every bit of sched_domain_span(sd) via for_each_cpu_wrap(i, span, cpu)
> >    and check cpumask_test_cpu(i, covered) one CPU at a time, even after
> >    entire child groups (e.g., 120-CPU NUMA nodes) have been added to
> >    covered. Instead, track the remaining uncovered CPUs
> >    (cpumask_copy(uncovered, span)), clear each built group's span with
> >    cpumask_andnot(), and advance directly to the next uncovered CPU.
> > 
> > 2. __visit_domain_allocation_hell() and __free_domain_allocs() allocate
> >    and free 3 * nr_levels + 2 temporary per-CPU pointer arrays via
> >    alloc_percpu() / free_percpu() on every domain rebuild. Reuse the
> >    per-CPU pointer arrays across domain rebuilds under
> >    sched_domains_mutex, clearing entries in __free_domain_allocs() and
> >    only freeing the topology-level arrays when sched_domain_topology is
> >    replaced in sched_init_numa() / sched_reset_numa().
> 
> sched_domains_mutex does not protect the free:
> 
> [snip]
> 
> >  #ifdef CONFIG_NUMA
> > +static void __sdt_free_percpu(void)
> > +{
> > +	struct sched_domain_topology_level *tl;
> > +
> > +	for_each_sd_topology(tl) {
> > +		struct sd_data *sdd = &tl->data;
> > +
> 
> sched_init_numa() and sched_reset_numa() are called from
> sched_update_numa(), which runs from sched_cpu_activate() and
> sched_cpu_deactivate() without sched_domains_mutex. The free is safe
> because every domain builder holds at least cpus_read_lock(), and
> sched_update_numa() runs under the hotplug write lock. 
> 
> Please fix the changelog and add lockdep_assert_cpus_held()
> in __sdt_free_percpu(), so a future caller cannot break this without a warning.

I will update the changelog to note that __sdt_free_percpu() is serialized 
against domain rebuilds by the CPU hotplug lock, and add
lockdep_assert_cpus_held() to __sdt_free_percpu().

> > +		free_percpu(sdd->sd);
> > +		sdd->sd = NULL;
> > +		free_percpu(sdd->sg);
> > +		sdd->sg = NULL;
> > +		free_percpu(sdd->sgc);
> > +		sdd->sgc = NULL;
> > +	}
> > +}
> > +
> >  static int cpu_numa_flags(void)
> >  {
> >  	return SD_NUMA;
> > @@ -2449,6 +2483,7 @@ void sched_init_numa(int offline_node)
> >  	/*
> >  	 * Copy the default topology bits..
> >  	 */
> > +	__sdt_free_percpu();
> >  	for (i = 0; sched_domain_topology[i].mask; i++)
> >  		tl[i] = sched_domain_topology[i];
> >  
> > @@ -2507,6 +2542,7 @@ static void sched_reset_numa(void)
> >  		kfree(masks);
> >  	}
> >  	if (sched_domain_topology_saved) {
> > +		__sdt_free_percpu();
> >  		kfree(sched_domain_topology);
> >  		sched_domain_topology = sched_domain_topology_saved;
> >  		sched_domain_topology_saved = NULL;
> > @@ -2708,17 +2744,23 @@ static int __sdt_alloc(const struct cpumask *cpu_map)
> >  	for_each_sd_topology(tl) {
> >  		struct sd_data *sdd = &tl->data;
> >  
> > -		sdd->sd = alloc_percpu(struct sched_domain *);
> > -		if (!sdd->sd)
> > -			return -ENOMEM;
> > +		if (!sdd->sd) {
> > +			sdd->sd = alloc_percpu(struct sched_domain *);
> > +			if (!sdd->sd)
> > +				return -ENOMEM;
> > +		}
> >  
> > -		sdd->sg = alloc_percpu(struct sched_group *);
> > -		if (!sdd->sg)
> > -			return -ENOMEM;
> > +		if (!sdd->sg) {
> > +			sdd->sg = alloc_percpu(struct sched_group *);
> > +			if (!sdd->sg)
> > +				return -ENOMEM;
> > +		}
> >  
> > -		sdd->sgc = alloc_percpu(struct sched_group_capacity *);
> > -		if (!sdd->sgc)
> > -			return -ENOMEM;
> > +		if (!sdd->sgc) {
> > +			sdd->sgc = alloc_percpu(struct sched_group_capacity *);
> > +			if (!sdd->sgc)
> > +				return -ENOMEM;
> > +		}
> >  
> 
> Keeping the arrays also means every slot must be NULL when a build 
> starts. Patch 5 depends on that: get_group(), 
> init_overlap_sched_group() and init_sched_domain_shared() treat a NULL 
> slot as "not allocated yet", and the overlap fast path treats 
> "sgc->ref > 0" as "set up in this build". An old pointer would pass
> these checks and be used without a warning.
> 
> The rule holds today, but nothing says so. It also depends on builds
> never filling a slot outside cpu_map, because the clearing loops only
> visit cpu_map. Please write this down and check it, for example in
> __sdt_alloc():
> 
> 
> >  		for_each_cpu(j, cpu_map) {
> >  			struct sched_domain *sd;
> 
> Maybe add
> 
>         /*
>          * The slot arrays are kept between builds. Every slot for a CPU
>          * in cpu_map must be NULL here; lazy allocation treats NULL as
>          * "not allocated in this build". claim_allocations() and
>          * __sdt_free()/__sds_free() clear the slots, but only for
>          * cpu_map, so a build must not fill slots outside cpu_map.
>          */
>                 for_each_cpu(j, cpu_map) {
>                         struct sched_domain *sd;
> 
>                         WARN_ON_ONCE(*per_cpu_ptr(sdd->sd, j) ||
>                                      *per_cpu_ptr(sdd->sg, j) ||
>                                      *per_cpu_ptr(sdd->sgc, j));
> 

Sure, I will add the comment, and WARN_ON_ONCE.

> > @@ -2748,30 +2790,36 @@ static void __sdt_free(const struct cpumask *cpu_map)
> >  
> >  			if (sdd->sd) {
> >  				sd = *per_cpu_ptr(sdd->sd, j);
> > -				if (sd && (sd->flags & SD_NUMA))
> > -					free_sched_groups(sd->groups, 0);
> > -				kfree(*per_cpu_ptr(sdd->sd, j));
> > +				if (sd) {
> > +					if (sd->flags & SD_NUMA)
> > +						free_sched_groups(sd->groups, 0);
> > +					kfree(sd);
> > +					*per_cpu_ptr(sdd->sd, j) = NULL;
> > +				}
> >  			}
> >  
> > -			if (sdd->sg)
> > +			if (sdd->sg) {
> >  				kfree(*per_cpu_ptr(sdd->sg, j));
> > -			if (sdd->sgc)
> > +				*per_cpu_ptr(sdd->sg, j) = NULL;
> > +			}
> > +			if (sdd->sgc) {
> >  				kfree(*per_cpu_ptr(sdd->sgc, j));
> > +				*per_cpu_ptr(sdd->sgc, j) = NULL;
> > +			}
> >  		}
> > -		free_percpu(sdd->sd);
> > -		sdd->sd = NULL;
> > -		free_percpu(sdd->sg);
> > -		sdd->sg = NULL;
> > -		free_percpu(sdd->sgc);
> > -		sdd->sgc = NULL;
> >  	}
> >  }
> >  
> > +static struct sched_domain_shared * __percpu *sched_domains_sds;
> > +
> >  static int __sds_alloc(struct s_data *d, const struct cpumask *cpu_map)
> >  {
> 
> and maybe similar check 
> 
>         for_each_cpu(j, cpu_map)
>                 WARN_ON_ONCE(*per_cpu_ptr(d->sds, j));

I will add the comment and the WARN_ON_ONCE() checks in
both __sdt_alloc() and __sds_alloc() for v2.

Thanks,
Pasha
