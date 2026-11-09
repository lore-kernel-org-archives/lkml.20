Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231451;
	b=augUldGvikLC6kOxubITJqlhZJaaQVUU0Nr0bwrJ2A5LTAAYfFGXU5usRlwsFDPRZmn6
	 NQZSN0DqNWNfmhH4sKus0xBC0awG+qRP3ZmqsAs/Z++F55apJGtNiopXklp5/5NC7+s6R
	 baevZ/we70I4SyjV+irt3GdJIFaGj4JD/ILfDhzU0PVjarxOlNaLg7Vz9u38q9mEMCno/
	 urQC6bQavJQmFt5aKaRMKkQwl0D1Z+atEc6wZLpvzfVnOgRKUMRXruk2A7VIsLPW89DL2
	 SuJvGTIwhv2XWm+XdJfMuj/evnznruw19+rE5IYR/Cb+ZD5aYOoDh+KYbDbVH4iQ4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=JSCkrhz2TqQthxLClwvri60zifjJGsoROo6CvbE27kg=;
	b=w92mGzyjzZBM8aMWs/pMFaWJRzTFCQFuJpiSgXHSnOXXlIlmO9ElQNTziBKWMlySpMzp
	 HxCXDvD294Q+hJ5Dqlj3DLx7RHY3gO/cojcl1Ri4IANkNZVgYrqf7yMwYSJdsScImdj2S
	 XISOitgxGLk2NDkIxwGZwNu6V39hF0dZ5E0JhqXELuQislX6w/2bNmTU8HkCr5IDhbXR/
	 1ZUx0ZhbKojWm9OJavaModbDi82BG3qMKV1S8WVs6lVrqzVC5KfdhTQFBqG9pzEqGrj4L
	 pKSlg0JXLQB/5WWS53OBQ+qIRC2bP6Mmj6mUWqII4lhcKBwituK4hilT/0vwZKeHxzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeLGKn2F;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5F606D825
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB5F606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeLGKn2F
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed28bac8d7so3228825ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231450; x=1794836250; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSCkrhz2TqQthxLClwvri60zifjJGsoROo6CvbE27kg=;
        b=eeLGKn2F7qXTGEV2a6fsB7Vz9ZWKqcmJQ3lEYihYYVg/jebVB2xeONXP6VJ9o1OsRO
         AmzLDLBHXFceDEhIRfilajGHgz9KZmm57XJHLATaH/2smoIoyQfk8NJiQTqZ+bo8Em3R
         WyeNQZptGGQR4mnqweqh/ICbfJ04cX0h8gjWZQ+rCJFyzA9sBGr9QKcP9MjBZuuVhw3K
         l1WpDV/SF/jnXupi4Rp8CCbe8G5y8Wwa8oDcti7KSHCEvr7Jl6UUL7YCgQI2lQfYuFaY
         Nm6ApdNr9AbGqxNadEofHGNSk0GBoCgsW4iouqjQOZw/MiRLf42u++Ew+19ySwB7/1Ij
         yBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231450; x=1794836250;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSCkrhz2TqQthxLClwvri60zifjJGsoROo6CvbE27kg=;
        b=JW/7ir/9A1y9QYfJsX8d/NJcm54uShuQsAwFnmqHjHNkDvAWN0eabh1w+0sJEv2c9C
         CSfcAabbHqky7MQqakvN1VI0ivOs7yaISXbCJjU5pGTsdxRcEq00w5CoSCe3xrLqRuBX
         j693RkJGPcMbJGZv4YKHNkjJGjsZLE9g+i5aa4rOYVtwzx1jiOPrf5eiOY166wfMDWK5
         Oc2n2CPf6RWlTP3yJDEPV6B/FXjv+V/rdHmBGR9USDo0PG8JK5UMULFa1zTslqflHQLy
         m5Fsu7gjH/zG3Vpd6RNFn5E2YIZONGiYLn3QjmGvAc7Joro1dkWeifh1iO5rmnNYGwgB
         /+bA==
