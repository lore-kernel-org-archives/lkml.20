Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00247CA76
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219081; cv=pass; b=MY53R0/ouDrZxHQKZZHpHAsXPwwnYMW4W4Jh8/chImNO0GkOQ2RToqIP9z39VTl3CMw1SJrM4OGTtjpVRjxiv7xaac/79TYwA+yuio6m/mBj57RRo/zVeomM9u1c0c3lsQAoSCQwKJewaaiJWsts3rtlLhue24oSA30VkkPAL5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219081; c=relaxed/simple;
	bh=BsiF8+r5vgUuRparDjgrLB9w7U/qShYtdjOD3d2tROQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BX7gouIn2J+L4QAqYPIE4nPaHrP30OB+leot2IpGRz9qoLhQH5U2B7y5ogORcco+CG1IrHgzzIy9zml5n+EG4IKxcSnwvG8Xr3E5JxXuGoJi+gX99szPR+0pMx6NsymlayfHoPp9HuS5Ch6Hllf16R564o64uH4DjT7dNVj26IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa93kqwP; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa93kqwP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso4519865e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789219078; cv=none;
        d=google.com; s=arc-20260327;
        b=VPcvBWKVw+NWs6xNMqWanG6VjnZ0mxcmZat4SwpZrYDAOkrpC0WgfHaHMMKR9QfmFc
         28qgaATpxr5xf+xa3sOejSRZZGNpEu0I9ijCgfhl638vBtmiKTkWyZwz/GEbSAbaO6Kw
         XOm0YftmnKyJ/VSakPeR5zdIRa6qvFrDuy8bevdxuGZDunkza3fZzN7ZBoGbHeGq8nmN
         myq0qqarOuVZ7QURrmeKYJ2Fr7cBH1s+p+T0DVzfQu86yCBUwPcZRnSpa5ZA+AaFphSt
         y5N1weqnHDEYvnRHV90C0Gl4Lm3R8R21h1p10e85JlRaTVBaxgr4vfY/8GMX+l/j+Kx6
         uvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPi8mMYl+gIyOrC3hZ2sXqCE+u6Vau0Qj07zs3k7gBA=;
        fh=n7CWuG3vXyNVXrRoLvvK2Zde98ARutG49dSBPlMPLlg=;
        b=AzHLlLA6I/RGd0xXw9QTLd4YYy2FxtuTAl1+wHd2k5rMC01Oqj855VQa6DDHEdtfsj
         /3pdCgIpJtGWKeQXb0SrCNekT7ZteRLqa6lSxI62tdyKT7JKjHVTXTevxtTTsfB20n+N
         l+C1FcIo4eqChQFGzWqJRZZT9/MUmsSUHMLLjKlvFhmPXjmKVGfPC1bcGYU+SmxiRxHa
         9CCKtViv1H7mcZgPl6iV/9T5FpOnOj/ASQAsxS7TbITOTBKwLyCipXoVvAeG5Fkq+5GO
         +35F3jiEkh8ZTkqt8ttSWJa9VefdeYePI75tp9VhlENGHZdxU9HVDUueXTW0qedvAX/S
         pEeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219078; x=1789823878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPi8mMYl+gIyOrC3hZ2sXqCE+u6Vau0Qj07zs3k7gBA=;
        b=Pa93kqwPH/SeNFjsdCZVBPfFpttIy3qoCOSQS4W2ZvJJvB+3DIOxuYM8ZjkscBohkj
         mROx2kk1SCZfxZ9K5T1LzkevowV8Tc7JpvYO7yLCT7fsya2tDRRCCCIhjrbdQNV0o3Vc
         wjLQ6+y1V8qrCxzgcg7YX6g5tgc3qtxoBoIk82jyU1za6wLQ3qxA528iwf7AMOmKJ0qy
         nAbwwXoqayiMtCsL2vKk+TZrp9xMvh/SZv0ZJvFFGNeZYucsq20DPsMT+cJnnRlXyyW7
         0Oh6I//FZAMOXskxT6t4IYFdUp+ZZkpSGwUnTUVSdPLgyB2cofbDqkmwl5x1xLlxr3Q3
         88FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219078; x=1789823878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPi8mMYl+gIyOrC3hZ2sXqCE+u6Vau0Qj07zs3k7gBA=;
        b=nOb8fLxHjPBZ7j3Pwvcae6p/OJxcYxm/oWgFiVrvBMRIyyn4rYxs/wdNngWZtLAegn
         sKo9c59u6MSpsE83a2NHRycBr74r0wlLKbFr+cJ58mxZrcyIlBmS/mJx4z7vVLJyeRXx
         tvwv7J1UDqMcP1oYAWJLHFlJsBvcIXAyQDKTb8EFWM6iDzig9FV441PGiDq/5AB9ojQz
         2yvuZLJBYkV5Rym/myBLeTOrazZeDIGgslfDxvOugXgDie3gDv6Fe90jK5IziZVYWobH
         1f3i1nNIVIbMcJTZOpOwQNjrUrsyJKRkCNwifGJa7e4uLOpeZNxUZva0wezkqWAFkLKv
         ZrDA==
