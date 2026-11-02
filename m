Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626774;
	b=axN5+mCJHiNSZz19eSVrQlVEnxmXgFxyDUAtSSCc5BKoWcerWaqhJr7kTF3VI+WjrvAR
	 DwvKzoK9IpnoMKWOXKoe48t+o1PjqCbtFel8FX1Zcyjq4C88HLymMk3ONj7SeEl3Dv8q+
	 ljRceu0Fr8vz7cCGjqlzylCqVmRfY2cjgu7eR66GKznZ2qKDQ+A23qaTCuiznwKBfe0de
	 jC/M6u0y/bib/rUhZt0WXLIg4sSzYzbh93jt7+zXgmfPyMZUpqiNRmc2/z1k7o5DWsycd
	 idg/rPJ5IlYHIV0JohJRgytW/zyu0LgCDjzPAuCAdGMT7pIxTiFFPuWpIuAOnVR4ftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626774;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
	b=QbWsrRhjAJ7vbcVKUD9WGX8ae0OuUGn3xQ6oVWddpWVtPTik7s2x76/4V8v9pJAQKepR
	 P8B93jEz0G3suH/dUWVSNXqo5Oew/dNrcayTAkGbS+4qNQ/8AkBWZ35qJ0dTKJutPmnf8
	 FJkwHIWHV3HVRyRbyPL/gzFXZdieFGzBccOsMfYIUbV7X0Z+Km6pvcZAtwaNuuRa6VVrv
	 LfgijYo/mQf9fCcpHxHHQpogzggxSQoGbZnviqfFlON0pTA79Qt92oD2bdqkOpbA05ua2
	 JOBHxLQY63iNWHioHbpc1VbS/R9BLJfZ8GGGt8WBFYZ7Pq/Qxd9CsE3HDWInr5gOmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFbJVB1p;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=paydM+AM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB01E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFbJVB1p;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=paydM+AM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793626772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
	b=ZFbJVB1pHLSeRGa8X2SKdcggfkkuxKMgMwZL2TcDfWKp4WtVMrAxXSF9zzD31ohSWwv11S
	e3HfVFj/6UfbW9Gh6cIv7cwwCPuaxUM0Wt/IPKzxCo0dhTa5JgFnJGPQXWqfvHi3w4xXJR
	h0LHeJtxO7c+u+FZHXouRXiwikkq5eU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-H5YyzBqwMmeRHxRI17xkKg-1; Mon, 02 Nov 2026 08:39:20 -0500
X-MC-Unique: H5YyzBqwMmeRHxRI17xkKg-1
X-Mimecast-MFC-AGG-ID: H5YyzBqwMmeRHxRI17xkKg_1793626759
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso1682088f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793626759; x=1794231559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
        b=paydM+AMHzzAlZygzTr0BBG+/DyD2fz8CAqTZLCpSZsfKEXWCeprSbJd7qMVEL1a/o
         R0AMnrW+Txc+7YLtKzunkfMoUYfdvnsly1y3OW/MEvKcqQZYhAS/hFUrgtMda1d19SF4
         1nsjBhNsLvj/jbr96TKj7Am7ciaw2UY0D5qalfdYLWqyN8h2y8xBcTCSHQ0b7cwx26jc
         IWhe3nAWI1kqsIfsP6N3VYNe4kg7LX+SQ0AqQgGjM5Uo57efC9Nmot4b4o2S1cbEGIAK
         J/dyRMG8ic9S95/ARlgiqdgcXe8qYkPpzJiVHBPtII2PrbvQ0xj7gQLaXiemnPZjNGNE
         imaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626759; x=1794231559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFJVdr2pKdNME7t4AJW04aj4Lc5pq236bqQdeqyqOvo=;
        b=DsHuJZE+NuHoCLo2dMXn4ohFfM2cW5aDIziHmE+C5k90hiD87BjC2GSHA8nU7rxYp4
         8OlmJBSILN9SV8dVwhRu6wHUh3XDMJucUQkUJvImsPDYbaKiPao+f3Ziyd4T8V6aTYl0
         rsL6YMQbN6+OBJNekUDHz/17nwo+KSn0KfYypiUpVW4Cq00FFwj+ATYsytSIjJLVb5x3
         Wnq7F96Pc90R6Wyo58MvhzOBPWs+l67m3Msl10n1L21x0ljbtRQ6D1bSVHzNbCAu0NTZ
         X1z3lpk7Gcm8AL6pLfeF+GTYU4VOKUse+YuDdUeyT635lpxcRp7aTLzLOR+67B8xZGS8
         T38g==
