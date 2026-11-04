Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816190;
	b=jgqIQFy5xrkEuSueqxymq87Z6mEwwUQdcyg8xAakuf/ut/UYwrL7DaeT/Z+ynfLQjaHZ
	 Bo46VfcQ0uSKIP1xlAJKLXb1gwBsPvtlwZbSuwZvOO/oeFFLhrkHPhTmJigVus/us9Rrs
	 zH+rwZtGys0WKURbGc0YHDXBWJyoSpfnGhorZhBuJn5R/kvY2ORV2epOp7Uo24YXQkWHh
	 j6xg49JZzHH8Axa2jl9wBsepX0ChNPEWrW1/BTDR0wPOWDCsCJn3QfjtX8XMDQ8ixBaLv
	 VNAIT8ZT0K+dmU9bAicThBlz2a8Q7Nb04X5IG6cO0wQ+llhq9zEpEscbrJIeju9HebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816190;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NbSUXBGeKD6JKvSHNZEN2OjthBhE1PxdBHy+algVzcQ=;
	b=b91dxSqnyrzC//McLZ6yfGKmzrJI6N77RA1obPKhI0v1qNRlD3KUBWxI+9vtO7O66ZcG
	 IQ1yXTl88Pw5Uyt6Mtl/C/CGK46rkS9Hp8tDl0uw18Q1+57TggSjWz463xwVPL109ZYmo
	 X8GUVqFokdZqE6h8u4xXJK8JKfJTUsaZeKts+sFeCi26Gex/qM1vwLUdof6dHka+9OKAb
	 CZOvVGjx5WZBTU/QxcJ8Bw7yxTxrjZ/Wo71g7x0y53h9NtYfomibh/7Qe8AqqMScM1CjV
	 H63FdUsgfAoxbhLA0R6RF2WiCvUv7e8THv7XCfEmRwobgRgaxV7irh9RTU03otKhpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hh3mq5pn;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1954606D818
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1954606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hh3mq5pn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793816188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbSUXBGeKD6JKvSHNZEN2OjthBhE1PxdBHy+algVzcQ=;
	b=hh3mq5pnAEupZDHVh2n+JzB/1Y9xlclJA3dAAAq+trtkBSH7nCEyWvHP5PT2dMswX2JUVo
	/+3vcv1gym89nDIZ9BN/8+U9jFrH4iOzjFZ0bqpeB0ltEKGvMIISgvi5KKw5X534NvIpHS
	5JLOCg53U2hZU58AA5xWC7BH8uDUNEk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-K_XAaw-3MWymk0BntRoeIw-1; Wed,
 04 Nov 2026 13:16:25 -0500
X-MC-Unique: K_XAaw-3MWymk0BntRoeIw-1
X-Mimecast-MFC-AGG-ID: K_XAaw-3MWymk0BntRoeIw_1793816183
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93B021800593;
	Wed,  4 Nov 2026 18:16:22 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D429D301D915;
	Wed,  4 Nov 2026 18:16:16 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>,
	linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Ahmed Abdelraoof <araoof@amazon.de>
Subject: Re: [PATCH RESEND] sched/core: Do not touch SMT siblings that have not joined the core yet
Date: Thu,  5 Nov 2026 03:16:13 +0900
Message-ID: <20261104181613.3978049-1-snishika@redhat.com>
In-Reply-To: <20261104093418.GA1779021@noisy.programming.kicks-ass.net>
References: <20261104093418.GA1779021@noisy.programming.kicks-ass.net>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Wed, Nov 04, 2026 at 10:34:18AM +0100, Peter Zijlstra wrote:
> Hmm, so I hadn't seen the previous one; but I did see this one:
>
>   https://lore.kernel.org/all/20261101221219.118052-1-araoof@amazon.de/
>
> And I'm thinking you're both tripping over the same issue.

Yes, it is the same issue, and both patches fix it.

