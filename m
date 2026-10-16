Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141134446FA;
	Fri, 16 Oct 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137679; cv=none; b=C2jnickHWyq4ZLB6DLGMp4PekAcXnjpeW9H+a+SAX3UFNzjivobqSF2fAN8fn2nltTEcXRzXo3ix2eoyBsKFOhe+gXFYHLQpPqUCI2rKzrqIesAatTcvh6D1nejAKXE9CLjeqdC5X0PlhKTa3OglRMfNUCvRcBB/+QegkHbmnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137679; c=relaxed/simple;
	bh=KTvH1Oe7sybEMAIYyQR0z88HzdEP7P5yNz48S4p0Wsw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZGBXOTQTkP2muWquHAuXIY/YTnFmVDztbyXzPuS7iq4VR8XxmlgWgZe87lmRyEATKgSLHulwiT8/M1Ubg1UYfIPZbb6T8awz+ryij/yUVUx59N3GlwOqBSwuG2k6OS8bPUMObLl0gZlXuKU/2Eft/H1E5s03p1B8IY4cqtylD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HtS9/i1u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n5M/KNFE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HtS9/i1u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n5M/KNFE"
Date: Fri, 16 Oct 2026 08:01:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137674;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeG2ss3SLqdXOShYMXok7S9ZGEvd2dTIHpQQ62gvUns=;
	b=HtS9/i1uxeDOag7mIY7RG2Mi4CT38XVIxjT2l/iPlSgPbXHddQpHsg2B/ptz5YtLwSia+A
	Fvw30vwkMlVQvH7zkScx57qfcO0eWuNwY1vbSWr5taxiMd9wQS4Te09xLYkB4imP3d+5km
	Lq82uDKPcDzdRk1Mo2PKbY951naa3nW3qtC8jGjVDOno1plfq8xc9WKyP6RaUfhD7VaF3n
	ee7111JmqmvL1kUHnf5VjkVYH6xChIJx1y5Bm978p1VI9aSQTFW7B+/mx4NS1hd5i6b4vy
	tBMqmH2gIeRtgLOa2C3XIIrr+Jc0W76R2mSCKrWkv62FJXPqsTT2ypIfSR2D6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137674;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeG2ss3SLqdXOShYMXok7S9ZGEvd2dTIHpQQ62gvUns=;
	b=n5M/KNFEjq/I0nYk7ev3DI7UMqa/KcPjtAKvrocPwHT3xreckmPGSYrv9qbr0r1Uucr8lH
	v96CQh8AFJIp/vDA==
From: "tip-bot2 for Christian Loehle" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Replace nr_iowait_cpu() with a bool accessor
Cc: Christian Loehle <christian.loehle@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016073341.575472-1-christian.loehle@arm.com>
References: <20261016073341.575472-1-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213767317.2666988.5842328125477460793.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     b99b7f60c5b473d374c68b53753153b4aa9e0702
Gitweb:        https://git.kernel.org/tip/b99b7f60c5b473d374c68b53753153b4aa9=
e0702
Author:        Christian Loehle <christian.loehle@arm.com>
AuthorDate:    Fri, 16 Oct 2026 08:33:40 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:04 +02:00

sched: Replace nr_iowait_cpu() with a bool accessor

The menu governor was the last consumer of the per-CPU I/O-wait count
that needed its magnitude, apart from nr_iowait() summing it globally.
Commit 38f83090f515 ("cpuidle: menu: Remove iowait influence") removed
that use. All remaining per-CPU consumers only test for zero/nonzero.

Replace nr_iowait_cpu() with bool cpu_has_iowait() and update the generic
and s390 idle accounting callers. Have nr_iowait() read the counters
directly so that the global total and existing accounting are preserved.
Replace the stale menu comment with a description of the predicate.
Also convert the remaining open-coded idle accounting checks to use the
predicate, as suggested by Prateek.

The conversion was done with coccinelle:

@ predicate depends on patch @
expression cpu;
@@

- nr_iowait_cpu(cpu) > 0
+ cpu_has_iowait(cpu)

@ callers depends on patch @
expression cpu;
@@

- nr_iowait_cpu(cpu)
+ cpu_has_iowait(cpu)

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20261016073341.575472-1-christian.loehle@arm.c=
om
---
 arch/s390/kernel/idle.c    |  4 ++--
 include/linux/sched/stat.h |  2 +-
 kernel/sched/core.c        | 13 +++++--------
 kernel/sched/cputime.c     | 20 +++++++++-----------
 4 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