X-Forwarded-Encrypted: i=1; AKwUvBxWHk/pGL7+pocgrI+bBVIEMtWFIVD09MC2dKaW3yo69+sBr2xR6Un7G2LC4qdg4X+EAAUv4wP0v6nFcQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C0guotGfWUBeqP5opGCwlSM/8oknBp9Cz6JM/Bo7DW08J1GbM
	+IeBSR02h6DlxBqCfEKa9rA75/a8IuhI31X+zDd5YonHsUJlujsMcQPtM3SwJYvSUubDsO++9GZ
	vsiaiAmc62KQfILgedqIPoGEw9wUBsH6LNZZ/hnN8DRspZsOguXvnzE9kb9qYvE5ddw==
X-Gm-Gg: AYBFou1dTCR4/M41W9fwPLMYDy16xLlEYV5a7QT6NmVhMG06tGHd3clXH9pUBBh5v4x
	xGiphSUQhn8uEptXm+ezamuHgiiJWhWJNu+9c6/oECf05aXXCE61w97Q8ukoEk2dnfbmC2sL4rz
	umVtqkE3EXREC+dRa82gvCSjvpY6n29q99TDnXHDI2SEOz1v0G2DsKtdkwGGhJuH/2L3n6+t2kO
	C+Z7LBGZUPEsB5a2ZbfWN2Of63nkW81LNis6AX1yXFVTtIac3fCiCvyJBGvtcU/gSHdyr2GONc8
	KxNRURXDE2F2LQ2fR++T6acXspJkJABG9jADZVPaaut2u0IzUWrDKb6jcVQL2g9/6CiFl/D9xEu
	wWhNfAv4ezVfQYBQA1UbczDw/0ek6w9PZ1eBcBXe48sViyQzBoo8n8wOpLBF9YQ293niQK2BTdN
	juoQ==
X-Received: by 2002:a5d:588a:0:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-48e6e2ff039mr22169065f8f.22.1793626759006;
        Mon, 02 Nov 2026 05:39:19 -0800 (PST)
X-Received: by 2002:a5d:588a:0:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-48e6e2ff039mr22168991f8f.22.1793626758540;
        Mon, 02 Nov 2026 05:39:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm20245980f8f.20.2026.11.02.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:39:17 -0800 (PST)
Date: Mon, 2 Nov 2026 14:39:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Weiheng Qiu <weihengqiuu@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, cgroups@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline, cpuset: total_bw corrupted by a sleeping DL
 task's cpuset move
Message-ID: <auiSg2cB6BSjtg9a@jlelli-thinkpadt14gen4.remote.csb>
References: <14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com>

Hello,