X-Forwarded-Encrypted: i=1; AL+hErEf3c+q3c1GZjUl1VVPx+w9O9ik7+Y29/ec6gO0jIFptE0ezEMbI0CVilHIbHWUEKx1OYKRebamhabumTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h/r+Iq2OY8Y5/yftj9RN1dUM0IDjBveuvVy7K6lHyNVFbqXwW
	Vey83BQA9+vRLeSn/aPZFbRdMwqce2z9shdBd8bkiAglGMDx8c24iLb9
X-Gm-Gg: AYBFou1wFj+Kb1tPf2GQ6Na8IKp7rUKKYmj7EstZy4lED44yW3UP+vT35afNqTZOu0d
	RVpoSL+jTpRZ3QgTaKTR+jC24xD1KQOwjcRFEInuwea1Xdf8dnF7xkSTnPDAA7y6AhbL8shsyyi
	d0biVqx43P+buma0h5SK2eN1PrjVaDvU+LIjQLrA0tJaZ5nG0eiYzoN9X6p46ACjgs9Zqce+gyx
	keR3JN0XHRE8prJbJ9cVLgq6Rr3Ih91+iJp4GrG+irP+AR+uNCIa9zfE+zkVHWFeRfbzWGkXXTO
	37nQDDRUlBhJ2gL5DzXQdV6qYtck5CbgG+6VHXijtOSvrnvYFW3ppEN6yXcXQKo2o/LLozWcxAt
	6xLBOC7hny2jPbWZaBFccVyEToVpkr7Uaygr1HklB+kUWJL/LJM4BTbyiio2BwfMZA2feFfgr/8
	ISAfr9za5c8kD4o721h7QY0XtzwPpwAQTYk+OM9IAYARTeLV0YtCPIj16YyTT3s5Aq+N39dT5Fz
	9zrtPAGpYgnWGLTDP9h3qzrDDLtVFxx4qhgC5AecfXUdQDjAtclgAxGxRc46BM7UB7Px8cvgshA
	aIerLanLJR8nQCF3vZsOpj/0sw7ufjuJpg98
X-Received: by 2002:a17:902:e546:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2ed6817ded1mr49276785ad.28.1794231450248;
        Mon, 09 Nov 2026 05:37:30 -0800 (PST)
Received: from smtpclient.apple ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81745f12sm11290635ad.68.2026.11.09.05.37.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:37:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.300.31\))
Subject: Re: [PATCH v4] sched/cache: Remove the old cache group footprint on
 exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <20261022031933.46869-1-jemmywong512@gmail.com>
Date: Mon, 9 Nov 2026 21:36:59 +0800
Cc: yu.c.chen@intel.com,
 tim.c.chen@linux.intel.com,
 Jemmy Wong <jemmywong512@gmail.com>,
 chen.yu@linux.dev,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <35237F63-C205-4AE5-87C2-BE85604055C6@gmail.com>
References: <20261022031933.46869-1-jemmywong512@gmail.com>
To: mingo@redhat.com,
 peterz@infradead.org
X-Mailer: Apple Mail (2.3901.300.31)

Hi Ingo, Peter,

A gentle ping on this sched/cache fix.

v4 carries Chen Yu=E2=80=99s Reviewed-by and Tested-by and only updates =
the
comment and commit description relative to v3.

Are there any remaining concerns or additional tests needed before this
can be picked up?

Thanks,
Jemmy


