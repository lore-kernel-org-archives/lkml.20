Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052974;
	b=ULCIoKfs4qctFMFore18S0OxJjHgwIDZlQYM5GYWs2ky3+cMDFTHNlvRzEJPwWxoTc7l
	 caJG/CHbw+nwzw58PYi+fWWp2XNdWb0TGZjzLILGq2wRM52wJQlRA10t4Ji08JTZyPvy7
	 zn7WTdPeDHGynFevr/e2E5EU/1ZIbyDjzmAi+KjgfxHy9WqWZF6VKPsHKTS5kqtKNamtp
	 cjvrwCMt3JRPqUIMiOatbXxtQSWVKChqbEq2ATQuXOHl6GVl9QPdNe6XXvIfD/Pjefqp+
	 MoJK6drTzxkFZ0ffjqW2TKk8qzmC0A6Oa0FpcBIkxNnNZsA5oIqOiF7VPUUWoVmbgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052974;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=ioFgQ7N49IOeu5G6JitL28+VWWaLMEydcZMY6/RaQSw=;
	b=uwHwqzpNGqM3knRcSQ6gVAXfYR5D/h9Z/azcQtSN19dnBSmPh2pU09cRwkMBmI9u29sL
	 5E5SOBYRNJxzjEZ6506gAnjDU+SxLaiGCgiUaUkoR8aVkASrDit8TSbno3eUGpllzePCQ
	 jzpM+gR/V180pDlzJjWQ81euXvzIVwvRitzcOsY7cZj9McuxHQnzZ1wBoETgXopr6VV6e
	 5OZ8BtEU8gOcKUdeECQr9nTZXvzT2dOz86JXGwEKnr6G/LRBBtewdu/FXYNXgkWNFB5pA
	 uUmZRm/AkE5lv1DPdROQf2Hvig6IBLUJMb2AeuYQugt+QfP26cAoWlCKjtcLzXGKJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bzjaD7p1;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F184606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F184606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bzjaD7p1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ioFgQ7N49IOeu5G6JitL28+VWWaLMEydcZMY6/RaQSw=; b=bzjaD7p1lUVzGFtu7gqHruovYI
	T/ntbzYtIofCFytGu+1PbePXN3Lyo9f3KLM6H5YLGwiou1UVsRKiyX5O8VSpgSiibxaEoIZZ31/MM
	3y5q1cg9MX/8VkF4+0NgWn5hAe49iI9fHfM7p1exd9Dg6h3T5F0K71aCIRsLtihIGoaXbpYBX1yai
	eJMz4zA+FOv7S+2bpn0dQlaj/TPngQkECk5cZYL1/6P6eL5/TyYyPmT9HSxkgoVRFGH+AMLPXF31x
	WKh2bjMbDKOcnr+Rp08mQOtblNqRhpxZA3VKdfz09KilLDU4WVftyIY5X0TUUnILvJZQpu44esxa1
	UnyJvJvg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8B-000000008zA-0Smg;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 4058A303310; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120208.040877914@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:24 +0100
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
Subject: [PATCH v2 11/12] sched/fair: Push sched_balance_newidle() unlock down
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

By pushing down the this_rq unlock, there are more cases where the lock isn't
dropped.

XXX needs numbers

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13706,6 +13706,7 @@ static int sched_balance_rq(int this_cpu
 			struct sched_domain *sd, enum cpu_idle_type idle,
 			int *continue_balancing)
 {
+	bool lock_rq = false, unlock_rq = idle == CPU_NEWLY_IDLE;
 	int ld_moved, cur_ld_moved, active_balance = 0;
 	struct sched_domain *sd_parent = sd->parent;
 	struct sched_group *group;
@@ -13774,6 +13775,13 @@ static int sched_balance_rq(int this_cpu
 		 */
 		env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
 
+		if (unlock_rq) {
+			lockdep_assert_rq_held(this_rq);
+			raw_spin_rq_unlock(this_rq);
+			unlock_rq = false;
+			lock_rq = true;
+		}
+
 more_balance:
 		rq_lock_irqsave(busiest, &rf);
 		update_rq_clock(busiest);
@@ -13902,6 +13910,13 @@ static int sched_balance_rq(int this_cpu
 	if (!need_active_balance(&env))
 		goto out_unbalanced;
 
+	if (unlock_rq) {
+		lockdep_assert_rq_held(this_rq);
+		raw_spin_rq_unlock(this_rq);
+		unlock_rq = false;
+		lock_rq = true;
+	}
+
 	scoped_guard (raw_spin_rq_lock_irqsave, busiest) {
 		/*
 		 * Don't kick the active_load_balance_cpu_stop,
@@ -13995,6 +14010,10 @@ static int sched_balance_rq(int this_cpu
 out:
 	if (need_unlock)
 		atomic_set_release(&sched_balance_running, 0);
+	if (lock_rq) {
+		raw_spin_rq_lock(this_rq);
+		__release_ctx_lock(__rq_lockp(this_rq));
+	}
 
 	return ld_moved;
 }
@@ -14878,8 +14897,6 @@ static void sched_balance_newidle(struct
 	t0 = sched_clock_cpu(this_cpu);
 	__sched_balance_update_blocked_averages(this_rq);
 
-	raw_spin_rq_unlock(this_rq);
-
 	for_each_domain(this_cpu, sd) {
 		u64 domain_cost;
 
@@ -14930,8 +14947,6 @@ static void sched_balance_newidle(struct
 			break;
 	}
 
-	raw_spin_rq_lock(this_rq);
-
 	if (curr_cost > this_rq->max_idle_balance_cost)
 		this_rq->max_idle_balance_cost = curr_cost;
 