index dd12efb..ff9732e 100644
--- a/arch/s390/kernel/idle.c
+++ b/arch/s390/kernel/idle.c
@@ -82,13 +82,13 @@ static u64 arch_cpu_idle_time(int cpu, enum cpu_usage_sta=
t idx, bool compute_del
=20
 u64 arch_kcpustat_field_idle(int cpu)
 {
-	return arch_cpu_idle_time(cpu, CPUTIME_IDLE, !nr_iowait_cpu(cpu));
+	return arch_cpu_idle_time(cpu, CPUTIME_IDLE, !cpu_has_iowait(cpu));
 }
 EXPORT_SYMBOL_GPL(arch_kcpustat_field_idle);
=20
 u64 arch_kcpustat_field_iowait(int cpu)
 {
-	return arch_cpu_idle_time(cpu, CPUTIME_IOWAIT, nr_iowait_cpu(cpu));
+	return arch_cpu_idle_time(cpu, CPUTIME_IOWAIT, cpu_has_iowait(cpu));
 }
 EXPORT_SYMBOL_GPL(arch_kcpustat_field_iowait);
=20
diff --git a/include/linux/sched/stat.h b/include/linux/sched/stat.h
index 0108a38..4810b14 100644
--- a/include/linux/sched/stat.h
+++ b/include/linux/sched/stat.h
@@ -20,7 +20,7 @@ extern int nr_processes(void);
 extern unsigned int nr_running(void);
 extern bool single_task_running(void);
 extern unsigned int nr_iowait(void);
-extern unsigned int nr_iowait_cpu(int cpu);
+extern bool cpu_has_iowait(int cpu);
=20
 static inline int sched_info_on(void)
 {
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 047fbe8..d7c3b43 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5638,15 +5638,12 @@ unsigned long long nr_context_switches(void)
 }
=20
 /*
- * Consumers of these two interfaces, like for example the cpuidle menu
- * governor, are using nonsensical data. Preferring shallow idle state selec=
tion
- * for a CPU that has IO-wait which might not even end up running the task w=
hen
- * it does become runnable.
+ * Return whether any tasks are accounted as I/O waiters on this CPU.
+ * They may wake up on a different CPU.
  */
-
-unsigned int nr_iowait_cpu(int cpu)
+bool cpu_has_iowait(int cpu)
 {
-	return atomic_read(&cpu_rq(cpu)->nr_iowait);
+	return atomic_read(&cpu_rq(cpu)->nr_iowait) !=3D 0;
 }
=20
 /*
@@ -5684,7 +5681,7 @@ unsigned int nr_iowait(void)
 	unsigned int i, sum =3D 0;
=20
 	for_each_possible_cpu(i)
-		sum +=3D nr_iowait_cpu(i);
+		sum +=3D atomic_read(&cpu_rq(i)->nr_iowait);
=20
 	return sum;
 }
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 19aa804..9e0fb86 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -226,9 +226,8 @@ void account_steal_time(u64 cputime)
 void account_idle_time(u64 cputime)
 {
 	u64 *cpustat =3D kcpustat_this_cpu->cpustat;
-	struct rq *rq =3D this_rq();
=20
-	if (atomic_read(&rq->nr_iowait) > 0)
+	if (cpu_has_iowait(smp_processor_id()))
 		cpustat[CPUTIME_IOWAIT] +=3D cputime;
 	else
 		cpustat[CPUTIME_IDLE] +=3D cputime;
@@ -431,7 +430,7 @@ static void kcpustat_idle_stop(struct kernel_cpustat *kc,=
 u64 now)
 	if (!kc->idle_elapse)
 		return;
=20
-	iowait =3D nr_iowait_cpu(smp_processor_id()) > 0;
+	iowait =3D cpu_has_iowait(smp_processor_id());
 	delta =3D now - kc->idle_entrytime;
 	steal =3D steal_account_process_time(delta);
=20
@@ -565,14 +564,14 @@ static u64 kcpustat_field_dyntick(int cpu, enum cpu_usa=
ge_stat idx,
 u64 kcpustat_field_idle(int cpu)
 {
 	return kcpustat_field_dyntick(cpu, CPUTIME_IDLE,
-				      !nr_iowait_cpu(cpu), ktime_get());
+				      !cpu_has_iowait(cpu), ktime_get());
 }
 EXPORT_SYMBOL_GPL(kcpustat_field_idle);
=20
 u64 kcpustat_field_iowait(int cpu)
 {
 	return kcpustat_field_dyntick(cpu, CPUTIME_IOWAIT,
-				      nr_iowait_cpu(cpu), ktime_get());
+				      cpu_has_iowait(cpu), ktime_get());
 }
 EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
 #else
@@ -627,7 +626,7 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_=
stat idx,
 u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
 {
 	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE,
-				     !nr_iowait_cpu(cpu), last_update_time);
+				     !cpu_has_iowait(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
=20
@@ -651,7 +650,7 @@ EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
 u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 {
 	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT,
-				     nr_iowait_cpu(cpu), last_update_time);
+				     cpu_has_iowait(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
=20
@@ -1136,7 +1135,6 @@ static int kcpustat_field_vtime(u64 *cpustat,
 				int cpu, u64 *val)
 {
 	struct vtime *vtime =3D &tsk->vtime;
-	struct rq *rq =3D cpu_rq(cpu);
 	unsigned int seq;
=20
 	do {
@@ -1179,11 +1177,11 @@ static int kcpustat_field_vtime(u64 *cpustat,
 				*val +=3D vtime->gtime + vtime_delta(vtime);
 			break;
 		case CPUTIME_IDLE:
-			if (state =3D=3D VTIME_IDLE && !atomic_read(&rq->nr_iowait))
+			if (state =3D=3D VTIME_IDLE && !cpu_has_iowait(cpu))
 				*val +=3D vtime_delta(vtime);
 			break;
 		case CPUTIME_IOWAIT:
-			if (state =3D=3D VTIME_IDLE && atomic_read(&rq->nr_iowait) > 0)
+			if (state =3D=3D VTIME_IDLE && cpu_has_iowait(cpu))
 				*val +=3D vtime_delta(vtime);
 			break;
 		default:
@@ -1278,7 +1276,7 @@ static int kcpustat_cpu_fetch_vtime(struct kernel_cpust=
at *dst,
 			}
 			break;
 		case VTIME_IDLE:
-			if (atomic_read(&cpu_rq(cpu)->nr_iowait) > 0)
+			if (cpu_has_iowait(cpu))
 				cpustat[CPUTIME_IOWAIT] +=3D delta;
 			else
 				cpustat[CPUTIME_IDLE] +=3D delta;
