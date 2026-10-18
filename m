Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5063F8EA2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342813; cv=pass; b=dbiyml+nHrqNxZ9K90NGxhWvntsqH037i1ParLsU61LCbFwGw495Xz96tpvpBhQoH9v0/3wE7cjkMmFfoYsjZOq6iZtC3b9SQiVDKL2KN7jNW3Tmuev40wvzkiYpEa6YNQ+tRSIHK0tBbcg27d57FlN9QhsyXuzh75OECasgzm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342813; c=relaxed/simple;
	bh=sMlAoNSGHvAAYy1819D+/Uf4kfUWCwyiqqNR5jGwBiY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KK/nSIr66Lhw1RIMKj0WjYg6SoeQYCaPTithft+fFOZGGzHHMqNJGCNOlbgihzUKbULLfRJqymEeu0MTw7w8PFfqdlULUYNTD11ZqYhy+OSdcAXdfSzMV4e5QUKSLzopW+z+jw6L0J3j+nidPCCw4sJ5HaRmT+Jv/7psvXw+hE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qomjaDfL; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qomjaDfL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so933374e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792342809; cv=none;
        d=google.com; s=arc-20260327;
        b=WEFvwH6eAazlOPveZ9E1SLtADyrxfprPcUyHisJjwQdgxsVDfWFBy5e8ozvkRhQD5g
         tXOtRshZFNzkTkdgHEWjG6jSUZI6iPEpdM/E19aAf5PSo128EyGCt/5o/HwwKqZM4bn1
         T8243hQSUyv6LdVfKUGBR+aMKIh9oNCYudNKVyvWUMyHsTdB3EglUv13FCTMZc4O28Vm
         1ryjSA8AOOLqOXGQiCguGLxg82g8CGrl2Qlte+ZuR7x7fYfTBily7+a31ln1qliW0kAn
         jIbadR2/7XgcGZBftrAirksUjH8e4xB3oSsvzUDOuZCK8NRbkz2PNTaU7ugp0XkD48UR
         1Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NU+LfUXqDXyTcqt9euDwSw0oiYY/M2jVouytfxgsasU=;
        fh=BQelU2mXZ39YrgFPEsvrf6IydsIMV8AMCTsMnwXSzcI=;
        b=eQN4gc7vMszFlyGONUZcl8XL82ZIcALhOQvASF8x3ekAIreabKThIPZe8CEJYIrv+W
         k+h6SMtyGWOvNBpHkQC/TcaNHVkcYph+SpUI/rfARO9d5zvXYFY23tk8wjBmc/qcREJc
         JGumIX/hwGwQse/MiT7CcWhMo03ZfybWnyvc4eQt5qaxT5a8jW+Gin1pZUcip5x+/hIr
         hKwRq1EiXK/x7zSb/ZIikYFDVAmscrQ9iWYChdefIdTlPVKEM312TOfrsd3hZq2OgFuy
         YGCzLfjWl76Mw1YeuIIbpM4tWCFDU+VeETjoZ2QRmZnh2P6vY2JfNYFWoMWfcQSrnO3M
         JuBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342809; x=1792947609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NU+LfUXqDXyTcqt9euDwSw0oiYY/M2jVouytfxgsasU=;
        b=qomjaDfLiTKfsSxlM58b4eVUeQn9QFCUjcaOmvCoqOmF6uE60xh94guR9L1zKLjKwF
         A9t0wsmk3zUCA7KsQjxzb5BCC+JwpJXWrRQYIXvcNSskFws/N9yY++O0pXhAwqvB+gu+
         RiZY7SRsiiPBkXnK6HOdW8BhLfg4QYjp0Y1uAAVGYl5rf2FvM6PFIQu44hm0NMMlLlXt
         DMla0SC3nxPULOiZGqdJTFAVGuNg+Wi+iiPIwhre+MsZO3bP0yaqhD6gr0Ia1UQkBrwA
         YKNqWdLYoVchAxWTjUxn6ukyWJBnZhwJ7RGuii3Q8xUqbjK36gA8K/UBpxD7ElVNBFEI
         7GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342809; x=1792947609;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NU+LfUXqDXyTcqt9euDwSw0oiYY/M2jVouytfxgsasU=;
        b=FZW5z7HiUeWR54H+Otg8kFzByAb7Pnp733wC46gcnLtXuW7cSSIdqXJfhHxST9XDsr
         eY+TZ6Rk7cJe7CSL6BPW7/GbT0O/QQn7KdO8l5ahOEoQwD4CAnpXl7w0jK1isKOgdAic
         jhH51KefTp9fj3QpVoPoFBEljqlw2EmxR2HacQ0lr0Rwn/zSN/7SJiuI+LKruqlQljhv
         sl3wKiJGhAqsDZTQ8a9NfxgDuGQZ0R3e1MqZ+EKcXY0XG6z5vjOJXht1HAKG8XwnkRAV
         qjM6HS9DoTrYxVOmD5iFQ0HBpAreeDVrYniWt+aUM6vaJTh6UNgoD7FzDwK6pp2ur1r2
         IhLw==
