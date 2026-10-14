Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2924B44AF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969481; cv=none; b=E++HSEJqKOwQBYWD8W+C2KZPJGAEP+mgC8lJ6ZhV0e9bIjzPGfw8fUwnDKg9qqYawfxfpI0qeiPVJX7bgQzDOoRBdPC0P2+8lQNWiDBYoayoY7wlhK/qygiDxMK445XgjiH7+XmaHU62uWiHScZvGC8FmoyVReTcKDx08LeKHGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969481; c=relaxed/simple;
	bh=Uv+gBqC23z/hi8oZFqAImn91uz8smKSLCKfFN3432bI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V8AY5GEF8BcjWwv2hFHmaZc6mv6oSnjyy7OH1CRvZ0gpQNKnF+39naOK/izAO1GS3ic7ctw96Q8kjPW4cCIgyhBQkUbvcenVDbJ7WCOSzO6RhY7OzTE4tqe3vX9FDLYrXBRAsosb4SolYE796nvWbWfCHAnEjk9fenQMWUSNnrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjlUJ0jQ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjlUJ0jQ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2113316a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969479; x=1792574279; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1eMSc0aul1lmNsuhH3WrHKiL8meQpiHX+Cb2ce9FBdo=;
        b=AjlUJ0jQYg8EKeRQrbzjH8C6QUBqHyEK5iPTY1UUm8pnQ95w2+lV0HoCb0tte0e7V6
         +8GCndaasMUlqT6v9uApurtfdQYrafGaVaOxh8W8QKIKl0OSzIcYK4IZ/0WR4wwz2O76
         MfS0F0ED0tNTWWHdNDShXy/o27zJKSLwWr/jRkvoYJn/Wgc/w3ixJhbfy1rOYg2+fEXd
         GuHZLjVFaJ5ioeuDBMOP6tOVwn+f+Lng8impRJkd2grF30MXDA0rzX8/WtGXUaRIH7hM
         OHJJumAoUVvt8Z0yv1Q0retu8DS3g221bRUQ8VH5OI581sAp0vXhahv3E3Lj6iullS6q
         0w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969479; x=1792574279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eMSc0aul1lmNsuhH3WrHKiL8meQpiHX+Cb2ce9FBdo=;
        b=glmUwlxNDxcXxWPstnWv5vo8tgOMx8iUSKR8AQxtPoDRuqrkklKC2Xj72yJouVxkNU
         FyowEnc4WNoWfvN5dvKxFY94NIyKpVOBOssydYM3glHUnoTxva7XkUXg9ExsFlTE1Arm
         UwlUJvhdPLiAeEe8RvNnwf2M/QGbVFzq4mPj/Ltnid/ZKufx1IDOJwgCYu6aw/i5uFnD
         c+8m10NxsrGMXqLLsVUVeYB7ri3wXhNiM7l5s401cUgDOLZXNKlBOYmdJpB1R7nBZg9M
         PEJZOglAFe63o3qsI0rd2vIHxB8vqjElwrzO4fwJI7+2nuwUrOOqB00I54DKThyoyvm4
         5Juw==
X-Forwarded-Encrypted: i=1; AKwUvBywg7+BQZDSedVrwljL1aKkZCKKyX2wbJ/g74p0jWoYMjKY58yQbRHHps4F8Dc7ixn1EdnvHa4eRjx6920=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTs4ZmLofpQCmIKcN13F8hQHBSc/dchiJnyVDTJh7Ebb9WxIkN
	HfAo5n5pJMKN8W9e5Q2zM1TEJmQMPul983EZBHp9KY5JUFExR3bkwuCuuQ+c0eEVGG8=
X-Gm-Gg: AYBFou3hdBgf8xw5LyNz1/xtDX2p1Q9BLbk5yAn+3q0LDFrXLaW4zcKCNG0+W2hzh9Y
	erk7gAY2mzvy4v6jwBmwDjj04zz49r2UeycdqD+0Yd2IXi2O3ox8JZ1sXjTc4UgSrA7Jpz123VX
	QLk0gLp8oKNV+BvjPJ/66S/v9rl7SW9EvnTsAMKoB+P0+9I+OXzYZH4zCrpCmUuh+uotRmsccna
	oyOE7WnZ/tJiPCBuL1EoG/evoIFUZ25LKoIHb6qUl3KSWRtHnb0ZGhoUCnNrvZmFA1x8dLJnIMs
	2oPZxIr9gwkFVKTYm4P7n++Wk4VFUNT4ea/vcnFQqDl5Z1cAuGMteQvgXwQS041C74CFUAqRC+L
	SgAFeo+NnuHrIv7w6lmyZjOz8sqzxqbIHsKleQA7KliHwO2GbuvJeQSx2N5aNBOC7FzDg+mp4gj
	qg7czfArG3jS1yFz9pJSAhOreGTs/HIHQlOWEyx66f4TAislpQrGKp0qK02ultDkk=
