Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F47408031
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054116; cv=pass; b=WW1BB2HebSqKZe8vsa5bunsfKih0xf4G60VY70gri9uk/7/QhDPx1Cr43zsO+yra0TRonobPZ+M/irYTpUIHrGzx86r6cSD9eLS0DPGQUg8BJdfHTgsPwnxHWtP1t+TVimnNXbIwrDr5tsJ8wTF2HTqVFd43eZxgLwEEKExtV1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054116; c=relaxed/simple;
	bh=ot1MDAiX1bkE79ZfytaWVGQiLliZNPAGQ/ha5i2UYDE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LiO5uP8+dOMwc6RRtZY5EISTjudkRzcXxdEzoENONrzcbphhZk7MGxbSV64hcpPpN2BiQPeQjGX2T0MY4ytKAdL8eEe+PnJr+/+4sAhBB3vZZhkO4tCU8yBPyLbHxBzD+1tUzMcfi5izORDAW3MhCRE2zbsS9pgwL6qATlZYkGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qNqM/V7L; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qNqM/V7L"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so91605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054113; cv=none;
        d=google.com; s=arc-20260327;
        b=QtbB5F98RG91Vi4w6E41MtDsbwQ3+H1xt9D9XFM6D/BgyD1hxc+5ptPsTg0Otoz7s2
         dNebXxI+tiTFKN98rubgoRNYVpyIvKN+IAvKer7TvRkrU0S6VwRYe2zm/X3p3Oqq0BzE
         jCwXSf44eYMR6E8PcycON2nP66oIrLx9mvhAJbPGsVvUXGcqZeW6NN0xTEDMWSfk4/vV
         idOVIkmreVG9ZBFgMFGwZ4S0/fckbcrl83mPoAYMIz1s2pKbVKkE4jgW+rLeuH4dkOdj
         6dMyNed8r/HmhI1UFQR/TtdteQ3BzLMQTSe5Xf1MWecDFB5IwcSgd2ln3v+RK5Gy2b9a
         vVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xo3WnTQ2bjcUUvcq+sZLWjr91B/KOL9hrB7vKtu8+KQ=;
        fh=/SJJKIc7haf/+DXfKSwd9nj6ZC4/bya3PXkdMH7yGfw=;
        b=IesBFJ4RctcR10UkWeLeoeuUGX6YOnhwLlvIkylqUorpn3n+mJ+uHVlsf6Vh7C/osJ
         forwvs9JsFzD8DH11b5RbbeSjxtTfTI3/PttRNlErGVoE8U28jYYAp8JhhSky0+ILqAf
         NR6QTj/xrwOy/8xqKoI1x45DHSWqu68SBesiwMVKkdDkJz//qnyGhPV3nYUwWybBsWH+
         Tg6Gar8Qvyn1MMDsqP+gdYnhgojpXvXDfPq7YUdvpCgoBPq4E9OQtOEKaW8ptEiSNNz3
         5Pf94TPeLigFgUQPcQazGX0rb/DGgy6vofbmlYoDPMljIigtBAuQKmogKGow9pdmn0Hj
         +hYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789054113; x=1789658913; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3WnTQ2bjcUUvcq+sZLWjr91B/KOL9hrB7vKtu8+KQ=;
        b=qNqM/V7LLRkcOl0aVoG8ArPDXi0CSENE/RkL3/+vDoEq9BSLnBvEA2J9OnNvVGKQIS
         Qr5+L4LWur9dlpV19KPF/QQqH5uZZOD5dmfkuWLZfminYSrV8gUGe1shktuB52VJ/Ffg
         eoaNntgY0lmmMAoXOJpXN5k7En0BRXlxHNdDjKCKsIhEr4C82GWtq8d4O4OQk71C3aHl
         lv7YiKX1fEfv53/LOJLqJpeF7g/68erHaldojYrOsxfxlvjxud6HuKYsQPSCCvTaVJvb
         xzB+vrmFuVQzVJ9RqO4/7TtgJIAfAj16tt6luv/+MIbIgpP9Xv5kv9hmGW5uPGXOOZIK
         KYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054113; x=1789658913;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xo3WnTQ2bjcUUvcq+sZLWjr91B/KOL9hrB7vKtu8+KQ=;
        b=VypfbcU4wZ2hINhMwEHo6QSQomy83xzcHnDtwh1A/cmT/HLJlGL/SEJEdamnCSobkd
         LkD83yTyAjBMohGyQ/mcbTLpplc6gn8x9MrPgi/gBehSHWxokrei0GA7dbt12VVKCr4l
         dUzjLeGWN+EQvZZjfmnDZ6Wb0kpjouI0X+ZdZ8SwKP5mod37mDXnd1hIN93keBefWeYe
         uHOv8lUO2bcv909kmJyqYU78A8ZDZp2iADMLUj5f52tQf6sJgaaPxXhOV+KcpIiblgGB
         /j+nPHqyolNnya51C8t11lkFaMMu3bJHcwYzJDnExyoyoDd9fgDGl0cEV5RvqTsyzVOf
         /xPw==
