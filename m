Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926989;
	b=MW0erj2VBU/dDTvM2/k/t4/8DgimZWT3hPY2ZvyNszLeKhf+Ii9HLNWVqEka0F585qZu
	 V7Ewq8dsZo3T69WSoiSHcr+cyCe/sT16MRNTI1lPKFPXxqWrDs+vIghFZVdj2+PnBj/x2
	 l+ecoevw7lDy6saBCzccHaNKmEh3HH/3ELKrFpo1fDsMbZm+gmMD0w3rJmx5F0waMzP8r
	 EHjY0hnc2a50y6FEA/qASN1uHMaAsUqeIUO+H5aFbcVkRFUsvnH67jCQBJ7KCmgWpzpKc
	 cm6eEbT1ovPria7ZGzsgfptd7TG6rQmJ81n5bijpn1EEC93wQzTdXebW286+JVj/EqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926989;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gD/9n3nl5odkvNAExLuUih2EyZuqc5ZqpMrrY1goBME=;
	b=K5jWmBcjPMz6I3M1Yw6SR5BxmaML57K/pPKI6BJiMM/gSsyzo1Bw9ln53OAi87A4e5bq
	 eX9cnWUUZxfytyGkI77HQsGNCH2Xr/gTezHbjVZ/JH1ORlHqQwnhR9Q/TbD9ZYBHzKOUH
	 4Zo8l/ho/pSBRDmkG29uetdF/C74FPmi8iXRrRbTv/vIbDcSHzlCGCVWmG/RmbF3svFCL
	 hQKGBrNX9SZrFSuz7ajxiulBXsL4D0c+EOHV7xj8Pn+Csh8RQPOvRqb6cVaOqJdexJcyw
	 n07Ec2OvCizpAtKmVA0cGzzqTMnX1oZGIPzfz/LSGuAvhqi8EkThnIJQxCZZSyKL+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BxKqABiA;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8FE606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BxKqABiA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794926988;
	bh=gD/9n3nl5odkvNAExLuUih2EyZuqc5ZqpMrrY1goBME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BxKqABiAoC5QhW7RWyxvO/yz4fg12aEx+Gj2TGknHxIW450euCGE8EZPb1tfXSSSk
	 kaHOFGEwxwuur3tT7Q9tjrC3vICcweRcGuTVAN8H7Bh/Za2NwOExZ+PdJx0Aoby201
	 CpZkfxe1OfNJ3wW7+GWXkb/iVUo3m1rrz9xrgkOID8ZS57x64QUTiwt9Yiw3cnaoJX
	 kUWbeqf0ABVAwwGPqWvrG3JDcfG+bF4Xcu2BuE60rQg5A6QAzsv5UDJ+7u9EsXaO4M
	 6LWsoEWNHOZJSGHXFyK7fUEK2t7bGZLnMYs/svMdwYQexks+20kGrbQn8Wt4Yr6Kwf
	 7WN0d7BwN08FQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jTSLh1JsczRZV;
	Tue, 17 Nov 2026 09:49:48 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: juri.lelli@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it
Subject: [PATCH 2/2] sched/deadline: Count only active CPUs when spreading extra_bw
Date: Tue, 17 Nov 2026 09:49:45 -0500
Message-Id: <0b11b9cdd6eaa6b2f5369214edcb8ae5dc247431.1794926626.git.mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794926626.git.mathieu.desnoyers@efficios.com>
References: <cover.1794926626.git.mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__dl_add() and __dl_sub() change the total_bw of a root domain. They
also spread the change over the extra_bw of its CPUs, which GRUB uses
for SCHED_FLAG_RECLAIM tasks. __dl_update() changes only the active
CPUs, so the cpus argument must count those. Most callers pass
dl_bw_cpus(), which does.

dl_task_offline_migration() and dl_add_task_root_domain() pass
cpumask_weight(rd->span) instead. That also counts the inactive CPUs of
the span. A span holds one while that CPU goes offline, which is when
dl_task_offline_migration() runs. Each active CPU then gets a smaller
share of the change than it should. A later change made with
dl_bw_cpus() does not undo it exactly. extra_bw stays off until the
next rebuild of the root domains resets it. SCHED_FLAG_RECLAIM tasks
would reclaim a little more or less than their share meanwhile. This
was found by reading.

Fix this by passing dl_bw_cpus() of the CPU whose root domain changes.

Fixes: 59d06cea1198 ("sched/deadline: Fix bandwidth accounting at all levels after offline migration")
Fixes: f9a25f776d78 ("cpusets: Rebuild root domain deadline accounting information")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/deadline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 8c0c982810c1..d80f3f6bdf3a 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1021,7 +1021,7 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
 			dl_b = &src_rq->rd->dl_bw;
 			raw_spin_lock(&dl_b->lock);
 			__dl_sub(dl_b, p->dl.dl_bw,
-				 cpumask_weight(src_rq->rd->span));
+				 dl_bw_cpus(cpu_of(src_rq)));
 			raw_spin_unlock(&dl_b->lock);
 		}
 		/*
@@ -1033,7 +1033,7 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
 		dl_b = &later_rq->rd->dl_bw;
 		raw_spin_lock(&dl_b->lock);
 		__dl_add(dl_b, p->dl.dl_bw,
-			 cpumask_weight(later_rq->rd->span));
+			 dl_bw_cpus(cpu_of(later_rq)));
 		raw_spin_unlock(&dl_b->lock);
 		p->dl.dl_bw_cpu = later_rq->cpu;
 		p->dl.dl_bw_gen = dl_bw_gen;
@@ -4283,7 +4283,7 @@ void dl_add_task_root_domain(struct task_struct *p)
 	dl_b = &rq->rd->dl_bw;
 
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw, dl_bw_cpus(cpu));
 	raw_spin_unlock(&dl_b->lock);
 	p->dl.dl_bw_cpu = cpu;
 	p->dl.dl_bw_gen = dl_bw_gen;
-- 
2.47.3

