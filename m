Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EC40DB37
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181059; cv=none; b=IIuZk1zsniEIvG+vOBBQrVfd9SD32eJ8oG0gx3TDB4N2BIc2R2UPwyUTWfy8zCBUQoEHB77KVcNp+Itu+2iCnxbypBF8iIZEZCA09JmBN0huhC0sUte9Nd7Q7XlhGaSpVYRjyQVDrsPVFINNGXK7lyzQQwouRrEHCgdOPcbUuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181059; c=relaxed/simple;
	bh=9ZL4XBzPZ0V9ydMLiQmcbR7eiM+nR8n/0NGC/rsZkDs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=icMddmDyUpiNm5xu+wiIPf090ykU3kbf/s4/WhDK3rM0iWGT1FMFFKSLTg4+EH1Hz4osbz4mmbv7FEVqIRJpxb2R8ct4jKHUAVVM9VU/K3lPttJiGAVPR5daEhw+U4HdOVQBzUQiOhOZ7kfYJFp2FmjpmU8Jc+HyWUF67tI5iO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nwo7NLxx; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nwo7NLxx"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccb223bceso14582585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788181056; x=1788785856; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKyH/g1NLaguYKAGHg3qgzdHP4bGLADdCtBT1AC9Fr0=;
        b=Nwo7NLxxMhj64eutgN6/3+L/uI2MGH0sGWp6pAHMw/j9iiKpc0g1q0tnviS5HWVW+R
         FTteYGLuCOVsoLRtWW9ihIG/Q2W2zaG+KMtOzFp1frpItSAf/QHgDs7KdUkkejXVGfvI
         odPInk5E31766YCeg+iVae0PPzYwNNUlaULlT7e0LFflnMmnQvOhrQX6rHDqEaO+2U5C
         6kXL7G8zBMwmlsrPZwQbD4TQ+Od4gK80nEIq5n1nMOxWEN4g7juWP+NggHVfOBwCKfbn
         LyTSF2z+y896UMVrl8y34h0+HEA/psgX/lGsMdT7RgeqZqjvMSFCJAChCfo1Oy7D4lmG
         TpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181056; x=1788785856;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKyH/g1NLaguYKAGHg3qgzdHP4bGLADdCtBT1AC9Fr0=;
        b=tDZoE4gF+JDiJCIAx1w1qroH0OCOFOsfERnNDsm98BPDQ3+tDEwSmWq6oXuhYYUgGr
         W1pSqNrGTJS4G4AFzQi0S8Cg+3dfVCZ9F9fdp0WdlK3BulaDcxN2RG3xQi6ynCaC0Css
         BKIfu7LAfFzKpEQ0jrIEyMDEWzvSSRzOdDBJXywPjljshmfWg3RtqbAI1RFW7UvySUlF
         0zoXmaIqFMVE9pbyXY5EOFfJOs75Rwm4TEkAgKpGCNIq/pnrWZLrNj6I5BweNN9ORS46
         kb3e76wwRSA/LxWNBXEg61DacVByU58HwHlwdzfc9DLRIqU3j+XTt+ZjjYnXaYA1JA6i
         jDig==
X-Forwarded-Encrypted: i=1; AHgh+RonFx3xV6sVHnK5UJcOta/DLvCdr2E7IlCmIyCMA6gsraKtHQUM8XkmCVc/Y1p0JPkPDo9EWHTCBl9wFoM=@vger.kernel.org
X-Gm-Message-State: AFuF++luNhZH1vVaPEz+Bet9K1Prlx5OPue9IlcmweD8wtglmiwxBzfK
	HNnoXRRvnArdjUsedLaDBJjRp9dIvylwcRPJHeMwYLsPrMMX1EuLg/5nAoYMFVAwTQL158A7l21
	7ZKxyLPDBXowU+kiOYA==
