Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587405;
	b=K8JFZfFlpm9WBq8wDLfWVcxIW7hI3meXVZHqPv0sM7oYgn2/EYs53GKB3++gPHWwhqhV
	 0Ob6ry9xdMNjrpYpZgCEB3ATp4mnte7TbdMGoRaYcjJD6h29fhP1/EH+6I26QEe89Ufti
	 YqUxsJLVy+yPkpWRT3jX9GG3YWZ+B7TC4YEbD/PndvlhRjbjo6uICC6xhfaa9lAhQ8FIH
	 mR++LqaXg4+bzDg4hBVSOawAYpr9pDcc+0I77vqS7yUwKJYRA27VvRqgOaqPvSlYGGjg+
	 nZSC7vyTTMY/tBGoNGCoRnCOBOQfxWzs7qLiWBsNwJbNtgT5ap4q19Wky/ahaNbp7cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587405;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=eEP7kMaOtorNyEMucl2+nhHmWBOY2qVNMQVzcLfVqyk=;
	b=kt7swuvs+t4ex0vCQVWrPHqunk7sZszGgOrDpbZKYMMg+VqvFrCxnK7rLDy8xrhZ6IP7
	 pY9JXHhpn4gFRLCNqQID2siquz7MwJBQCHS3MJiQwsj8e7n9ZcrHmVM0+z7+g6HOcezCn
	 MTXG5nfawWWh5DA/DsI8646dWAycwcYsyP+qVpXfBd+ANaSrBwhsNhU0p/OVdUoOtMP5E
	 8v6f61LkGWdXmDMbzhziq4eV4YsjRedX5ntNuW3QY6QTgaUz0kLHpP/AN/Pr72LqDLcmQ
	 5wBlm1lFiVCizVeCfI9xexDhKgr76BVlfAMxqr/vFNgmUNd8EkT5NGeOCc2PUnI+W6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKNayR2l;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Vu/769px";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E15606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E15606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKNayR2l;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vu/769px
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794587403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEP7kMaOtorNyEMucl2+nhHmWBOY2qVNMQVzcLfVqyk=;
	b=gKNayR2lZKuz81RXoDhoEpEnfrT899XBIDJ1SM1Y66tgmGUVHF9ypGzqnE/ei2gBdNF/Lr
	1ijJBT2whwcwW6ur8EetK5xyyrz3Wk+9SvBOuRAMkcUc1C6/xPTIzhyOpXAmQIEl8l6Nvt
	qIRQVas/rEetM1FEQ0Vku1UYWofZ3EA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-MLJ2gtG2M2m4u6CMqqnE_w-1; Fri, 13 Nov 2026 11:30:02 -0500
