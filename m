Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC233ED12B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221168; cv=none; b=J+6R9T3C6fU5cCfOQ2O4GXfcFt906cG/MzehOhYc9FyjVCp5bS7jwCAXXk6tYCQ5I+6rMjlVNL6XK0mc9dnn7pDpCIk3BrbcGEqP+U1p6TfaMGESbnvaisUfnd/YBysj8n6fghDVVo8yxchcrEPKjmygggCr2TLEK2iNss0Mqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221168; c=relaxed/simple;
	bh=rvo+63FMVTA2fiS8JF3B9jN9ET0Lr9Jui2Dm503gITU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xt5P5/EjdRoNWymwnLGhrRN/UGDd+A6TRE2rJUVzM8aE4c5w4G6EJzicwPza0gIn+dvRz3iSP+5y2jQ9TyFJBqyXeDDBRexIwFsxxBsmGSmKMFWUVLsHrZkY0FJCJIM21HmzAychfaSTW1t30pJhDAOYVoFm9grC4gSKNLck+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiQIeFmE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiQIeFmE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so446066a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792221166; x=1792825966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJH8UNyjh46J8FjQdq/QYU7fitJ1+CWgYhgsIWlIMTo=;
        b=BiQIeFmE6unK3ubMPBkrlBtqynLZ5o6TsmBELN9n9sCu4mKEr0xXYYoXaqTkFdMlu3
         wBJzJyo94z+tjWEz2qk9YoJ8ycmghqxfYuFzkQdszl1PJCYi8QMhjI6uPY+NASxnK145
         PXAy/tTAGJaVhhqYplowKQXWjgeRN1voVpfswEioLHEGAeW/vz8EcpKSYDzs6bP2sLwi
         VURo8ylHjtDHKEkXKlT+KGcE+ekyxG9io3Y+d41Th4w3ykijyTZqZw/fIVBO2yQa9qJs
         amIgkGP8K/cvwlqvRfF4k11qTpM761IxKkfRUPOq8DUM32D4ua3SWv3R5V6tLTVmxsKU
         dVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792221166; x=1792825966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJH8UNyjh46J8FjQdq/QYU7fitJ1+CWgYhgsIWlIMTo=;
        b=0zB6l/Z6918V0IWmoNOK46pdg9NZEkU22u40t9mRNaJb7qm8uDyt1QIusjBhijSKRH
         sV8WLyRwnvruBfvTQvkRX1FeK7qgdjr+IrPPjayrZA42pSsC5zxa7Mdl4Z+p3XTLKVhq
         vocFOWUEeUnZkMi+O/tZ+l18QswGSh6G1dz0KW1tLgE/VBKsoDF3vi8ouM6wiQoSyxy5
         Z4GbexGDfL96ZMz8h/JnTJTdkoPGUJ5QAv+reOxM+5N1Z0Q+H/YCr9mtqEdrtAd6fG/J
         +RlhdT1mwyANh8tvN78yRaeWZXeSXST1ViAofeP8wyN8p6Yth2WL/7hPS0l49F72VLOF
         Enag==
X-Forwarded-Encrypted: i=1; AKwUvByA7DsyVpCXgzSHodkLWZi4k4vTpdjE6Ry/Y5Zzg/+9dz0vRHffZZnLPDD7rpgFQ4ArnZPVlvysXzJgS6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiEgubUTC7F0dpYpVig75UODG0nrWTVkjo5fgin8Gzqk8QVb+3
	aGc6EjajMQ95UYrPh3zWizor/j2e4pCd6WYewyvdO0XWUmXvpyZah8mD
X-Gm-Gg: AYBFou3mfA2vj4Ij62QaPsOngLWNRZ4fF3T0t5tX4GwbxjaD7qU5KbU+Xp/31dkBN6d
	GNrcyIt8XPCHaFDBxUaHFqDUU3jiH8S6mjo/Mqqc3PJzConF7Cc1Uf/QalmoRv2O7OIM76e8EQi
	ppkCoTkPsxt4B1rIpefY1f63Pl8X3PhhgvRmauJ7E8Hf/WNymTznv1dwoDGurqgnBFlBgr5fOu1
	Klvjur9rfdpFGzHvrVNrj0N+e24H/xzWnj/GtBPkhUGRoXgDHj/JaRybzSbHAfdjeP2OhJ/MHhc
	5aZozi/ENN8eIiBLTajQ3e70ZB9oTxIdZoh4doQGhj9xqF8RfxaksSt4HVCz7379wWgdKSER4p9
	4w7BpCgBb8WAjRIfzhjr3iaQPwdJ539NtaGIx8KuBIKgYs7uVwmmNM8DpwG0xjTkFDniloaubfK
	CEchSYUEG29XnzM2xbrJud3NHquku82ULCjr+XNlzRK0HCQrcz35PZD7aqTknsCOw4/YgH8xu2c
	6kNGuxQ+uhJH2PdSC8c3oequg==