X-Forwarded-Encrypted: i=1; AKwUvBxlGPZMGV7FQF4rK9nOqYlLUIlFTPwlrjxXmQBAVzuV2ixMhfweGpfkWOdj+pZNW9vYT4cOeAHNdy/n3eI=@vger.kernel.org
X-Gm-Message-State: AFuF++nkL1L91vKPuQBcAExgevVaoNkaaCBhBcogtHB1RU1iQvaI2NXd
	nL79uNqkfbJRD4nV5tCtw+eKHJLY3H+r0/a4jfaLfzQhHszgf51AiZO2WTuNgNBUXCi9R64l90S
	d9Mi0YulPDUJlK6u6vOUUz0NbPXFCUn8=
X-Gm-Gg: AYBFou3/whcN6ZtCoye9ajPZsBr/mY7SSSc8t1BDFWyCpuLlqv/PfjyzF7fIiaunqUO
	l03FaG1w1gih5yzWFofdVrjd7HVgB9l5Xtc+qVguyphyC6UdSnX5psm6Ith5VBI+cnd/rBJ5W/B
	DboZus7X3wFw55IrDyHpBoWGs6y2WqIko5v5gtbuBK+gqdAFj4U7976FFvTcre22BglnmhVvXJA
	TigNvHQXiKNu3REgyDGw8+DlgoSAGq+FpSRyBY0cvdU6/zChmVSJjgd7fsSjaqzBe43cmTz9rMr
	KF0SIVlt5AnUprW22sUFoWPIEFfVhZNc2a/4kIL3vmUHuZBhL2EFojBHvmLMfHBegQWw2dVB4Xv
	+DqVVdSusenc=
X-Received: by 2002:a05:600c:6216:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49e6ca350camr24650915e9.0.1789219077551; Sat, 12 Sep 2026
 06:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
 <c201584b58aec856342e0f23f8df9f81baccba1d@linux.dev> <CAN_Opa-cvXVJeMxniuarq+2mE9EepjzTCgii1bW6mmSnaCKKxQ@mail.gmail.com>
 <4298908f242e82d54e0f462307ee18fa777b0935@linux.dev>
In-Reply-To: <4298908f242e82d54e0f462307ee18fa777b0935@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 12 Sep 2026 21:17:45 +0800
X-Gm-Features: AcwNN1WZzQfgiUds4j9elCw2mdpkAUcvPuBlha1DBx4yXy8ULrk4CMRYin5AjcY
Message-ID: <CAN_Opa_AVXF=+0FbTccTQU_vrQ798Y0HBynmH8qpKickDnS55Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] srcu: Round out atomic SRCU support
To: Zqiang <qiang.zhang@linux.dev>
Cc: paulmck@kernel.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, jiangshanlai@gmail.com, 
	josh@joshtriplett.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 8:41=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > On Thu, Sep 10, 2026 at 8:16 PM Zqiang <qiang.zhang@linux.dev> wrote:
> >
> > >
> > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > >
> > >  This series rounds out atomic SRCU support with a reader-free fastpa=
th,
> > >  some atomic-context fixes, and additional test coverage.
> > >
> > >  The core change is a reader-free fastpath for synchronize_srcu_atomi=
c().
> > >  Atomic SRCU's read-side critical sections disable preemption, so whe=
n
> > >  the summed lock and unlock counts match for both ranks,
> > >  synchronize_srcu_atomic() can end the grace period immediately, with=
out
> > >  the index flip or the srcu_advance_state() scans. Correctness depend=
s
> > >  on the grace-period anchor written by srcu_gp_start() preceding the
> > >  lock-count scan; two LKMM litmus tests (patches 1-2) verify that
> > >  ordering.
> > >
> > >  For synchronize_srcu_atomic(), the following items maybe also
> > >  need to be added:
> > >
> > Hi Zqiang
> > Sent as: https://lore.kernel.org/rcu/20260911093515.2802551-1-kunwu.cha=
n@gmail.com/
> >
> > Did a small late_initcall that enters an atomic read-side critical sect=
ion and
> > calls synchronize_srcu_atomic(). srcu_lock_sync() catches it:
> >  WARNING: possible recursive locking detected
> >  swapper/0/1 is trying to acquire lock: (&ss) at:
> > synchronize_srcu_atomic+0x28/0x380
> >  but task is already holding lock: (&ss) at:
> > srcu_lockdep_test_init+0xd0/0x170
> >  *** DEADLOCK ***
> > Rcutorture SRCU-N/P also pass.
>
> Hi, kunwu
>
> You can add srcu_atomic lockdep test to rcutorture to verify
> your change, and I also saw that Paul suggested the same thing :)
>

Hi Zqiang,
Thanks for the suggestion. This is very helpful.

I saw Paul's suggestion too. I'll use your example as a starting
point, verify the atomic SRCU lockdep cases, and check the
--do-srcu-lockdep handling in torture.sh, including the normal RCU
read-side case Paul mentioned.

I'll add a Suggested-by tag for your contribution when I post the
changes.

Thanks,
Kunwu