X-MC-Unique: MLJ2gtG2M2m4u6CMqqnE_w-1
X-Mimecast-MFC-AGG-ID: MLJ2gtG2M2m4u6CMqqnE_w_1794587401
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so1489249e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587401; cv=none;
        d=google.com; s=arc-20260327;
        b=oul+x6OwKOKMo+BOaZVzdDOD3KTwyD6rI1I/5RdsJFyVrCC7cAtqryf4x9KM4CF8aW
         7U9dnNtHMzaRpwF09CqnHh6oHBMp9jFQ5aL3bjoCSfTFbwK0CPsvZ4DRJsHfHkzqXYma
         kWDjJKfhnKd6yDJMRuo0TikO3LQ57AY5L3nR4iEcVWnsrLO1DVDGjIQKezGwvI3MXUg6
         /Av7+vFvhMVLetn75P/B6GJtbgjwpZeKOfQb6lBhPheJJcH4IUDbe/iv88V0opvVtjKu
         uizIjkRnv9f2v/uhQgSQFesDsEs5ANwJqRKvtdO5E78Jz6LMDrTxgoSiIDwNt3AvjjEo
         Fksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eEP7kMaOtorNyEMucl2+nhHmWBOY2qVNMQVzcLfVqyk=;
        fh=+8sbLS24bUjViHTEzGrX/SIat2pF3pLGnaoba++RyVA=;
        b=Wuo9CAtyiHmf6rKo3JZ1Y8bhS4SgVpe27kIhpBHNa8kHfcLFLHz2tNsdw3l05Sgq9y
         auFAryZgflTv59GXxvcjW4LSQuKH1CYeET2Euw+Ac63vJCRMzPTFoNy2GxjG8ahcu0xW
         PIEcbnmo4TW/m/GXL1FbIpcR/Fiy5YeBd/NGQMs4F9vzcoX2TXKhoVz3igQ8bKqbPMVf
         9f5l6Y6YTw7RtFkLi5gRZMBhfUfbGxbSOrcgvbbCvw42uyjABDutjIMGY0Tu7WmJin5n
         acHoRRxYyvpfmIyxO1d1WU8e7QZ1Uw/JD7asxgpLE2vsQYGV5LM0ArmVDoKnKNJ0yoon
         RAeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794587401; x=1795192201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eEP7kMaOtorNyEMucl2+nhHmWBOY2qVNMQVzcLfVqyk=;
        b=Vu/769pxZSxWBthtF3WIxVHtPREVqePr/juNUMGYVQfAu4WV526wqYL7f1rgX1ABn0
         qx7GV7UhK0Z0qJwVTfG3ILhaCkNjMib2lODVmAz7jzKzUT0bg6im4yqg2voDiczOFSZ9
         EBMrW8jXK1Cm0chcq4wfuae/ca3V1HxUhD16ISz7Ji5LJPnZVVAprtaGvf8eV96cNBnJ
         qHZ3XPiLSBdy3xGip7Vd6vYDjDj7WVTJuoCf9qi69NhQDSO8J7cizyE2c2LUuxMDbI2A
         mjjtVgxyNyvNglr6UAsKXnk66MS9zWzAVXhrAIy2+lssxnOOd182DkU4NHMFRdSnPmci
         6Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587401; x=1795192201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEP7kMaOtorNyEMucl2+nhHmWBOY2qVNMQVzcLfVqyk=;
        b=b15XIwjjCFf0T5Ps4HIf/8ysN0pNhQbpTcGUay+S2dLCxzL3xTTKfg3UKpZgieWOfv
         AjXpc/dbJrlEpxnk/l+pTXg++yPTnkRPjNOPq/BPleNxrOGqWoKZWyN61zv/RQZYDfT1
         +DDyuTvkrHTD/+nV4eKlUI5KoceJQC68WkXj6OCy7SrXnutKlQSbQeosvXEYKeBpXxe4
         XQHTL8qIHXglByrvsRuFG4hjOU6vmkbnJ41YqwPPFN95o7OpMZKJHH/bDNoAiGhj1OjN
         AcA/LPiObDMUBfIaw1ITQTJdIgYt1yDin/5PjY8p3F0F2zm0heQlQw0gANKYti0G61Pt
         0BAg==
X-Forwarded-Encrypted: i=1; AL+hErFGl+2UYKPiqxC+iRRgGt/9j4reSt1qNvrkC0hVxCZOHw1dV8QLdTxHtlst/Nvxhl9+masujdhwLU+/grc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EhqhHW/iErzwm6YaY7NHdbym3fWoNqFah4ExFTnFMpMp7ydf+
	/u1716/0il0DjmIEgBTShOU0eKOxFrEYia146nfsHLP9OKQ5GUEvbkqukiPD58bAj/cGeC6DsZo
	q/PfiDbAmPzKK8nkrfgt26UmYBrgoRd/l5LJPpgZkGaG7GeuCozjJWVWWH7gvBIEvAhjEfN/z5B
	JMjAqYqqFhD5GbzcUI8szOgPsjBYDWfgZcTZ7tACCM