X-Received: by 2002:a17:90b:28c5:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3acef667162mr1425497a91.66.1792221166557;
        Sat, 17 Oct 2026 00:12:46 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:8954:498:18c1:c1ef:4268:7168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0aa3c24sm3788644a91.4.2026.10.17.00.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:12:46 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
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
Date: Sat, 17 Oct 2026 15:11:18 +0800
Message-ID: <20261017071120.4628-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com>
References: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ravi,


TLDR
====

I have noticed that there might have an issue with this patch or my CPU.
I am not sure.  I have provided some details below.

On Mon, 05 Oct 2026 01:46:44 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> This series lets DAMON monitor a hardware-sampled data attribute -- the
> addresses a PMU saw accessed -- through the data attributes monitoring
> (probe) interface, and run DAMOS schemes on it in data attributes-only
> mode.  Patches 3, 5, and 6 are co-developed with Akinobu Mita, building
> on his earlier perf-event proposal [3].
> 

I expected it to monitor regions in the same way as PTE sampling, that
is, if the system has hot memory, DAMON should be able to detect it, or
at least with some probability.  However, it is not always work like
that.  After I starting DAMON about 10 minutes, the DAMON cannot found
any hot page, even when I am running 'stress-ng --vm 6 --vm-bytes 6G':

    snapshot time: [0 ns, 100 ms] (100 ms)
    |0000000000000000000000000000000000000000| size 1.461 GiB   access 0      age 3 m 3.200 s  
                                   |000000000| size 1.465 GiB   access 0      age 3 m 1 s      
                                          |00| size 2.922 GiB   access 0      age 3 m 0.500 s  
                         |0000000000000000000| size 1.471 GiB   access 0      age 3 m 1.700 s  
                    |000000000000000000000000| size 1.462 GiB   access 0      age 3 m 2.100 s  
                                          |00| size 1.470 GiB   access 0      age 3 m 0.500 s  
                                           |0| size 2.926 GiB   access 0      age 3 m 0.400 s  
                                          |00| size 1.544 GiB   access 0      age 3 m 0.500 s  
    memory bw estimate: 0 B per second
    total size: 14.722 GiB
    record DAMON intervals: sample 5 ms, aggr 100 ms

    Note that this is my own fork of damo [1].

To ensure this was not a bug in my damo fork [1], I adding a tracing
statistic [2] to DAMON to confirm whether this was indeed a DAMON issue.

TLDR for new tracing statsistic: 'seen' means how many times
damon_perf_overflow() was called.

Later, I noticed that about 10 minutes after starting DAMON, the 'seen'
stopped increasing:

    I am running 'stress-ng --vm 6 --vm-bytes 6G' during recording this
    statistic.

    Start Time: 19:25:42 | End Time: 19:42:18
    Time Unit: 1 step = 1.81 minutes

       Seen (Delta)
            ^
            |
      100k  |  *
      36k   |      *
      18k   |                      *           *
      17k   |          *
      15k   |                  *
      4k    |                          *
      453   |                              *
      106   |              *
        0   |                                      *
            +--+---+---+---+---+---+---+---+---+---+---> Step
               1   2   3   4   5   6   7   8   9   10

    Note: Zero delta from 19:42:18 (step 10) till 20:00:00 (I close my
    machine after that).

My DAMON Perf Config
====================

    K=/sys/kernel/mm/damon/admin/kdamonds/0
    C=$K/contexts/0
    P=$C/monitoring_attrs/probes

    echo 1 > $P/0/preps/nr_preps
    echo perf_event > $P/0/preps/0/prep_action
    cat /sys/bus/event_source/devices/ibs_op/type > $P/0/preps/0/type
    echo 0 > $P/0/preps/0/config
    echo 0 > $P/0/preps/0/config2
    echo 0 > $P/0/preps/0/sample_freq
    echo 100000 > $P/0/preps/0/sample_period
    echo 1 > $P/0/preps/0/sample_phys_addr
    echo 0 > $P/0/preps/0/exclude_kernel
    echo 0 > $P/0/preps/0/exclude_hv
    echo 1 > $P/0/weight

    Note that this issue can also reproduce even when
    'kernel.perf_cpu_time_max_percent=100'.

