Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8038D014
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883935; cv=pass; b=m0DTEGZFw7pNFCCjd5R70gqynoOB2rmZz9gzoE4NiZyL0mLGigwq3EmtztPpnSsZfarRKyDPQlAlMIhSHWFMZvrXmNPPgAuvRfhhpuuVRJqamUPjXbfVuqBJybejlXXaRe4TFavCynfWlcyPM+g3W99mp82ZI269ANSShvifcwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883935; c=relaxed/simple;
	bh=1bJ3BpJqL6XRVNYecItYKDdYwQ+H5PLoopg0tnRg59o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaoQy/hw40S2ptrdC7TUj+uYE7mZOlqGj8SdB0iiPeCBwfFBmG7LQpdIKvLwSOHOkQozHR2XQwbVzSKNKNnBfwEShhE4RYLFdZeH6SbVtKlB9HFlBBBV0Dy8coU+9q2U4WEBTxYuGzcZ0CJ39CEScgEvRC2fUwldnA8EQGokdew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkUFGJQh; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkUFGJQh"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6793ff3d53dso2007112d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791883933; cv=none;
        d=google.com; s=arc-20260327;
        b=OqStER8GvxLlK2w1KBRnjgKmHKh3PLj+kahn72hY7nBj/5XuZ8kKEw+rGk7L1XaWU+
         DoY6Oe7fOoVfJsMtJ6OQ7UUoigYacjc11DnOGN7i9LnkaeDmmIZk8JuN9MEPYW9+bQ4T
         pfiiyRqLaAs0praefsYv700Gt2+Kui/Te82mY3OH/3/Tr6b+vu79z1cfZLS4MXcspfO/
         nUe5gsbfaMEroUJ5Xj+5nJsZbq+X3Lgw8DgJvW0UqquhLXU62iWHt1aSMgebjEExj/+/
         LHMw53dSwbBJ0IgEX9Wd7zgLcJNZIBCdUYQiwx96DRWrf8krrxgVtpRyylZK1Ns297Tm
         Gi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3laYlGriIt8rJHKn52BHOyta5Irk/sF5+2l2dqx7+A=;
        fh=x6kBEWL2/lqwJhJucVU1DK4Baun/G0qKsMg03IO0peQ=;
        b=k4afaXk9DMXgK8UJI5/KWz1OAwr5rv9Xzltw+C+nGKTFPQEmkCH767uCyiS2CWScEf
         cVd/iHiO3Tqo2z0AjGEXyV5NOWVA8/LsfcMDVgSl4lnpTLEbYkVCxj+v7XpweKU8vLB2
         nv5xYMLu15oNNsLkSZrlijtPR+nuBW5VHcomylH5kvoAVvBGtTNs60gyY5wZpzBg8If+
         2ZdhZXRCU4sLlWw4ukifO8ZLn/flxrGUZf4Wfb3ptVMQuA/vziMD4nsU6VUx9n8onZKU
         D6XUF6PsD5rbl7YzAEj0bKRPBM1UHrzJozsWkzErMSJUNvc4DKP/p2l+sjAC1m7BJrcP
         bBLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883933; x=1792488733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3laYlGriIt8rJHKn52BHOyta5Irk/sF5+2l2dqx7+A=;
        b=JkUFGJQhZXY1iJElFEOb1mQkVDzR+ZklCw09pEp5d2tqzSbqp0tcH1FgzUhlYZ1Wne
         fSpqyNATyLWSGXWGXnGvSxo97Db0LGcX/YdrjUqJhxxM9FgP6gOzoA4Nhi1JZtleC+ZN
         OwW0k3gBujI81hhHP6oCNYFXCNRPCsaJ3eYxi3XMl0pkXGr/sd0lguJv78XJRxDjcHFl
         fIaKJ5oyl8QDdtKgkZ7rGkFAiYZTXTZ5/F5El1TtlMSpTwYPJLzeljXeleAVDkbcSjMX
         VAm9rhowyctHb0mSBnWlq4HkYgT64nINiFjd6++v2wMGF3YpEDq6K3p5xJ/aL2+rzyNH
         RRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883933; x=1792488733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3laYlGriIt8rJHKn52BHOyta5Irk/sF5+2l2dqx7+A=;
        b=Y8/s6wCrfph4cfwlvolY0yA/u9yfZwhTZ+1nDPiEL62cduG27HtokLEROycuD75+yI
         2IpQY5HJBSP1NazDKbM1/YXSpucBhuwEzr6xIdWNehjQaG19RldEA85xqMlAKfcqSleL
         sfAejqjY6O0F1RlHmZxFP6BOwjU6lw4q/GlqLPcbIRm5W7CRm2RnbHrM7xon29fQOqst
         UT/qN5VBLzse64TtKiowaJKwvbRWNisGBOuKReZ96J/7OUs8cRI2IwgHDcW3iSFAZhzl
         +i43duqLJN6pnABRy26E7iEc9JLBtuEAIjBqpl37Uf0PCJVSPq2nnVR6bnezPHZ3wCA5
         fXKw==
