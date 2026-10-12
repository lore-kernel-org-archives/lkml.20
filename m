Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23192931EE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812132; cv=none; b=kVllYXVI+W6X/2LAsmXNgb4Bk/hGjr2vPs/Tp4f0YrEr4EjYduTwC3heJuksfO0uHtt0eOjjunaAGh8c+QADAA794sFeacyKp5tHXncc1s/pGBP3VgEMAQqkspG/yxYVNeHBjdKUVAWUFyIZTSY6liiFeFpx9ev8qMVhx8JsW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812132; c=relaxed/simple;
	bh=Df7cRe39XCFBf5ghSaQ0O4E5i4ULUUkT6f4bsZEcirs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=khY45RH6MNkEyYTHDIvAmg6cCUjkooJtZUnp+8ewlr+YcwrqwtuHnF18Xre3verdRQUJ89MB4NEuoPyDyk6nNLxCfAdfGJJyajELUO/51GKOwqwg1DnZAiKk1Od4UKp1M82Iuq0H3k3bL8fjhGxitd4CKUHS2oQrjiH0vxCMxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0OXtpK1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0OXtpK1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1482215a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812130; x=1792416930; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MeQxm9U061wfkbN1bmnqTcMp3bHt7ytVuTw275ipvM0=;
        b=T0OXtpK1/rf9N65gbPGt6SHRsUDyO9EU4SIj1lOzH1LTYNrzkW2XqDgVfW7MXluHzA
         adHkl3dBp3rH2IcHWNDFIPxuRImaQICGM5v7Ib9VhL0Bu+rCitupvTdCFWe4mLenLU87
         RtAhYVXI8xOAY30wh9o6EWBEjZ8be89QCVJiZXM1LH3YRhxCe5ZmGjB+7cG984CTw8D2
         tAwdceGNNUAqf/8Tdk8Ur7SpP1FfUOiFXhJQBxkWCMaSgKWCj+JwFrDL3d2u15YkFDso
         9hV822LTNcsU1OD+YFpisNpHw86Ow0GkhF+YgsYAdNa6x6T1j0P+jtZi27WocXhklpF7
         1lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812130; x=1792416930;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeQxm9U061wfkbN1bmnqTcMp3bHt7ytVuTw275ipvM0=;
        b=YbHCYZwWRbU/j8cOSyMzjkab2vXW4K8WR5QhcpAEopmLYgbZZiSTloUm93Z6CkNe0Y
         RsBA9c1xK5U968kv10HI5WEfXt0jMnaNJ4ulL2PkRz9lzQpLmSQ2hVFBt77EST2hA4ar
         dsYf81IZvRCdL+VIxre0GsY/8RwrRCOn/JyZM8Wpd14agKcG0Ecq4AQ7LAL1gQ0K3qdo
         qP7ytFQLh87MihAJhK+8QSvTJAawGG6SuW80DKoiuMvIFJjgk2zbfY7u18rnHocbUMsW
         FfdRMaEaMwi1hiG0O6LIExximt61gPEwifPq6fNz0oJ5DUgEibBxYy4D1gQ7EQNgNgF0
         B/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHcRy4J2iePnB3ImMquL9eW6VdumUrIvqcJVXFdJHJYbX32dbrFtFPnt5K0cYsfHghxID30CowQwiaKsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKErUz3yQ41jjRShq3LzT9nby3ungp6B1+IvS0WxIC92lmtprBx
	3zjIK5rb8k9CQq42jF1eb2WhpcLoupvqXGw2/JpdTtiLg38ivcUi83Cp
X-Gm-Gg: AYBFou2AXlUB1AegpYREb2ry2e2YHpsjhrnRpdnvTHnH9ecsbcGtEyS+4BMPrjP2z43
	uXMurPQVvW6HTmuuxlw4C7ucE3Mk6TX9mDFXEvZQfHsyyKg2yhPsboAv75LHohc7kpIwoG30sHy
	nIlGhdmnoW7LBev1C6R4mcDO6T3nPKksOpfaHX+yKiuVOQ7tF802zhOdwJrDoE2CdXMkSaQne/n
	1Q6hEHNfLxNEZXSpteB2FjPde7HpmdBZNURdJSbnwf6QooVpk3vJFOWjixSeMRoB2qw5xKdKy+0
	EacxBQ1kOAylrluHBej5fsoo0jFLG4ZLrK7zo1XzBwgB3agm+4wKLqK4zJLjQGLIVsFJ6kPLBXs
	k/fy6Ww6C6w7YBhLjLs3QsBjEMqPB4MOK3uI/8WxXx7eWm48P/xd58nN2yEGdESGBr6fg2aL4zI
	N2CjiE2FQmk6bEoQNO5RfWxoHFxBAUpl8HeKh+SrbyZwYMNqy5bTrMUdPlozXOI/OqY3ZjaIbMY
	RBCCBvXYIu4aHIM
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr8607323a91.41.1791812129973;
        Mon, 12 Oct 2026 06:35:29 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm17002811a91.4.2026.10.12.06.35.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:35:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.66.1.3\))
