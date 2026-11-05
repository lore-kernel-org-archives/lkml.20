Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873438;
	b=ov60wq7QmO/fjOQFwrPOg5th+YJf74MhsMWjkL8Ah6DXT+4VeUl5mxEmLPjukETAsEPC
	 E4AOOrCHcfA+/kVo4AkyWamf2YZ0ktoj7O/QCc7ifoJHW32vZ54E4iOzRWyiDHDCPUgKD
	 Ptid5a7G/wnluFAqNl7xTQaj4kV2V3KFYMm6poJBwy+y6rzjCcsxwHShIZOi0ldfmnTsJ
	 eCIV1nK97hUDDrFiKUvIviSADsccrght9G+6Wp0ZtvvResTVMOIkWZDMwBtorxyLyK9bu
	 npn68d13lARwh/JgRovgUzGMYZFE9rYKpWQdEXuLFOuilZod7aLuXS0oZxd3nRyxh2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873438;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FCfHVHX9X2HfeQukppjmDpIPvryXe//k2Xx93VGeC28=;
	b=yaOud4KokO3HpLL4w/5pqs7tMLZRxMROiL6nmFRjqxa7nX9xWozi5nQaJXXp7aHTqSXQ
	 IV/nJIuERy1nOiujiKGinmz1OLiePd6E1BgxrKtVoFi0RdgI0KQoX/2RA1mgmM8L+jmeZ
	 AiTjSOVhOu+/1DeUUkhfVRJpfLyzYx5ONUdPl6IWwvVSN37iNvZs64d2yJ8p8Qtxfpdjg
	 OsKsBlEj64uL6/0S5F3bCHr4xs6156q4Htq0jGE0jng5hOj6hOVH2C5pzEKIKLnJyImTL
	 I1BLlHl89twyVbFubOEyQxs1GIatzxefbMXMD14xRWyePNQiuDc12ZcCe5yzWrA7U2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GIvQFJze;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF3606AA41
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BF3606AA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GIvQFJze
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FCfHVHX9X2HfeQukppjmDpIPvryXe//k2Xx93VGeC28=; b=GIvQFJzeAdISiQiALvLAUamy+K
	j16UhUk5PAjafnJhsPky5kl9c0IxN1+CX3oGxybKBj64917/utxIP4KzMLGI3dzL/iywr67mSzv7t
	YM0M2V/F68PcMQMgwg83Ty9uYULzLJmT6ixVUBGkpkDJzCH3u8Gulkm6zswuxP0JDXgN9tl+hZx4g
	ozL4H1f99VPR+vAKrN12mPn01N8IumRhxiSpNgEqNr8Y5v238QvoeeNuZo73F7MTL3GJdFfJL/nVB
	gsz1PaipQ+dxo1Og1njknBcrtwAiKQy06EHgMHyzAXKXhD2opmF2Z86WqtFtVoYItDJH4h+D4jBAS
	RG2mzwBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuQG-00000002nvy-2x3x;
	Thu, 05 Nov 2026 10:10:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9AC163002F0; Thu, 05 Nov 2026 11:10:18 +0100 (CET)
Date: Thu, 5 Nov 2026 11:10:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Ahmed Abdelraoof <araoof@amazon.de>
Subject: Re: [PATCH RESEND] sched/core: Do not touch SMT siblings that have
 not joined the core yet
Message-ID: <20261105101018.GM1813469@noisy.programming.kicks-ass.net>
References: <20261104093418.GA1779021@noisy.programming.kicks-ass.net>
 <20261104181613.3978049-1-snishika@redhat.com>
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
In-Reply-To: <20261104181613.3978049-1-snishika@redhat.com>

