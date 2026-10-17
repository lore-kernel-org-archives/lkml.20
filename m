Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2E38F636
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202381; cv=pass; b=j6wVnZhqG9/9uF5+wmc7TeAKjwJZAEYr8Q9Bqn3NbzD6STwSxAqYVLk3/ijSN1S1erZ53hhOMbecZfA58K4co6QG/DKJ2rMqLA7eNyelu13LNucwMiriOc+753XJJlaVMWIOFolGk7UUBIFvA7s8vygn6i6bHeDjVK0az1rFUDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202381; c=relaxed/simple;
	bh=lluafLLQeeo2AuTO+6C62Oie8+3t2kap/gM/nsFIWHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksHgMyunFvct1IrkThpJOWMnmLFBZWkT5UsQqI3QNNkmzXuuqfNXoLpwfli36EELFMPU5jsogy2H7h0CLBftZZCmb2MNPIZmivHx+vLWI6EhtwgmXlkPiD0P5ERZXpm3gJLYvnz73N0jL5YnyqdIfUD6pyhjxPqrHvwdCHwsQa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPZGLQM9; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPZGLQM9"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67489c8202cso494917d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792202379; cv=none;
        d=google.com; s=arc-20260327;
        b=s9kLu+lwJBlRI3G6uJmGlmEj3xc3mJLxzgyH09H0rSxnCltgjViEAJWaL5Liwh2sOD
         FhbU3S6oLTdxtNRRhouBKhLz9Cd8V33rpeiN8SxBZs9Rru73Uxufxj8KnvLv7jUpN2ef
         08SA0y2Tbof4jf+BnE+xFtZodvgbmQi0QzsYTzlbSUNgFC1+HCHr+pQKaJ+kRrzEc6y8
         G1wbGogMe5g7tG+2WocaQzcXyuKCd3OoQXcPJ0FOuZQ7QU+MBjWKzfBOdzqG+AhXkZdq
         Q0NE7VqajLjIHYGhuDSCw53BJfM+Kgzu/vc6FVEBIkKes064PnGtUhFCHk7mt0P/xGVL
         CkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cG9ATYqMl/y18XgW8djL6SHSrSp+vtak/e3H6LudwE4=;
        fh=JafBJmDyuN8qYuRCoOuwEEXQsdjHDDd7v/gX48XtjCw=;
        b=ngSjhB7UMVpOr2rgemfq2GddoXdM5nudj49lzaL1MIonEwdCJlsDC1DVtLXKQgV73u
         9y2DaZGkr84tcEhWm93/wPx10OBzsqWykPPZ1csDbovOLn9qKvdrhCOiMciJc3fRepz9
         h2gCzZbgF/CWDQ6CIZw6mJNuAq722xhud1kjb/BmQcTuF3SQp9I0j7hZ1gySlf/q25Zx
         Y5o4ty+Xb0Pvd0DeFOFJcVF7OrN/OuFrkA1UGJFwMC6P52hszibSU2k4XwpMk2N8VoWb
         9Fkk+8BotR6ZzHA2UPUyvXWerZjm8BTQFnLGLLiemjEhq/kmd4BYtyRrza2cDgRah3Vl
         Wcrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202379; x=1792807179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cG9ATYqMl/y18XgW8djL6SHSrSp+vtak/e3H6LudwE4=;
        b=YPZGLQM9LKK/sxC85q17uyigRrGtvxhPcpSLKIAly4iq+NQE1ZodPwjHZYI1nQK9+P
         +2bKE8HTE27u2O2gCIEqH1K3/U/Sqnos4GDnIyods0zlBdT8IXuP2zdvdPPBfyS/EjMW
         mtBAj5gleW1uDAmJ/PGyjtzMyRO/Z2chB9V1U+vrOPdHYMNRwrbcJ7jq4XxAg7rf7Q95
         p9ALwuShLefRlAgk0dLN0nrxXkSm0yRLSPlO75N9Mo9lsj+AMitjaZElI/oCtQtToUYH
         I6aKZe4fsOpFgljzH7Rct4sdYmll6UVXKmbX10IdWSXkksd12knxvKALHKuMJkNJJyUp
         rdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202379; x=1792807179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG9ATYqMl/y18XgW8djL6SHSrSp+vtak/e3H6LudwE4=;
        b=g2rUu9SzQ2ub5R/abA9PH1+gUARoLtLf8FrB/vV4jwXfcLN7hwp/Zbyqxl12cud1Ph
         k+CL8dQmOA726KqHh0sVidGWWERct0qCp8y6ZUmwVxileaEkWl+eb/A+hk+x0vlI4Vxl
         65hs1NdiimoP8jYJeAICS8zbooKHMc8eeNFzl8SGjuH4yLuFs1hbk/tbAlqZhfrih66i
         qHnStHXL+cXnQnbrz7dPVHcw6n/W208eim605BP54cOKiKC9QxjbCABO0iAGwyRHvODM
         QHWDcwQXiq850eGgIEdujHDsHxNfVqcK5jtyw5sDbMstAHdoHE5Em6p1S/WEGV4xy7Si
         P8mg==