X-Gm-Gg: AYBFou3pkWjbFRkl+Ny2Lv4eZhCqxUh1xRH/vVUz83ODJm1+ISxHmmJ9XMchuqmcb8Y
	7hvd8IxhZwPcQZr6U15XN0pW+fhyJ3BSUi0RDnDw76e1aR+AlIXVc5RAgXiDtjcQ3Usgqnpzwtl
	9g9CdofkqtfPa2VJP09fVuYWZh/9rt9maeX3E2xG5mjpM+mX47HgC5BR38
X-Received: by 2002:a05:6122:181f:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5ee34a9ced3mr1255847e0c.14.1794587400860;
        Fri, 13 Nov 2026 08:30:00 -0800 (PST)
X-Received: by 2002:a05:6122:181f:b0:5ea:9a2c:27a8 with SMTP id
 71dfb90a1353d-5ee34a9ced3mr1255804e0c.14.1794587400274; Fri, 13 Nov 2026
 08:30:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com> <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
In-Reply-To: <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 13 Nov 2026 17:29:48 +0100
X-Gm-Features: AclHuK8lYXvj3BWY91anNIdn8c3Z-vvQiyM-7UB6PuGhNufBqg0MsqHh1ScpGdM
Message-ID: <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>, 
	Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>, 
	Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Chen Yu <yu.chen.surf@gmail.com>, Adam Li <adamli@os.amperecomputing.com>, 
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>, 
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>, 
	Qais Yousef <qyousef@layalina.io>, Libo Chen <libchen@purestorage.com>, 
	linux-kernel@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Philip Auld <pauld@redhat.com>, 
	Joe Mario <jmario@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter, Chen Yu, Tim,

We have a workload where cache-aware scheduling (CAS) causes a
large regression: NAS MG class D [3] - a memory-bandwidth-bound
multigrid, 112 OpenMP threads, 26.4 GiB working set - runs 65%
slower with the llc_balancing switch on (25.5s -> 42.2s median,
n=3D5), because CAS aggregates all 112 threads onto one LLC. On
this system each LLC is a whole socket, so the process is left
with one socket's memory bandwidth for a working set 250x the
LLC size.

The check that should keep such a process out of aggregation is
this patch, merged as 808915f982c2 via the May enhancements series,
with the RSS comparison replaced by a footprint estimate from NUMA
balancing fault statistics following the discussion here. On this
Sierra Forest system that estimate stays at 0 for MG even with
NUMA balancing active, and the NUMA balancing off case Chen Yu
left open here costs the same.

On this platform the footprint check is the only safeguard that can
catch such a process. Of the safety valves listed in the new
sched-cache.rst [1], the thread limit is ~115 threads (80% of 144
CPUs) and the busy threshold is 75% utilization (no SMT): the
112-thread run above sits just under the limit and passes both,
and so does the 64-thread one (44% utilization). And unlike
platforms with several LLCs per node, where aggregation trades a
node's bandwidth for one LLC's, here it simply halves the
bandwidth available to the process.

PLATFORM
  2x Intel Xeon 6780E (Sierra Forest), 144 cores each, SMT off,
  288 CPUs. One 108 MiB LLC per socket; each LLC coincides with one
  NUMA node. Kernel: v7.4-rc2-based, kernel.numa_balancing=3D1,
  aggr_tolerance=3D1. n=3D5 independent runs per configuration, CAS
  master switch off (baseline) vs on.

RESULTS (runtime, lower is better)
  workload                          CAS OFF      CAS ON      delta
  NAS MG class D, 1 proc x 112thr  25.53s med   42.23s med  +65%
  NAS MG class D, 1 proc x 64thr   26.45s med   41.78s med  +58%
  NAS MG class D, 1 proc x 32thr   35.06s med   51.04s med  +46%
  NAS MG class C, 1 proc x 4thr     9.34s med   11.99s med  +28%