> For example, as shown below (I am not test or verify it):
>
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index d795e07a12ad..d4f7399acbd5 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -4662,6 +4662,17 @@ static DECLARE_RWSEM(rwsem7);
>  static DECLARE_RWSEM(rwsem8);
>  static DECLARE_RWSEM(rwsem9);
>
> +static DEFINE_RAW_SPINLOCK(spin0);
> +static DEFINE_RAW_SPINLOCK(spin1);
> +static DEFINE_RAW_SPINLOCK(spin2);
> +static DEFINE_RAW_SPINLOCK(spin3);
> +static DEFINE_RAW_SPINLOCK(spin4);
> +static DEFINE_RAW_SPINLOCK(spin5);
> +static DEFINE_RAW_SPINLOCK(spin6);
> +static DEFINE_RAW_SPINLOCK(spin7);
> +static DEFINE_RAW_SPINLOCK(spin8);
> +static DEFINE_RAW_SPINLOCK(spin9);
> +
>  DEFINE_STATIC_SRCU(srcu0);
>  DEFINE_STATIC_SRCU(srcu1);
>  DEFINE_STATIC_SRCU(srcu2);
> @@ -4673,6 +4684,17 @@ DEFINE_STATIC_SRCU(srcu7);
>  DEFINE_STATIC_SRCU(srcu8);
>  DEFINE_STATIC_SRCU(srcu9);
>
> +DEFINE_STATIC_SRCU_ATOMIC(srcu0_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu1_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu2_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu3_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu4_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu5_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu6_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu7_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu8_atomic);
> +DEFINE_STATIC_SRCU_ATOMIC(srcu9_atomic);
> +
>  static int srcu_lockdep_next(const char *f, const char *fl, const char *=
fs, const char *fu, int i,
>                              int cyclelen, int deadlock)
>  {
> @@ -4702,6 +4724,13 @@ static void rcu_torture_init_srcu_lockdep(void)
>                                           &rwsem5, &rwsem6, &rwsem7, &rws=
em8, &rwsem9 };
>         struct srcu_struct *srcus[] =3D { &srcu0, &srcu1, &srcu2, &srcu3,=
 &srcu4,
>                                         &srcu5, &srcu6, &srcu7, &srcu8, &=
srcu9 };
> +
> +       raw_spinlock_t *spins[] =3D { &spin0, &spin1, &spin2, &spin3, &sp=
in4, &spin5,
> +                                       &spin6, &spin7, &spin8, &spin9};
> +       struct srcu_struct *srcus_atomic[] =3D {&srcu0_atomic, &srcu1_ato=
mic, &srcu2_atomic,
> +                                               &srcu3_atomic, &srcu4_ato=
mic, &srcu5_atomic,
> +                                               &srcu6_atomic, &srcu7_ato=
mic, &srcu8_atomic,
> +                                               &srcu9_atomic};
>         int testtype;
>
>         if (!test_srcu_lockdep)
> @@ -4812,11 +4841,48 @@ static void rcu_torture_init_srcu_lockdep(void)
>         }
>  #endif // #ifdef CONFIG_TASKS_TRACE_RCU
>
> +        if (testtype =3D=3D 4) {
> +                pr_info("%s: test_srcu_lockdep =3D %05d: SRCU_ATOMIC %d-=
way %sdeadlock.\n",
> +                        __func__, test_srcu_lockdep, cyclelen, deadlock =
? "" : "non-");
> +                if (deadlock && cyclelen =3D=3D 1)
> +                        pr_info("%s: Expect hang.\n", __func__);
> +                for (i =3D 0; i < cyclelen; i++) {
> +                        j =3D srcu_lockdep_next(__func__, "srcu_read_loc=
k_atomic", "synchronize_srcu_atomic",
> +                                              "srcu_read_unlock_atomic",=
 i, cyclelen, deadlock);
> +                        idx =3D srcu_read_lock_atomic(srcus_atomic[i]);
> +                        if (j >=3D 0)
> +                                synchronize_srcu_atomic(srcus_atomic[j])=
;
> +                        srcu_read_unlock_atomic(srcus_atomic[i], idx);
> +                }
> +                return;
> +        }
> +
> +        if (testtype =3D=3D 1) {
> +                pr_info("%s: test_srcu_lockdep =3D %05d: SRCU_ATOMIC/raw=
_spinlock %d-way %sdeadlock.\n",
> +                        __func__, test_srcu_lockdep, cyclelen, deadlock =
? "" : "non-");
> +                for (i =3D 0; i < cyclelen; i++) {
> +                        pr_info("%s: srcu_read_lock_atomic(%d), raw_spin=
_lock(%d), raw_spin_unlock(%d), srcu_read_unlock_atomic(%d)\n",
> +                                __func__, i, i, i, i);
> +                        idx =3D srcu_read_lock_atomic(srcus_atomic[i]);
> +                        raw_spin_lock(spins[i]);
> +                        raw_spin_unlock(spins[i]);
> +                        srcu_read_unlock_atomic(srcus_atomic[i], idx);
> +
> +                        j =3D srcu_lockdep_next(__func__, "raw_spin_lock=
", "synchronize_srcu_atomic",
> +                                              "raw_spin_unlock", i, cycl=
elen, deadlock);
> +                        raw_spin_lock(spins[i]);
> +                        if (j >=3D 0)
> +                                synchronize_srcu_atomic(srcus_atomic[j])=
;
> +                        raw_spin_unlock(spins[i]);
> +                }
> +                return;
> +        }
> +
>  err_out:
>         pr_info("%s: test_srcu_lockdep =3D %05d does nothing.\n", __func_=
_, test_srcu_lockdep);
>         pr_info("%s: test_srcu_lockdep =3D DNNL.\n", __func__);
>         pr_info("%s: D: Deadlock if nonzero.\n", __func__);
> -       pr_info("%s: NN: Test number, 0=3DSRCU, 1=3DSRCU/mutex, 2=3DSRCU/=
rwsem, 3=3DSRCU/Tasks Trace RCU.\n", __func__);
> +       pr_info("%s: NN: Test number, 0=3DSRCU, 1=3DSRCU/mutex, 2=3DSRCU/=
rwsem, 3=3DSRCU/Tasks Trace RCU, 4=3DSRCU_ATOMIC, 5=3DSRCU_ATOMIC/raw_spinl=
ock.\n", __func__);
>         pr_info("%s: L: Cycle length.\n", __func__);
>         if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU))
>                 pr_info("%s: NN=3D3 disallowed because kernel is built wi=
th CONFIG_TASKS_TRACE_RCU=3Dn\n", __func__);
>
>
> Thanks
> Zqiang
>
>
>
>
>
> >
> > Thanks, Kunwu
> >
> > >
> > > srcu_lock_sync(&ssp->dep_map);
> > >
> > >  RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> > >  "Illegal synchronize_srcu() in same-type SRCU read-side critical sec=
tion");
> > >
> > >  if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> > >  return;
> > >
> > >  Thanks
> > >  Zqiang
> > >
> > >  The series is:
> > >
> > >  1-2 LKMM litmus tests for the reader-free fastpath ordering.
> > >  3 srcutree: add the reader-free fastpath.
> > >  4 rcutorture: add --do-atomic-srcu to torture.sh.
> > >  5-7 srcutree: honor and propagate is_atomic so atomic SRCU never
> > >  transitions to big.
> > >  8 srcutree: forbid srcu_expedite_current() on atomic SRCU.
> > >  9 rcutorture: disable srcu_expedite_current() for atomic SRCU.
> > >  10 srcutree: skip callback scheduling for atomic SRCU grace periods.
> > >  11 srcutree: drop the srcu_barrier() sleep for atomic SRCU.
> > >  12 srcutree: remove leftover debug pr_alert()s.
> > >  13 srcu: restrict the non_block annotation to task context, fixing a
> > >  KCSAN data race.
> > >
> > >  The KCSAN race in patch 13 is a data race on the interrupted task's
> > >  ->non_block_count when a timer callback runs atomic-SRCU readers in
> > >  inline softirq context.
> > >
> > >  Tested with herd7 7.58 (litmus tests), torture.sh --do-atomic-srcu, =
and
> > >  torture.sh --do-atomic-srcu --do-kcsan (KCSAN+PROVE_LOCKING).
> > >
> > >  Kunwu Chan (13):
> > >  litmus: Add SRCU fastpath anchor-before-scan test
> > >  litmus: Add SRCU fastpath scan-before-anchor test
> > >  srcutree: Add reader-free fastpath to synchronize_srcu_atomic()
> > >  rcutorture: Add atomic-SRCU support to torture.sh
> > >  srcutree: Honor is_atomic in check_init_srcu_struct()
> > >  srcutree: Make init_srcu_struct_atomic() prevent transition to big
> > >  srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
> > >  srcutree: Forbid srcu_expedite_current() on atomic SRCU
> > >  rcutorture: Disable srcu_expedite_current() for atomic SRCU
> > >  srcutree: Skip callback scheduling for atomic SRCU grace periods
> > >  srcutree: Remove srcu_barrier() sleep for atomic SRCU
> > >  srcutree: Remove debug pr_alert()s
> > >  srcu: Restrict atomic-SRCU non_block annotation to task context
> > >
> > >  include/linux/srcu.h | 10 +-
> > >  kernel/rcu/rcutorture.c | 1 +
> > >  kernel/rcu/srcutree.c | 95 ++++++++++++++-----
> > >  tools/memory-model/litmus-tests/README | 16 ++++
> > >  .../SRCU-fastpath-anchor-before-scan.litmus | 56 +++++++++++
> > >  .../SRCU-fastpath-scan-before-anchor.litmus | 53 +++++++++++
> > >  .../selftests/rcutorture/bin/torture.sh | 24 +++++
> > >  7 files changed, 229 insertions(+), 26 deletions(-)
> > >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-anc=
hor-before-scan.litmus
> > >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-sca=
n-before-anchor.litmus
> > >
> > >  base-commit: ef15070f96c5f07de3a9b593c36f6e83bc9e3d58
> > >  --
> > >  2.43.0
> > >
> >