X-Forwarded-Encrypted: i=1; AKwUvBxPlvcpAe5FwVn+NYZQgbtz0qpvUc7STjUwWUAzlVh92zsFzpmRlyr8eSQQVntWvsP3QgbqVpK76gd5xPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2WfsRAirfZTq3VXt4c/+LUWQwvWlsvq1ZhTaS1kDtyaR5VVp6
	gnZOQ+CzH4ZFYggC8ub9uT9UWZUhQ7XQrBQJcoWDYJeO+7lHpyxT5ehJZqsV/cmmuv4TiLRBOev
	c/4AWz2ST8XumcwRMlh4NTG/0HB2y/qM=
X-Gm-Gg: AYBFou3KX+TefmFAxvMoXXsUygvr1k2b9CLnqyJ9UQLhFECn8VNEQ5IqD1+KCZV9ryX
	L8m6AzYG+FxGq2oM7sQVOAsNcbXcRIE/7ibNGKusIcwB+HNTD3NjZ+rGDnf+FaLGvm8TreA2IH4
	sVZz95wgFeJAd9dAwiSFo1Qu/44xNuOg2ocaQ5Zc1z7bJinq9bSofDOljdqgIWV5mKBv9ZJJJgN
	ww78gYRLvyTR4TPOvfcSm49DWF33Nrn9mUlSitF5xo+XqCUpxTyc5/Ft74Bxu0Z/FHzfLRua4qO
	JDPgpoFmAbBxiO0HS+b/LlTcrQwB4f8qHZbRGexKTGQEWEt6LISfRxcXaRDklrHkzAd2N5pfVNi
	ohUThpUifug==
X-Received: by 2002:a05:690e:dcb:b0:674:a7b:a07e with SMTP id
 956f58d0204a3-679ca744120mr424310d50.29.1792202378667; Fri, 16 Oct 2026
 18:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908122446.56708-1-lizhe.67@bytedance.com>
 <as3gQ8jfa_6eBf15@chenyu-dev> <CALOAHbBssx9ZHGwebGZCvzT4d_soyjNfZRj4L6gnxHRXtc7eMA@mail.gmail.com>
 <807eb0e80c76c3ccb85024b360bd47ace201931b.camel@linux.intel.com>
 <CALOAHbCt+iGGWMxzjrcRamdSqD48_v+V685-qi7_Qy7UL8bxxQ@mail.gmail.com>
 <atG4VXk4t-m8VubY@chenyu-dev> <CALOAHbDY6zLcEc4kGhC9GSFsOsREadkWN7Q4CmZuR_m_BMHAyg@mail.gmail.com>
 <bcabbe25-5b2c-464a-a22d-5375a342f938@intel.com> <CALOAHbALpHebACLUmvet_tFH_w-iK3TWpY52OhYTUVoLzoGKkg@mail.gmail.com>
 <8d1997019d00fad3f250c4df3f18c53dff25e054.camel@linux.intel.com>
In-Reply-To: <8d1997019d00fad3f250c4df3f18c53dff25e054.camel@linux.intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 17 Oct 2026 09:59:02 +0800
X-Gm-Features: AclHuK-nWLmy9xCqiE3rlEx99gEKF6vkNm0ULanpBQ42g6oWCUWpeUa-WtIJ04A
Message-ID: <CALOAHbDGx-2MfHiUs2S5cWT9yWiKp_22kg-OFL4gtuGG4aCUAw@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, "David Hildenbrand (Red Hat)" <david@kernel.org>, ljs@kernel.org, 
	Li Zhe <lizhe.67@bytedance.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	tim.c.chen@intel.com, mkoutny@suse.com, tj@kernel.org, chen.yu@linux.dev, 
	Vern Hao <vernhao@tencent.com>, Vern Hao <haoxing990@gmail.com>, 
	Qais Yousef <qyousef@layalina.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 4:32=E2=80=AFAM Tim Chen <tim.c.chen@linux.intel.co=
