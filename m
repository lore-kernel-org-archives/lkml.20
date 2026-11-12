Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471525;
	b=DOxaaOMl2WT33lVOFAKD7H85jrUqp5csezuH9wnZj6WRtQjYdfI3xvqM7vCgXvm0cGL5
	 QbipVm1oK7s/za5+9pQEwkekMQgw8b96fS/EJCRM4f5sXP9wmR2XDD0hPsTyXN2HaP8A/
	 q8JatnttHuSgDdYtgK/JQo+/3YMmZqRDtYT7c3+Z2kgDPpX+f9/s8D+UMtdG6aBrm3JZj
	 NR7MfUUaBpgbgUPFpsHfnuCQymrqHxsEA4oB34v6rqz3C4IYbSGaJULJwJckurgOL1/Xw
	 p1tc82w7CAZ8akYfBACjdoZxUxJ4lvZXL1DHNWvwHZe9temxTeILItzhGQt9I0wHDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471525;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Cc:From:Date:
	 Mime-Version:Subject:Message-Id:X-Lms-Return-Path:Content-Type:To:
	 Content-Transfer-Encoding:X-Mailer;
	bh=5GyUoUljr+/sK8Eg2JDeZkzMLVwSUUjrsXIs8GIjUTg=;
	b=SV9M26UxiDDozYXRFh3aUlgi9khcNP/zF/Hu4oWDVMZZB751YBuQtv5t2JZVXjhiIeGE
	 SMlfF73WKueH29F4Pa724RWPDSogEs9SQObvbpJzQ7/gYJU05GfyQQwOlmXEYGAzI7C6S
	 tf1iAaeW9FZUNpu+1p8Ilf/nYIvHWkzaOMxS8ZTFXwqIBjuAJlSLDmKWUwy2J1gR0nF6Y
	 BsiPEIcneY35kOAO777rlgq18tYjjqowOeNSN6TD8L6JSGoLDma2ApojgH5K6X3HlIfbq
	 Ddq/OEJsVFc0a0tV/8T3J6GRUaPFj3lo6u8A+zEiAmqmrIE6jeKWWhP7jI/CBySC7Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GyYcxJ14;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GyYcxJ14
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794471512; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=5GyUoUljr+/sK8Eg2JDeZkzMLVwSUUjrsXIs8GIjUTg=;
 b=GyYcxJ14q/UiT5t1O8wuo6uFZR5XqT8S/kPLRGeAnz7rkAs3PHqNEGc+MOpPNjsnossbUj
 xq19/HLoWVrz8bLOhJFih1DHJ+5YleqEzfH0hr6vAbD4qMHOaCbQYL9EgFW6SMXnatf9tS
 MPq1/X4+4bvE6HUDgfiVBFv8B/6LSJiXA/deBlz70cGe0zko1nmaH9V6iP0UtuDMhdzvAN
 xTZ7Hc3n6+vgBThPgsC45tXbnG6L8de1l8DD+jhTS8RJ6+ct2UMI7oEHFf8tmDQnrk2Dfm
 LtXaXjH0noQPGpOOEuuCuo8ZZL/wsjhCSmYja/EloIw2RumDxMl6h/WMJMr93w==
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Thu, 12 Nov 2026 16:18:08 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: [PATCH] x86/debug: Avoid exc_debug_kernel() warning after user data watchpoints
Message-Id: <20261112081808.62170-1-zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26af57656+bf9135+vger.kernel.org+zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <x86@kernel.org>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.39.5 (Apple Git-154)

A user-address data watchpoint can fire while the kernel accesses user
memory. If DR6 also reports DR_STEP, hw_breakpoint_handler() consumes
the watchpoint but passes DR_STEP to exc_debug_kernel(). There,
WARN_ON_ONCE(dr6 & DR_STEP) triggers even though the interrupted
frame has TF clear.

On the reproducing QEMU/KVM host, an earlier single-step event left BS
in KVM's saved guest DR6; a later data-watchpoint exception appeared
to the guest as B0|BS. Consume the residual DR_STEP only after the
watchpoint has been handled, no breakpoint bits remain, and TF, ptrace
and KGDB stepping are inactive.

Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---

Testing:
With panic_on_warn=1, the baseline warned in all three QEMU/KVM trials;
the patched kernel showed no target warning in three trials. A focused
KGDB single-step/watchpoint test preserved DR_STEP when TF was set.

 arch/x86/kernel/hw_breakpoint.c | 41 ++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index f846c15f21ca1..0b6131aa05969 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm_types.h>
 #include <linux/export.h>
+#include <linux/kgdb.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 
@@ -49,6 +50,19 @@ static DEFINE_PER_CPU(unsigned long, cpu_debugreg[HBP_NUM]);
  */
 static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM]);
 
+static inline bool kgdb_single_step_active(void)
+{
+#ifdef CONFIG_KGDB
+	return atomic_read(&kgdb_cpu_doing_single_step) != -1;
+#else
+	return false;
+#endif
+}
+
+static inline bool hw_breakpoint_is_user_data(struct perf_event *bp)
+{
+	return !arch_check_bp_in_kernelspace(counter_arch_bp(bp));
+}
 
 static inline unsigned long
 __encode_dr7(int drnum, unsigned int len, unsigned int type)
@@ -514,7 +528,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 	struct perf_event *bp;
 	unsigned long *dr6_p;
 	unsigned long dr6;
-	bool bpx;
+	bool bpx, handled_kernel_user_data_bp = false;
 
 	/* The DR6 value is pointed by args->err */
 	dr6_p = (unsigned long *)ERR_PTR(args->err);
@@ -561,6 +575,8 @@ static int hw_breakpoint_handler(struct die_args *args)
 		 */
 		if (bpx)
 			args->regs->flags |= X86_EFLAGS_RF;
+		else if (!user_mode(args->regs) && hw_breakpoint_is_user_data(bp))
+			handled_kernel_user_data_bp = true;
 	}
 
 	/*
@@ -568,6 +584,29 @@ static int hw_breakpoint_handler(struct die_args *args)
 	 * breakpoints (to generate signals) and b) when the system has
 	 * taken exception due to multiple causes
 	 */
+	if ((current->thread.virtual_dr6 & DR_TRAP_BITS) ||
+	    (dr6 & ~DR_TRAP_BITS)) {
+		/*
+		 * User-space data breakpoints are traps, and the CPU can report
+		 * them together with DR_STEP while the kernel is accessing user
+		 * memory. Once the user data watchpoint has been consumed above,
+		 * there is no kernel TF state to report if the interrupted frame
+		 * did not have TF set and neither ptrace nor KGDB requested a
+		 * single-step. Clear that residual DR_STEP before deciding
+		 * whether the generic debug path still needs to see it.
+		 */
+		if (handled_kernel_user_data_bp &&
+		    !(*dr6_p & DR_TRAP_BITS) &&
+		    (*dr6_p & DR_STEP) &&
+		    !(args->regs->flags & X86_EFLAGS_TF) &&
+		    !test_thread_flag(TIF_SINGLESTEP) &&
+		    !test_thread_flag(TIF_BLOCKSTEP) &&
+		    !kgdb_single_step_active())
+			*dr6_p &= ~DR_STEP;
+
+		dr6 = *dr6_p;
+	}
+
 	if ((current->thread.virtual_dr6 & DR_TRAP_BITS) ||
 	    (dr6 & (~DR_TRAP_BITS)))
 		rc = NOTIFY_DONE;

base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
-- 
2.39.5 (Apple Git-154)
