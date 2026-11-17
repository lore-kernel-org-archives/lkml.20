Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891188;
	b=WPBPQfPTXZuNygw7DnUYEQE9m7WWN9Y/omNsxD4Jnwqthon4CXadgkK10eiN73/ueFWH
	 pvC0i3JcOzBPAO9Zz9lbJ8M3hqX99fe5edsdYVVuFz+TbojwrR1Y04PK+zGf8TzXtfH2u
	 /KLgpaXETXEuYndzEWeOF/e1OM5lbMkC+f653nAYo217WwIhXzj+Sq0BuOQBdYz9zo87Q
	 cpBVA6ULf85ndWrOh0NuAkhxIYn/8iSTEyhkgW/kH4CRLSpDeDg74oXWMpTifRxj0SLvS
	 LEJ5xtIRp5QsjY+m9XPX43mCWVZFDvPYxwioSHtUb0LxwPVsRkdvQbRC7w5q7kxX2FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HkjF6bCupjXjMpu5POuuvoE7+5QnihoNMN3ajOMbfaI=;
	b=qVLpJrYGlKs1knpL8f/elhvVcHm5kR3VsZeKQq5UWAhiVbxk8TliO739IXsdinMom29o
	 ZVX6nuMugxA3cFAC7Ohq2MvH1KsCHpL2hE++Qn7FIGTeMlUzUoU2D+1Fb1M7WpoUjkvsn
	 2OPEEJ/NLLF2Fir+qothy9qcH8xJKbCr27LF09UUHErRGPd02ukTmAvBmNGu+6/HhcHWf
	 ssyzY0kYTtsrWFlvhkp35O9F+sNIDXGc/baNkw8mUU6cCT3wh8QTtI8CjcStW5AIjEYWx
	 CD1eZN3FJeOsLFNBNyf29B858CkhNLo7nkpxvnqtblVtmxVrs/oSYjbInr1VEx9nPMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gmo31sgJ;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0737D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gmo31sgJ
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bfe396acb4so2042446b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794891186; x=1795495986; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkjF6bCupjXjMpu5POuuvoE7+5QnihoNMN3ajOMbfaI=;
        b=Gmo31sgJ7h6kJ/equPPBW+c1EFFYQZAC0XQ+mJuGR+jFGFe+YRCVgKiZbcKlBFAy9j
         g8wMzbWOhMJqxD+OK4ESyrGgfrSolsCWn/cofKRYUsroMqUP67+PSLjdjgn94tkV6sUQ
         9u4kPD7I7sJSWYVjenx5h/uT6+1mpkv7ipgRfIOULbDrBhskbZP4ayCJy6SbqkK+zoVZ
         qEBiRWiPx3vWOzjIpj+BPzlFpxPn4bxHdwta6vNgdTAqOXZ9KIuZa88dNnoyoq7+RHG2
         Ys59s2A0anQldJehVw48zXZ7IVsmbUdwkuQtcSpKC/MLzRA4JTmKpbIBfV/IjQD9foui
         zXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891186; x=1795495986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkjF6bCupjXjMpu5POuuvoE7+5QnihoNMN3ajOMbfaI=;
        b=CbLzqtd7/M+fogEdTGTGCE80p4HKRHNEKDeDZZlrA4/UFmNjcxNwZ4qwZrjiAHXjB/
         7ytzxLLaM5ge6UncdkTGfqh3aW4jJAID+avx6wG9tEwvTc0kCWzZ8Iv+LGGzUrc3BRVx
         J/SKBddt/SJaZWZzKb9G9llxRq+T5JdNkRxzucY6a414JwyXHmwAvT4vDRyXQEAIZOwK
         yOgRaXHMpYnf0EuLtPmeKcQ1mhl3SMORqBx9wgLqP605EBXQF7t7MHm1vYmbzsJfZzON
         pFvwQbDa7gw+RNAlKNudnRwXShxLgjgKw12Kz6yis7mt3fDZfLOd5RYZKFXhqQHoRz2k
         arBQ==
X-Forwarded-Encrypted: i=1; AL+hErEe1tkjsYVSnXOcIl0JXDQgKOm166uknIidYeM1ULRlmnPYg8kgX2ftFG8Q4wOXTntjWfN1GcUT6ZqqKok=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eAAdCHG78hRFUfh0bHbOKD6CKRXhwxTwUOSTVBoAz7GoAg5FW
	4n8qgi1N5lSfe7bhL52MaP6hl3fl6meuNv5zoQBbntJTAm8KsJ98vAn/K6uDh8OYf5CFRM6wnQt
	1hpYQqtY6PqYpG95YzYlVB747jQ==