m> wrote:
>
> On Fri, 2026-10-16 at 16:18 +0800, Yafang Shao wrote:
> > On Fri, Oct 16, 2026 at 4:01=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com=
> wrote:
> > >
> > > On 10/16/2026 3:38 PM, Yafang Shao wrote:
> > > > On Fri, Oct 16, 2026 at 1:51=E2=80=AFPM Chen Yu <yu.c.chen@intel.co=
m> wrote:
> > > > > A more complex scenario is when cgroup A and cgroup B become thre=
aded domains:
> > > > >
> > > > >                           root
> > > > >                          /    \
> > > > >                         X      Y
> > > > >                         |      |
> > > > >                         A      B          A, B: threaded domains =
(thread roots)
> > > > >                        / \    / \         separate memory.max / i=
o.max
> > > > >                      A1   A2 B1  B2       threaded cgroups
> > > > >                      ^        ^
> > > > >                      |        |
> > > > >                      +--------+
> > > > >                    want to share one cache group
> > > > >
> > > > > In the above case, we might need to change the deployed cgroup hi=
erarchy.
> > > >
> > > > I think we can enable LLC-aware scheduling for both A1 and A2 =E2=
=80=94 does
> > > > that sound right?
> > > >
> > >
> > > Here A1 wants to share data with B1, but A2 does not want to share da=
ta
> > > with B2 nor B1 nor A1. Enabling cache-aware for A1 and A2 might not h=
elp
> > > in this case.
> >
> > I'm not sure whether this is a real use case or merely a theoretical
> > one. I'd suggest we not focus too much on purely theoretical scenarios
> > unless someone can demonstrate a practical need.
>
> In our discussions with Vern Hao from Tencent, they have use cases where
> A1 and B1 are dealing with data compressions while A2 and B2 are dealing
> with databases.  So data are mostly shared between A1 and B1, A2 and B2
> due to functionality.  We may put the parent A or B in the same sched gro=
up,
> but the sched group may contain too many threads to fix in a LLC.

Good to know. While I'm not sure why it's deployed that way, I
understand that real-world use cases are often complex.

>
> The tricky thing is if there are scenarios where
> we want to do grouping one way when we consider resource
> usage but another way when we consider data sharing.
>
> >
> > >
> > > > >
> > > > > Suppose threads in A1 and threads in A2 belong to the same proces=
s Pa,
> > > > > this reminds me of the cgroup bpf NUMA balancing case: after enab=
ling
> > > > > NUMA balancing for A1 but not setting it for A2, what would be th=
e final
> > > > > NUMA balancing decision for process Pa, is it enabled or disabled=
?
> > > > > The NUMA balancing scan/invalid seems to be per process, so if we=
 change
> > > > > the setting of its threads, the whole process will be impacted. O=
r maybe
> > > > > we should not enable NUMA balancing for threaded cgroups? Anyway =
I haven't
> > > > > digged into your cgroup bpf patch set yet, let me try to look at =
it.
> > > >
> > > > cgroup NUMAB works the same way: the setting is per cgroup and opt-=
in.
> > > > For Pa in your example, since its threads spread across A1 and A2, =
you
> > > > would enable it on both =E2=80=94 enabling it on only one of them i=
s not
> > > > meaningful.
> > > >
> > >
> > > I see. I haven't yet digged into your code, is there a per cgroup fla=
g
> > > cgroup.numab.enabled?
> >
> > Right. I will introduce a cgroup::numab_mode field, but without a
> > cgroupfs interface file; it will be written through a BPF program.
> >
> > > Would there be a logic in the kernel, when
> > > A1.numab.enabled
> > > is written to true, the kernel detects all the other cgroups {X} that
> > > contains threads
> > > share the same mm_struct as A1's threads/tasks, and then update {X}'s
> > > numab.enabled
> > > to the same value as A1, to keep consistency?
> >
> > We have no plan to support threaded cgroups for now. If a real need
> > arises, the BPF program can be extended to handle it, which would just
> > require more kfuncs.
> >
> > > In summary, if threads are
> > > spread
> > > cross different cgroups, when you set the enable flag for 1 cgroup, w=
ill the
> > > kernel iterates all the other cgroups to update their flags as well? =
Or
> > > leverage userspace to do that?
> >
> > I believe this should be implemented in userspace, not automatically
> > in the kernel. Use cases are always complex, and flexibility is
> > important here.
>
> I think there is a misunderstanding that using prctl necessarily mean
> we have to modify the user programs.
>
> With the prctl that Chen Yu and I proposed for cache aware scheduling
> [1], the application does not have to change at all. The prctl can be
> issued by an orchestrator daemon on other tasks:
> the caller passes a target pid and a pid_type (thread,
> thread group or process group), and the permission check is
> ptrace_may_access(), as in core scheduling. So a daemon run by the
> platform team can put the application's threads into the right cache
> group from outside:
>
>   prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_CREATE, leader, 0, PIDTYPE_TGID);
>   prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SHARE_FROM, tid, leader, PIDTYPE_P=
ID);
>
> The daemon can take its policy from wherever is convenient: cgroup
> membership, the pod spec, process names, or a config file. Changing
> the policy means changing the daemon, which the same team owns. That
> is the same round-trip as changing a BPF program, and no application
> team is involved. This is how schedqos already uses the core
> scheduling prctl.
>
> That said, we may start with a per cgroup control of
> cache aware scheduling that sit next to the prctl [1]
> without either one replacing the other.  A lot of the
> code in [1] can be reused with per cgroup control
> of cache aware scheduling.
>
> It starts small, in the form Tejun suggested for NUMA balancing
> in your series [2], and grows only when a real need shows up.