Subject: Re: [PATCH v2] sched/cache: Remove the old cache group footprint on
 exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <aspT_A1vl-RwKmoP@chenyu-dev>
Date: Mon, 12 Oct 2026 21:34:58 +0800
Cc: Ingo Molnar <mingo@redhat.com>,
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
Message-Id: <CEF1F3DC-07E5-44DA-9602-56A5B5810F09@gmail.com>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
 <aspT_A1vl-RwKmoP@chenyu-dev>
To: Chen Yu <yu.c.chen@intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>
X-Mailer: Apple Mail (2.3901.200.66.1.3)

Hi Chenyu,

Thanks for the review and for spotting the race.

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

Right, and there is no lock. grp->footprint is only ever written by =
plain
READ_ONCE()/WRITE_ONCE() in task_numa_placement(), exit and (with v2) =
exec.

> An enhanced way is to turn the raw footprint write into cmpxchg.
> It reduces the race, and since numa balancing scan interval=20
> numa_scan_period is not small, the overhead of using
> atomic write is low, I'm thinking of something below(only compile =
tested):

This looks right to me, including applying the placement diff once.
I've taken it into my local tree with a few tweaks, explained
inline below. Feel free to push back on any of them.

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

I folded it in without the forward declaration by ordering the helpers =
ahead
of the callers. The condition lives in sched_cache_footprint_drop(), =
with an
empty stub when CONFIG_NUMA_BALANCING is off, so exec and exit share one =
call:

	old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
	sched_cache_footprint_drop(old, p);
	sched_cache_group_put(old);

Moving the check into the helper costs no call: I confirmed in the
generated code that sched_cache_footprint_drop() is inlined into both
exec and exit, so the early-out test still sits in the caller.

The "must stay ahead of task_numa_free()" note moved onto that helper.
Nothing enforces the order; sched_cache_exec_mmap() just remains before
task_numa_free(current, false) in bprm_execve().

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

#ifdef CONFIG_NUMA_BALANCING
static void sched_cache_footprint_update(struct sched_cache_group *grp, =
long diff)
{
	unsigned long old =3D READ_ONCE(grp->footprint), new;

	do {
		if (diff < 0)
			new =3D old - min(old, -(unsigned long)diff);
		else
			new =3D old + diff;
	} while (!try_cmpxchg_relaxed(&grp->footprint, &old, new));
}

static void sched_cache_footprint_drop(struct sched_cache_group *grp,
				     struct task_struct *p)
{
	if (grp && p->total_numa_faults)
		sched_cache_footprint_update(grp, =
-(long)p->total_numa_faults);
}
#else
static inline void sched_cache_footprint_drop(struct sched_cache_group =
*grp,
					    struct task_struct *p) { }
#endif

Two changes in that helper:
- try_cmpxchg_relaxed() rather than try_cmpxchg().
  try_cmpxchg() is fully ordered on success; on arm64 with LSE that
  is casal. Its release half keeps the CAS from being observed before
  any earlier access from this CPU, and its acquire half keeps later
  accesses from being observed before the CAS. In exec_mmap() those
  earlier accesses include e.g. the tsk->mm and tsk->active_mm stores
  just above, which need no ordering against grp->footprint.

- Signed @diff rather than (delta, bool add), so the sign is not split
  across an abs()/">0" pair at the call site. Subtraction still clamps,
  with the negate done in unsigned arithmetic to keep the clamp in one
  type.

One question about the clamp: shouldn't atomic updates balance each
task's placement diffs against its exit/exec subtraction? Assuming no
overflow, old < delta would suggest an accounting bug that clamping
hides. Is there a legitimate path where the contributions do not =
balance?

If not, we could use atomic_long_t and atomic_long_add(diff,
&grp->footprint) instead of the CAS loop, provided the footprint fits
in a signed long. atomic_long_add() is already unordered; readers would
use atomic_long_read().

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

grp is declared inside the guard, and the signed diff is passed through:

	if (fp_diff) {
		scoped_guard(rcu) {
			struct sched_cache_group *grp;

			grp =3D rcu_dereference(p->sched_cache_grp);
			if (grp)
				sched_cache_footprint_update(grp, =
fp_diff);
		}
	}

> + }
> +#endif
> +
> /* Cannot migrate task to CPU-less node */
> max_nid =3D numa_nearest_node(max_nid, N_CPU);
>=20
> --=20
> 2.25.1

Thanks,
Jemmy


