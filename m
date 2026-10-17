Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05303319851
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271793; cv=none; b=nDgrqLEZZzz6EhD1O671uYKi2W0z14QajohJhc3zZyDZtYnRlFAPu1Ia+DKGzq2TXr8aO0lL28p2M52abGDd+4TNTI3n9hURICvhXjPVBC3IQPpTPxW4s4nVxEYVUFTGWeuYf2glpajnBGfp3NwnAINmmBMSadg/a5YHlo/L/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271793; c=relaxed/simple;
	bh=9Hg3Lo4OE34WZ3L+lqPVx5wzeuuEdjB2rFEKAK7xRds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJFtfNb2JNMl4/x0lyJLG5dKCnUGLMeWO21WOJzdkMxFrlZ2dBWgpJzFCoV7FaPbOkA+H4QzuVxK9wUSY19+cOa285f47KuzcYSLlnKSBBYZHApvbnlxRFHP4NaiTy44eDzF8oUcG+wv83wWMskiULHrGOnPAJh4oOJMlAkwDEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC6MGk0Q; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC6MGk0Q"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a058f74a54so93766b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792271791; x=1792876591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qguhYArQk/KW+dhlWzdBW+K99B5MVDRdS3H3exN/DQM=;
        b=PC6MGk0QZ6MPDl0af7xFUSwHumhpfj3b6UlQ+ZCoTLMoSUvppsDbaUlMdOmMOYhyGi
         pvKPkZDCvAaPfxSRSb10HkfCOlgjQq9DWiIrCoeFLW6AqjfZF2H98vTy2nckaPnpx5Ee
         RnAmTHjAILM6Kxm/NLYwPS9LPGvSvD41EEaVkiUE8HDOJM04k2cTr1RipGs+lSMUYl/q
         UFddh0E5NcOv9ZBY0ax8IoZmNoWpk5Ua1X80ZGXMffGSVtxmqStR2ItP0hzzPrl2XnpQ
         ro1cX752vS4j11fDiZD/I4om2JcWVasSoLQnsIny5zH6yPnzHlv6/xZr02LtLOfJeFf4
         ctrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792271791; x=1792876591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qguhYArQk/KW+dhlWzdBW+K99B5MVDRdS3H3exN/DQM=;
        b=Qo0I9HeeEFGGsG9M0he+kns9CjVkArnmhcmUu2HxVpUPhUnCL87SWUASbxKzKibveI
         zZ1HSjAkbHlE2XxG1WqxHJLoxkOafPyvCaYmkidC+qqPFagS4LlaCW8ohIWN+ZQGYwLU
         uvzJC/y8dDUZBIcJA3rb+SilZJ5cNBrUF6zIgGGU9JTtxjmC/cZClHVxTvPP2C6kBqk1
         nYd7JwPxoL3+0j6ryzG/It4jGvieWuGbCO8WD3d8gZHkx1H/2Qn7rW1PPvMmBgmt2P7b
         RVrRu908/lYcO+VQ/JJZiP9qXaGbS2yg2B2CsJmY0lNGHlETGF4vQ6mtufyGtXwsAdsE
         diUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwXTmijYlFMwFue7Ej3UnZgLMsR39l8cHOSdJOiA52hN8Khn7D9qd/DLTghzx2+No8ObJmbM8fJz9LNBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0nGkmeOGePo6doYb2hDiF5QvI6J/CTnqH05PVKnmgZBSvKnRZ
	MLxFy0qnmOuHSLlpX5T6anXV+7eBriHcjXcxOH87gWZnKk2IVCa8rzXK
X-Gm-Gg: AYBFou14Ezrr2b7H12RId4wZ1UUInq87bFvHGfCVe9ANyywfExn03OWSmBcouqFVRdT
	qa8A7SvisSsML/ODdh799KHNJMI1upmHcVW5QCWfh+KrvlyQ0UeFxZ9GLkBhEMUUj7oRHTMlBG2
	IB4x27Bhn+WY/4cvT42/mvI0t0+uHnxCcU9R6gqjArCUnGqLHcLltQJRV8u5j9LIi/a3eTJUygT
	bqBseORmTigXH/9apHcl/1KknDtprKA9Xve+lXjY8H8TyixuJIZNn2uu4otlSU1T1pwmPeS+Qsh
	prEj/8JQzJrj1upFSRJj4gmC205kZzF6CxYcdT346Wg2bDEcu7/2P+o3l+iOLFrXK9U3A/ZI077
	xgF2jRAN9ji/AmfsHpCytas7Tuj0OgVps2jKZ20TYNy2xM0l1LjB6EGxjV+UWM3CPfd/UaGg+Go
	QB7CYmisD+g/n+3VK9rJVAs2r4AXnn0Py5tO5Ys0+733fLZ9FekBkOipyiL+RRHCnIUVEeJQ1FH
	V8WOUmdWJF6Cx3OoNktPUsJGw==