> Now, I asked Ahmed if we couldn't consistently do:
>
>  -     for_each_cpu(i, smt_mask) {
>  +     for_each_cpu_and(i, smt_mask, cpu_online_mask) {
>
> Does that work for you?

I tested your suggestion on v7.4-rc1 with the syzbot C reproducer.
I used cpu_online() in the first walk, and
for_each_cpu_and(i, smt_mask, cpu_online_mask) in the other walks and
in __sched_core_account_forceidle(). To make the window wider, I added
mdelay(2) between the first and the second walk. I also added
pr_warn_once() for a NULL core_pick in the second walk. It crashed
after about 60 seconds, right after CPU 1 came online:

[   61.359433][ T5634] smpboot: Booting Node 0 Processor 1 APIC 0x1
[   61.365674][   T22] sched_core: loop2 on cpu0 sees cpu1 online with NULL core_pick
[   61.365700][   T22] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
[   61.371165][   T22] KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
[   61.372533][   T22] CPU: 0 UID: 0 PID: 22 Comm: migration/0 Not tainted 7.4.0-rc1-dirty #13 PREEMPT_{RT,(full)}
[   61.376129][   T22] RIP: 0010:__schedule+0x439a/0x5890
[   61.385226][   T22] R13: ffff8881a3185000 R14: 1ffff11026bc7b7a R15: 0000000000000000

faddr2line shows that it crashed in cookie_equals() in the second
walk. It read the CPU of the NULL core_pick (R15) in task_cpu():

__schedule+0x439a/0x5890:
task_cpu at include/linux/sched.h:2263 (discriminator 2)
(inlined by) is_task_rq_idle at kernel/sched/core.c:6255 (discriminator 2)
(inlined by) cookie_equals at kernel/sched/core.c:6260 (discriminator 2)
(inlined by) pick_next_task at kernel/sched/core.c:6460 (discriminator 2)
(inlined by) __schedule at kernel/sched/core.c:7302 (discriminator 2)

It appears that CPU 1 was still offline in the first walk and came
online before the second walk. start_secondary() calls
set_cpu_online() without any rq lock, so the online mask can change
while we hold the core lock.

I also ran Ahmed's patch and mine with the same mdelay(2), and neither
of them crashed. Each ran for about 2700 seconds (about 2500
offline/online cycles of CPU 1). So the mdelay() itself does not cause
the crash.

In my patch, all walks see the same set of CPUs, because
rq_i->core == rq->core does not change while we hold the core lock.

The diff I used for this test is below.

Thanks,
Seiji

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..bea9712838ee 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8,6 +8,7 @@
  *  Copyright (C) 1998-2024  Ingo Molnar, Red Hat
  */
 #define INSTANTIATE_EXPORTED_MIGRATE_DISABLE
+#include <linux/delay.h>
 #include <linux/sched.h>
 #include <linux/highmem.h>
 #include <linux/hrtimer_api.h>
@@ -6413,6 +6414,9 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 */
 	max = NULL;
 	for_each_cpu_wrap(i, smt_mask, cpu) {
+		if (!cpu_online(i))
+			continue;
+
 		rq_i = cpu_rq(i);
 
 		/*
@@ -6445,9 +6449,13 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * For each thread: try and find a runnable task that matches @max or
 	 * force idle.
 	 */
-	for_each_cpu(i, smt_mask) {
+	mdelay(2);
+
+	for_each_cpu_and(i, smt_mask, cpu_online_mask) {
 		rq_i = cpu_rq(i);
 		p = rq_i->core_pick;
+		if (!p)
+			pr_warn_once("sched_core: loop2 on cpu%d sees cpu%d online with NULL core_pick\n", cpu, i);
 
 		if (!cookie_equals(p, cookie)) {
 			p = NULL;
@@ -6490,7 +6498,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * their task. This ensures there is no inter-sibling overlap between
 	 * non-matching user state.
 	 */
-	for_each_cpu(i, smt_mask) {
+	for_each_cpu_and(i, smt_mask, cpu_online_mask) {
 		rq_i = cpu_rq(i);
 
 		/*
diff --git a/kernel/sched/core_sched.c b/kernel/sched/core_sched.c
index 43e0bde3038e..1efde88da76e 100644
--- a/kernel/sched/core_sched.c
+++ b/kernel/sched/core_sched.c
@@ -273,7 +273,7 @@ void __sched_core_account_forceidle(struct rq *rq)
 		delta = div_u64(delta, rq->core->core_forceidle_occupation);
 	}
 
-	for_each_cpu(i, smt_mask) {
+	for_each_cpu_and(i, smt_mask, cpu_online_mask) {
 		rq_i = cpu_rq(i);
 		p = rq_i->core_pick ?: rq_i->curr;
 

