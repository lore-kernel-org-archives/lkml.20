Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC4175A5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791942837; cv=none; b=RaALWvw2HZfYjz+zengQxhJ1Vzi0y1xgSKu3TbfZo5eArdHmlNcvepsuRWWb3fAsyH4wfPh4JEBFUiGkqsA9AfB11j0v9CPBSO/nDXCwClNsaoe9FuTwgnjOA+yJkZBBU4rGODp72zGu8EoQY5jlEMkLb5uSeJHwFjTAlRlDSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791942837; c=relaxed/simple;
	bh=etzMKFfxyaLbRaq/gDzTndGUtAYGsuuIZao4GHbqgps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VyXE/qDHTfvQ+AybLJeMb0BKwxRsA8xG5paiq7bu5ef7gUmS2qFQKHNXMw1iQcz96D1EQUvdnQQXFJC8o3y+Q7LhzIIC4sPvji8cfRHdHSKb/fP62LqxAz97VZMob8FbuE6QFT20DIRFUNBNRZGVTruaqmy5tEuwXvG6TayTW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ng993Nf0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ng993Nf0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2095080f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791942834; x=1792547634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7gohh3C0jcN6dr3Ss+1kwQpdA+0WCudV85EOEZosuw=;
        b=Ng993Nf0WUvmyTmfVIKWAs6ecuvJ9QdDY97lTjrfIl/Rj/QaaQaNRVNObepxP1jzqk
         /n+W40RwImKIN78o/zftXddwDgSaXDoTl66g08EHTSmHyG65c0/lWZ+P6D9NKYYZj7Xb
         +G2jk3oVImpQ/s3QpJckxyASP74fcfJqNEQuX78rQg//HeFXs7P+qxZ0/B1RDVfpTTqo
         s7R91/Bvp2/hqoYDOwAB1vbM5+NIqIAKxn4gHULzehsFwpunbmRGJddezStObscgtSuN
         MkMJrZsyjMaYAGuukFxXAksFNxOdCfk625ud6iF8wG4qySEJdwN8JIURVg3nqQUhOPU9
         LasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791942834; x=1792547634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7gohh3C0jcN6dr3Ss+1kwQpdA+0WCudV85EOEZosuw=;
        b=jmXMlcFYPh//zED1FU3O/c0qWW8WSt32j2dI1NI5nFv/GvMnGmiQocoNdS5Wj5vQcg
         VzhPzuQgQ63H95TYgEdXHYQvMjrZmuHk/8eTHCXzmPyAH/eE3JArbJvfPpZDrcarDeUH
         WVeWyyzxPx7Pn942/F8AOVvmx6MSogzz+U0bOnbo16vuq24MqF+Nco22Eg/siYzEY/A3
         5k759GpkOJlLh516bRhlmGwfNkIe+LVJ7UBd3GhT/N/EoCACAQfLICbf/EQyL8H4X/YK
         LYpezsirr77/6X6lmuG5ib5Z0Css5eiFx+veT3bdLQvTrg7JmiZw5/AZs/Amonlkl1zU
         bCIw==
X-Forwarded-Encrypted: i=1; AKwUvByiXRd0NXXIXsFz3Tu3nlPr92mizp/+RMyZg0bjK4fOH4xOIoJaowmcDA9CSDcVRjvNcyYc4r04Whzx3oQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyhpZqKoA8i6npSy0pQXeYtoVrPwqalSBigquH11CnBhIubrBd
	0loZH9rsBGu9INB1Gc6qCL6F6JjnCXShRcXGnmzTpHsjD1TNqTb8Sf719v5BpmplaA==