THE FOOTPRINT ESTIMATE NEVER LEAVES ZERO (MG class D, 64 threads)
  Traced live on the stock kernel with bpftrace (comm-filtered),
  across three CAS-on runs:

    - grp->footprint: 0 in 44,670 and 40,638 task_cache_work()
      samples over two full runs (min =3D max =3D 0), while ~7M pages
      (26.4 GiB) were resident. NUMA balancing was active: 8k-20k
      hint faults and up to 3.3M pages migrated per run.
    - In those two runs the footprint write never executed: all
      ~8k-13k task_numa_placement() calls per run (one per hint
      fault, via task_numa_fault()) returned at the scan_seq gate.

  WHY THE SIGNAL NEVER ACCUMULATES
  1. grp->footprint is only written in task_numa_placement(),
     which runs only when mm->numa_scan_seq changes. That counter
     increments only in reset_ptenuma_scan(): when the NUMA scanner
     has wrapped the whole address space.
  2. The scanner walks the 26.4 GiB of mappings at ~0.3-1 GiB/s
     (traced via mm->numa_scan_offset and change_prot_numa()
     return values), so one sweep takes 30-40s or more. The 43s
     benchmark completed 0 sweeps in two runs, 1 sweep (at t=3D33s)
     in a third. The accounting runs at most once per task per
     run.
  3. The signal is also small: a run accumulates only 8k-20k
     hint-fault events, 0.1-0.3% of the working set, below the
     108 MiB threshold even when a sweep does complete.
  4. And it is a rate signal, not a size: the increment is
     diff =3D numa_faults[MEMBUF] - numa_faults[MEM] / 2, which is
     zero at any steady fault rate.

  Cadence, coverage and formula each independently hold the
  footprint orders of magnitude below the resident set.

  exceed_llc_capacity() is evaluated on every tick and every scan
  epoch, but with footprint at 0 the comparison

      llc_bytes * scale  <  footprint * PAGE_SIZE

  is never true, so grp->cpu is never reset. After a 1.8s warm-up it
  pointed at the same LLC for all 44,661 remaining samples.

  Without NUMA balancing the check never triggers, as sched-cache.rst
  documents. With CAS on and numa_balancing=3D0 the same run takes
  42.2s, the same as with NUMA balancing on (42.0s).

WHAT THE AGGREGATION COSTS (MG class D, 64 threads)
  - With CAS on, 97% of thread-samples are on one node. The 26.4 GiB
    working set starts ~50/50 across the nodes and NUMA balancing
    then pulls it to the busy node (numa_maps 3.3M/2.7M pages ->
    6.7M/0.2M; 1.42M pages migrated during the run).
  - The cost is not on the CPU side: average CPU utilization is
    essentially unchanged (6164% vs 6029% - about 61 of the 64
    threads on-CPU in both configurations), and wakeup latency is
    49us on average, 0.73ms max (perf sched). What grows is
    UserTime, +48%: the threads keep running, each operation just
    stalls longer on memory.
  - The cost is the placement itself, not migration or remote
    accesses:
      a) 32 threads: memory fully converges to the busy node well
         before the run ends, and the run is still 46% slower;
      b) CAS on with numa_balancing=3D0: no migrations, pages stay
         65/35, and the runtime is unchanged (42.2s);
      c) CAS off with the process simply taskset-pinned to one
         socket (memory 100% local from first touch, no
         migrations): 40.3s, within the CAS-on range (40.6-42.9s).
    64 memory-streaming threads on one socket get about two thirds
    of the throughput they get spread across both sockets (Mop/s
    -34%), wherever the pages live. So the only effective fix is to
    not aggregate such a process in the first place.