X-Received: from pgcle4-n2.prod.google.com ([2002:a05:6a02:8b84:20b0:cca:bb35:aa7b])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3293:b0:3de:94b:7e68 with SMTP id adf61e73a8af0-3f7a4dbff9amr12222591637.8.1794891186049;
 Mon, 16 Nov 2026 20:53:06 -0800 (PST)
Date: Tue, 17 Nov 2026 04:52:54 +0000
In-Reply-To: <20261117045254.1048298-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117045254.1048298-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117045254.1048298-3-dylanbhatch@google.com>
Subject: [PATCH 2/2] selftests/livepatch: Add cond_resched() kthread
 transition test
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a livepatch kselftest (test-cond-resched.sh) and helper module
(test_klp_cond_resched) to verify that a livepatch transition completes
while CPU-bound kthreads spin in a cpu_relax() +
cond_resched_tasks_rcu_qs() loop on other online CPUs.

After commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
live-patching"), klp_sched_try_switch() was moved from cond_resched()
into __schedule() and gated on TASK_FREEZABLE. A sole runnable kthread
spinning in a cond_resched() loop never gets TIF_NEED_RESCHED set and
does not have TASK_FREEZABLE set, causing the livepatch transition to
stall.

Note that because _cond_resched() is a no-op under CONFIG_PREEMPTION=y,
a sole runnable spinning kthread enters __schedule(SM_PREEMPT) via
preempt_schedule_irq() with an in-kernel interrupt pt_regs frame on the
stack. Passing this test without another runnable task on the CPU
therefore requires arch_stack_walk_reliable() to support unwinding
across in-kernel exception frames (such as x86_64 with
CONFIG_UNWINDER_ORC=y); on architectures or configs where
arch_stack_walk_reliable() currently rejects in-kernel exception frames
(arm64, powerpc, s390, or x86 with CONFIG_FRAME_POINTER=y), this test
exposes the lack of exception-boundary reliable unwinding.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 tools/testing/selftests/livepatch/Makefile    |  3 +-
 .../selftests/livepatch/test-cond-resched.sh  | 73 ++++++++++++++
 .../selftests/livepatch/test_modules/Makefile |  1 +
 .../test_modules/test_klp_cond_resched.c      | 94 +++++++++++++++++++
 4 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/livepatch/test-cond-resched.sh
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_cond_resched.c

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index a080eb54a215d..14741d8da4209 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -11,7 +11,8 @@ TEST_PROGS := \
 	test-ftrace.sh \
 	test-sysfs.sh \
 	test-syscall.sh \