On 31/10/26 17:08, Weiheng Qiu wrote:
> Hi,
> 
> Moving a sleeping SCHED_DEADLINE task from the root cpuset into an
> exclusive partition and back, before it runs again, leaves the root
> domain short by the task's bandwidth. The root then over-admits, and
> when the task exits its total_bw underflows: small DL requests fail
> with -EBUSY while large ones wrap in __dl_overflow() and are admitted.
> The partition also keeps a stale reservation.
> 
> cpuset_can_attach() and set_cpus_allowed_dl() both decide through
> dl_task_needs_bw_move(), which tests task_rq(p)->rd. A sleeping task
> is not migrated when its affinity changes, so task_rq(p) still points
> at the CPU it last ran on, and on the move back the root domain is
> neither re-credited nor the partition debited.
> 
> Reproducer below; needs root, cgroup v2 and debugfs, and turns the
> last CPU into a partition, so use a test VM. On mainline c339f4010dea
> with 4 CPUs:
> 
>   cpu3 is a partition; sleeping DL task 76 (0.5 CPU) in the root cgroup
>   total_bw in CPUs (change since start):
>   start:                     root  0.650 (+0.000)   partition  0.050 (+0.000)
>   moved into the partition:  root  0.150 (-0.500)   partition  0.550 (+0.500)
>   moved back to the root:    root  0.150 (-0.500)   partition  0.550 (+0.500)
>   (expected: +0.000 and +0.000; the task is in state S and has not run)
>   root domain admits 28 more 0.1-CPU tasks: 0.650 + 28 x 0.1 = 3.450 CPU
>   reserved, limit 3.000 CPU (3 CPUs x 1000000/1000000)
>   those tasks exited:        root  0.150 (-0.500)   partition  0.550 (+0.500)
>   the DL task exited:        root -0.350 (-1.000)   partition  0.550 (+0.500)
>   DL tasks left: 0; new 0.010-CPU request: Device or resource busy
>   DL tasks left: 0; new 0.500-CPU request: accepted
>   after a root-domain rebuild (recomputed): root 0.150, partition 0.050
>   moved in while asleep, then SCHED_DEADLINE: Operation not permitted

Thanks for the report and reproducer.

Can you check if what below helps with it?

Best,
Juri
---
 kernel/sched/deadline.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 4d66e7298b686..2eebb688891a8 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3324,14 +3324,26 @@ static void task_woken_dl(struct rq *rq, struct task_struct *p)
 	}
 }
 
+/*
+ * Find the root domain where a DL task's bandwidth is currently
+ * accounted. For a sleeping task that was moved between cpusets
+ * without running, task_rq(p)->rd may be stale. Use the task's
+ * current cpus_ptr (not yet updated to the new mask) to find the
+ * actual root domain.
+ */
+static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
+{
+	unsigned int cpu = cpumask_first_and(p->cpus_ptr, cpu_active_mask);
+
+	BUG_ON(cpu >= nr_cpu_ids);
+	return cpu;
+}
+
 static void set_cpus_allowed_dl(struct task_struct *p,
 				struct affinity_context *ctx)
 {
-	struct rq *rq;
-
 	WARN_ON_ONCE(!dl_task(p));
 
-	rq = task_rq(p);
 	/*
 	 * Migrating a SCHED_DEADLINE task between exclusive
 	 * cpusets (different root_domains) entails a bandwidth
@@ -3339,16 +3351,16 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 	 * domain (see cpuset_can_attach()).
 	 */
 	if (dl_task_needs_bw_move(p, ctx->new_mask)) {
-		struct dl_bw *src_dl_b;
+		unsigned int src_cpu = dl_task_root_domain_cpu(p);
+		struct dl_bw *src_dl_b = &cpu_rq(src_cpu)->rd->dl_bw;
 
-		src_dl_b = dl_bw_of(cpu_of(rq));
 		/*
 		 * We now free resources of the root_domain we are migrating
 		 * off. In the worst case, sched_setattr() may temporary fail
 		 * until we complete the update.
 		 */
 		raw_spin_lock(&src_dl_b->lock);
-		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
+		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(src_cpu));
 		raw_spin_unlock(&src_dl_b->lock);
 	}
 
@@ -3358,10 +3370,13 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
+	unsigned int cpu;
+
 	if (!dl_task(p))
 		return false;
 
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	cpu = dl_task_root_domain_cpu(p);
+	return !cpumask_intersects(cpu_rq(cpu)->rd->span, new_mask);
 }
 
 /* Assumes rq->lock is held */

