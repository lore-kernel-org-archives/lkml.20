Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76EB36197F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695330; cv=none; b=XeF8TVO3Rm/l9nQPyTuN5tWdMumkyA42gTy2tFENDRzWyqfLGJj6sitYL43QwcYDvlr2xeSRfRBNYFpVc7LRx2k2z9D83jA0UDRZldCUjvXUEFpsx8YU3aenBzRb3e5ZIIgj0ZjeQQcXFs+klfPDXPbbpOQ6XUxUSYz2JcTl5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695330; c=relaxed/simple;
	bh=hONuqa0AzDZHbSBJrPMYM1RN7mr5bXzjNNqA+a5bg1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dmLU1fSrwY42YKTvQ0Dbri4y8gdSjFo7VwMX/CFjynDTp2XxHHDw9qL+oPM5rUGv70uxXWIBwN6d/OtDt+PP/Iosod75cP7WB4aPTziHwBTGVpdaSHmcZE2e/BSVwaiq609L+Bxm7g0AufeA2QDK2uaiP+lpNDibwi3ecBh+97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnPfE_laxqsfxECA--.12268S2;
	Fri, 18 Sep 2026 09:34:55 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: [PATCH] sched/mmcid: Bound the CID allocation busy wait
Date: Fri, 18 Sep 2026 01:34:54 +0000
Message-Id: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnPfE_laxqsfxECA--.12268S2
X-Coremail-Antispam: 1UD129KBjvJXoWfJF4UtrWrZw48KrW5uw1fXrb_yoWkKw4fpr
	yjgr4DGr40q3WvyayUA3WkJry5Gr4fAF47J3yxGr1fJa4Ykw1UXrn2gr42vF1UKr1kZF47
	tr1UXwsakF1DJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F
	4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS
	5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1-txDUUUUU==
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

mm_get_cid() spins forever when no CID is available. All callers hold
either a runqueue lock or mm::mm_cid::lock with interrupts disabled,
so the loop relies on another CPU releasing a CID within a short
window.

That assumption fails in two ways:

 1) In steady state per task mode CIDs are owned by their tasks for
    their whole lifetime and are only released on task exit or
    execve(). When the CID bitmap is exhausted, the spinning task
    blocks everything on its CPU with interrupts disabled, which
    escalates to RCU stalls and can lock up the machine when e.g. a
    text_poke IPI targets the spinning CPU.

 2) During a mode transition the fixup thread has to acquire the
    runqueue lock of the spinning task's CPU to release per CPU owned
    CIDs. That lock is held by the spinning task, so neither context
    can make progress - a livelock.

Bound the retry loop and return MM_CID_UNSET on exhaustion. All call
sites cope with that:

 - The schedule in paths (mm_cid_from_task()/mm_cid_from_cpu()) set
   both the per CPU and the task storage to MM_CID_UNSET and retry on
   the next schedule in. The plain per CPU value left behind by
   mm_drop_cid_on_cpu() has no owner in the bitmap anymore, so the
   task must not adopt it as its own CID. A task running with an
   unset CID is an already established state for lazily assigned
   tasks (see mm_cid_fixup_cpus_to_tasks()).

 - sched_mm_cid_fork() stores the unset CID in the task and the per
   CPU storage, which the schedule in path handles the same way.

This also prevents an exhausted allocation from feeding MM_CID_UNSET
into the transition bit handling, which would later hand MM_CID_UNSET
as bit number to clear_bit().

Fixes: 9a723ed7facff ("sched/mmcid: Provide new scheduler CID mechanism")
Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
---
 kernel/sched/sched.h | 51 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf86..6de25f546e3a6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3964,11 +3964,27 @@ static inline unsigned int __mm_get_cid(struct mm_struct *mm, unsigned int max_c
 	return cid;
 }
 