X-Gm-Message-State: AFuF++lip8s3BPmxUmzvVXfxgn6lzm8iWDh3GEcyRzZfjYNFqx0HORBY
	1NgHcNByVG1q/uSJzHuzpcOFU0y5/yw6jNqnaUo73pmTZQn38gfB6hjKn+e09ZI0U2kOBTkSxnM
	+7wD9s7Vs6WseA6GHPCdPpk8SweVmcK5m1YKSEGri
X-Gm-Gg: AYBFou0Q8YtW2UkTAbT/rqdkEvXVVnT/Cnv6LLUVrSE34hzUYuGxFHyOtxlygyhDhOW
	69VzLis76jAVbUkkj6LxYI02DhE7p4eqQaOmv5Gh6B6h5G21wwzDJUTdJl+e5dDr8TG7WO6JS/e
	OlK7xW7bLAdfhrmzkxJhEN11JHKE9OigMvSY+Q/gQqbnY9jvFdzRLrvn7eLqdqXH250Eev+GGUX
	0SaZ8jBO/x5MqPqF0vqlrvT7YP9XEkwTWSsX23TczdwXF75ks81uI3QPZVq6lHBlOiRO7Yu3Etd
	QelN5PNdD0GW8qxwqRLLDoYB3ZwIzrdDSglN5evtoOocmtUrZgyPm9At5P6tIYbyA+ffXwdndyF
	ayEwhIt+wbu9zq2i1wYLI+86713t+BB9NxeWZrBcddQ==
X-Received: by 2002:a17:903:32c3:b0:2d5:db38:8013 with SMTP id
 d9443c01a7336-2dd1174b3efmr6298935ad.18.1789054112293; Thu, 10 Sep 2026
 08:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Thu, 10 Sep 2026 17:27:54 +0200
X-Gm-Features: AcwNN1VBED9vrLC13TsybE0t8qGPUg2fRNaIzbWmVlEkeSoQ0FVvh7SF41nS5so
Message-ID: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
Subject: [BUG] futex: scheduling-while-atomic because nested vfork can break guard(private_hash)
To: Hyunwoo Kim <imv4bel@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: kernel list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000da0e2e065b229eda"

--000000000000da0e2e065b229eda
Content-Type: text/plain; charset="UTF-8"

Introduction
============
The futex private hash implementation was written with the assumption
that any MM used by more than one running task either has a private
hash or has irrevocably opted out of having a private hash; but this
isn't actually the case.