X-Received: by 2002:a05:6a00:1394:b0:898:9b2:605b with SMTP id d2e1a72fcca58-8a04d23d89amr2331468b3a.56.1792271791111;
        Sat, 17 Oct 2026 14:16:31 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:8954:498:18c1:c1ef:4268:7168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8b922sm2460239b3a.11.2026.10.17.14.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 14:16:30 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: Liew Rui Yan <aethernet65535@gmail.com>,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: Ajay Joshi <ajayjoshi@micron.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bijan Tabatabai <bijan311@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	Gregory Price <gourry@gourry.net>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Lian Wang <lianux.mm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Rientjes <rientjes@google.com>,
	SJ Park <sj@kernel.org>,
	Wei Xu <weixugc@google.com>,
	Yunjeong Mun <yunjeong.mun@sk.com>
Subject: [RFC PATCH v4 0/9] mm/damon: hardware-sampled access reports
Date: Sun, 18 Oct 2026 05:16:13 +0800
Message-ID: <20261017211613.16456-2-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017071120.4628-1-aethernet65535@gmail.com>
References: <20261017071120.4628-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 17 Oct 2026 15:11:18 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> Hi Ravi,
> 
> 
> TLDR
> ====
> 
> I have noticed that there might have an issue with this patch or my CPU.
> I am not sure.  I have provided some details below.
> 
> On Mon, 05 Oct 2026 01:46:44 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> 
> > This series lets DAMON monitor a hardware-sampled data attribute -- the
> > addresses a PMU saw accessed -- through the data attributes monitoring
> > (probe) interface, and run DAMOS schemes on it in data attributes-only
> > mode.  Patches 3, 5, and 6 are co-developed with Akinobu Mita, building
> > on his earlier perf-event proposal [3].
> > 
> 
> I expected it to monitor regions in the same way as PTE sampling, that
> is, if the system has hot memory, DAMON should be able to detect it, or
> at least with some probability.  However, it is not always work like
> that.  After I starting DAMON about 10 minutes, the DAMON cannot found
> any hot page, even when I am running 'stress-ng --vm 6 --vm-bytes 6G':
> 
>     snapshot time: [0 ns, 100 ms] (100 ms)
>     |0000000000000000000000000000000000000000| size 1.461 GiB   access 0      age 3 m 3.200 s  
>                                    |000000000| size 1.465 GiB   access 0      age 3 m 1 s      
>                                           |00| size 2.922 GiB   access 0      age 3 m 0.500 s  
>                          |0000000000000000000| size 1.471 GiB   access 0      age 3 m 1.700 s  
>                     |000000000000000000000000| size 1.462 GiB   access 0      age 3 m 2.100 s  
>                                           |00| size 1.470 GiB   access 0      age 3 m 0.500 s  
>                                            |0| size 2.926 GiB   access 0      age 3 m 0.400 s  
>                                           |00| size 1.544 GiB   access 0      age 3 m 0.500 s  
>     memory bw estimate: 0 B per second
>     total size: 14.722 GiB
>     record DAMON intervals: sample 5 ms, aggr 100 ms
> 
>     Note that this is my own fork of damo [1].
> 
> To ensure this was not a bug in my damo fork [1], I adding a tracing
> statistic [2] to DAMON to confirm whether this was indeed a DAMON issue.
> 
> TLDR for new tracing statsistic: 'seen' means how many times
> damon_perf_overflow() was called.
> 
> Later, I noticed that about 10 minutes after starting DAMON, the 'seen'
> stopped increasing:
> 
>     I am running 'stress-ng --vm 6 --vm-bytes 6G' during recording this
>     statistic.
> 
>     Start Time: 19:25:42 | End Time: 19:42:18
>     Time Unit: 1 step = 1.81 minutes
> 
>        Seen (Delta)
>             ^
>             |
>       100k  |  *
>       36k   |      *
>       18k   |                      *           *
>       17k   |          *
>       15k   |                  *
>       4k    |                          *
>       453   |                              *
>       106   |              *
>         0   |                                      *
>             +--+---+---+---+---+---+---+---+---+---+---> Step
>                1   2   3   4   5   6   7   8   9   10
> 
>     Note: Zero delta from 19:42:18 (step 10) till 20:00:00 (I close my
>     machine after that).
> 
> My DAMON Perf Config
> ====================
> 
>     K=/sys/kernel/mm/damon/admin/kdamonds/0
>     C=$K/contexts/0
>     P=$C/monitoring_attrs/probes
> 
>     echo 1 > $P/0/preps/nr_preps
>     echo perf_event > $P/0/preps/0/prep_action
>     cat /sys/bus/event_source/devices/ibs_op/type > $P/0/preps/0/type
>     echo 0 > $P/0/preps/0/config
>     echo 0 > $P/0/preps/0/config2
>     echo 0 > $P/0/preps/0/sample_freq
>     echo 100000 > $P/0/preps/0/sample_period
>     echo 1 > $P/0/preps/0/sample_phys_addr
>     echo 0 > $P/0/preps/0/exclude_kernel
>     echo 0 > $P/0/preps/0/exclude_hv
>     echo 1 > $P/0/weight
> 
>     Note that this issue can also reproduce even when
>     'kernel.perf_cpu_time_max_percent=100'.
> 
> My CPU Specification
> ====================
> 
>     CPU(s):                                  12
>     On-line CPU(s) list:                     0-11
>     Vendor ID:                               AuthenticAMD
>     Model name:                              AMD Ryzen 5 5600H with Radeon Graphics
>     CPU family:                              25
>     Model:                                   80
>     Thread(s) per core:                      2
>     Core(s) per socket:                      6
>     Socket(s):                               1
>     Stepping:                                0
>     Microcode version:                       0xa500012
>     Frequency boost:                         enabled
>     CPU(s) scaling MHz:                      48%
>     CPU max MHz:                             4280.9849
>     CPU min MHz:                             412.6250
>     BogoMIPS:                                6587.34
> 
> I am trying to figure out if this is a CPU issue, or if there is an
> issue with this patch.  I would be happy to provide more information.
> 
> [...]
> 
> [1] https://github.com/aethernet65535/damo/tree/probe
> [2] Trace patch diff
> '''
> diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
> index 4dfc9467ea4b..290d3ee2d836 100644
> --- a/include/trace/events/damon.h
> +++ b/include/trace/events/damon.h
> @@ -199,6 +199,23 @@ TRACE_EVENT(damon_aggregated,
>  			__entry->nr_accesses, __entry->age)
>  );
>  
> +TRACE_EVENT(damon_perf_source_stats,
> +
> +	TP_PROTO(unsigned long seen),
> +
> +	TP_ARGS(seen),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, seen)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->seen = seen;
> +	),
> +
> +	TP_printk("seen=%lu", __entry->seen)
> +)
> +
>  #endif /* _TRACE_DAMON_H */
>  
>  /* This part must be outside protection */
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index bae4569f0ab3..73988ce82b1a 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -4927,6 +4927,8 @@ static void kdamond_check_reported_accesses(struct damon_ctx *ctx)
>  	if (damon_drains_ring_perf(ctx))
>  		__kdamond_drain_ring(ctx, tbl, ctx->perf_rings,
>  				&ctx->perf_pending);
> +
> +	trace_damon_perf_source_stats(damon_get_perf_seen());
>  }
>  
>  /*
> diff --git a/mm/damon/perf_source.c b/mm/damon/perf_source.c
> index 4baa8aebcfa8..e8365dbe1744 100644
> --- a/mm/damon/perf_source.c
> +++ b/mm/damon/perf_source.c
> @@ -27,6 +27,8 @@ struct damon_perf_probe_state {
>  	struct perf_event *single_event;
>  };
>  
> +static DEFINE_PER_CPU(unsigned long, damon_perf_seen);
> +
>  static void damon_perf_overflow(struct perf_event *perf_event,
>  				struct perf_sample_data *data,
>  				struct pt_regs *regs)
> @@ -40,6 +42,8 @@ static void damon_perf_overflow(struct perf_event *perf_event,
>  		.cpu = smp_processor_id(),
>  	};
>  
> +	this_cpu_inc(damon_perf_seen);
> +
>  	/*
>  	 * Teardown NULLs event->ctx (with a release barrier) before releasing
>  	 * the per-CPU perf events, so an in-flight overflow racing the
> @@ -84,6 +88,16 @@ static void damon_perf_overflow(struct perf_event *perf_event,
>  	damon_report_access(&report);
>  }
>  
> +unsigned long damon_get_perf_seen(void)
> +{
> +	unsigned long sum = 0;
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		sum += per_cpu(damon_perf_seen, cpu);
> +	return sum;
> +}
> +
>  static enum cpuhp_state damon_perf_cpuhp_state;
>  
>  /*
> diff --git a/mm/damon/perf_source.h b/mm/damon/perf_source.h
> index 12ca61be7243..49beca6e3189 100644
> --- a/mm/damon/perf_source.h
> +++ b/mm/damon/perf_source.h
> @@ -50,6 +50,7 @@ int damon_perf_probe_setup(struct damon_ctx *ctx,
>  			   struct damon_perf_probe_event *event);
>  void damon_perf_probe_teardown(struct damon_ctx *ctx,
>  			       struct damon_perf_probe_event *event);
> +unsigned long damon_get_perf_seen(void);
>  
>  #endif /* CONFIG_DAMON_PERF_SOURCE */
>  #endif /* _DAMON_PERF_SOURCE_H */
> '''

I found that if I enable the kernel NMI watchdog, this issue can be
fixed.  So I think this is not issue of this patch.  What do you think?

[...]

Best regards,
Rui Yan