X-Gm-Gg: AYBFou056hHDedy1UmuNlJ79Nx+cLS+E49YN9T07BSf+GIZdfLh78yzw/CSls6cK0nM
	X6TUUozA1BP8/G0CS1MXr8YDOee3cEYYIdWI81/kbrTZllXSMs5Pk7IH45fl2pnp+2Dknb7d7Yy
	tfab6xX5c6DSr1ZxACwJB91EG1QIEyxh+0bKwvD4dUuOkSrxDqc2LphX3EDdYL4sEa4ANUhlFP5
	+1ekDX5U3efqq37E8WaiN+gIeqeBUesywXA1qV6kNX7rRikPi6GpZgACsK+B7Y7T5R/FvZdWgRA
	KtSJtoF2zPNpyjaXp0/nQa/O9J9pCLeeF60auWsag+HgwMjXC8kvnqaOx/BuayUPDw7d4cnoZX3
	MgWViIcoeakqcTGcYRezL2A+3cxznsN2yGCumewVN7PGIJYoUP0Wzotajqptk1LKht6taG2vDNB
	42lewU+74x/t05DvpCCVGZ1fxHvdn/UyULsz2EKRMBP9FONZmzQ1FwSRP5aTebXAf+C2he+B/eu
	68+b3++Va5hYZ0mbZmZHC1OyieY+0F91qj9Tki1s5Uu7+FzYOCmU0k=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a18e47a844mr298659345e9.9.1791942833797;
        Tue, 13 Oct 2026 18:53:53 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1b2e9791csm19754185e9.1.2026.10.13.18.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:53:53 -0700 (PDT)
From: Wei Gao <wegao@suse.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Gao <wegao@suse.com>
Subject: [PATCH v1] sched/cputime: Preserve iowait accounting across waking interrupts in dyntick-idle
Date: Wed, 14 Oct 2026 01:52:58 +0000
Message-ID: <20261014015258.13967-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In liburing's test suite, the test/iowait.t test case intermittently fails
with:
    iowait diff too small: 48
    test 1 failed
on tickless systems where IRQ time accounting (CONFIG_IRQ_TIME_ACCOUNTING)
is not enabled.

Commit 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
optimized dyntick-idle cputime accounting by avoiding pausing idle
accounting on IRQ entry when IRQ time accounting is disabled.

However, this causes iowait time to be erroneously accounted as
CPUTIME_IDLE if the task waiting for I/O is woken up inside the interrupt
handler (such as the 1-second timeout hrtimer in liburing's test/iowait.t):

1. In test/iowait.t, a read request is submitted on an empty pipe and
   io_uring_wait_cqe_timeout() is called with a 1-second timeout. Because
   current->in_iowait is set, rq->nr_iowait on the CPU is incremented
   to 1. When the CPU enters tickless idle, the periodic scheduler tick
   is stopped.
2. When the 1-second timeout expires, the hrtimer interrupt fires.
   Because irqtime is disabled, kcpustat_irq_enter() does not pause idle
   accounting.
3. Inside the interrupt handler, io_cqring_timer_wakeup() calls
   wake_up_process(). In ttwu_do_activate(), waking up the task immediately
   decrements rq->nr_iowait from 1 to 0 before the CPU has exited idle.
4. When the CPU returns from the interrupt and calls tick_nohz_idle_exit()
   -> kcpustat_idle_stop() to settle the elapsed tickless idle duration,
   it checks:
       iowait = nr_iowait_cpu(smp_processor_id()) > 0;
   Because rq->nr_iowait was already decremented by ttwu_do_activate(),
   this evaluates to false. As a result, the entire 1-second idle duration
   spent waiting for I/O is credited to CPUTIME_IDLE instead of
   CPUTIME_IOWAIT, causing diff < 50 and failing the test.

Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
before the interrupt handler runs. On kcpustat_irq_exit(), resume
accounting if it was paused.

Fixes: 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
Signed-off-by: Wei Gao <wegao@suse.com>
---
 kernel/sched/cputime.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e5..e8b56433c61c 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -496,7 +496,8 @@ void kcpustat_irq_enter(u64 now)
 	struct kernel_cpustat *kc = kcpustat_this_cpu;
 
 	if (!vtime_generic_enabled_this_cpu() &&
-	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu()))
+	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu() ||
+	     nr_iowait_cpu(smp_processor_id()) > 0))
 		kcpustat_idle_stop(kc, now);
 }
 
@@ -510,9 +511,13 @@ void kcpustat_irq_exit(u64 now)
 	 * need to pause nohz accounting. Resume nohz accounting as long
 	 * as the irqtime config is enabled to handle case where irqtime
 	 * accounting got runtime disabled in the middle of an IRQ.
+	 *
+	 * Also resume accounting if it was paused on IRQ enter due to
+	 * iowait.
 	 */
 	if (!vtime_generic_enabled_this_cpu() &&
-	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu()))
+	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu() ||
+	     !kc->idle_elapse))
 		kcpustat_idle_start(kc, now);
 }
 
-- 
2.55.0