-	test-kprobe.sh
+	test-kprobe.sh \
+	test-cond-resched.sh
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/livepatch/test-cond-resched.sh b/tools/testing/selftests/livepatch/test-cond-resched.sh
new file mode 100755
index 0000000000000..4a7c013c863db
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-cond-resched.sh
@@ -0,0 +1,73 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+. $(dirname $0)/functions.sh
+
+MOD_LIVEPATCH=test_klp_livepatch
+MOD_COND_RESCHED=test_klp_cond_resched
+
+setup_config
+
+if [[ $(nproc) -lt 3 ]]; then
+	skip "test-cond-resched requires at least 3 online CPUs"
+fi
+
+function cleanup_cond_resched() {
+	# Stop the spinning kthread first so any stalled livepatch transition
+	# can complete before unloading the livepatch module.
+	rmmod $MOD_COND_RESCHED 2>/dev/null || true
+	if [[ -e "$SYSFS_KLP_DIR/$MOD_LIVEPATCH" ]]; then
+		echo 0 > "$SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled" 2>/dev/null || true
+		loop_until '[[ ! -e "$SYSFS_KLP_DIR/$MOD_LIVEPATCH" ]]' || true
+	fi
+	rmmod $MOD_LIVEPATCH 2>/dev/null || true
+	cleanup
+}
+trap cleanup_cond_resched EXIT INT TERM HUP
+
+# - start CPU-bound kthreads spinning in a cpu_relax() +
+#   cond_resched_tasks_rcu_qs() loop on other online CPUs
+# - load a livepatch and verify the patching transition completes
+# - disable and unload the livepatch and verify the unpatching transition
+#   completes
+# - unload the cond_resched kthread module
+
+start_test "kthread spinning in cond_resched() transition"
+
+load_mod $MOD_COND_RESCHED
+
+load_lp $MOD_LIVEPATCH
+
+if [[ "$(cat /proc/cmdline)" != "$MOD_LIVEPATCH: this has been live patched" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+if [[ "$(cat /proc/cmdline)" == "$MOD_LIVEPATCH: this has been live patched" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+unload_mod $MOD_COND_RESCHED
+
+check_result "% insmod test_modules/$MOD_COND_RESCHED.ko
+$MOD_COND_RESCHED: cond_resched_fn: spinning in cond_resched()
+% insmod test_modules/$MOD_LIVEPATCH.ko
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH
+% rmmod $MOD_COND_RESCHED
+$MOD_COND_RESCHED: cond_resched_fn: stopping"
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
index a13d398585dcb..1502ff9070b88 100644
--- a/tools/testing/selftests/livepatch/test_modules/Makefile
+++ b/tools/testing/selftests/livepatch/test_modules/Makefile
@@ -6,6 +6,7 @@ obj-m += test_klp_atomic_replace.o \
 	test_klp_callbacks_demo.o \
 	test_klp_callbacks_demo2.o \
 	test_klp_callbacks_mod.o \
+	test_klp_cond_resched.o \
 	test_klp_kprobe.o \
 	test_klp_livepatch.o \
 	test_klp_mod_patch.o \
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_cond_resched.c b/tools/testing/selftests/livepatch/test_modules/test_klp_cond_resched.c
new file mode 100644
index 0000000000000..ae1d1e3aab106
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_cond_resched.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * test_klp_cond_resched.c - Support module for testing livepatch
+ * transitions while a CPU-bound kthread spins in cond_resched().
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/completion.h>
+#include <linux/cpumask.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/processor.h>
+#include <linux/rcupdate.h>
+#include <linux/sched.h>
+#include <linux/smp.h>
+
+#define NUM_COND_RESCHED_TASKS 2
+
+static struct task_struct *cond_resched_tsks[NUM_COND_RESCHED_TASKS];
+static atomic_t cond_resched_ready = ATOMIC_INIT(NUM_COND_RESCHED_TASKS);
+static DECLARE_COMPLETION(cond_resched_started);
+
+static int cond_resched_fn(void *data)
+{
+	if (atomic_dec_and_test(&cond_resched_ready)) {
+		pr_info("%s: spinning in cond_resched()\n", __func__);
+		complete(&cond_resched_started);
+	}
+	while (!kthread_should_stop()) {
+		cpu_relax();
+		cond_resched_tasks_rcu_qs();
+	}
+	return 0;
+}
+
+static void stop_cond_resched_tasks(void)
+{
+	int i;
+
+	for (i = 0; i < NUM_COND_RESCHED_TASKS; i++) {
+		if (cond_resched_tsks[i]) {
+			kthread_stop(cond_resched_tsks[i]);
+			cond_resched_tsks[i] = NULL;
+		}
+	}
+}
+
+static int test_klp_cond_resched_init(void)
+{
+	int cur_cpu, cpu, i = 0;
+	int target_cpus[NUM_COND_RESCHED_TASKS];
+
+	cur_cpu = get_cpu();
+	for_each_online_cpu(cpu) {
+		if (cpu != cur_cpu)
+			target_cpus[i++ % NUM_COND_RESCHED_TASKS] = cpu;
+	}
+	put_cpu();
+
+	if (i < NUM_COND_RESCHED_TASKS)
+		return -EINVAL;
+
+	for (i = 0; i < NUM_COND_RESCHED_TASKS; i++) {
+		struct task_struct *tsk;
+
+		tsk = kthread_create_on_cpu(cond_resched_fn, NULL,
+					    target_cpus[i],
+					    "klp_cond_resched/%u");
+		if (IS_ERR(tsk)) {
+			stop_cond_resched_tasks();
+			return PTR_ERR(tsk);
+		}
+		cond_resched_tsks[i] = tsk;
+	}
+
+	for (i = 0; i < NUM_COND_RESCHED_TASKS; i++)
+		wake_up_process(cond_resched_tsks[i]);
+
+	wait_for_completion(&cond_resched_started);
+	return 0;
+}
+
+static void test_klp_cond_resched_exit(void)
+{
+	stop_cond_resched_tasks();
+	pr_info("cond_resched_fn: stopping\n");
+}
+
+module_init(test_klp_cond_resched_init);
+module_exit(test_klp_cond_resched_exit);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Livepatch test: cond_resched() kthread transition");
-- 
2.56.0.679.gc527c65306-goog