X-Forwarded-Encrypted: i=1; AKwUvBzwSKiDSBf8lWHiRHdQdvAC97OoWbSpOO/T3B3ezH4b9KM/Nq2028r9aPDKdRNfudFbAINzBYvK52F/QQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt9dHR6ovC02YtT1YHwVYMT2IlfikvqZtUqfHUk0rT2HutwtW0
	ZMBl6xzJ8zsq3j8EOa94LY/MnZea4RWLBm6bQw4biIDX+62W+GLa6vrZnwi4lG8EmZK+L1MgAXA
	YDf4vo2Vp9wWHNawHUHP9l0whvEt1hyo=
X-Gm-Gg: AYBFou3s+UnKepOrow8/avRhKLQvIcEzpUbhEg5GUlyVkGDWzmNlaRzf8ffR2GQe/16
	idGduoEK3C497peeVRVl41b1bKVsmli6gANVaqift8LfwMn6XxhA6gZZyddZEYp1JKgrhhjJeO5
	bRgjvHYucn2UCPuK6/W5FTpe44GAi8zT9Ht6aP45TmVTxGXzAKLsRpRrWng8kav4rb4POI5EYWK
	ugNUoKPYoDY/n8twYlTlwz02tBwyzQAinJSZ/PTKD/7R40tRjdr0t8nZr2RuZgagl35P2UhhPL9
	JA8AAO12TvjdJR5EJJh9JHQEHQR2Ctg4KEcb54KEECSdMYrIlxmXB8uQAJgJ8GSX6IQXr94AMjr
	pcew7KDzrWw==
X-Received: by 2002:a05:690e:d4b:b0:66f:c1bc:c098 with SMTP id
 956f58d0204a3-67936288010mr2521640d50.96.1791883933466; Tue, 13 Oct 2026
 02:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908122446.56708-1-lizhe.67@bytedance.com> <as3gQ8jfa_6eBf15@chenyu-dev>
