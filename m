Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B783E024B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998779; cv=none; b=CV5nPX3aWMs11o5memfBsIyRY+Jfb/90CPyOOP5ww9OQFo+SEGa7h28F5p61aTRVJ46Tq1O9QeoJaJnzyMQaS6UnnzdcM4JRJu00V2tai/GQQ2TAWSYUzgZ0rGhvJUAZ0605uNKnSophYgJJserqfJh2ckBCYwNotkCRhfXjxVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998779; c=relaxed/simple;
	bh=WyPFSQzlcPsM7bEg65zgmEDipP6f4nXL0yMbSWA5h84=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kRgfdAzPPaCJlXgiVzb+itRxhpmoVQftMYvaUEcVqSYWn/Ho1Pxnfw4qRrOCrtHtNmg2B95ltbLvO9woLoJ3JLXnekG+1a8brhXeFaWsvgUvPRihInsrqdsUVl1rowgPglFBb13KfBm771c9rgSPbmMXXDhN1iuQs/Q7md9HwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6xltyem; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6xltyem"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-88834d30002so2190629b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791998778; x=1792603578; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyPFSQzlcPsM7bEg65zgmEDipP6f4nXL0yMbSWA5h84=;
        b=g6xltyemoesbxQ3OqIiTgQlkBFOTXRvi+8OhuhQmCecZcFUQe3Kw6wI6IkYWEaAjUp
         Cg1mTFBiuj4i47WMRf+O54F3dCXlBe0zFusblAr973LRntzxbHe3WwK2px2PO2nNHt7C
         pXhdiJWt7PljbqdVWcqOf/ilFgCVxXBNza0fTdH+e7FFVd1IQtuvR7iaRYUrfKVLFAQ/
         bGsQHVJ0GuqM1nxtZ4mV8slfJHXI94kJVTCPHULzDaDwUY5rWmW3k45pl83jfNkmaSg7
         POs56Nb+PxEXQnUIx+Y0CESHRG3JwCiX9HuTkbRuVzKfZ7ZDv9SI2Eyn7TGvEkHwYgUB
         6Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998778; x=1792603578;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyPFSQzlcPsM7bEg65zgmEDipP6f4nXL0yMbSWA5h84=;
        b=fo2vnEGMuesbGer4n5kXRZnMLxvhnkPnSekPQre2k+rN7oroBwquP/8kJGboFLR1LS
         rrwlq0jZKy0HjwSljdIbY8z+5BKPV+ZQkJDTGt7UM/imxeEMxOHLauNJV9M54WK0tGht
         loPPdxS4ttXWtlPRsBC44y92ebpR+N19LT/2+zwJ51CoPvulOcs+98aXMlmkRc/XoJ4d
         sfjZ2vdDE11xJA6fiN0VdQBpPU1x81bcsYlMFEoRho+JU2tnyqDLI/tVICx1QI0q/loe
         Fj8f9BkrI4Q6TnDrgu4y3Lw2dIqLywDe9XWbgmk2uv+UZ7PL0A0jDyWXKqnh8uRez1S7
         wtTw==
X-Forwarded-Encrypted: i=1; AKwUvBwCq9R/m2ZmFSAiOaBX/971ky8UhEHgS9wLDED+2/qFH95fjZkzLcjNVG0CH9+fBpjKJ+868I8qUzu3Yc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWY/CUEpd0qypqn8T6Km6ppabEk8AC6AxK4CbCSCJlyGaZWWsL
	5Mc6TBKDa9fqB7NUVWEp5joo0QdlwdKeZwHvv5UUh/uX2kBL9+2AuVF2
X-Gm-Gg: AYBFou289JiBlzOw19yzWYMstzC2+XWeobc6biQR31Kr8KBpw9RMpqGEZe6iZ0c7uH4
	Ydoo4Hw4kArs753QQsOIkHu0i61GzBoUr+WWmCQQKotKR3p8iZtG8cRHk/G7oig3wQdxu6fW9wI
	WzjXd87QfuZSIx9Oj0E4Alr5kyT2byuv4N7HQJ236Uf5NFSnMA56eG3mGONevHkiMBefkSfwL6G
	n3o+IYRU03nuwREBPM5yk+csvT4u4Mu7Yd1p1Tkem9QfFPLv5g5TIUtirtXCAEO8KC3fHutza5T
	kYfo6BYcceWusivqRD8tHtfBNAU2/tAD6S91QsQkKqWILbOfPXmUAg9NflLJQFZyDLZPGBowVJk
	eqUmReple84XhyIkL5a/ARNCXKS6MRAMPYoKFjDSPTyzJVSWrVGtmPEcEjQLz5Nco6qj7geAiZW
	nhkCQ5yzw0279DaUHiN5ig3yYvY8WBrw5U1o6dHxQgbQiYcaWDUmVRWPPt6QlpnAVl
