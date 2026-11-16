Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839765;
	b=x809dHUaFIN+e7ILBUnRQ7GWwVAgOgtjmQ9YzxmR2l+/3cfemWbZZGD1pA3kxrZ6LTPC
	 y/HG/CNG5dhTwpPphmSNCEecT6jK1EY2vCAgBINZiiJMmJq96vcoUfkp89Ui15pWLwHgU
	 eyud3kMB1y7bV/VU8YmOT+ZB4uZzA2IHq7QEvCb8oMWEHisUVepoNNPsenWHxteFJG+Vc
	 6ZS3D5nonqUt77wK3FMqfMwmg0xUoAKQjN4wa+go6AhY+Z1i4DDk/kZu957aEwqRaWyYB
	 qYieT61vvKeltxJ4EIB5dKUGVhybgg5tn2w2Keyeaj6l7TYyijpGHmgVYmFHsSXm4SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839765;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=P7yDWNTu2we0bT5SJ3PcIkc27E7XfMTIZd9HJ2D2k1s=;
	b=Mw9U7oKNFp0s/FvWJEyqAUvnKYCy458xPAnv6m5KCqRgEHHttNoLpGj3DOLK2RTYffkE
	 u+c6UXeZFA3qjA+zRxb45KbfqgJ70KhZ0OMxC+3vlYH8wAXKh+zJ6i0HZ+rLlxuVaafzj
	 3/Nhwh+wT8Zi01RkxsK4RJRoBaWzR9t15+/u0p/l8giVOiBG0nI66ePTFe9jqU0+nE8mE
	 CEqmmcNOGpoAd4G5AXczLDXCHIi5g2y9c7L+hbB3RefPwW3n66Gqhw49WYt9PbNXavOvD
	 qxIagIxummmCisn0Y77Ut5JUb7/EVkAfM0Ov6ID14FzZBZipWAPt5rx7x4RrGv9zJzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InYtdF6p;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTDfy+o4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E235606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E235606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InYtdF6p;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTDfy+o4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794839763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P7yDWNTu2we0bT5SJ3PcIkc27E7XfMTIZd9HJ2D2k1s=;
	b=InYtdF6peXPD97ZoDpNZK+hf2nVTVyOEzXswRWrG4mJ3hZPw0qZ5CPd+ycGeqOGB9rZl7G
	qK7mzwmCzUVjvja/OTZHIixy09TBpVBseL2j6WFdvm015be2DFyNzmtGT9NaE9xTGGVTDe
	msqTg85xbiIYCUNTRSrw/oBgREJ6sdw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Ig6opw2RMP-DSurFE48Upw-1; Mon, 16 Nov 2026 09:36:01 -0500