In-Reply-To: <as3gQ8jfa_6eBf15@chenyu-dev>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 13 Oct 2026 17:31:37 +0800
X-Gm-Features: AclHuK8ndsxhhlK5nTTn5Lujec0hKh1opnIku5qhG2TbGUlvVhns7ig0IWDcDvg
Message-ID: <CALOAHbBssx9ZHGwebGZCvzT4d_soyjNfZRj4L6gnxHRXtc7eMA@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
To: Chen Yu <yu.c.chen@intel.com>, "David Hildenbrand (Red Hat)" <david@kernel.org>, ljs@kernel.org
Cc: Li Zhe <lizhe.67@bytedance.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	tim.c.chen@intel.com, mkoutny@suse.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:52=E2=80=AFPM Chen Yu <yu.c.chen@intel.com> wrote=
:
>
> On Tue, Sep 08, 2026 at 08:24:42PM +0800, Li Zhe wrote:
> > Automatic NUMA balancing is controlled globally through the
> > kernel.numa_balancing sysctl and can be influenced indirectly through
> > memory policy. That works well as a system default, but it is too coars=
e
> > for workloads where a launcher wants most processes to use the default
> > policy while a selected process opts out because it already manages NUM=
A
> > placement or cannot afford the sampling overhead.
> >
> > A recent per-cgroup proposal tried to address this by adding a
> > cgroup-local enable knob plus a NUMA_BALANCING_CGROUP mode where
> > balancing was disabled by default and then enabled for selected cgroups
> > [1]. The discussion also noted that automatic NUMA balancing already
> > operates at task/process granularity, that the knob is not a resource
> > control attribute, and that task/process controls such as sched_setattr=
()
> > or prctl() may be a better fit while cgroups and cpusets continue to
> > describe workload grouping and placement domains.
> >
> > There is also prior art from 2023 prctl() proposals [2][3]. Those
> > versions used a per-mm mode with disabled/enabled/default states, added
> > NumaB_mode to /proc/<pid>/status, and changed the global static key
> > handling so a per-process enable could override the global sysctl.
> >
> > This series takes a more conservative variant to preserve existing
> > administrator and workload expectations. Keeping the global sysctl as a
> > hard off switch means an administrator can still disable all automatic
> > NUMA balancing activity with one knob. Using a weak two-state
> > per-process opt-out/allow ABI avoids exposing a "default" state whose
> > meaning depends on global policy and is therefore easy to misinterpret.
> > Storing the configured mode in signal_struct gives the control explicit
> > thread-group semantics and avoids making unrelated non-thread CLONE_VM
> > users share the policy merely because they share an mm.
> >
> > The series implements a per-process interface: a thread group may use
> > prctl() to set or get its configured automatic NUMA balancing mode. A
> > process can opt out of new periodic NUMA scan scheduling and NUMA
> > scheduler accounting, or opt back in. Existing hinting faults and queue=
d
> > work are allowed to drain naturally as the disabled state takes effect.
> > When kernel.numa_balancing is 0, a process-local enable request does no=
t
> > override it.
> >
> > A separate task_struct scheduler snapshot is used by enqueue/dequeue
> > accounting so the scheduler can consistently account the state that was
> > in effect when a task entered the runqueue. This avoids changing
> > historical task accounting while still allowing a process mode change t=
o
> > take effect through the normal dequeue/update/enqueue path.
> >
> > The series also exposes the process NUMA balancing mode in
> > /proc/<pid>/status and documents the new prctl() ABI and its interactio=
n
> > with the global sysctl.
> >
>
> Can the global key be extended to tri-state, like the THP settings?

IIUC, a BPF-based THP policy is yet to be developed as prctl() doesn't
fit some use cases, especially mTHP.

> To keep it backward-compatible, echoing 0 and 1 remains the same effect.
> The user can also echo always, advise, or never to it.
> We have a similar proposal here for cache-aware scheduling[1]

We are also experimenting with the LLC-aware scheduler on production
servers, and we want to enable it per cgroup rather than globally
there as well.  Given the lessons we have learned from THP, what
about implementing it as a BPF-based feature from the beginning, so
that the semantics can still change when new use cases show up?

> In this way, the user does not have to disable NUMA balancing one by one
> across the whole system.
>
> Yafang Shao has a bpf-cgroup based NUMA balancing proposal[2].
> Overall I support fine-grained control of NUMA balancing, and I'm curious
> what the possible setting would be in the production environment, would
> something like Kubernetes be responsible for setting the NUMA
> balancing attribute via prctl, or as Yafang proposed, leverage cgroup
> interface?
>
> [1] https://lore.kernel.org/lkml/fd341106e7e6cbd2f047656650f43ee87c6633c1=
.1787955777.git.tim.c.chen@linux.intel.com/
> [2] https://lore.kernel.org/lkml/20261012120438.52849-1-laoar.shao@gmail.=
com/


--=20
Regards
Yafang