Commit ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private
default hash alloc") tried to fix cases where processes can share an
MM without triggering private hash allocation, but overlooked that
nested vfork can also result in concurrently running processes sharing
an MM. After that was discovered, commit bde023808364 ("futex: Fix
race on the initial mm->futex.phash.ref allocation") instead changed
futex_hash_allocate() to not rely on this assumption anymore; but
other places in the futex code still make this assumption.

Issue description
============
exit_pi_state_list() contains this code to handle waiters on PI
futexes held by the current task, which is exiting or going through
execve:
```
 /*
* Ensure the hash remains stable (no resize) during the while loop
* below. The hb pointer is acquired under the pi_lock so we can't block
* on the mutex.
*/
[...]
guard(private_hash)(current->mm);
[...]
raw_spin_lock_irq(&curr->pi_lock);
while (!list_empty(head)) {
  [...]
  if (1) {
    CLASS(hbr, hbr)(&key);
```

CLASS(hbr, hbr)(&key) calls futex_hash(), which (if the MM is in the
middle of switching between two futex_private_hash instances) can call
futex_pivot_hash(), which can block on scoped_guard(mutex,
&mm->futex.phash.lock). guard(private_hash) is supposed to have taken
a reference on the futex_private_hash, which would prevent switching
to another futex_private_hash instance; but guard(private_hash) will
have been a no-op if the MM didn't have a futex_private_hash yet at
that time.

So it is possible to race as follows:

First, use nested vfork to create three processes P1, P2, and P3 that
share one MM and can run concurrently. That can be done like this:

 - P1 vforks to create P2'
 - P2' vforks to create P2
 - P2 sends SIGKILL to P2' to unblock P1
 - P1 vforks to create P3'
 - P3' vforks to create P3
 - P3 sends SIGKILL to P3' to unblock P1

Then race like this (view this in monospace):

P1         P2                   P3          RCU
==         ==                   ==          ===
           futex(FUTEX_LOCK_PI|FUTEX_PRIVATE_FLAG)
             [success]
                                futex(FUTEX_LOCK_PI|FUTEX_PRIVATE_FLAG)
                                  [blocks]
           do_exit
             exit_mm
               mm_exit_exec_release
                 futex_exit_exec_release
                   futex_cleanup
                     exit_pi_state_list
                       guard(private_hash)(current->mm)
futex_hash_prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS)
futex_hash_prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS)
  futex_hash_allocate
    scoped_guard(mutex, &mm->futex.phash.lock)
    futex_ref_drop
      __futex_ref_atomic_begin
        call_rcu_hurry(..., futex_ref_rcu)
                                            futex_ref_rcu
                                              __futex_ref_atomic_end
                       raw_spin_lock_irq(&curr->pi_lock)
                       CLASS(hbr, hbr)(&key)
                         futex_hash
                           futex_private_hash_get [fails]
                           futex_pivot_hash
                             scoped_guard(mutex, &mm->futex.phash.lock)
                               *** scheduling-while-atomic ***
    __futex_pivot_hash

Impact, related issues
==========
futex_wait_multiple_setup() follows the same pattern of using
guard(private_hash)(current->mm) to ensure that a later CLASS(hbr,
hbr)(&q->key) won't sleep and is probably affected by the same issue.

__futex_unlock_pi() and requeue_pi_wake_futex() also use
futex_private_hash(), but there the race seems benign.

This issue also means that different futex users could disagree about
the hash bucket that a private futex belongs in (older futex_hash()
calls returning a pointer into the global hash, newer futex_hash()
calls returning a pointer into the private hash). For most users of
CLASS(hbr, hbr)(...), that probably just leads to futex wake/wait
operations on the same userspace address not interacting with each
other, without affecting the kernel. But an interesting aspect of
exit_pi_state_list() is that it does spin_lock(&hb->lock) further down
without any visible access to the corresponding hash bucket; I can't
tell if that actually protects against something, but if yes, this
locking might be broken if the corresponding locking in another task
is holding the hb->lock of a global hash entry instead?

Sidenote
========
Maybe we should block CLONE_VFORK when current->vfork_done!=NULL ? It
is clearly bad to allow nested vfork() such that a SIGKILL can cause
two threads to run concurrently on the same userspace stack.

But I'm not sure if that's a good fix for these futex issues - a fix
that doesn't rely on such distant assumptions might be nicer...

Reproducer
==========
Tested at mainline commit 50d05c7c76c96b90462f24debacca971d2e86713,
with a build with options:

CONFIG_PREEMPT=y
CONFIG_RCU_STRICT_GRACE_PERIOD=y
CONFIG_DEBUG_ATOMIC_SLEEP=y

To test, patch delays into the kernel like this (also attached as
kernel-delay-patch.diff):
```
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b606d..94ebd2c25b2a 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -47,6 +47,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kmemleak.h>
 #include <linux/wait_bit.h>
+#include <linux/delay.h>

 #include <vdso/futex.h>

@@ -1359,6 +1360,7 @@ static void exit_pi_state_list(struct task_struct *curr)
         */
        WARN_ON(curr != current);
        guard(private_hash)(current->mm);
+       if (strcmp(current->comm, "SLOW-1") == 0) mdelay(1000);
        /*
         * We are a ZOMBIE and nobody can enqueue itself on
         * pi_state_list anymore, but we have to be careful
@@ -1945,6 +1947,7 @@ static int futex_hash_allocate(unsigned int
hash_slots, unsigned int flags)
                                 * reference on the existing hash.
                                 */
                                futex_ref_drop(cur);
+                               if (strcmp(current->comm, "SLOW-2") ==
0) mdelay(10000);
                        }

                        if (new) {
```

And run the following testcase:
```
#define _GNU_SOURCE
#include <err.h>
#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <linux/futex.h>

static void *alloc_stack(void) {
  size_t stack_size = 1024*1024;
  void *p = mmap(NULL, stack_size, PROT_READ|PROT_WRITE,
MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
  if (p == MAP_FAILED)
    err(1, "stack mmap");
  if (madvise(p, 0x1000, MADV_GUARD_INSTALL))
    err(1, "stack madvise");
  return p + stack_size;
}

static pid_t child1, child1b;

static unsigned int futex_var;

int child_fn2(void *arg) {
  printf("child_fn2 entry, will kill %d\n", child1);

  syscall(__NR_futex, &futex_var, FUTEX_LOCK_PI|FUTEX_PRIVATE_FLAG, 0, NULL);
  if (kill(child1, SIGKILL))
    err(1, "kill");

  usleep(100000);
  prctl(PR_SET_NAME, "SLOW-1", 0, 0, 0);
  exit(0);
}
int child_fn1(void *arg) {
  child1 = getpid();
  if (clone(child_fn2, alloc_stack(),
CLONE_VM|CLONE_VFORK|CLONE_PARENT|SIGCHLD, NULL) == -1)
    err(1, "second clone");
  errx(1, "child_fn1 running after clone");
}

int child_fn2b(void *arg) {
  printf("child_fn2b entry, will kill %d\n", child1b);
  if (kill(child1b, SIGKILL))
    err(1, "kill");

  // this will block until the bug has been hit
  syscall(__NR_futex, &futex_var, FUTEX_LOCK_PI|FUTEX_PRIVATE_FLAG, 0, NULL);
  exit(0);
}

int child_fn1b(void *arg) {
  child1b = getpid();
  if (clone(child_fn2b, alloc_stack(),
CLONE_VM|CLONE_VFORK|CLONE_PARENT|SIGCHLD, NULL) == -1)
    err(1, "second clone");
  errx(1, "child_fn1b running after clone");
}

int main(void) {
  setbuf(stdout, NULL);
  if (clone(child_fn1, alloc_stack(), CLONE_VM|CLONE_VFORK|SIGCHLD, NULL) == -1)
    err(1, "first clone");
  if (clone(child_fn1b, alloc_stack(), CLONE_VM|CLONE_VFORK|SIGCHLD,
NULL) == -1)
    err(1, "first clone");
  printf("parent running after clone\n");
  usleep(500000);
  prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 4, 0, 0);
  prctl(PR_SET_NAME, "SLOW-2", 0, 0, 0);
  prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 8, 0, 0);
  return 0;
}
```