X-MC-Unique: Ig6opw2RMP-DSurFE48Upw-1
X-Mimecast-MFC-AGG-ID: Ig6opw2RMP-DSurFE48Upw_1794839760
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso822376e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794839760; cv=none;
        d=google.com; s=arc-20260327;
        b=TGnAUKMNmp3hcqZXsG86V8y5ibxvaYYUOwAs/TYb8s+O5kA9fEwGJtTgb/T6alQHBP
         4jU6I2tGrtFKaKgHIJ5Gn+C4SiHuYPmzog9QqdndVeHDSaWjHLZubXOjlF7sjyuZRWxK
         DsBFVPLjjxuLtNeif2Q5hzeda0mPEyyMLTjnpdWQ1O+w7ZqFkCIgqAh2ndo10qrF3vA1
         LiZSHEE0MV5keaPOzzyaIoHd3nlWtlZi1JmiG/vvSqPtO3kc6sraKwsFM5P0ZJgOMaEe
         9rXoNJoQIs4beibxz3U8bquxuA8/Nl52e881G2WuZz73Fdk8rvIyelZrAR5E5PjaANar
         saHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P7yDWNTu2we0bT5SJ3PcIkc27E7XfMTIZd9HJ2D2k1s=;
        fh=1pZMeZS7JqggqhPS/QNR+lGfsB4DtHCNkQ2p1bMPQCc=;
        b=jQhlw9J8VQ2O/Toe0CQTyjL6MElC+E3Y6nCDMdgDQOwDxhKy0DvaWaooV9NP5ddgZ9
         bM82i8hlpb9f3IMMQoTvuNLGSVsFotqUplqiLMagM8DpfpmRL2Bs69gwwtDhJjt9pnko
         sUy+t8yALoCzWNS262cO1WNMmPyyFhG2SxwFX6XQqSdHi5oOb3ECIrmsv1e+y9O2iKgK
         AKH+bvLOIkb93EbFHrFXxwWnYzszoL33TJTj+czneS0eDBhaOqqN6bzC4SdGAZT3rQBI
         JJL0HvMzgMLsPqR1cdQeeBXBRjUoFE5X/rqFWRAn29xOj2Log8K/FiyJO/dM4NDhOJWU
         wTZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794839760; x=1795444560; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7yDWNTu2we0bT5SJ3PcIkc27E7XfMTIZd9HJ2D2k1s=;
        b=mTDfy+o4DDg57t49E2iRme51mN0rBGO9Pn9ywXIz57X0EtweLAKsK67U3ij/AFIoxh
         4eGfunQjB7Wd+0jrDNneRd8Nlxkrb4hUj8adZ6+CU0GReahxIRFuNjV4r5bh2/B/zh7s
         cjcYR4Cjpy43+SA5lb2auqFK6SBMkE08c0iYFCpITc29kKC071vefYAFw8hPQxxyoRa/
         o4Rnb03g9ZjMTccPizC9bDci2qsBSe0UhCqyM4TPfudGSlllcV0d/er+xlqwPwuF0hZ0
         xYBwojvIgGh8yc+OYWqGRhOTlPg+yzuK04ABalMeZFQZtlJvXm8M2DdopoyUsFPHi5E2
         yDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839760; x=1795444560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P7yDWNTu2we0bT5SJ3PcIkc27E7XfMTIZd9HJ2D2k1s=;
        b=LoDnEae1kJD6eXop9FS8VOOvpuVy/6NYJKRr9NnCw1kYnuOdUtyXPYAuRgtIb2KIuS
         hgSmgZ8+mX89SPmHSJ+ijry2m+YjNdHcBD8TXK/iPOsnWL+r3jcELAXpITYpLatCpORE
         80nt8kslHxNLqwba/gj2mAglxL7a+SColgs+AYRBC/QMCxjVIJPlJ9XT9ZvdE+CEIrdn
         dm3HcU0NE9iDTqJT5TZxip/3AnfjX34epjP2nacEhIgRQLKHv8o2yHkR4ShCNANSjJfl
         AYbuFpF/YWtNPSVW2djVdfptDUnqS55UF6zwgFr5pFvSQvm0U9GhATP1UpUYN540bsSA
         CBGw==
X-Forwarded-Encrypted: i=1; AL+hErE7DgGiTzsvjHsdWqwVpfHERGL7EC8ZwzfQiTl2osba+YP0UPUYZb1vK6T4WJxpFM1Dcv/QwAX8mWB773Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eodx31Ar6AxNVeY4QyRr8kg/P0iT4qQFwENDtiz2j51yKZu5T
	x0lKrW7CytZZZo8Y8sq5A/hrkX8LhE7rahURWO3lkCgLHao324kng1sFJA5Eq56kdUyiRGZ6Oxf
	xydJ7pOd7MuQNmxsK6MFarIncCCwdTo6k0SZXQ/mU9N1INM+pkfEKXyCmv6GE9fbFNXAIdGBxQu
	mFoDt5yLDoRDRGQRZBDoFkpasXrmC8YCOwIk7cCrK9
X-Gm-Gg: AYBFou0U4Xmywkt1jilU5BMi+TryM7RXnTMj5nmti8r9vLttHIro7Mps7oGNl5VBUXD
	8d3JC5TQWlCMyFw2dZiFPNgUpp0+Omo9LqCqQISdQBfUFjqMPO4xn5JTaqJroY5YC039GnqIwX1
	crTKvVCBWkrk+WZbI4Ytnl52c5ibSCgZ1ceQFlSDgruSpBTdW7ITXK6Tme
X-Received: by 2002:a05:6122:2192:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee3468945bmr3563818e0c.1.1794839760428;
        Mon, 16 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6122:2192:b0:5c8:46e3:ec57 with SMTP id
 71dfb90a1353d-5ee3468945bmr3563795e0c.1.1794839759831; Mon, 16 Nov 2026
 06:35:59 -0800 (PST)
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
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com> <avqYbuJPHo4zLDOd@three-body>
In-Reply-To: <avqYbuJPHo4zLDOd@three-body>
From: Jirka Hladky <jhladky@redhat.com>
Date: Mon, 16 Nov 2026 15:35:45 +0100
X-Gm-Features: AclHuK-6v5g1IyHy4NHqdBjxK4vFs6GC0AbAskmDZR-KLhoXrJY_DF715dU2_Tg
Message-ID: <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
To: Chen Yu <chen.yu@linux.dev>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
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

