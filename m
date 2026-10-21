Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560531;
	b=SMvoZ5tC6hWtO6NFanA+PJusdA+RjylxQXzdiSqllUl4oj4jS4qu8YlZfdI2T26DTYFf
	 va6STx4onIeX5NjsoQD6jgkeKTslEkk+JCPOUU//PITDoUOLArWtbp0Ag1iOtmCCZdxXa
	 fk3KNpBAZTwI/9mDHykGvifvuQjybqj3UNxkD2MrpOFqtJiWmi4VYT1zlNhIwjKONINbj
	 yQNdXaiGr9dlWy7mv8JAvvQg97+dYXBvg3zY+NjTqivyh5rA3h31KV2o7+uHbSVpS/jvO
	 Le/8HkPyXPQ14vetZ8dh4ImcxM6XmIf4p4I8hf6uhpTCalbUcjqeAiJ/wF3CQSspf8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ouzBv4fv2YGdLEYKWhnCl7lglQF6uLUFcI2YpZbOk+Q=;
	b=WP39sHPhqGvmN0B0GnvKexrf8jD9HkX2DHFWEXM0icEPcKvBc4FqLabb8RX89LyPQ7D7
	 4p6woKC1ctw3gjBCK5OigYThWGoU9UklAyzYVwuS4k5UyuNzFRNB0Hx6e+3kiXjFHMlJL
	 VXsimK/rZqTeOXFzObHwfVnXW7cGgDfzEXzw9fSVZr1DnduD64GEu4zSaxpsPdL/+VKtu
	 fglYYg/V3fCVWm49zUAd0Bp7qYjw8s/vUi9aQWerK5sjRkBuSlD0CmIjueKihKF5FTF7A
	 iFV063ZiBBzjXdhvTIvGUdt2JVls2Vhq0YRnb1ctu+DNrOed7abK53J6qARQtUolakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWxh5wln;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34B3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWxh5wln
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df3912dd2so31203f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792560529; x=1793165329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouzBv4fv2YGdLEYKWhnCl7lglQF6uLUFcI2YpZbOk+Q=;
        b=rWxh5wlnOlOBF8aKbhvrAB6F17tSK4lK9jajw70Qg3CzWxt5IQ+RC8oj6dq63yFpsW
         d1UJ534DPtd4cKa47qbL1/3sf2k8QN4m8Kp+y2umEXZQ//9vt6/zydHkkViWUJEDmHja
         CKIRgxEeEsdhUWF82RQU+qYpH7jBn7VCjTFp8dh41Bto5oaPNzgvgwNtfXzC4OYwOz9U
         LV36LRR0/f75iz85tCw2alinINPywaR4JhskJu043mmOLGvio4bB+j7kVlpM7ofrY+ZF
         GSwFKZX/7qPEYqYSPV7EV9uJ/sD0BAWV1aoVNnLTkapgzGGRJUbo76KTnFE2aWzilrME
         6+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560529; x=1793165329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouzBv4fv2YGdLEYKWhnCl7lglQF6uLUFcI2YpZbOk+Q=;
        b=UwHbU937ru7oSSygHHTvlOygO4zuHuPtBvg3W8H+o6x1BfVI2SvCjbecgW52XqMTcV
         wm9dvqX3EIoCXD49vlQ5qFlMI5phaZPk8ISyMusfpU89bqfpj47/DR2EpLiwzIPvjkdK
         vSKVHt+CCWzcJDrC1Q/snGtLoLdcpPw4/wFFWIBcUW8umVi8gIC9f5eFK82JXqwG80vQ
         /RE9WA1ZWcayEeXmAOAZUr8KBO6qf3zzbto78e6hG8jQ1ysAy5/iR5+fQ0+tBA4vS5P9
         v3IuKfRji9KMQ+Q3i0i+/95rb+FG5PoMzxc0QFqNyEhAT+fNxT+eOxfKo6Zk5221b3x7
         Q1pg==
X-Forwarded-Encrypted: i=1; AKwUvBxO4r8fk09GPnqAQ0jDQq8DSb73MzW6REsVa5620H517zO4ZZTKhRHuvmWcQDT//RH84ki4iBZRHKYdHjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPep3b4ER+bZk8kYLtof+4wBDtXF2f8hAt0LhR1dfRccgrMfBB
	DQbEalqifAT25cF5zSVDBRi5+lJL4TMFOPDBefATCEGG4HQpLrTTnkfN