That's great.

>
> The rule for every step with a BPF based cgroup interface:
> the per-task p->sched_cache_grp from [1]
> is the only thing the scheduler reads. Each interface is just
> another way to set it, so the scheduler side never changes.
>
> Step 1: a per-cgroup setting
> ----------------------------
>
>   - struct cgroup gets a sched_cache_grp pointer and a mode:
>     inherit (default), off, or "this subtree is one group".
>   - One kfunc sets the mode by cgroup id. No cgroupfs file for now.
>   - The kernel puts tasks in the cgroup's group:
>       - when the mode is set: allocate the group, publish it, then
>         walk the cgroup's tasks
>       - at fork: in sched_post_fork(), right after cgroup_post_fork()
>       - at exec: exec_mmap() installs the cgroup's group instead of the
>         mm's one
>       - on migration: in cgroup_migrate_execute(), next to the
>         ss->attach() calls
>   - A task that was grouped explicitly (by the prctl, or later by BPF)
>     keeps its group. Cgroup changes do not override it.
>   - In the "advise" mode the cgroup's group is created enabled, since
>     a new group starts disabled there.
>
> This reuses most of [1]: the refcounted sched_cache_group (patches
> 1-3), __sched_cache_set() with the pi_lock swap and the footprint
> transfer (patch 4), the fork and exec handling (patches 2 and 4), the
> per-group enabled flag (patch 5) and the always/advise/never mode
> (patch 6). Only the prctl UAPI itself is not needed.
>
> This covers the the case where the sched groups match well with
> cgroups: cache aware scheduling can be turned on for group A
> only. The other part, a footprint threshold for A that differs from
> the global llc_aggr_tolerance, would need a per-group tolerance that
> the per-cgroup setting can carry.
>
> Step 2: BPF picks the group
> ---------------------------
>
> Add kfuncs to create, read, set and reset a group (thin wrappers around
> the same code), and one that stores a BPF-chosen group in a cgroup.
> The kernel still installs tasks at fork, exec and migration as in step
> 1. The difference is that two cgroups can now share one group, for
> example A1 and B1 in one sched group in the above example.
>
> Step 3: BPF decides per task
> ----------------------------
>
> Only if someone needs it: programs on the fork, exec and cgroup-attach
> hooks that set a task's group directly, for example to split a cgroup
> that is too big for one LLC, or to group only some of its tasks. The
> set kfunc takes pi_lock, so it needs a context filter that allows it
> only in sleepable programs and those hooks.
>
> Each step stands on its own. If step 1 is all anyone ever needs, we
> stop there. The prctl stays for users who do not run cgroups or schedqos.
>
> Does step 1 match what you have in mind for the LLC-aware scheduler
> on your servers?

Thanks for the detailed explanation.  It works for me.

My original idea was a simpler cgroup-field-only scheme: store the
mode on the cgroup and derive each task's group from its cgroup at
lookup time, which would avoid the fork/exec/migration hooks. On a
closer look that does not hold up for LLC: the prctl can set a
task's group explicitly and that has to keep precedence, and the
footprint estimate has to move between groups on a membership
change. Since most of the infrastructure is reused from the
prctl()-based series, I'm fine with implementing it that way.

Please Cc me when you post it.

>
> [1] https://lore.kernel.org/lkml/cover.1787955777.git.tim.c.chen@linux.in=
tel.com/
> [2] https://lore.kernel.org/lkml/20261012120438.52849-1-laoar.shao@gmail.=
com/
>
> Thanks.
>
> Tim


--
Regards
Yafang