Hi Chen Yu, Tim,

> Do you mean accumulate the pages into the group in task_numa_fault()?
> ...
> Would this decay cause a jitter of the footprint? Anyway, I thought
> what you suggested is the following for fix2 ...

I built and tested the sketch on the Sierra Forest box: a kernel built
from the same 7.4.0-0.rc2.19.eln159 source as my baselines, patched
with your sketch plus the fixes needed to compile it, and with one
change: the decay is applied once per group per sweep via a
last_decay_seq stamp, since decaying per task would halve the group
footprint once per thread per sweep.

The accounting mechanism works exactly as designed:

- The footprint accumulates during the sweep and crosses the
  27,648-page LLC threshold at t=4.4 s; the aggregation is withdrawn
  and stays withdrawn (grp->cpu = -1 in 96% of 27,796 samples). To
  answer the jitter question: with once-per-sweep decay I saw no
  oscillation in a run whose footprint reached ~3.95M pages.
- Removing the exit()/exec() subtraction held up fine as well.

But the regression is not fixed. NAS MG class D, 1x64 threads, n=5,
median time:

    stock rc2.19, CAS off      26.45 s
    stock rc2.19, CAS on      41.78 s   (+58%)
    sketch,          CAS off      26.57 s
    sketch,          CAS on      39.19 s   (+47.5%)

The regression drops from +58% to +47.5%: 2.6 s of the 15.3 s gap,
about one sixth, and the reason is placement hysteresis. The 2.1 s
window between the aggregation settling
and the gate tripping has already shaped the run: the threads re-spread
at only ~1 thread per second (4/60 across the two nodes at t=5 s,
20/44 at t=28 s), and the memory first-touched during the window is
59/41 toward the aggregated node, with NUMA balancing then pulling even
more memory there as the run continues. Withdrawing grp->cpu stops the
steering but does not undo the placement, the fault statistics, or the
page layout.

A few observations for the design:

1. Fix 1 (the RSS gate) looks critical for this workload class. MG's
   RSS crosses the 108 MiB LLC size within ~0.1 s of the allocation
   phase, so an RSS gate would refuse aggregation almost immediately,
   before first-touch lays down the skewed layout.

2. Fix 2's trip time is bounded below by the scanner, not by the fault
   count: the 4.4 s crossing decomposes into the 1 s scan delay plus
   the 2-3 s the scanner needs to reach the large VMAs of a 26.4 GiB
   address space. Even the theoretical ~1.8 s would arrive after ~60%
   of the working set is first-touched.

3. One caveat on the withdrawal path, shared by both fixes: whenever
   the gate trips after aggregation has been in effect, passive
   withdrawal (clearing grp->cpu) recovers almost nothing on this
   workload; the tasks re-spread at ~1 per second. An effective
   withdrawal would need to actively re-spread the tasks or reset
   their NUMA preferences. With Fix 1 in place this matters less for
   the regression class I reported, since aggregation is refused
   before it settles; it applies to workloads that grow past the LLC
   mid-run.

Happy to re-test when the next revision is posted. The exact version I
tested, on top of your sketch with the changes above, is below. The diff
is against v7.4-rc2; the hunks are in code my downstream patchset does
not touch, so it should apply to your tree as well.

Thanks,
Jirka

On Mon, Nov 16, 2026 at 6:45 AM Chen Yu <chen.yu@linux.dev> wrote:

---

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1446,6 +1446,7 @@
  int preferred_llc;
  /* 1: task was enqueued to its preferred LLC, 0 otherwise */
  int pref_llc_queued;
+ unsigned long total_footprint;
 #endif

  struct rseq_data rseq;
@@ -2396,6 +2397,7 @@
  u64 nr_running_avg;
  unsigned long next_scan;
  unsigned long footprint;
+ unsigned long last_decay_seq;
  int cpu;
  refcount_t refcnt;
  struct rcu_head rcu;
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1621,6 +1621,7 @@
  grp->next_scan = jiffies;
  grp->nr_running_avg = 0;
  grp->footprint = 0;