X-Received: from wrca25.prod.google.com ([2002:a5d:4579:0:b0:47f:40f4:399])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b11:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cd5312c4bmr116093915e9.1.1788181055786;
 Mon, 31 Aug 2026 05:57:35 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:57:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADV6lWoC/x3M3Q5DQBCG4VuROe4k2AZ1K40D1rdM1E92aDXi3
 m0cPgfve5DCC5TK6CCPr6jMU0DyiMj29dSBpQ2mNE6zuDAJ61/ZbSt2/tUDeJURrB+xYGuy3BS Ny5vXk0K/eDjZ7/e7Os8LP0I/zmsAAAA=
X-Change-Id: 20260831-sys-futex-wake-time-slice-c36738bf7b94
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5416; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9ZL4XBzPZ0V9ydMLiQmcbR7eiM+nR8n/0NGC/rsZkDs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqlXo5XkZJ/cLNePTes/5M7fqd3nfGvueYaphPp
 CSactW57IGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCapV6OQAKCRAEWL7uWMY5
 RmTPD/9AeJ1U4JHzObrRSkY0Ji1Cx2BzazA67y7PXmzUDBjtoKd+PWoOdYHkDkWQ+qerlBujUs4
 XvKt//3pqDOj9UIACwKbTtdhPHGZLkY0YqvQCf2IKYV1mJPfNe6EVu+hB2Qkv8UGRaQEyr6ng/b
 3bIU3cGAgy4Dkeh7ZNLpx5HkdKVlwdx8WDR1wIM0Zjscy8pLVzHdo9oqPOex4pF9nfYLTR4fDmP
 7J8ro6eCYpp1pP5hiz0R+9QiW+2CAY6L8XJKf98/JOP0QeXu6WW4t4zgqzD5HUcG70KaCzo74tW
 Vy4oOLlHIZrJBKHqHh3ViCXIXG36nrTd36a7wv4T9AuVAGN4PXkqtatuHcFc81Dh5ycJzdW+Tyl
 3w4gTalyJV3yIBuDokhwZhSi2ClbEgLZ/aF1sE0x132UeCG5zkPnZHtVi4hG/ZSk7m9uVyKn4WH
 4fIxU4iA/NroslxurDJ1O1Nk2eWDCuMFH6qzikgoJn1J3QX+5ee8AZIXYVpqp5jL4z/Wy8hKxwX
 xgAMtLmZoxkuladsOPhpBrB4iQYNapBAXIk9R5lBXQTozpaP3rBg5scHX34KbNPSTDOT+yyqsjW
 tizhmGvXsFMwLBYmMYpunAg4NfHytPb3QkqxwM+yImAt+Lc0RhVqEvClcFycC6p82hpKqCdY8pI mLXMKbjOZ0v6+uQ==
X-Mailer: b4 0.14.3
Message-ID: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
Subject: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
From: Alice Ryhl <aliceryhl@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a task is granted an rseq scheduler time slice extension, it is
expected to finish its critical section and relinquish the CPU via
rseq_slice_yield(2). If the task issues any other system call while a
grant is active, rseq_syscall_enter_work() forces an immediate
reschedule on syscall entry via cond_resched(). This may cause
significant latency penalty for userspace lock implementations that use
rseq time slice extensions when unlocking the futex.

In a userspace mutex unlock sequence:
1. The lock is released in userspace.
2. If there are waiters, the unlocking thread calls sys_futex_wake()
   to wake a sleeping waiter.

Because sys_futex_wake() is currently treated as an arbitrary syscall,
rseq_syscall_enter_work() schedules out the unlocking thread upon
syscall entry, which is before it has executed the wakeup. Consequently,
the lock is free in userspace, but the waiter remains blocked in the
kernel while the CPU switches to an unrelated task. The waiter is only
woken when the unlocking thread is eventually scheduled back in to
finish the syscall, causing lock handoff delays.

Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
does not reschedule during syscall entry. The thread will yield the CPU
on the syscall exit path instead.

