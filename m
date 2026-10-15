Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548C449EB2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057389; cv=none; b=RkuL7dCJ12p/7nqOlCDiDMhyE/wKVE7lfnrKOa81LoVfyy8aR7RAJfAFbFjNm2nMeR8sj60LXiHAh9ujpzw/DFfsWsUmu+jVb7tYjDhpxrSuxRFZ3JcC1oHlFmlw6Qf2fzZApiR1Cat0eIh1rRCPfB9alTH3DTNE2pvSAgX4z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057389; c=relaxed/simple;
	bh=LDHuhXzhqSsKFw0QQ+al7co5fJURPVu81XK5aDR8AmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvIia02bZtzVoeZpD7+pZgrRiy5BywMLLuX263TiRVoI2c5yscH1Ule/Io0WX1rGrFuYG9PiE3dpij6tL+vgbmbSA7fS8X1w7WC6fZOq0F+hSEGd2IAiI43WkVehio+OSbvNPlrMZIbV72/CpxjT0CydI69zFa7Y9BGt40Vb4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XnB5rCnl; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XnB5rCnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pw
	tbfomv95pVh430USUSVD0JX8E5q+0LXyQwpoGnff4=; b=XnB5rCnlmzp7kLlFUG
	dKaCDWIZXOdyB8D8e3QuSJZ857Zo2f6IAwTpTCvs0Xxx2vpf2SisfydIyOERYpI8
	Ttu/qdSyi6Do4px8aERyJsCF6uRUfbaBkgK1fu76L74wa0Bol8VXtGeLkk11D/Fc
	nt2VPlc+u+pdYPEjsVHsDW4LI=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXf9bzn9BqYugkEw--.55640S2;
	Thu, 15 Oct 2026 17:42:12 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH] sched/idle: Make forced polling state race-safe
Date: Thu, 15 Oct 2026 18:42:11 +0900
Message-ID: <20261015094211.4156055-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXf9bzn9BqYugkEw--.55640S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4fur47ArWrGw4xZw1rtFb_yoWrGFy5pF
	9Yya43Kr4kJw17ZwnrJ3WqgFyruan7A343ZrW2k3y8CF4YvF1FqFyvq3WFvrW8CrWkXr13
	Z3WUGF9rCa15JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hTzU2rQn-SfWAAA3I

cpu_idle_poll_ctrl() maintains a global nesting count for forced idle
polling. The count is updated with plain increments and decrements while
idle CPUs read it without synchronization.

Use an atomic counter to make the nesting count safe against concurrent
updates and to make idle-side accesses race-free.

The weak arch_cpu_idle() fallback also permanently switches the generic
idle path to polling. Keep that state separate from the temporary
request counter so a concurrent request cannot overwrite, or later
release, the fallback state.

Fixes: d16699123434 ("idle: Implement generic idle function")
Signed-off-by: Hui Su <sh_def@163.com>
---
Testing:
- On x86_64, a two-worker KCSAN harness reported the data race and ended at
  -14565 before the change; 100,000 balanced requests ended at zero with no
  target report afterward.
- The KCSAN/noinstr build completed without objtool warnings. A focused test
  confirmed that polling remained enabled after the temporary count returned
  to zero; the weak fallback itself was not exercised on x86.
---
 kernel/sched/idle.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..84b02db65828 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -6,6 +6,7 @@
  * (NOTE: these are not related to SCHED_IDLE batch scheduled
  *        tasks which are handled in sched/fair.c )
  */
+#include <linux/atomic.h>
 #include <linux/cpuidle.h>
 #include <linux/suspend.h>
 #include <linux/livepatch.h>
@@ -24,22 +25,27 @@ void sched_idle_set_state(struct cpuidle_state *idle_state)
 	idle_set_state(this_rq(), idle_state);
 }
 
-static int __read_mostly cpu_idle_force_poll;
+static atomic_t __read_mostly cpu_idle_force_poll = ATOMIC_INIT(0);
+static bool __read_mostly cpu_idle_force_poll_sticky;
+
+static __always_inline bool cpu_idle_force_polling(void)
+{
+	return raw_atomic_read(&cpu_idle_force_poll) || READ_ONCE(cpu_idle_force_poll_sticky);
+}
 
 void cpu_idle_poll_ctrl(bool enable)
 {
 	if (enable) {
-		cpu_idle_force_poll++;
+		atomic_inc(&cpu_idle_force_poll);
 	} else {
-		cpu_idle_force_poll--;
-		WARN_ON_ONCE(cpu_idle_force_poll < 0);
+		WARN_ON_ONCE(atomic_dec_return(&cpu_idle_force_poll) < 0);
 	}
 }
 
 #ifdef CONFIG_GENERIC_IDLE_POLL_SETUP
 static int __init cpu_idle_poll_setup(char *__unused)
 {
-	cpu_idle_force_poll = 1;
+	atomic_set(&cpu_idle_force_poll, 1);
 
 	return 1;
 }
@@ -47,7 +53,7 @@ __setup("nohlt", cpu_idle_poll_setup);
 
 static int __init cpu_idle_nopoll_setup(char *__unused)
 {
-	cpu_idle_force_poll = 0;
+	atomic_set(&cpu_idle_force_poll, 0);
 
 	return 1;
 }
@@ -63,7 +69,7 @@ static noinline int __cpuidle cpu_idle_poll(void)
 
 	raw_local_irq_enable();
 	while (!tif_need_resched() &&
-	       (cpu_idle_force_poll || tick_check_broadcast_expired()))
+	       (cpu_idle_force_polling() || tick_check_broadcast_expired()))
 		cpu_relax();
 	raw_local_irq_disable();
 
@@ -83,7 +89,7 @@ void __weak arch_cpu_idle_exit(void) { }
 void __weak __noreturn arch_cpu_idle_dead(void) { while (1); }
 void __weak arch_cpu_idle(void)
 {
-	cpu_idle_force_poll = 1;
+	WRITE_ONCE(cpu_idle_force_poll_sticky, true);
 }
 
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE
@@ -348,7 +354,7 @@ static void do_idle(void)
 		 * broadcast device expired for us, we don't want to go deep
 		 * idle as we know that the IPI is going to arrive right away.
 		 */
-		if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
+		if (cpu_idle_force_polling() || tick_check_broadcast_expired()) {
 			tick_nohz_idle_restart_tick();
 			cpu_idle_poll();
 		} else {

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.55.0