X-Gm-Gg: AYBFou0yHlpqJ/jb0PwUMVESDiHzkR7hDdbZUmktC5xFGq0ahNccUsIXYZ6IiAR5mqJ
	h0ulR03Osh2dvL2xessF7kF3xpraHoEh0fssj5W0UomjGyHIVA/+7/aWlevPzvDilLr6JPUmkMC
	2EvngtyHrHFz26ggCcbVJND7338XRs3w3gjkeR6xEYJZs8MAZ92mgKu9cXSR7HJ6Fh+YnNOA+cx
	u5WowU52u2eApoNmy4CtDKI36Cz529ftTnp9IXbJrBtPmGNYxWFoP+JTUiZ/JBWzQmVUjnxrqaE
	sljWgHxJrYUWLXed24oC7kPtBWEJLrHhWnpni+/KFsIZ2DmABAM5SKZ8C1leX0oTeghpKgNn+w+
	KySUTtPYJpgnSW0SKk4LXxejz8fXHL6Iomhi2emdEW1bzg9Z1yaKfCS/vHbzPW7Mhtw/KqI3Yrk
	d7DpvattgympR6fdfmsUM4wBTUwFK8uevZcNBAyuHq8n3JxWbhRVhHja7U7Ie4acHN+1o2vwpsX
	yEAfeMDkXvadm23Jz+M/d3eL7c8FlxGXYDsPavmTbe0171yknL+aGAipOnzUJGl3t7MqBXBi79Y
	DSme6LH1hj+9KgnkCuM/gB9jiOo6
X-Received: by 2002:a05:600c:19ca:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a1fd72c846mr13981435e9.0.1792560528932;
        Tue, 20 Oct 2026 22:28:48 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm3093795f8f.34.2026.10.20.22.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:28:47 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:28:44 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Barry Song <baohua@kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Chen Yu <yu.c.chen@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Balance cluster static-key updates
Message-ID: <athKWWKD3ryCikSW@scheduler.schedules>
References: <20261021043834.1140951-1-sh_def@163.com>
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
In-Reply-To: <20261021043834.1140951-1-sh_def@163.com>

On Wed, Oct 21, 2026 at 01:38:34PM +0900, Hui Su wrote:
> build_sched_domains() increments sched_cluster_active once per newly
> built partition that contains an SD_CLUSTER domain.
> detach_destroy_domains() instead tested the global static key before
> decrementing it, so destroying a cluster-less partition could drop a
> reference owned by another partition and disable cluster-aware
> scheduling while SD_CLUSTER domains remained installed.
> 
> Check the installed domains before detaching them, only while the key is
> enabled, and decrement only when the removed partition contains an
> SD_CLUSTER domain.
> 
> With two cluster-bearing partitions installed, removing a singleton
> partition left the baseline count at 1 where 2 partitions still
> carried SD_CLUSTER; the fixed kernel correctly reports 2.  On an
> asymmetric cluster topology where the parent partition gains no
> cluster domain, the baseline count drops to 0 while a cluster
> partition remains installed; the fixed kernel keeps it at 1.
> 
> Fixes: 8881e1639f1f ("sched/fair: Scan cluster before scanning LLC in wake-up path")
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
> 
> Changes in v2:
> - Guard the SD_CLUSTER domain scan with sched_cluster_active to avoid an
>   unnecessary loop on systems without cluster domains. (K Prateek Nayak)
> 
> v1: https://lore.kernel.org/r/20261021034314.864713-1-sh_def@163.com
> 
>  kernel/sched/topology.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 3dab0253976fb..21e3ab1af4c85 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -3314,13 +3314,25 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
>  static void detach_destroy_domains(const struct cpumask *cpu_map)
>  {
>  	unsigned int cpu = cpumask_any(cpu_map);
> +	bool has_cluster = false;
>  	int i;
>  
>  	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
>  		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
>  
> -	if (static_branch_unlikely(&sched_cluster_active))
> -		static_branch_dec_cpuslocked(&sched_cluster_active);
> +	if (static_branch_unlikely(&sched_cluster_active)) {
> +		rcu_read_lock();
> +		for_each_cpu(i, cpu_map) {
> +			if (lowest_flag_domain(i, SD_CLUSTER)) {
> +				has_cluster = true;
> +				break;
> +			}
> +		}
> +		rcu_read_unlock();
> +
> +		if (has_cluster)
> +			static_branch_dec_cpuslocked(&sched_cluster_active);
> +	}
>  
>  	rcu_read_lock();
>  	for_each_cpu(i, cpu_map)
> -- 
> 2.55.0
>

LGTM.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
