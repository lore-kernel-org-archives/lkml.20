Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB740EB91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913697; cv=none; b=GGAYembMM3J+iADWyii4yNjCvu7H1UBhSSe+5j3KP+0kAtQ0UxJaJ3mu+f49ilXyv4AJHZF6HIXHJWGLQ93ymyzp+pa0yVO1w8zMFhp+L8X6Y6Zyxa1AOUH++XVPy76/ayckQqwyiAKh4cHwGZ1/iYj7nZGVX6e1XkTeCUkg3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913697; c=relaxed/simple;
	bh=M9L/8ers4EBHSjNxIucwGQmOBSlS1KyQ7jpC7KaSLxg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rv+5TcPbeMDVuoeKjcrRMv25OpwjIEnmGfAkjBdpfYFCGvhp1H18RdTagE3w7iDkFhjA4Wp9SGuyIEqDvm2fpIdW2Bj4PMrY529i1j5E1b5oYNC6ixZSJetcZ5neBJOcR3UqfZmIqIsfowyxtn3u0d78MkmDw3XOpG+cKQL1AuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sobi9/wC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sobi9/wC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ikZKHh438sPD3ZO6RnnPs393nybtZ4oMoD2bs/hJ8uU=; b=sobi9/wC5OMW+9t5zSar0pPlJJ
	ePHujL/11xNyklWIMzregODg3mZPV/rjMLdysupHc4YlAIyg3c+OHLQ96ZoUZ5ClomhXzjqib2gIO
	hTnc99arszPDLL09BycYNGE7vb6cxrtSoy9xF0/kr404aQBfH9T8BLBgUVjBDMAdp6xf96q2Vu63v
	QLtYmw52l1aF/YsUPQEMFltGp6EI2ecb7fI8iTz3mNltYmzIcCiyk8phdL+bcaTq4lXTa3BKum5AC
	GXpsTbx9Jw9RGfFesx2n8CYYSbFj49AReOqE5ZjsP43Clwq5I894CFIozAnxbx40sRtDol1EPIuRi
	RF9vwCWA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1T-0000000EWAn-2X1j;
	Fri, 28 Aug 2026 10:41:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E697C303152; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.890793421@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:05 +0200
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
 tj@kernel.org
Subject: [PATCH 6/7] sched/fair: Push sched_balance_newidle() unlock down
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

By pushing down the this_rq unlock, there are more cases where the lock isn't
dropped.

XXX needs numbers

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13417,6 +13417,7 @@ static int sched_balance_rq(int this_cpu
 			struct sched_domain *sd, enum cpu_idle_type idle,
 			int *continue_balancing)
 {
+	bool lock_rq = false, unlock_rq = idle == CPU_NEWLY_IDLE;
 	int ld_moved, cur_ld_moved, active_balance = 0;
 	struct sched_domain *sd_parent = sd->parent;
 	struct sched_group *group;
@@ -13485,6 +13486,12 @@ static int sched_balance_rq(int this_cpu
 		 */
 		env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
 
+		if (unlock_rq) {
+			raw_spin_rq_unlock(this_rq);
+			unlock_rq = false;
+			lock_rq = true;
+		}
+
 more_balance:
 		rq_lock_irqsave(busiest, &rf);
 		update_rq_clock(busiest);
@@ -13613,6 +13620,12 @@ static int sched_balance_rq(int this_cpu
 	if (!need_active_balance(&env))
 		goto out_unbalanced;
 
+	if (unlock_rq) {
+		raw_spin_rq_unlock(this_rq);
+		unlock_rq = false;
+		lock_rq = true;
+	}
+
 	scoped_guard (raw_spin_rq_lock_irqsave, busiest) {
 		/*
 		 * Don't kick the active_load_balance_cpu_stop,
@@ -13706,6 +13719,8 @@ static int sched_balance_rq(int this_cpu
 out:
 	if (need_unlock)
 		atomic_set_release(&sched_balance_running, 0);
+	if (lock_rq)
+		raw_spin_rq_lock(this_rq);
 
 	return ld_moved;
 }
@@ -14582,8 +14597,6 @@ static void sched_balance_newidle(struct
 	t0 = sched_clock_cpu(this_cpu);
 	__sched_balance_update_blocked_averages(this_rq);
 
-	raw_spin_rq_unlock(this_rq);
-
 	for_each_domain(this_cpu, sd) {
 		u64 domain_cost;
 
@@ -14634,8 +14647,6 @@ static void sched_balance_newidle(struct
 			break;
 	}
 
-	raw_spin_rq_lock(this_rq);
-
 	if (curr_cost > this_rq->max_idle_balance_cost)
 		this_rq->max_idle_balance_cost = curr_cost;
 