+/*
+ * The retry loop covers the transient contention window where a CID is
+ * concurrently released. It must be bound because all callers hold a
+ * runqueue lock or mm::mm_cid::lock with interrupts disabled. An
+ * unbounded wait livelocks with the context which is expected to
+ * release a CID: in steady state per task mode CIDs are owned by their
+ * tasks until exit and during a mode transition the fixup thread needs
+ * the runqueue lock which the spinning task holds.
+ *
+ * On exhaustion MM_CID_UNSET is returned, which all callers handle by
+ * letting the task run without a CID. It retries on the next schedule
+ * in or fork.
+ */
+#define MM_CID_GET_RETRIES	32
+
 static inline unsigned int mm_get_cid(struct mm_struct *mm)
 {
 	unsigned int cid = __mm_get_cid(mm, READ_ONCE(mm->mm_cid.max_cids));
+	unsigned int tries = MM_CID_GET_RETRIES;
 
-	while (cid == MM_CID_UNSET) {
+	while (cid == MM_CID_UNSET && tries--) {
 		cpu_relax();
 		cid = __mm_get_cid(mm, num_possible_cpus());
 	}
@@ -4030,9 +4046,22 @@ static __always_inline void mm_cid_from_cpu(struct task_struct *t, unsigned int
 			else
 				cpu_cid = cid_to_cpu_cid(tcid);
 		}
-		/* Still nothing, allocate a new one */
-		if (!cid_on_cpu(cpu_cid))
-			cpu_cid = cid_to_cpu_cid(mm_get_cid(mm));
+		/* Still nothing, allocate a new one. On pool exhaustion
+		 * set both storages to MM_CID_UNSET: the plain per CPU
+		 * value left by mm_drop_cid_on_cpu() no longer has an
+		 * owner in the bitmap and must not be adopted by the
+		 * task. It will be retried on the next schedule in.
+		 */
+		if (!cid_on_cpu(cpu_cid)) {
+			unsigned int ncid = mm_get_cid(mm);
+
+			if (ncid == MM_CID_UNSET) {
+				mm_cid_update_pcpu_cid(mm, MM_CID_UNSET);
+				mm_cid_update_task_cid(t, MM_CID_UNSET);
+				return;
+			}
+			cpu_cid = cid_to_cpu_cid(ncid);
+		}
 
 		/* Handle the transition mode flag if required */
 		if (mode & MM_CID_TRANSIT)
@@ -4065,9 +4094,19 @@ static __always_inline void mm_cid_from_task(struct task_struct *t, unsigned int
 			else
 				tcid = cpu_cid_to_cid(cpu_cid);
 		}
-		/* Still nothing, allocate a new one */
-		if (!cid_on_task(tcid))
+		/* Still nothing, allocate a new one. On pool exhaustion
+		 * keep the CID unset. It will be retried on the next
+		 * schedule in.
+		 */
+		if (!cid_on_task(tcid)) {
 			tcid = mm_get_cid(mm);
+
+			if (tcid == MM_CID_UNSET) {
+				mm_cid_update_pcpu_cid(mm, tcid);
+				mm_cid_update_task_cid(t, tcid);
+				return;
+			}
+		}
 		/* Set the transition mode flag if required */
 		tcid |= mode & MM_CID_TRANSIT;
 	}
-- 
2.34.1


-- 
Below is the crash report:
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	0-...!: (1 GPs behind) idle=05ac/1/0x4000000000000000 softirq=640934/640935 fqs=18
rcu: 	(detected by 1, t=10005 jiffies, g=269757, q=11838 ncpus=2)
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 32768 PID: 57790 Comm: syz.4.7239 Tainted: G        W    L      7.1.13 #1 PREEMPT(full) 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
RIP: 0010:num_possible_cpus home/zzzrrll/tmp/kf_src/linux-7.1.13/include/linux/cpumask.h:1222 [inline]
RIP: 0010:mm_get_cid home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/sched.h:3880 [inline]
RIP: 0010:sched_mm_cid_fork+0x367/0x5c0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/core.c:10970
Code: 00 80 39 cd 76 da 89 c8 f0 48 0f ab 03 73 05 b9 00 00 00 80 89 c8 eb c8 41 89 87 6c 0b 00 00 eb 4b 3d 00 00 00 80 75 31 f3 90 <8b> 2d bb 05 8d 05 48 89 df 48 89 ee e8 08 e3 5f 01 48 89 c1 b8 00
RSP: 0018:ffffc9000e44fd88 EFLAGS: 00000046
RAX: 0000000080000000 RBX: ffff8880110b3ed0 RCX: 0000000000000002
RDX: 0000000000000001 RSI: 0000000000000002 RDI: ffff8880110b3ed0
RBP: 0000000000000002 R08: ffff8880f407a000 R09: 0000607e4b7877c0
R10: ffffc9000e44fc24 R11: ffffffff81aecab0 R12: ffff8880110b3910
R13: ffff8880110b3800 R14: ffffffff8999a020 R15: ffff888101201900
FS:  00007f4a95db7640(0000) GS:ffff8880f407a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4a95d74fe8 CR3: 000000001d284000 CR4: 0000000000752ef0
PKRU: 80000000
Call Trace:
 <TASK>
 bprm_execve+0x51d/0x7a0 home/zzzrrll/tmp/kf_src/linux-7.1.13/fs/exec.c:1775
 do_execveat_common+0x884/0x900 home/zzzrrll/tmp/kf_src/linux-7.1.13/fs/exec.c:1850
 __do_sys_execveat home/zzzrrll/tmp/kf_src/linux-7.1.13/fs/exec.c:1945 [inline]
 __se_sys_execveat home/zzzrrll/tmp/kf_src/linux-7.1.13/fs/exec.c:1938 [inline]
 __x64_sys_execveat+0x48/0x70 home/zzzrrll/tmp/kf_src/linux-7.1.13/fs/exec.c:1938
 do_syscall_x64 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x187/0x520 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x590d6d
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4a95db6fd8 EFLAGS: 00000216 ORIG_RAX: 0000000000000142
RAX: ffffffffffffffda RBX: 0000000000600b67 RCX: 0000000000590d6d
RDX: 0000200000000280 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007f4a95db7010 R08: 0000000000000000 R09: 0000000000000000
R10: 00002000000002c0 R11: 0000000000000216 R12: 00007f4a95db7640
R13: 000000000000004d R14: 0000000000528d40 R15: 00007f4a95d97000
 </TASK>
rcu: rcu_preempt kthread starved for 9915 jiffies! g269757 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:14136 pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/core.c:5395 [inline]
 __schedule+0x632/0x17e0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/core.c:7196
 __schedule_loop home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/core.c:7273 [inline]
 schedule+0x5b/0xa0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/sched/core.c:7288
 schedule_timeout+0xce/0x150 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x17f/0x5d0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/rcu/tree.c:2095
 rcu_gp_kthread+0x1c/0x110 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/rcu/tree.c:2297
 kthread+0x18d/0x1e0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/kthread.c:436
 ret_from_fork+0x191/0x450 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
CPU: 1 UID: 0 PID: 10504 Comm: kworker/1:4 Tainted: G        W    L      7.1.13 #1 PREEMPT(full) 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Workqueue: events jump_label_update_timeout
RIP: 0010:csd_lock_wait home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/smp.c:355 [inline]
RIP: 0010:smp_call_function_many_cond+0x63e/0x910 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/smp.c:912
Code: f8 48 8b 1c c5 50 47 df 86 44 8b 64 2b 08 44 89 e6 83 e6 01 31 ff e8 41 5d 05 00 41 83 e4 01 75 07 e8 f6 58 05 00 eb 18 f3 90 <f7> 44 1d 08 01 00 00 00 74 07 e8 e3 58 05 00 eb ed e8 dc 58 05 00
RSP: 0018:ffffc9000e06fca8 EFLAGS: 00000293
RAX: ffffffff81613f2d RBX: ffff8880f407a000 RCX: ffff8881078d8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffff899b86e0 R08: ffffffff81613f0f R09: 0000000000000001
R10: 0000000000000002 R11: ffffffff813a8df0 R12: 0000000000000001
R13: ffff88813de2d580 R14: 00000000fffffff8 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881b447a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000007066000 CR4: 0000000000752ef0
PKRU: 55555554
Call Trace:
 <TASK>
 on_each_cpu_cond_mask+0x3c/0x90 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/smp.c:1077
 on_each_cpu home/zzzrrll/tmp/kf_src/linux-7.1.13/include/linux/smp.h:72 [inline]
 smp_text_poke_sync_each_cpu home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/kernel/alternative.c:2773 [inline]
 smp_text_poke_batch_finish+0x163/0x590 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/kernel/alternative.c:2983
 arch_jump_label_transform_apply+0x1a/0x30 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/kernel/jump_label.c:146
 __static_key_slow_dec_cpuslocked+0xea/0x150 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/jump_label.c:315
 __static_key_slow_dec home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/jump_label.c:321 [inline]
 jump_label_update_timeout+0x1e/0x30 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/jump_label.c:329
 process_one_work home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0x2f9/0x690 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/workqueue.c:3397
 worker_thread+0x31a/0x480 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/workqueue.c:3478
 kthread+0x18d/0x1e0 home/zzzrrll/tmp/kf_src/linux-7.1.13/kernel/kthread.c:436
 ret_from_fork+0x191/0x450 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 home/zzzrrll/tmp/kf_src/linux-7.1.13/arch/x86/entry/entry_64.S:245
 </TASK>
---

