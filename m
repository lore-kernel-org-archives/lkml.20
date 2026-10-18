Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3E3431F8
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295767; cv=none; b=oah5e1hNapOveEUQo9imA18znZztorPYKH00QUOA5W4Y67RQuLkoq8tfyIUDTqPWXActAEGtIQq7aRtFOLZc0KaLP+0c/oi7Qgxym93MS0wZRbRzOtRe3e4zwU5xj8qUaRAOUslfo5+yOGPNI2yiZ0s87gm+YX+IL5w1sowe8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295767; c=relaxed/simple;
	bh=ax0wD7or1jIPacz8om/s600JoQaSJNZpdU864D+KD0E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A6D9FpTguIfjLWkE8QaNht687xTvCVHQOfrJ34nbXe0AygZ+HLxXyqc6F20U9NBvfCLlohg2Koh5esSmbTrqLXSzF032JNPcO/JRPao3tJT/+s+j/Ro/LfmDRvXFp4/cUEGMypS99HFKHfJcgcpc28b1+CiM3FcXb71rmbG5GW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+wijnaL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+wijnaL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso710920a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295765; x=1792900565; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UiiOcBIIhNzBJSJRN1N9UNaeQ/tZq9fkc3hofjT0mE=;
        b=k+wijnaLzoIrbfo3xRCY576dZdITbnigdNMENIjb9WPS6RVWEagW6YOJT1nv6JgylQ
         t6K+0qWsxZzVi2BB+rYQgL1fsawqSV/K6rOjzr8w5HxeETEpuXofAnlt22pj4Ha+BqHy
         ObCtju/L+nMjzpKFUBUACEEfGEctBb//IiXLacKTK/Q/xeObXkz34/mD7FSlviKxAIhk
         qlnThF7G2U+vgWX441qVSuZ/tVFXERH9ZXRGQvn7ed9hCwk05F6bDGowUhAJzyNb1MJE
         wGzkos+1mnxeUwDyOzTagyQs5O57e8lS77WWtvKsZ7NmKlPK8GOt8HfEbAOxZDFZ0BEM
         nbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295765; x=1792900565;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UiiOcBIIhNzBJSJRN1N9UNaeQ/tZq9fkc3hofjT0mE=;
        b=PWA5Y7LuTW7fvMUbBiTmyv1qcgc1tTtd7I2Bs9PPR3y+OmeH/hHtWvVFqgwZbbQ6wy
         TuQQKqkWEK4sBi862Z2NoSnGk0kgcEhmeF60Rl/IoAzLVBKPnB6kj2pZhWYRt9fSVrm1
         TltB47PGdG4sCSsH5ojpvx/0X8JY7yP/VLVv0vxr3pN5yz5BY0eC8eZvzzt9eu9nB/0X
         B3pYV5kedMhpaRQLyZxgW/sXxhvUMj9Ce1Ixu1jLYDdWPIgQFBfsqMdkObTbe5oistFh
         CLyZh7yybNTMXAznftA2bcIRHpfcstuQYPDoKHwUe8CSRtlVnElFmCHiQBTSg6j/gH+X
         X8TA==
X-Forwarded-Encrypted: i=1; AKwUvBzPejmKK/bT0UFpe+Lvekd7RfAzRHrYg/lwTKVgWm7tl1OWqnIH526doAWTiBlDzY5UREcF8bC3uV/i0+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiuN8Bzr4UZUaUIL3DAPj2JzF1XUIdRQxCK/ctBqTanFtIYM+t
	xj5VFiDPy6iNx/+f3gBoAbM6c3AbPgM6qDYgskSqdw5WDVtg4fWv/mX2JqKJo2+/
X-Gm-Gg: AYBFou3drHgdq35jpTMyqDhgtOratcSl2xrNHVD7zif3l38zVQAW0TMsTV9dMucl2lc
	S1IbFkZQvFq/ugeyaQM4M9xOW3Rg2Y6wWo2NNJcWPrvwCFK1xf+OMeq73hwK0YVKhHbh/ZBMKPP
	Bh8OiUk0oD9vp8S4u83PIYdeEnjZ4nh93XAR9u2CT85Wp6WldE6hcL2vzA8MgWth3UfsBqbKcdG
	FkOq8ii+NZh74z6RrnKRxV6eVuSD5qux1iQSsfHlxSx8L7dDL3l/Jx6ZZ+6og6NcwN1uttJ54QU
	lvKYPCLadzbT4kkjsu9O3BWz3SDgeDS2L1RTakWPEW3MRJcN7t7SFbvmjFfpQzI8GT7v1mS6p6Q
	9l0r2aTinrjSd8zhYpMXk/bOSc5F8wsui+4Pc+eAZ6PH9WUX+u+BPc42g2dFSoxZ/8wDdbiJGA4
	meoMhR2/z+YgjBemRd3abjQpGJSqS8jZB/jZCKKgKEbarOBEBCBU4TEJGa6/xQ/xMkNg==
X-Received: by 2002:a17:90b:3d87:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3acef154517mr3221486a91.34.1792295765294;
        Sat, 17 Oct 2026 20:56:05 -0700 (PDT)
Received: from localhost ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc492fa54sm10283593a91.13.2026.10.17.20.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:56:04 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] sched/rt: queue a push when a queued RT task is boosted
Date: Sun, 18 Oct 2026 11:55:47 +0800
Message-ID: <179229574717.42111.11570330900189006001@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

A PI boost can leave a queued RT task stuck on a CPU where it cannot run.
The pull side only considers tasks whose affinity includes the CPU that
became idle, and prio_changed_rt() does not queue a push. If the boosted
task's mask excludes the idle CPU, neither path can move it.

In a four-vCPU non-PREEMPT_RT guest with RT_PUSH_IPI off, a FIFO-10 task
holding a PI mutex, boosted to FIFO 90 by a waiter on another CPU while
a FIFO-99 hog kept its CPU busy, stayed queued for the whole 1.5 s dwell.
A FIFO-60 spare was idle on a CPU in its mask. With RT_PUSH_IPI on, the
same setup resumed in under 6 ms.

Queue a push from prio_changed_rt() when a queued, non-current RT task
with more than one CPU has its priority raised. The push selects a target
from the task's cpus_mask, which is what the pulling CPU cannot do.
rt_mutex_setprio() calls __balance_callbacks() after prio_changed_rt(),
so the callback runs in the same rq->lock section as the existing
rt_queue_pull_task().

With no boost present the push finds no legal target.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 kernel/sched/rt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add7..dc2775261 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2499,6 +2499,18 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, =
u64 oldprio)
 		 */
 		if (p->prio < rq->donor->prio)
 			resched_curr(rq);
+
+		/*
+		 * A boost can create a migration opportunity that the pull
+		 * side cannot reach: pull_rt_task() on another CPU only picks
+		 * tasks whose affinity includes that CPU, so a task that gets
+		 * boosted while its CPUs are busy can stay queued until it
+		 * becomes current. Queue a push on this rq instead, which
+		 * selects a target from the task's own affinity.
+		 */
+		if (p->nr_cpus_allowed > 1 && p->prio < oldprio &&
+		    rq->rt.overloaded)
+			rt_queue_push_tasks(rq);
 	}
 }
=20
--=20
2.43.0