My CPU Specification
====================

    CPU(s):                                  12
    On-line CPU(s) list:                     0-11
    Vendor ID:                               AuthenticAMD
    Model name:                              AMD Ryzen 5 5600H with Radeon Graphics
    CPU family:                              25
    Model:                                   80
    Thread(s) per core:                      2
    Core(s) per socket:                      6
    Socket(s):                               1
    Stepping:                                0
    Microcode version:                       0xa500012
    Frequency boost:                         enabled
    CPU(s) scaling MHz:                      48%
    CPU max MHz:                             4280.9849
    CPU min MHz:                             412.6250
    BogoMIPS:                                6587.34

I am trying to figure out if this is a CPU issue, or if there is an
issue with this patch.  I would be happy to provide more information.

[...]

[1] https://github.com/aethernet65535/damo/tree/probe
[2] Trace patch diff
'''
diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
index 4dfc9467ea4b..290d3ee2d836 100644
--- a/include/trace/events/damon.h
+++ b/include/trace/events/damon.h
@@ -199,6 +199,23 @@ TRACE_EVENT(damon_aggregated,
 			__entry->nr_accesses, __entry->age)
 );
 
+TRACE_EVENT(damon_perf_source_stats,
+
+	TP_PROTO(unsigned long seen),
+
+	TP_ARGS(seen),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, seen)
+	),
+
+	TP_fast_assign(
+		__entry->seen = seen;
+	),
+
+	TP_printk("seen=%lu", __entry->seen)
+)
+
 #endif /* _TRACE_DAMON_H */
 
 /* This part must be outside protection */
diff --git a/mm/damon/core.c b/mm/damon/core.c
index bae4569f0ab3..73988ce82b1a 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -4927,6 +4927,8 @@ static void kdamond_check_reported_accesses(struct damon_ctx *ctx)
 	if (damon_drains_ring_perf(ctx))
 		__kdamond_drain_ring(ctx, tbl, ctx->perf_rings,
 				&ctx->perf_pending);
+
+	trace_damon_perf_source_stats(damon_get_perf_seen());
 }
 
 /*
diff --git a/mm/damon/perf_source.c b/mm/damon/perf_source.c
index 4baa8aebcfa8..e8365dbe1744 100644
--- a/mm/damon/perf_source.c
+++ b/mm/damon/perf_source.c
@@ -27,6 +27,8 @@ struct damon_perf_probe_state {
 	struct perf_event *single_event;
 };
 
+static DEFINE_PER_CPU(unsigned long, damon_perf_seen);
+
 static void damon_perf_overflow(struct perf_event *perf_event,
 				struct perf_sample_data *data,
 				struct pt_regs *regs)
@@ -40,6 +42,8 @@ static void damon_perf_overflow(struct perf_event *perf_event,
 		.cpu = smp_processor_id(),
 	};
 
+	this_cpu_inc(damon_perf_seen);
+
 	/*
 	 * Teardown NULLs event->ctx (with a release barrier) before releasing
 	 * the per-CPU perf events, so an in-flight overflow racing the
@@ -84,6 +88,16 @@ static void damon_perf_overflow(struct perf_event *perf_event,
 	damon_report_access(&report);
 }
 
+unsigned long damon_get_perf_seen(void)
+{
+	unsigned long sum = 0;
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		sum += per_cpu(damon_perf_seen, cpu);
+	return sum;
+}
+
 static enum cpuhp_state damon_perf_cpuhp_state;
 
 /*
diff --git a/mm/damon/perf_source.h b/mm/damon/perf_source.h
index 12ca61be7243..49beca6e3189 100644
--- a/mm/damon/perf_source.h
+++ b/mm/damon/perf_source.h
@@ -50,6 +50,7 @@ int damon_perf_probe_setup(struct damon_ctx *ctx,
 			   struct damon_perf_probe_event *event);
 void damon_perf_probe_teardown(struct damon_ctx *ctx,
 			       struct damon_perf_probe_event *event);
+unsigned long damon_get_perf_seen(void);
 
 #endif /* CONFIG_DAMON_PERF_SOURCE */
 #endif /* _DAMON_PERF_SOURCE_H */
'''

Best regards,
Rui Yan