X-Received: by 2002:a05:6a20:734b:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3e19071d800mr10023078637.35.1791998777510;
        Wed, 14 Oct 2026 10:26:17 -0700 (PDT)
Received: from smtpclient.apple ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d803cc9f0sm1402553b3a.29.2026.10.14.10.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:26:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] sched/cache: Remove the old cache group footprint on
 exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <as99ta0PWAuYROp0@three-body>
Date: Thu, 15 Oct 2026 01:25:52 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 Chen Yu <yu.c.chen@intel.com>,
 tim.c.chen@linux.intel.com,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1174BE6F-35AC-4BBA-BD36-661B6FEC0794@gmail.com>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
 <aspT_A1vl-RwKmoP@chenyu-dev>
 <32BC7D58-C1C9-4B24-857B-7433F19606A8@gmail.com>
 <as99ta0PWAuYROp0@three-body>
To: Chen Yu <chen.yu@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)


> On Oct 14, 2026, at 9:03=E2=80=AFPM, Chen Yu <chen.yu@linux.dev> =
wrote:

[=E2=80=A6]

> The minor issue is that the goal of sched_cache_replace_grp() was to =
serve as a
> helper for dealing with sched_cache_group pointer assignment, so we =
don't want to
> interfere with its members' values, such as footprint. If you can =
reuse
> sched_cache_footprint_update() in sched_cache_exit_mm() and =
sched_cache_exec_mmap(),
> that would make the code cleaner for future maintenance. Do you have =
any reason
> to keep the current form?
>=20
> Could you please send a formal patch? I'll launch a test with your =
patch applied.
> The only concern is that we convert the raw READ/WRITE_ONCE into =
atomic write,
> which might impact performance.
>=20
> thanks,
> Chenyu

Hi Chenyu,

I originally put the subtraction in sched_cache_replace_grp()
so both exec and exit share it (and the CONFIG_NUMA_BALANCING
guard stays in one place).

I tried moving it into the two callers as you suggested
(patch attached). That required several small helpers to hide
the config guards and reuse the old group pointer, which
fragmented the code more than expected for this small bit of
accounting.

I agree a pure pointer-assignment helper should not touch the
footprint. I now think it is better to change its responsibility:
rename it to sched_cache_switch_grp(): have it subtract the
task's contribution from the old group, publish the new pointer,
and return the old group for the caller to put. This keeps the
leave-group accounting and NUMA guard centralized.

Would you be comfortable with that approach? I'll send a formal
v3 once we settle this. Thanks for offering to test, especially
the performance impact of the atomic updates.

Thanks,
Jemmy


diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..4a02a47c988e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2412,7 +2412,8 @@ struct sched_cache_group {
unsigned long epoch;
u64 nr_running_avg;
unsigned long next_scan;
- unsigned long footprint;
+ /* Sum of the member tasks' accounted footprints, in pages. */
+ atomic_long_t footprint;
int cpu;
refcount_t refcnt;
struct rcu_head rcu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..4d635bb28f18 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1483,6 +1483,7 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
#ifdef CONFIG_NUMA_BALANCING
unsigned long llc, footprint;
struct sched_domain *sd;
+ long fp;
int scale;

guard(rcu)();
@@ -1497,7 +1498,9 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
* excluded.
*/
llc =3D sd->llc_bytes;
- footprint =3D READ_ONCE(grp->footprint);
+ fp =3D atomic_long_read(&grp->footprint);
+ WARN_ON_ONCE(fp < 0);
+ footprint =3D max(fp, 0L);

/*
* Scale the LLC size by 256*llc_aggr_tolerance
@@ -1677,7 +1680,7 @@ int mm_init_sched(struct mm_struct *mm,
grp->cpu =3D -1;
grp->next_scan =3D jiffies;
grp->nr_running_avg =3D 0;
- grp->footprint =3D 0;
+ atomic_long_set(&grp->footprint, 0);
refcount_set(&grp->refcnt, 1);
/*
* The update to grp->pcpu_sched should not be reordered
@@ -1719,6 +1722,27 @@ DEFINE_FREE(sched_cache_group_put, struct =
sched_cache_group *,
#define rcu_deref_sched_cache_grp(tsk) \
rcu_dereference_check((tsk)->sched_cache_grp, (tsk) =3D=3D current)

+static inline void sched_cache_footprint_update(struct =
sched_cache_group *grp,
+ long delta)
+{
+ if (grp && delta)
+ atomic_long_add(delta, &grp->footprint);
+}
+
+static inline void sched_cache_footprint_update_task(struct task_struct =
*p,
+ long delta)
+{
+ sched_cache_footprint_update(rcu_deref_sched_cache_grp(p), delta);
+}
+
+static inline void sched_cache_footprint_drop(struct sched_cache_group =
*grp,
+ struct task_struct *p)
+{
+#ifdef CONFIG_NUMA_BALANCING
+ sched_cache_footprint_update(grp, -(long)p->total_numa_faults);
+#endif
+}
+
static struct sched_cache_group *sched_cache_replace_grp(struct =
task_struct *p,
struct sched_cache_group *new)
{
@@ -1780,6 +1804,7 @@ void sched_cache_exec_mmap(struct task_struct *p, =
struct mm_struct *mm)
* the old one. @p is current and the only writer of its own pointer.
*/
old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
+ sched_cache_footprint_drop(old, p);
sched_cache_group_put(old);
}

@@ -1787,19 +1812,7 @@ void sched_cache_exit_mm(struct task_struct *p)
{
struct sched_cache_group *grp =3D sched_cache_replace_grp(p, NULL);

-#ifdef CONFIG_NUMA_BALANCING
- /*
- * Subtract this task's footprint from the group before dropping the
- * reference, so the group footprint converges as its threads exit.
- * Unlocked for performance; clamp to avoid underflow.
- */
- if (grp && p->total_numa_faults) {
- unsigned long fp =3D READ_ONCE(grp->footprint);
- unsigned long sub =3D min(fp, p->total_numa_faults);
-
- WRITE_ONCE(grp->footprint, fp - sub);
- }
-#endif
+ sched_cache_footprint_drop(grp, p);
sched_cache_group_put(grp);
}

@@ -2189,6 +2202,9 @@ void init_sched_mm(struct task_struct *p)
static inline void account_mm_sched(struct rq *rq, struct task_struct =
*p,
s64 delta_exec) { }

+static inline void sched_cache_footprint_update_task(struct task_struct =
*p,
+ long delta) { }
+
void init_sched_mm(struct task_struct *p) { }

static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
@@ -3883,14 +3899,13 @@ static int preferred_group_nid(struct =
task_struct *p, int nid)
static void task_numa_placement(struct task_struct *p)
__context_unsafe(/* conditional locking */)
{
- struct sched_cache_group __maybe_unused *grp;
int seq, nid, max_nid =3D NUMA_NO_NODE;
unsigned long max_faults =3D 0;
unsigned long fault_types[2] =3D { 0, 0 };
+ unsigned long old_faults =3D p->total_numa_faults;
unsigned long total_faults;
u64 runtime, period;
spinlock_t *group_lock =3D NULL;
- long __maybe_unused new_fp;
struct numa_group *ng;

/*
@@ -3965,36 +3980,6 @@ static void task_numa_placement(struct =
task_struct *p)
ng->total_faults +=3D diff;
group_faults +=3D ng->faults[mem_idx];
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
- grp =3D rcu_dereference(p->sched_cache_grp);
-
- if (grp) {
- new_fp =3D (long)READ_ONCE(grp->footprint) + diff;
- WRITE_ONCE(grp->footprint, max(new_fp, 0L));
- }
- }
-#endif
}

if (!ng) {
@@ -4017,6 +4002,8 @@ static void task_numa_placement(struct task_struct =
*p)
max_nid =3D preferred_group_nid(p, max_nid);
}

+ sched_cache_footprint_update_task(p, p->total_numa_faults - =
old_faults);
+
if (max_faults) {
/* Set the new preferred node */
if (max_nid !=3D p->numa_preferred_nid)
--
2.54.0 (Apple Git-157)