+ grp->last_decay_seq = 0;
  refcount_set(&grp->refcnt, 1);
  /*
  * The update to grp->pcpu_sched should not be reordered
@@ -1730,19 +1731,6 @@
 {
  struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);

-#ifdef CONFIG_NUMA_BALANCING
- /*
- * Subtract this task's footprint from the group before dropping the
- * reference, so the group footprint converges as its threads exit.
- * Unlocked for performance; clamp to avoid underflow.
- */
- if (grp && p->total_numa_faults) {
- unsigned long fp = READ_ONCE(grp->footprint);
- unsigned long sub = min(fp, p->total_numa_faults);
-
- WRITE_ONCE(grp->footprint, fp - sub);
- }
-#endif
  sched_cache_group_put(grp);
 }

@@ -2125,6 +2113,7 @@
  */
  p->preferred_llc = -1;
  p->pref_llc_queued = 0;
+ p->total_footprint = 0;
 }

 #else /* CONFIG_SCHED_CACHE */
@@ -3826,6 +3815,62 @@
  return nid;
 }

+#if defined(CONFIG_SCHED_CACHE) && defined(CONFIG_NUMA_BALANCING)
+/*
+ * Fix 2 (Chen Yu sketch, test build): accumulate the pages reported by
+ * task_numa_fault() into the group footprint as they arrive within the
+ * current sweep, instead of waiting for task_numa_placement() at the sweep
+ * boundary. Batched per task to limit writes to the shared counter.
+ */
+#define SCHED_CACHE_FP_THRESHOLD 10
+static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+{
+ struct sched_cache_group *grp;
+
+ p->total_footprint += pages;
+
+ if (p->total_footprint < SCHED_CACHE_FP_THRESHOLD)
+ return;
+
+ guard(rcu)();
+ grp = rcu_dereference(p->sched_cache_grp);
+ if (!grp)
+ return;
+
+ /* drain the per-task footprint into the group */
+ WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) + p->total_footprint);
+ p->total_footprint = 0;
+}
+
+/*
+ * Decay once per group per sweep: the first task whose placement() observes
+ * a new scan sequence halves the accumulated window. (Decaying per task, as
+ * in the original sketch, would halve the group footprint once per thread
+ * per sweep.)
+ */
+static void sched_cache_footprint_decay(struct task_struct *p)
+{
+ struct sched_cache_group *grp;
+ unsigned long seq = p->numa_scan_seq;
+ unsigned long old;
+
+ guard(rcu)();
+ grp = rcu_dereference(p->sched_cache_grp);
+ if (!grp)
+ return;
+
+ old = READ_ONCE(grp->last_decay_seq);
+ if (old == seq)
+ return;
+ if (cmpxchg(&grp->last_decay_seq, old, seq) == old)
+ WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) / 2);
+}
+
+#else
+static inline void sched_cache_footprint_accum(struct task_struct *p,
int pages) { }
+static inline void sched_cache_footprint_decay(struct task_struct *p) { }
+#endif
+
 static void task_numa_placement(struct task_struct *p)
  __context_unsafe(/* conditional locking */)
 {
@@ -3911,36 +3956,6 @@
  ng->total_faults += diff;
  group_faults += ng->faults[mem_idx];
  }
-#ifdef CONFIG_SCHED_CACHE
- /*
- * Per task p->numa_faults[mem_idx] converges,
- * so the accumulation of each task's faults
- * converges too - Given the number of threads,
- * it cannot overflow an unsigned long.
- * Racy with concurrent updates from other threads
- * sharing this mm. Acceptable since footprint is a
- * heuristic and occasional lost updates are tolerable.
- *
- * If a task exits, its corresponding footprint must
- * be subtracted from p->sched_cache_grp->footprint,
- * otherwise the footprint will not converge: the
- * exiting thread's footprint remains unchanged/undecayed.
- * See exit_mm().
- *
- * Lost updates and unsynchronized subtraction
- * in exit_mm() can cause footprint + diff to
- * go negative. Clamp to zero to prevent the
- * unsigned footprint from wrapping.
- */
- scoped_guard(rcu) {
- grp = rcu_dereference(p->sched_cache_grp);
-
- if (grp) {
- new_fp = (long)READ_ONCE(grp->footprint) + diff;
- WRITE_ONCE(grp->footprint, max(new_fp, 0L));
- }
- }
-#endif
  }

  if (!ng) {
@@ -3970,6 +3985,7 @@
  }

  update_task_scan_period(p, fault_types[0], fault_types[1]);
+ sched_cache_footprint_decay(p);
 }

 static inline int get_numa_group(struct numa_group *grp)
@@ -4210,6 +4226,7 @@
  p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
  p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
  p->numa_faults_locality[local] += pages;
+ sched_cache_footprint_accum(p, pages);
 }

 static void reset_ptenuma_scan(struct task_struct *p)