On Thu, Nov 05, 2026 at 03:16:13AM +0900, Seiji Nishikawa wrote:
> On Wed, Nov 04, 2026 at 10:34:18AM +0100, Peter Zijlstra wrote:
> > Hmm, so I hadn't seen the previous one; but I did see this one:
> >
> >   https://lore.kernel.org/all/20261101221219.118052-1-araoof@amazon.de/
> >
> > And I'm thinking you're both tripping over the same issue.
> 
> Yes, it is the same issue, and both patches fix it.
> 
> > Now, I asked Ahmed if we couldn't consistently do:
> >
> >  -     for_each_cpu(i, smt_mask) {
> >  +     for_each_cpu_and(i, smt_mask, cpu_online_mask) {
> >
> > Does that work for you?
> 
> I tested your suggestion on v7.4-rc1 with the syzbot C reproducer.
> I used cpu_online() in the first walk, and
> for_each_cpu_and(i, smt_mask, cpu_online_mask) in the other walks and
> in __sched_core_account_forceidle(). To make the window wider, I added
> mdelay(2) between the first and the second walk. I also added
> pr_warn_once() for a NULL core_pick in the second walk. It crashed
> after about 60 seconds, right after CPU 1 came online:
> 

> It appears that CPU 1 was still offline in the first walk and came
> online before the second walk. start_secondary() calls
> set_cpu_online() without any rq lock, so the online mask can change
> while we hold the core lock.
> 
> I also ran Ahmed's patch and mine with the same mdelay(2), and neither
> of them crashed. Each ran for about 2700 seconds (about 2500
> offline/online cycles of CPU 1). So the mdelay() itself does not cause
> the crash.

Right, I did wonder why Ahmed's patch had that second iteration
differently. I suppose this answers it.

Of the two, I like your better for being more consistent -- but you're
doing the same thing 4 times, which does beg the question if we cannot
wrap that nicer.

How about so then?

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..eb3380c473ba 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6296,7 +6296,6 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *next, *p, *max;
-	const struct cpumask *smt_mask;
 	bool fi_before = false;
 	bool core_clock_updated = (rq == rq->core);
 	unsigned long cookie;
@@ -6343,8 +6342,6 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 
 	prev_balance(rq, rf);
 
-	smt_mask = cpu_smt_mask(cpu);
-
 restart:
 	need_sync |= !!rq->core->core_cookie;
 
@@ -6412,7 +6409,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * Tie-break prio towards the current CPU
 	 */
 	max = NULL;
-	for_each_cpu_wrap(i, smt_mask, cpu) {
+	for_each_core_cpu_wrap(i, rq) {
 		rq_i = cpu_rq(i);
 
 		/*
@@ -6445,7 +6442,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * For each thread: try and find a runnable task that matches @max or
 	 * force idle.
 	 */
-	for_each_cpu(i, smt_mask) {
+	for_each_core_cpu(i, rq) {
 		rq_i = cpu_rq(i);
 		p = rq_i->core_pick;
 
@@ -6490,7 +6487,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * their task. This ensures there is no inter-sibling overlap between
 	 * non-matching user state.
 	 */
-	for_each_cpu(i, smt_mask) {
+	for_each_core_cpu(i, rq) {
 		rq_i = cpu_rq(i);
 
 		/*
diff --git a/kernel/sched/core_sched.c b/kernel/sched/core_sched.c
index 43e0bde3038e..d56be1c31435 100644
--- a/kernel/sched/core_sched.c
+++ b/kernel/sched/core_sched.c
@@ -241,7 +241,6 @@ int sched_core_share_pid(unsigned int cmd, pid_t pid, enum pid_type type,
 /* REQUIRES: rq->core's clock recently updated. */
 void __sched_core_account_forceidle(struct rq *rq)
 {
-	const struct cpumask *smt_mask = cpu_smt_mask(cpu_of(rq));
 	u64 delta, now = rq_clock(rq->core);
 	struct rq *rq_i;
 	struct task_struct *p;
@@ -273,7 +272,7 @@ void __sched_core_account_forceidle(struct rq *rq)
 		delta = div_u64(delta, rq->core->core_forceidle_occupation);
 	}
 
-	for_each_cpu(i, smt_mask) {
+	for_each_core_cpu(i, rq) {
 		rq_i = cpu_rq(i);
 		p = rq_i->core_pick ?: rq_i->curr;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c5633524a..1b57910288bc 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1534,6 +1534,25 @@ static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
 	return &rq->__lock;
 }
 
+/*
+ * A CPU coming online is set in cpu_smt_mask() before
+ * sched_core_cpu_starting() links its rq->core to the core leader.
+ * Until then it does not share the core-wide lock, so it must not be
+ * touched as part of the core.
+ */
+static inline bool sched_core_sibling(struct rq *rq, struct rq *rq_i)
+{
+	return rq_i->core == rq->core;
+}
+
+#define for_each_core_cpu(i, rq) \
+	for_each_cpu(i, cpu_smt_mask(rq->cpu)) \
+		if (sched_core_sibling(rq, cpu_rq(i)))
+
+#define for_each_core_cpu_wrap(i, rq) \
+	for_each_cpu_wrap(i, cpu_smt_mask(rq->cpu), rq->cpu) \
+		if (sched_core_sibling(rq, cpu_rq(i)))
+
 extern bool
 cfs_prio_less(const struct task_struct *a, const struct task_struct *b, bool fi);
 