QUESTIONS
  1. Was the sweep-boundary gating of this accounting known or
     intended? For a workload with a large address space it means
     the footprint sees at most one update per run; for a shorter
     one, none at all.
  2. Could the check fail closed when there is no usable estimate
     (warm-up, footprint still 0, NUMA balancing off)? RSS is a poor
     estimate of the working set, as Peter said, but it is an upper
     bound: if RSS fits in the LLC, so does the working set. Using it
     only on the permit side - aggregate without a footprint estimate
     only if RSS fits - would keep the gains for small processes and
     not aggregate the ones we cannot judge. The costs are
     asymmetric: a missed aggregation forfeits a gain, a wrong one
     cost 65% here.
  3. Our data supports Peter's point that LLC hit/miss information
     would be the better signal: the damage is purely memory-side
     (UserTime +59% at flat CPU% in the 112-thread run), and a
     memory-streaming process would show a low hit rate regardless
     of how well its footprint is estimated. Is anyone looking at
     that?
  4. Chen Yu mentioned that you are reworking the footprint
     accounting for the prctl v2 series [2]. Could the detection fix
     be part of that rework?

[1] <50a8055e38958cdc39e07435aaad56e4719b2bd3.1794507151.git.tim.c.chen@lin=
ux.intel.com>
[2] <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
[3] NAS Parallel Benchmarks: https://www.nas.nasa.gov/software/npb.html
    MG is the multigrid kernel: four V-cycles of 27-point stencil
    sweeps over a 3D grid hierarchy (finest grid 512^3 for class C,
    1024^3 for class D) solving a Poisson equation. Each sweep
    streams through a few double-precision arrays - a 3.3 GiB working
    set for class C, 26.4 GiB for class D - far beyond any LLC, with
    little reuse between sweeps: the kernel is memory-bandwidth-bound
    by construction.

The per-run logs, the placement/migration/sweep traces, and the
bpftrace scripts behind them are available if useful.

Regards,
Jirka Hladky
Red Hat


On Fri, Apr 10, 2026 at 11:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Fri, Apr 10, 2026 at 04:59:19PM +0800, Chen, Yu C wrote:
>
> > > This is pretty terrible. If you want LLC size, add it to the topology
> > > information (and ideally integrate with RDT) and make proportional to
> > > cpumask size, such that if someone cuts the domain in pieces, they ge=
t
> > > proportional size etc.
> > >
> >
> > If I understand correctly, do you mean the following:
> >
> > 1.Introduce a generic arch_get_llc_size() as a wrapper
> >   around the existing get_cpu_cacheinfo_level(), which
> >   returns the llc_size. Both the scheduler and RDT can
> >   use arch_get_llc_size().
>
> The tie in with RDT was more to affect the return of
> arch_get_llc_size(). Eg. when RDT takes away some ways for specific
> tasks, then the total effective size gets reduced for generic use.
>
>
> > 2. The sched domain stores llc_size in
> >    sd->res_size =3D llc_size * sd_span / arch_llc_span,
> >    and the cache_aware_scheduler uses sd->res_size for
> >    the comparison.
>
> Just so.
>
> > We will adjust the code accordingly.
>
> Thanks.
>
> > > Also, if we have NUMA_BALANCING on, that can provide a much better
> > > estimate for the actual size.
> > >
> > > Just using RSS seems like a very bad metric here.
> > >
> >
> > Got it. Currently we lack accurate memory footprint metrics in
> > the kernel. If we support user-provided hints in the future, we
> > can leverage RDT llc_occupancy metrics(Is it legal to use
> > RDT's metrics directly in the kernel? It would switch from
> > MSR-read to MMIO read thus less overhead). For now, let me have
> > a try how to leverage NUMA fault-in stats. If NUMA balancing
> > is off, I need to think more on how to avoid over-aggregation for
> > memory-intensive workloads.
>
> There is also things like this:
>
>   https://lkml.kernel.org/r/20260323095104.238982-1-bharata@amd.com
>
> But yeah, in an ideal world we could be looking at LLC cache hit/miss
> information... streaming workloads would have very low hit rate.
>
> But yes, possible prctl() controls could help, create tools to disable
> things per program etc.
>


--=20
-Jirka