X-Forwarded-Encrypted: i=1; AKwUvByskCUllHWXKy2Tz5p6njBFdLrRp2yr50KHO7tmlCcWN+7Bf0XjpHNQFsVlM9IvQ6qT3DsWucXOoeXrX68=@vger.kernel.org
X-Gm-Message-State: AFq9FYLojtC1IEHWGE+yTGvAlvIH6L8MmfevitfuAjjx2bP10wX/fB0c
	GOdMggdaq6w7yHYKkg+HajxGoPFv1sOZ/Fy3jdV6sbdR/kgv2zO7fz2gumWJidWaTAIe+Ga9v/w
	pdDeh5r8ZY2bKKG+k3EFbZvP376jhsq0=
X-Gm-Gg: AYBFou3WSkobCjALXfpFkM2pn5Zn1WmTroAcLA7I3rEctKbsCy2m6dgZRcaOUnqNMxT
	j4ojkWyw7WmVqpDk3iJ0xB/yGZV3aaLqmY/1yJa+XcDfpZCkc+PJ7kWNz7DOTo9UPIfBS9ETOho
	6XKkxzErbnuLdYTvzUEuVf0iRRks5XNjjrv5+lrmq46gXAokJkRgHFS6v2pp4ck/Wvj8X174iGP
	/93akJPqKGQBkuXBrnMBp94grUqTTHYdAAnjWvSLKQaQtjSbQFg5QO+NnHYQAohsE+pVT+2a4x6
	Rf6vScEBxwa1+zHxV+YNUST08ehrCOBhQk7Wt5fwbNO5w+4Oj94d23dX5y+ggxwSAm5zR74Meny
	LrX6RaFJ4iml8e1uY1/IsJmlIlwCjjC/U89MLCC6hUXOR
X-Received: by 2002:a05:6512:2309:b0:5ba:36c5:4c14 with SMTP id
 2adb3069b0e04-5be50a6c65emr1437488e87.12.1792342807135; Sun, 18 Oct 2026
 10:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Mon, 19 Oct 2026 00:59:54 +0800
X-Gm-Features: AclHuK8MXaRUF9Vb5wLzUMQuVKyyOQVaN0Kl1RYlTx_uwB1Ynqx_PNTTIjRwd14
Message-ID: <CANGjgdmNCfm=SctvKZ44y8b5n8t_JSp4meX=DKGnG74B3g1vVw@mail.gmail.com>
Subject: [PATCH] sched/fair: avoid redundant updates for unchanged default slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For a fair task using the default slice, _sched_setscheduler() leaves
attr.sched_runtime at zero, while se.slice holds the actual duration.
Comparing them directly makes an unchanged sched_setparam() request take
the parameter-update path.