> On Oct 22, 2026, at 11:19=E2=80=AFAM, Jemmy Wong =
<jemmywong512@gmail.com> wrote:
>=20
> Exec switches cache groups without subtracting the task's old =
footprint.
> CLONE_VM tasks without CLONE_THREAD can retain the old mm and group
> despite de_thread(), leaving an undecayed contribution that can =
suppress
> cache-aware aggregation. This mainly affects longer-lived CLONE_VM =
tasks:
> vfork() children rarely accumulate NUMA faults before exec because =
scanning
> starts late. Found by inspection, without a workload reproducer.
>=20
> Rename sched_cache_replace_grp() to sched_cache_switch_grp() and share
> exec/exit accounting: subtract the old contribution, publish the new
> pointer, and return the old reference for release. Exec subtraction =
must
> precede task_numa_free() clearing total_numa_faults.
>=20
> Convert footprint to atomic_long_t so concurrent placement updates
> cannot overwrite exec/exit subtractions. Use non-returning atomic
> add/sub, requiring no ordering against unrelated accesses, and apply
> the net total_numa_faults delta once per placement pass to reduce
> cache-line traffic. Assuming signed long accounting does not overflow,
> updates balance without a write-side clamp; retain the defensive
> read-side zero clamp and negative-value warning.
>=20
> Keep NUMA reset ordering unchanged. If exec fails after switching =
groups
> but before resetting statistics, exit can subtract the old total from
> the new, private group. The task is past the point of no return, so =
that
> group dies on exit; the surviving old shared group remains correctly
> accounted.
>=20
> Fixes: b636fef85bda ("sched/cache: Introduce =
task_struct->sched_cache_grp to fix UAF")
> Suggested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> Assisted-by: LLM
>=20
> ---
>=20
> v3: =
https://lore.kernel.org/all/20261015053604.29927-1-jemmywong512@gmail.com/=

> v2: =
https://lore.kernel.org/all/20261010111612.31345-1-jemmywong512@gmail.com/=

> v1: =
https://lore.kernel.org/all/20261009151215.62878-1-jemmywong512@gmail.com/=

>=20
> Changes in v4:
> - Restore the footprint convergence comment next to the batched update =
in
>  task_numa_placement(), referring to atomic_long_t as Chen Yu =
requested.
> - Add Chen Yu's Reviewed-by, Tested-by and Assisted-by tags.
> - Shorten the commit description while retaining the accounting =
rationale.
>=20
> Changes in v3:
> - Use atomic_long_t and atomic add/sub to prevent lost accounting =
updates.
> - Batch placement updates using the net total_numa_faults delta.
> - Rename sched_cache_replace_grp() to sched_cache_switch_grp(); share
>  exec/exit subtraction, guarded by old && old !=3D new.
> - Drop the write-side clamp; use an atomic read, warning and zero =
clamp.
> - Document failed-exec over-subtraction in the dying task's private =
group;
>  keep NUMA reset ordering unchanged.
> - Add Chen Yu's Suggested-by; drop Tim Chen's Reviewed-by pending =
renewed
>  review of the accounting changes.
>=20
> Changes in v2:
> - Mention vfork(), explain that longer-lived CLONE_VM tasks are the =
main
>  concern, and state that the issue was found by code inspection.
> - Add the Fixes tag and document that exec footprint subtraction must
>  precede task_numa_free() resetting p->total_numa_faults.
> - Add Tim Chen's Reviewed-by tag (not carried forward to v3).
>=20
> Validation:
> - v4: Strict checkpatch and whitespace checks passed.
> - v3: Built kernel/sched/{fair,core,build_utility}.o on x86-64 with:
>  - CONFIG_SCHED_CACHE=3Dy, CONFIG_NUMA_BALANCING=3Dy
>  - CONFIG_SCHED_CACHE=3Dy, CONFIG_NUMA_BALANCING=3Dn
>  - CONFIG_SCHED_CACHE=3Dn, CONFIG_NUMA_BALANCING=3Dy
> - Chen Yu tested v3 with hackbench on a Xeon with multiple LLCs per =
node
>  and reported no obvious performance difference. Some apparent
>  regressions had large run-to-run variance; selected reruns were also
>  unstable. His report is at:
>  https://lore.kernel.org/all/atiP8TwaDDtbImRn@chenyu-dev/
> - Build and runtime tests have not been rerun for this comment-only v4
>  revision.
>=20
>=20
> include/linux/sched.h |  3 +-
> kernel/sched/fair.c   | 90 +++++++++++++++++++------------------------
> 2 files changed, 41 insertions(+), 52 deletions(-)
>=20
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 12a7e094a3e6..bb0a424b6ad8 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2391,7 +2391,8 @@ struct sched_cache_group {
> unsigned long epoch;
> u64 nr_running_avg;
> unsigned long next_scan;
> - unsigned long footprint;
> + /* Sum of the member tasks' accounted footprints, in pages. */
> + atomic_long_t footprint;
> int cpu;
> refcount_t refcnt;
> struct rcu_head rcu;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b5546cd27dba..ab5c117d32a2 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1427,6 +1427,7 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
> #ifdef CONFIG_NUMA_BALANCING
> unsigned long llc, footprint;
> struct sched_domain *sd;
> + long fp;
> int scale;
>=20
> guard(rcu)();
> @@ -1441,7 +1442,9 @@ static bool exceed_llc_capacity(struct =
sched_cache_group *grp, int cpu)
> * excluded.
> */
> llc =3D sd->llc_bytes;
> - footprint =3D READ_ONCE(grp->footprint);
> + fp =3D atomic_long_read(&grp->footprint);
> + WARN_ON_ONCE(fp < 0);
> + footprint =3D max(fp, 0L);
>=20
> /*
> * Scale the LLC size by 256*llc_aggr_tolerance
> @@ -1621,7 +1624,7 @@ int mm_init_sched(struct mm_struct *mm,
> grp->cpu =3D -1;
> grp->next_scan =3D jiffies;
> grp->nr_running_avg =3D 0;
> - grp->footprint =3D 0;
> + atomic_long_set(&grp->footprint, 0);
> refcount_set(&grp->refcnt, 1);
> /*
> * The update to grp->pcpu_sched should not be reordered
> @@ -1663,12 +1666,26 @@ DEFINE_FREE(sched_cache_group_put, struct =
sched_cache_group *,
> #define rcu_deref_sched_cache_grp(tsk) \
> rcu_dereference_check((tsk)->sched_cache_grp, (tsk) =3D=3D current)
>=20
> -static struct sched_cache_group *sched_cache_replace_grp(struct =
task_struct *p,
> - struct sched_cache_group *new)
> +static inline void sched_cache_footprint_update(struct task_struct =
*p, long delta)
> +{
> + struct sched_cache_group *grp =3D rcu_deref_sched_cache_grp(p);
> +
> + if (grp && delta)
> + atomic_long_add(delta, &grp->footprint);
> +}
> +
> +/* Remove the old contribution and return the old group for the =
caller to put. */
> +static struct sched_cache_group *sched_cache_switch_grp(struct =
task_struct *p,
> + struct sched_cache_group *new)
> {
> struct sched_cache_group *old;
>=20
> old =3D rcu_deref_sched_cache_grp(p);
> +#ifdef CONFIG_NUMA_BALANCING
> + /* Other tasks sharing the old mm can keep its group alive after =
exec. */
> + if (old && old !=3D new)
> + atomic_long_sub(p->total_numa_faults, &old->footprint);
> +#endif
> rcu_assign_pointer(p->sched_cache_grp, new);
>=20
> return old;
> @@ -1722,28 +1739,18 @@ void sched_cache_exec_mmap(struct task_struct =
*p, struct mm_struct *mm)
> /*
> * Acquire the new reference before publishing the pointer, then drop
> * the old one. @p is current and the only writer of its own pointer.
> + *
> + * Footprint subtraction must precede task_numa_free() in =
bprm_execve(),
> + * which clears p->total_numa_faults. Nothing here enforces that =
order.
> */
> - old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
> + old =3D sched_cache_switch_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
> sched_cache_group_put(old);
> }
>=20
> void sched_cache_exit_mm(struct task_struct *p)
> {
> - struct sched_cache_group *grp =3D sched_cache_replace_grp(p, NULL);
> + struct sched_cache_group *grp =3D sched_cache_switch_grp(p, NULL);
>=20
> -#ifdef CONFIG_NUMA_BALANCING
> - /*
> - * Subtract this task's footprint from the group before dropping the
> - * reference, so the group footprint converges as its threads exit.
> - * Unlocked for performance; clamp to avoid underflow.
> - */
> - if (grp && p->total_numa_faults) {
> - unsigned long fp =3D READ_ONCE(grp->footprint);
> - unsigned long sub =3D min(fp, p->total_numa_faults);
> -
> - WRITE_ONCE(grp->footprint, fp - sub);
> - }
> -#endif
> sched_cache_group_put(grp);
> }
>=20
> @@ -2133,6 +2140,9 @@ void init_sched_mm(struct task_struct *p)
> static inline void account_mm_sched(struct rq *rq, struct task_struct =
*p,
>    s64 delta_exec) { }
>=20
> +static inline void sched_cache_footprint_update(struct task_struct =
*p,
> + long delta) { }
> +
> void init_sched_mm(struct task_struct *p) { }
>=20
> static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> @@ -3830,14 +3840,13 @@ static int preferred_group_nid(struct =
task_struct *p, int nid)
> static void task_numa_placement(struct task_struct *p)
> __context_unsafe(/* conditional locking */)
> {
> - struct sched_cache_group __maybe_unused *grp;
> int seq, nid, max_nid =3D NUMA_NO_NODE;
> unsigned long max_faults =3D 0;
> unsigned long fault_types[2] =3D { 0, 0 };
> + unsigned long old_faults =3D p->total_numa_faults;
> unsigned long total_faults;
> u64 runtime, period;
> spinlock_t *group_lock =3D NULL;
> - long __maybe_unused new_fp;
> struct numa_group *ng;
>=20
> /*
> @@ -3912,36 +3921,6 @@ static void task_numa_placement(struct =
task_struct *p)
> ng->total_faults +=3D diff;
> group_faults +=3D ng->faults[mem_idx];
> }
> -#ifdef CONFIG_SCHED_CACHE
> - /*
> - * Per task p->numa_faults[mem_idx] converges,
> - * so the accumulation of each task's faults
> - * converges too - Given the number of threads,
> - * it cannot overflow an unsigned long.
> - * Racy with concurrent updates from other threads
> - * sharing this mm. Acceptable since footprint is a
> - * heuristic and occasional lost updates are tolerable.
> - *
> - * If a task exits, its corresponding footprint must
> - * be subtracted from p->sched_cache_grp->footprint,
> - * otherwise the footprint will not converge: the
> - * exiting thread's footprint remains unchanged/undecayed.
> - * See exit_mm().
> - *
> - * Lost updates and unsynchronized subtraction
> - * in exit_mm() can cause footprint + diff to
> - * go negative. Clamp to zero to prevent the
> - * unsigned footprint from wrapping.
> - */
> - scoped_guard(rcu) {
> - grp =3D rcu_dereference(p->sched_cache_grp);
> -
> - if (grp) {
> - new_fp =3D (long)READ_ONCE(grp->footprint) + diff;
> - WRITE_ONCE(grp->footprint, max(new_fp, 0L));
> - }
> - }
> -#endif
> }
>=20
> if (!ng) {
> @@ -3964,6 +3943,15 @@ static void task_numa_placement(struct =
task_struct *p)
> max_nid =3D preferred_group_nid(p, max_nid);
> }
>=20
> + /*
> + * Per task p->numa_faults[mem_idx] converges, so the accumulation of =
each
> + * task's faults converges too. Given the number of threads, it =
cannot
> + * overflow an atomic_long_t.
> + *
> + * Apply the net change once per placement pass to limit cache-line =
traffic.
> + */
> + sched_cache_footprint_update(p, p->total_numa_faults - old_faults);
> +
> if (max_faults) {
> /* Set the new preferred node */
> if (max_nid !=3D p->numa_preferred_nid)
> --
> 2.54.0 (Apple Git-157)