This gives me a "sleeping function called from invalid context"
warning, a "Invalid wait context" warning, and a
scheduling-while-atomic BUG:
```
sh-5.3# /host/h/test/nested_vfork/nested_vfork
child_fn2 entry, will kill 82
[...]
child_fn2b entry, will kill 84
parent running after clone
 BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:623
 in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 83, name: SLOW-1
 preempt_count: 1, expected: 0
 RCU nest depth: 0, expected: 0
 locks held by SLOW-1/83: 2, last CPU#0:
  #0: ffff888101e73100 (&tsk->futex.exit_mutex){+.+.}-{4:4}, at:
futex_exit_exec_release+0x27/0x160
  #1: ffff888101e726f0 (&p->pi_lock){-.-.}-{2:2}, at:
exit_pi_state_list+0xd7/0x5a0
 irq event stamp: 3306
 hardirqs last  enabled at (3305): [<ffffffff838780bb>] __schedule+0x13eb/0x18d0
 hardirqs last disabled at (3306): [<ffffffff83886c47>]
_raw_spin_lock_irq+0x17/0x50
 softirqs last  enabled at (3294): [<ffffffff814b251d>]
__irq_exit_rcu+0xad/0x180
 softirqs last disabled at (3283): [<ffffffff814b251d>]
__irq_exit_rcu+0xad/0x180
 CPU: 0 UID: 0 PID: 83 Comm: SLOW-1 Tainted: G                 N
7.3.0-rc2-00099-g50d05c7c76c9-dirty #77 PREEMPT
 Tainted: [N]=TEST
 Call Trace:
  <TASK>
[...]
  __might_resched+0x290/0x2b0
  __might_sleep+0x54/0x90
[...]
  __mutex_lock+0x69/0x1180
[...]
  mutex_lock_nested+0x16/0x20
  futex_hash+0x2a4/0x310
[...]
  exit_pi_state_list+0x110/0x5a0
  futex_exit_exec_release+0x159/0x160
  mm_exit_exec_release+0x1e/0x1b0
  exit_mm+0x3b/0x200
  do_exit+0x43c/0x1390
  do_group_exit+0x139/0x140
[...]
  __x64_sys_exit_group+0x26/0x30
[...]
  </TASK>

 =============================
 [ BUG: Invalid wait context ]
 7.3.0-rc2-00099-g50d05c7c76c9-dirty #77 Tainted: G        W        N
 -----------------------------
 SLOW-1/83 is trying to lock:
 ffff888100098488 (&fd->phash.lock){+.+.}-{4:4}, at: futex_hash+0x2a4/0x310
 other info that might help us debug this:
 context-{5:5}
 locks held by SLOW-1/83: 2, last CPU#0:
  #0: ffff888101e73100 (&tsk->futex.exit_mutex){+.+.}-{4:4}, at:
futex_exit_exec_release+0x27/0x160
  #1: ffff888101e726f0 (&p->pi_lock){-.-.}-{2:2}, at:
exit_pi_state_list+0xd7/0x5a0
 stack backtrace:
 CPU: 0 UID: 0 PID: 83 Comm: SLOW-1 Tainted: G        W        N
7.3.0-rc2-00099-g50d05c7c76c9-dirty #77 PREEMPT
 Tainted: [W]=WARN, [N]=TEST
 Call Trace:
  <TASK>
[...]
  __lock_acquire+0xade/0x2c30
  lock_acquire+0xf1/0x210
[...]
  __mutex_lock+0xb7/0x1180
[...]
  mutex_lock_nested+0x16/0x20
  futex_hash+0x2a4/0x310
[...]
  exit_pi_state_list+0x110/0x5a0
[...]
  </TASK>
 BUG: scheduling while atomic: SLOW-1/83/0x00000002
 INFO: lockdep is turned off.
 irq event stamp: 3306
 hardirqs last  enabled at (3305): [<ffffffff838780bb>] __schedule+0x13eb/0x18d0
 hardirqs last disabled at (3306): [<ffffffff83886c47>]
_raw_spin_lock_irq+0x17/0x50
 softirqs last  enabled at (3294): [<ffffffff814b251d>]
__irq_exit_rcu+0xad/0x180
 softirqs last disabled at (3283): [<ffffffff814b251d>]
__irq_exit_rcu+0xad/0x180
 CPU: 0 UID: 0 PID: 83 Comm: SLOW-1 Tainted: G        W        N
7.3.0-rc2-00099-g50d05c7c76c9-dirty #77 PREEMPT
 Tainted: [W]=WARN, [N]=TEST
 Call Trace:
  <TASK>
  __dump_stack+0x21/0x30
  dump_stack_lvl+0x76/0xa0
  dump_stack+0x15/0x20
  __schedule_bug+0x83/0xa0
  __schedule+0x12a7/0x18d0
[...]
  schedule+0xf9/0x160
[...]
  schedule_preempt_disabled+0x11/0x20
  __mutex_lock+0x2ba/0x1180
[...]
  mutex_lock_nested+0x16/0x20
  futex_hash+0x2a4/0x310
[...]
  exit_pi_state_list+0x110/0x5a0
[...]
  </TASK>
```