Compare default/custom mode before comparing the requested duration, as
suggested by Peter. For default-mode requests, also check that the task's
slice still matches the current default. Keep the update path outside the
fair class and when an implicit uclamp value needs resetting. Explicit
uclamp requests continue to use the existing update path.

This also handles two cases that an equal runtime alone does not cover:
a custom slice equal to the default must switch the task to custom mode,
and an unchanged legacy request may still need to reset an implicit clamp
after an RT-PI boost has ended.

On an i7-12700KF running v7.2, repeated sched_setparam(0, priority=0)
calls from a SCHED_OTHER, nice-0 task took 616.51 ns per call before this
change and 162.39 ns after it, saving 454.12 ns (73.66%). The existing
custom-slice fast path increased from 162.57 to 163.22 ns (0.40%).
These are syscall microbenchmark results, not an application speedup.

Link: https://lkml.iu.edu/2610.1/11150.html
Assisted-by: LLM
Signed-off-by: Chengfeng Lin <lin2530632123@gmail.com>
---
No code changes since the revision posted in the RFC thread.
It applies to tip/sched/core b99b7f60c5b4; runtime testing was on v7.2.

The original/revision/original runs used matching GCC 15.2 configurations,
CPU 2, full preemption, performance mode and turbo disabled. Each boot had
15 samples of 500,000 calls per case; baseline drift was below 0.18% and
within-run CV below 0.30%. Probes were used separately from timing.

This revision passed the default/custom mode-switching and implicit
uclamp-reset checks described above. Basic syscall checks and the RT/DL PI,
default-change, explicit-uclamp and bounded concurrent-default-change
controls also passed. A running sched_ext scheduler and all possible
races have not been tested.

Codex assisted with the code, tests, analysis and submission text. The
performance figures are from recorded bare-metal runs.

Reproducer and per-batch results:
https://github.com/lcf0399/linux-regression-evidence/tree/a233ed8edb1e91a6a0ea0d326668bb1f52384489/kernel/sched/sched-fair-default-slice-noop

 kernel/sched/syscalls.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -488,6 +488,38 @@
                return -EPERM;

        return 0;
+}
+
+static bool fair_params_changed(struct task_struct *p,
+                               const struct sched_attr *attr)
+{
+       if (attr->sched_nice != task_nice(p))
+               return true;
+
+       /* Keep the full update path for PI-boosted and sched_ext tasks. */
+       if (p->sched_class != &fair_sched_class)
+               return true;
+
+       if (!!attr->sched_runtime != !!p->se.custom_slice)
+               return true;
+
+       if (attr->sched_runtime && attr->sched_runtime != p->se.slice)
+               return true;
+
+       if (!attr->sched_runtime &&
+           p->se.slice != READ_ONCE(sysctl_sched_base_slice))
+               return true;
+
+#ifdef CONFIG_UCLAMP_TASK
+       /* Equal fair parameters do not rule out an implicit clamp reset. */
+       if ((!p->uclamp_req[UCLAMP_MIN].user_defined &&
+            p->uclamp_req[UCLAMP_MIN].value != uclamp_none(UCLAMP_MIN)) ||
+           (!p->uclamp_req[UCLAMP_MAX].user_defined &&
+            p->uclamp_req[UCLAMP_MAX].value != uclamp_none(UCLAMP_MAX)))
+               return true;
+#endif
+
+       return false;
 }

 int __sched_setscheduler(struct task_struct *p,
@@ -589,8 +621,7 @@
         */
        if (unlikely(policy == p->policy)) {
                if (fair_policy(policy) &&
-                   (attr->sched_nice != task_nice(p) ||
-                    (attr->sched_runtime != p->se.slice)))
+                   fair_params_changed(p, attr))
                        goto change;
                if (rt_policy(policy) && attr->sched_priority != p->rt_priority)
                        goto change;