X-Received: by 2002:a17:903:b8f:b0:2df:ab36:f15f with SMTP id d9443c01a7336-2e842bbeb5fmr125306235ad.43.1791969478617;
        Wed, 14 Oct 2026 02:17:58 -0700 (PDT)
Received: from smtpclient.apple ([2a05:dfc1:8bc4:feda::10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm65382345ad.52.2026.10.14.02.17.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:17:56 -0700 (PDT)
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
In-Reply-To: <aspT_A1vl-RwKmoP@chenyu-dev>
Date: Wed, 14 Oct 2026 17:17:30 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
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
 chen.yu@linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <32BC7D58-C1C9-4B24-857B-7433F19606A8@gmail.com>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
 <aspT_A1vl-RwKmoP@chenyu-dev>
To: Chen Yu <yu.c.chen@intel.com>,
 tim.c.chen@linux.intel.com
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Chenyu,

I've updated the patch to use atomic_long_t for grp->footprint, with
atomic_long_add() for placement deltas and atomic_long_sub() when a
task leaves the group through exec or exit.

The reason for removing the clamp is that the footprint aggregates the
same contributions tracked by p->total_numa_faults. NUMA placement
already applies each signed memory-fault delta to the per-node counters
and the task total without clamping. A negative delta only removes half
of an existing bucket, so normal decay cannot make the task's
contribution negative.

With atomic updates preventing lost deltas, and each departing task's
contribution subtracted exactly once, the group footprint should remain
nonnegative too, assuming no overflow. Clamping would hide an accounting
mismatch rather than correct it. The non-returning atomic add/sub
operations also need no ordering against unrelated accesses.

I've kept your suggestion to update the footprint once per placement
pass. Instead of maintaining a separate delta accumulator, the patch
snapshots p->total_numa_faults before the loop and applies its net =
change
afterward. This reuses the existing NUMA accounting and limits shared
cache-line traffic.

There is one exception to the balance argument: if exec fails after
switching groups but before task_numa_free() resets the statistics, exit
can subtract the old total from the new group, where it was never
accounted. That can make the new footprint negative. This group belongs
only to the execing task, which is past the point of no return and will
exit, so the mismatch does not persist in a surviving shared group.
This version leaves the existing NUMA reset ordering unchanged.

Does using atomic_long_t without the clamp look reasonable to you,
including handling that failed-exec case as described?



diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..4a02a47c988e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2412,7 +2412,8 @@ struct sched_cache_group {
 	unsigned long epoch;
 	u64 nr_running_avg;
 	unsigned long next_scan;
-	unsigned long footprint;
+	/* Sum of the member tasks' accounted footprints, in pages. */
+	atomic_long_t footprint;
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..c9aa59148abd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1483,6 +1483,7 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
 #ifdef CONFIG_NUMA_BALANCING
 	unsigned long llc, footprint;
 	struct sched_domain *sd;
+	long fp;
 	int scale;

 	guard(rcu)();
@@ -1497,7 +1498,9 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
 		 * excluded.
 		 */
 		llc =3D sd->llc_bytes;
-		footprint =3D READ_ONCE(grp->footprint);
+		fp =3D atomic_long_read(&grp->footprint);
+		WARN_ON_ONCE(fp < 0);
+		footprint =3D max(fp, 0L);

 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1677,7 +1680,7 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->cpu =3D -1;
 	grp->next_scan =3D jiffies;
 	grp->nr_running_avg =3D 0;
-	grp->footprint =3D 0;
+	atomic_long_set(&grp->footprint, 0);
 	refcount_set(&grp->refcnt, 1);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
@@ -1719,12 +1722,24 @@ DEFINE_FREE(sched_cache_group_put, struct =
sched_cache_group *,
 #define rcu_deref_sched_cache_grp(tsk) \
 	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) =3D=3D =
current)

+static inline void sched_cache_footprint_update(struct task_struct *p, =
long delta)
+{
+	struct sched_cache_group *grp =3D rcu_deref_sched_cache_grp(p);
+
+	if (grp && delta)
+		atomic_long_add(delta, &grp->footprint);
+}
+
 static struct sched_cache_group *sched_cache_replace_grp(struct =
task_struct *p,
 							 struct =
sched_cache_group *new)
 {
 	struct sched_cache_group *old;

 	old =3D rcu_deref_sched_cache_grp(p);
+#ifdef CONFIG_NUMA_BALANCING
+	if (old && old !=3D new)
+		atomic_long_sub(p->total_numa_faults, &old->footprint);
+#endif
 	rcu_assign_pointer(p->sched_cache_grp, new);

 	return old;
@@ -1787,19 +1802,6 @@ void sched_cache_exit_mm(struct task_struct *p)
 {
 	struct sched_cache_group *grp =3D sched_cache_replace_grp(p, =
NULL);

-#ifdef CONFIG_NUMA_BALANCING
-	/*
-	 * Subtract this task's footprint from the group before dropping =
the
-	 * reference, so the group footprint converges as its threads =
exit.
-	 * Unlocked for performance; clamp to avoid underflow.
-	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp =3D READ_ONCE(grp->footprint);
-		unsigned long sub =3D min(fp, p->total_numa_faults);
-
-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
-#endif
 	sched_cache_group_put(grp);
 }

@@ -2189,6 +2191,9 @@ void init_sched_mm(struct task_struct *p)
 static inline void account_mm_sched(struct rq *rq, struct task_struct =
*p,
 				    s64 delta_exec) { }

+static inline void sched_cache_footprint_update(struct task_struct *p,
+						long delta) { }
+
 void init_sched_mm(struct task_struct *p) { }

 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
@@ -3883,14 +3888,13 @@ static int preferred_group_nid(struct =
task_struct *p, int nid)
 static void task_numa_placement(struct task_struct *p)
 	__context_unsafe(/* conditional locking */)
 {
-	struct sched_cache_group __maybe_unused *grp;
 	int seq, nid, max_nid =3D NUMA_NO_NODE;
 	unsigned long max_faults =3D 0;
 	unsigned long fault_types[2] =3D { 0, 0 };
+	unsigned long old_faults =3D p->total_numa_faults;
 	unsigned long total_faults;
 	u64 runtime, period;
 	spinlock_t *group_lock =3D NULL;
-	long __maybe_unused new_fp;
 	struct numa_group *ng;

 	/*
@@ -3965,36 +3969,6 @@ static void task_numa_placement(struct =
task_struct *p)
 				ng->total_faults +=3D diff;
 				group_faults +=3D ng->faults[mem_idx];
 			}
-#ifdef CONFIG_SCHED_CACHE
-			/*
-			 * Per task p->numa_faults[mem_idx] converges,
-			 * so the accumulation of each task's faults
-			 * converges too - Given the number of threads,
-			 * it cannot overflow an unsigned long.
-			 * Racy with concurrent updates from other =
threads
-			 * sharing this mm. Acceptable since footprint =
is a
-			 * heuristic and occasional lost updates are =
tolerable.
-			 *
-			 * If a task exits, its corresponding footprint =
must
-			 * be subtracted from =
p->sched_cache_grp->footprint,
-			 * otherwise the footprint will not converge: =
the
-			 * exiting thread's footprint remains =
unchanged/undecayed.
-			 * See exit_mm().
-			 *
-			 * Lost updates and unsynchronized subtraction
-			 * in exit_mm() can cause footprint + diff to
-			 * go negative. Clamp to zero to prevent the
-			 * unsigned footprint from wrapping.
-			 */
-			scoped_guard(rcu) {
-				grp =3D =
rcu_dereference(p->sched_cache_grp);
-
-				if (grp) {
-					new_fp =3D =
(long)READ_ONCE(grp->footprint) + diff;
-					WRITE_ONCE(grp->footprint, =
max(new_fp, 0L));
-				}
-			}
-#endif
 		}

 		if (!ng) {
@@ -4017,6 +3991,8 @@ static void task_numa_placement(struct task_struct =
*p)
 		max_nid =3D preferred_group_nid(p, max_nid);
 	}

+	sched_cache_footprint_update(p, p->total_numa_faults - =
old_faults);
+
 	if (max_faults) {
 		/* Set the new preferred node */
 		if (max_nid !=3D p->numa_preferred_nid)
--
2.25.1


> On Oct 10, 2026, at 11:04=E2=80=AFPM, Chen Yu <yu.c.chen@intel.com> =
wrote:
>=20
> On Sat, Oct 10, 2026 at 07:16:12PM +0800, Jemmy Wong wrote:
>=20
> [ ... ]
>=20
>> void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct =
*mm)
>> {
>> struct sched_cache_group *old;
>> @@ -1778,8 +1797,13 @@ void sched_cache_exec_mmap(struct task_struct =
*p, struct mm_struct *mm)
>> /*
>> * Acquire the new reference before publishing the pointer, then drop
>> * the old one. @p is current and the only writer of its own pointer.
>> + *
>> + * Footprint subtraction must stay ahead of task_numa_free() in
>> + * bprm_execve(), which clears p->total_numa_faults. Nothing here
>> + * enforces that order.
>> */
>> old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
>> + sched_cache_footprint_sub(old, p);
>=20
>=20
> Yes, it fixes the stale footprint issue for a vfork(). While looking =
at this fix I
> realize that maybe even with this patch applied, we might still can =
not fix the losing
> footprint, due to an existing race condition:
>=20
>  CPU0: execve()                    CPU1: CLONE_VM task
>  ------------------------------    -------------------------------
>                                    task_numa_placement()
>                                      read footprint
>  sched_cache_exec_mmap()
>    read footprint
>    write footprint - own faults    <-- the fix
>                                      write footprint + own diff
>                                      <-- overwrites the subtraction
>=20
> So the footprint might still be lost because CPU1 overwrites it, and
> there seems to be no lock protected against the race(I did not find =
one).
>=20
> An enhanced way is to turn the raw footprint write into cmpxchg.
> It reduces the race, and since numa balancing scan interval=20
> numa_scan_period is not small, the overhead of using
> atomic write is low, I'm thinking of something below(only compile =
tested):
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..4123f0535cd9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1771,6 +1771,11 @@ void sched_cache_fork_cleanup(struct =
task_struct *p)
> RCU_INIT_POINTER(p->sched_cache_grp, NULL);
> }
>=20
> +#ifdef CONFIG_NUMA_BALANCING
> +static void sched_cache_footprint_update(struct sched_cache_group =
*grp,
> + unsigned long delta, bool add);
> +#endif
> +
> void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct =
*mm)
> {
> struct sched_cache_group *old;
> @@ -1780,9 +1785,28 @@ void sched_cache_exec_mmap(struct task_struct =
*p, struct mm_struct *mm)
> * the old one. @p is current and the only writer of its own pointer.
> */
> old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
> +#ifdef CONFIG_NUMA_BALANCING
> + if (old && p->total_numa_faults)
> + sched_cache_footprint_update(old, p->total_numa_faults, false);
> +#endif
> sched_cache_group_put(old);
> }
>=20
> +#ifdef CONFIG_NUMA_BALANCING
> +static void sched_cache_footprint_update(struct sched_cache_group =
*grp,
> + unsigned long delta, bool add)
> +{
> + unsigned long old =3D READ_ONCE(grp->footprint), new;
> +
> + do {
> + if (add)
> + new =3D old + delta;
> + else
> + new =3D old - min(old, delta);
> + } while (!try_cmpxchg(&grp->footprint, &old, new));
> +}
> +#endif
> +
> void sched_cache_exit_mm(struct task_struct *p)
> {
> struct sched_cache_group *grp =3D sched_cache_replace_grp(p, NULL);
> @@ -1793,12 +1817,8 @@ void sched_cache_exit_mm(struct task_struct *p)
> * reference, so the group footprint converges as its threads exit.
> * Unlocked for performance; clamp to avoid underflow.
> */
> - if (grp && p->total_numa_faults) {
> - unsigned long fp =3D READ_ONCE(grp->footprint);
> - unsigned long sub =3D min(fp, p->total_numa_faults);
> -
> - WRITE_ONCE(grp->footprint, fp - sub);
> - }
> + if (grp && p->total_numa_faults)
> + sched_cache_footprint_update(grp, p->total_numa_faults, false);
> #endif
> sched_cache_group_put(grp);
> }
> @@ -3890,7 +3910,7 @@ static void task_numa_placement(struct =
task_struct *p)
> unsigned long total_faults;
> u64 runtime, period;
> spinlock_t *group_lock =3D NULL;
> - long __maybe_unused new_fp;
> + long __maybe_unused fp_diff =3D 0;
> struct numa_group *ng;
>=20
> /*
> @@ -3986,14 +4006,8 @@ static void task_numa_placement(struct =
task_struct *p)
> * go negative. Clamp to zero to prevent the
> * unsigned footprint from wrapping.
> */
> - scoped_guard(rcu) {
> - grp =3D rcu_dereference(p->sched_cache_grp);
> -
> - if (grp) {
> - new_fp =3D (long)READ_ONCE(grp->footprint) + diff;
> - WRITE_ONCE(grp->footprint, max(new_fp, 0L));
> - }
> - }
> + /* Update grp->footprint once, to limit the c2c cost. */
> + fp_diff +=3D diff;
> #endif
> }
>=20
> @@ -4008,6 +4022,18 @@ static void task_numa_placement(struct =
task_struct *p)
> }
> }
>=20
> +#ifdef CONFIG_SCHED_CACHE
> + if (fp_diff) {
> + scoped_guard(rcu) {
> + grp =3D rcu_dereference(p->sched_cache_grp);
> +
> + if (grp)
> + sched_cache_footprint_update(grp, abs(fp_diff),
> +     fp_diff > 0);
> + }
> + }
> +#endif
> +
> /* Cannot migrate task to CPU-less node */
> max_nid =3D numa_nearest_node(max_nid, N_CPU);
>=20
> --=20
> 2.25.1
>=20
>=20
>=20

