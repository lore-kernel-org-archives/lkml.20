Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052974;
	b=zc6krdlvoKk3ygP1hkD/PLz3vJILIWvNxO080SkllJf8AtEFFZyp1T4Vfg5vs77ZpR8e
	 iE0nrayv8spx+rp5FQltb95m7VJ1yKpQxaAak59eXI4mgnmEJWs4ZF7debNNdVMORkEgB
	 1oLxf+suKNzjDzMPVhOCUVBJaOftJ/TCjmeGo8KsVhMTYBwbpSehmcqOq7upxiuMmPZYs
	 Qbv57/EBtLqiN2pCrymp+SSZrkcSY6Wv9lmyPBbnLyTkClCSANq4t+zjHC4w6w///1/mC
	 hJFkzGeMDdXUg27rQwo47LVVCHuAi44Ucp2ahVSjev4Lonfb6UZ9qktfYBlkumloGtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052974;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=YIKH48GIghIfUTjXfAhwnvcGDx6l/W2tk7wPoJOeVX4=;
	b=0HK8G+5jlYUXFg29RIRYtp7JBxLrOG1AFRcA85lfuY8Hpav1jIr3M4zrG+linuNKlUqW
	 /NRDLGfYelP9Hj9zXeh5JZhKbcV//x8xl9Z7khUNBFECbyHlhf1WYoDyZp51WPNdBvTq0
	 DPcX2nAdLhCewaU7GpFRN8tOE12wAPpcyzgZk//6C8neMHQ0LW3KfZxBC5LphCf3tyz/3
	 cwt180VPox7lqQxc3bLwr859sgnCC2z0GHLj09YibwUhJhYwMvfLCANZ1agBr+OGS5Bzn
	 PpsZGjtLI5fMAR3yuwQ8AgBWDYJKk75g4WzwUswkOSQRCLlioPpMDHKL9ExNSFKl+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o08rckok;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3B606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD3B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o08rckok
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=YIKH48GIghIfUTjXfAhwnvcGDx6l/W2tk7wPoJOeVX4=; b=o08rckokL+CWBB1oXV6bTz37Ex
	dOQR7VkIAu0jFax8U95s6hPEeOZr5pargLRZjZkScpsBfh1ZZej9f5I/y/e1Ws/Nd33D1slQOgyiW
	myTW75c4k9eZXYxd12ZfLzecYrBqNrwCU73Rw8/5g4f0/xXCmdIDf+p+PUHi+kE6rvVjpmcf1TebQ
	9F1x1btMN5jdZtBo6aIyL1E37NbFoJSMILXvCk3+33avmGAeV4sxyKuHTJrjpm3Dj/bhQKXmuqdYT
	vx495G7yQrbTPvxh2zUUWc3VFWAPKFm67KTEH8fQtxqH5y5SWulcoq1uA0Sw4x2vNFFzfIsd/RwFs
	J8auDTSg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8A-000000008yw-3e9K;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 363E3303172; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.770077779@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 09/12] sched/rt: Add early exit on balance path
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add/make consistent an early exit on the balance_{rt,dl}() path. When there are
no pushable tasks, there is no point in taking the rq lock and all that jazz.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/deadline.c |   10 +++-------
 kernel/sched/rt.c       |    3 +++
 2 files changed, 6 insertions(+), 7 deletions(-)

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3250,17 +3250,13 @@ static void pull_dl_task(struct rq *this
 				   src_rq->dl.earliest_dl.next))
 			continue;
 
+		if (!has_pushable_dl_tasks(src_rq))
+			continue;
+
 		/* Might drop this_rq->lock */
 		push_task = NULL;
 		double_lock_balance(this_rq, src_rq);
 
-		/*
-		 * If there are no more pullable tasks on the
-		 * rq, we're done with it.
-		 */
-		if (src_rq->dl.dl_nr_running <= 1)
-			goto skip;
-
 		p = pick_earliest_pushable_dl_task(src_rq, this_cpu);
 
 		/*
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2307,6 +2307,9 @@ static void pull_rt_task(struct rq *this
 		    this_rq->rt.highest_prio.curr)
 			continue;
 
+		if (!has_pushable_tasks(src_rq))
+			continue;
+
 		/*
 		 * We can potentially drop this_rq's lock in
 		 * double_lock_balance, and another CPU could