--000000000000da0e2e065b229eda
Content-Type: application/x-patch; name="kernel-delay-patch.diff"
Content-Disposition: attachment; filename="kernel-delay-patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtvmbuul0>
X-Attachment-Id: f_mtvmbuul0

ZGlmZiAtLWdpdCBhL2tlcm5lbC9mdXRleC9jb3JlLmMgYi9rZXJuZWwvZnV0ZXgvY29yZS5jCmlu
ZGV4IGEwNjFmNTRiNjA2ZC4uOTRlYmQyYzI1YjJhIDEwMDY0NAotLS0gYS9rZXJuZWwvZnV0ZXgv
Y29yZS5jCisrKyBiL2tlcm5lbC9mdXRleC9jb3JlLmMKQEAgLTQ3LDYgKzQ3LDcgQEAKICNpbmNs
dWRlIDxsaW51eC92bWFsbG9jLmg+CiAjaW5jbHVkZSA8bGludXgva21lbWxlYWsuaD4KICNpbmNs
dWRlIDxsaW51eC93YWl0X2JpdC5oPgorI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAKICNpbmNs
dWRlIDx2ZHNvL2Z1dGV4Lmg+CiAKQEAgLTEzNTksNiArMTM2MCw3IEBAIHN0YXRpYyB2b2lkIGV4
aXRfcGlfc3RhdGVfbGlzdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cnIpCiAJICovCiAJV0FSTl9P
TihjdXJyICE9IGN1cnJlbnQpOwogCWd1YXJkKHByaXZhdGVfaGFzaCkoY3VycmVudC0+bW0pOwor
CWlmIChzdHJjbXAoY3VycmVudC0+Y29tbSwgIlNMT1ctMSIpID09IDApIG1kZWxheSgxMDAwKTsK
IAkvKgogCSAqIFdlIGFyZSBhIFpPTUJJRSBhbmQgbm9ib2R5IGNhbiBlbnF1ZXVlIGl0c2VsZiBv
bgogCSAqIHBpX3N0YXRlX2xpc3QgYW55bW9yZSwgYnV0IHdlIGhhdmUgdG8gYmUgY2FyZWZ1bApA
QCAtMTk0NSw2ICsxOTQ3LDcgQEAgc3RhdGljIGludCBmdXRleF9oYXNoX2FsbG9jYXRlKHVuc2ln
bmVkIGludCBoYXNoX3Nsb3RzLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJCQkJICogcmVmZXJlbmNl
IG9uIHRoZSBleGlzdGluZyBoYXNoLgogCQkJCSAqLwogCQkJCWZ1dGV4X3JlZl9kcm9wKGN1cik7
CisJCQkJaWYgKHN0cmNtcChjdXJyZW50LT5jb21tLCAiU0xPVy0yIikgPT0gMCkgbWRlbGF5KDEw
MDAwKTsKIAkJCX0KIAogCQkJaWYgKG5ldykgewo=
--000000000000da0e2e065b229eda--