There is no need to apply this optimization to the multiplexed futex()
syscall since any userspace code that can invoke rseq_slice_yield() can
also invoke futex_wake().

This patch was verified via ftrace that when sys_futex_wake() is invoked
during an active slice grant, the wakeup (sched_waking) occurs before
any context switch:
1. sys_enter_futex_wake
2. sched_waking (wakes waiting thread)
3. sys_exit_futex_wake -> 0x1
4. sched_switch (on syscall exit due to TIF_NEED_RESCHED)

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Documentation/userspace-api/rseq.rst | 17 +++++++++++++----
 kernel/rseq.c                        | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/rseq.rst b/Documentation/userspace-api/rseq.rst
index 8549a6c61531..30bdb1885f67 100644
--- a/Documentation/userspace-api/rseq.rst
+++ b/Documentation/userspace-api/rseq.rst
@@ -217,10 +217,10 @@ operation.
 
 If the thread issues a syscall other than rseq_slice_yield(2) within the
 granted timeslice extension, the grant is also revoked and the CPU is
-relinquished immediately when entering the kernel. This is required as
-syscalls might consume arbitrary CPU time until they reach a scheduling
-point when the preemption model is either NONE or VOLUNTARY and therefore
-might exceed the grant by far.
+relinquished. For most syscalls, this occurs immediately when entering the
+kernel. This is required as syscalls might consume arbitrary CPU time until
+they reach a scheduling point when the preemption model is either NONE or
+VOLUNTARY and therefore might exceed the grant by far.
 
 The preferred solution for user space is to use rseq_slice_yield(2) which
 is side effect free. The support for arbitrary syscalls is required to
@@ -228,5 +228,14 @@ support onion layer architectured applications, where the code handling the
 critical section and requesting the time slice extension has no control
 over the code within the critical section.
 
+For futex_wake(2), the CPU is instead relinquished when returning to userspace,
+so that it gets a chance to wake any waiting tasks before yielding the CPU.
+This makes it possible to terminate the critical region of a userspace mutex
+using rseq and futexes with futex_wake(2) instead of rseq_slice_yield(2).
+Currently, this is the only syscall that does not relinquish the CPU
+immediately on syscall entry. Note in particular that this applies only to the
+dedicated futex_wake(2) syscall, and not to the futex(2) syscall even when
+using op=FUTEX_WAKE.
+
 The kernel enforces flag consistency and terminates the thread with SIGSEGV
 if it detects a violation.
diff --git a/kernel/rseq.c b/kernel/rseq.c
index e75e3a5e312c..81bc2ed997f0 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -723,9 +723,18 @@ void rseq_syscall_enter_work(long syscall)
 		 * the task was already rescheduled before arriving here.
 		 */
 		if (!curr->rseq.event.sched_switch) {
-			rseq_slice_set_need_resched(curr);
+			if (syscall == __NR_futex_wake) {
+				/*
+				 * For this syscall, reschedule on syscall exit
+				 * instead of syscall entry to avoid delaying
+				 * the wakeup.
+				 */
+				set_tsk_need_resched(curr);
+			} else {
+				rseq_slice_set_need_resched(curr);
+			}
 
-			if (syscall == __NR_rseq_slice_yield) {
+			if (syscall == __NR_rseq_slice_yield || syscall == __NR_futex_wake) {
 				rseq_stat_inc(rseq_stats.s_yielded);
 				/* Update the yielded state for syscall return */
 				curr->rseq.slice.yielded = 1;
@@ -735,7 +744,8 @@ void rseq_syscall_enter_work(long syscall)
 		}
 	}
 	/* Reschedule on NONE/VOLUNTARY preemption models */
-	cond_resched();
+	if (syscall != __NR_futex_wake)
+		cond_resched();
 
 	/* Clear the grant in kernel state and user space */
 	curr->rseq.slice.state.granted = false;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-sys-futex-wake-time-slice-c36738bf7b94

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

