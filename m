Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2E3E9C2F;
	Wed,  2 Sep 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337990; cv=none; b=iwweW+GOoVL9ViCrGda1VSvr3Tf4lWzq33bSZkauOqKtn1fVkVE+O5XRj9uj9ME8QpDPv6n1dUz9YKiWml1Vbp6t0c7SZtr0hFdbgskzgT/8+o/9Cr6CYbaFEE3xajkf/puVShErkOtxhR0KUpJIKDX/NN4DCzOMy/xnVgvYt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337990; c=relaxed/simple;
	bh=Wf1kZhjmjzYL3GYDIGm8PkSm56+hYMVtzw+1fDqW27o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=n3RK73Y3+3qqTNWu7oi0uHQeEhpm6sidgrzJVeFE3mbnsaKvw+tI+LL2VTcm58C+r+koF7RWDCkQ05VGwGLOBB6gIjDxi+26Vzfeaw8yHUJveeVHML2SPn3DsCks7k6jR7JhawXKOFzl+BK1XGC9IpEreRgLtF0Ui7Q7KNKg9tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bjx6rOMu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zBeYCSY8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bjx6rOMu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zBeYCSY8"
Date: Wed, 02 Sep 2026 08:33:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788337985;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXhHnapD0Dn91khtat/91g7n3KJW8Wl/WYTN08dyBNU=;
	b=bjx6rOMu234YWMiKbj3/J4148mMSaGpJZGWCa0aURV40Yrko0tUB9gp96PlCG0jQiKsXkJ
	v5i+jjnzIYAEsaP0rjD5PQChx/iEZc2Y83GLqccNoWYbEsP0RJ7+Wzm6tZh+YMEBiFpylP
	ms+wT6p6b+TH1/DPLrfxtZNN0Dgb6ZHJD1OFQCsT99HvNW8zh7Wv8BvAiDSmNnnCGARnNa
	Q2mkgEtiX1kyTV/v+v3xjbpfuwlBJuvW+zvmj9LS/e0y97NJKSdOPAFu2xr2UEdM6KvvVj
	H0BPLTJHqybKt5mTrvOvRY5OI5+ge8JJURI5lqLNx1+J9mYzO0V6T8QqGfPAJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788337985;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXhHnapD0Dn91khtat/91g7n3KJW8Wl/WYTN08dyBNU=;
	b=zBeYCSY8Vbwkj4hl5nWLuYRWaMpE/Oaq0MdOL0ysDWYx1ybyTXm5T+UQPhwpdyUxARCT22
	i1z392LDm7SsEeBQ==
From: "tip-bot2 for Hongyan Xia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched: Convert paravirt_steal to new static key APIs
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819081207.12150-1-hongyan.xia@transsion.com>
References: <20260819081207.12150-1-hongyan.xia@transsion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833798427.3717435.12664289845877600702.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     a5576ebce9201e2abc820348a494e666de8efe64
Gitweb:        https://git.kernel.org/tip/a5576ebce9201e2abc820348a494e666de8=
efe64
Author:        Hongyan Xia <hongyan.xia@transsion.com>
AuthorDate:    Wed, 19 Aug 2026 08:12:09=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 10:28:24 +02:00

sched: Convert paravirt_steal to new static key APIs

paravirt_steal_rq_enabled and paravirt_steal_enabled use raw static_key
APIs which are now deprecated. Use the new API instead.

No functional change.

Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Juergen Gross <jgross@suse.com>
Link: https://patch.msgid.link/20260819081207.12150-1-hongyan.xia@transsion.c=
om
---
 arch/arm64/kernel/paravirt.c           | 4 ++--
 arch/loongarch/kernel/paravirt.c       | 4 ++--
 arch/powerpc/platforms/pseries/setup.c | 4 ++--
 arch/riscv/kernel/paravirt.c           | 4 ++--
 arch/x86/kernel/cpu/vmware.c           | 4 ++--
 arch/x86/kernel/kvm.c                  | 4 ++--
 drivers/xen/time.c                     | 4 ++--
 include/linux/sched/cputime.h          | 6 +++---
 kernel/sched/core.c                    | 4 ++--
 kernel/sched/cputime.c                 | 4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 572efb9..30bf61d 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -157,9 +157,9 @@ int __init pv_time_init(void)
=20
 	static_call_update(pv_steal_clock, para_steal_clock);
=20
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
=20
 	pr_info("using stolen time PV\n");
=20
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravir=
t.c
index 10821cc..e8965a3 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -308,10 +308,10 @@ int __init pv_time_init(void)
=20
 	static_call_update(pv_steal_clock, paravt_steal_clock);
=20
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 #endif
=20
 	if (static_key_enabled(&virt_preempt_key))
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/=
pseries/setup.c
index f29e754..c181df4 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -876,9 +876,9 @@ static void __init pSeries_setup_arch(void)
 			static_branch_enable(&shared_processor);
 			pv_spinlocks_init();
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-			static_key_slow_inc(&paravirt_steal_enabled);
+			static_branch_inc(&paravirt_steal_enabled);
 			if (steal_acc)
-				static_key_slow_inc(&paravirt_steal_rq_enabled);
+				static_branch_inc(&paravirt_steal_rq_enabled);
 #endif
 		}
=20
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 5f56be7..9c13a6f 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -116,9 +116,9 @@ int __init pv_time_init(void)
=20
 	static_call_update(pv_steal_clock, pv_time_steal_clock);
=20
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
=20
 	pr_info("Computing paravirt steal-time\n");
=20
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b7357..f7ab9e7 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -328,9 +328,9 @@ static int vmware_cpu_down_prepare(unsigned int cpu)
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
-		static_key_slow_inc(&paravirt_steal_enabled);
+		static_branch_inc(&paravirt_steal_enabled);
 		if (steal_acc)
-			static_key_slow_inc(&paravirt_steal_rq_enabled);
+			static_branch_inc(&paravirt_steal_rq_enabled);
 	}
=20
 	return 0;
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 6b0a586..2ce01fd 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1054,9 +1054,9 @@ const __initconst struct hypervisor_x86 x86_hyper_kvm =
=3D {
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
-		static_key_slow_inc(&paravirt_steal_enabled);
+		static_branch_inc(&paravirt_steal_enabled);
 		if (steal_acc)
-			static_key_slow_inc(&paravirt_steal_rq_enabled);
+			static_branch_inc(&paravirt_steal_rq_enabled);
 	}
=20
 	return 0;
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index a2be0a4..a02d48a 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -169,7 +169,7 @@ void __init xen_time_setup_guest(void)
=20
 	static_call_update(pv_steal_clock, xen_steal_clock);
=20
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (xen_runstate_remote)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 }
diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
index e90efaf..6941264 100644
--- a/include/linux/sched/cputime.h
+++ b/include/linux/sched/cputime.h
@@ -182,9 +182,9 @@ extern unsigned long long
 task_sched_runtime(struct task_struct *task);
=20
 #ifdef CONFIG_PARAVIRT
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
+#include <linux/jump_label.h>
+DECLARE_STATIC_KEY_FALSE(paravirt_steal_enabled);
+DECLARE_STATIC_KEY_FALSE(paravirt_steal_rq_enabled);
=20
 #ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
 u64 dummy_steal_clock(int cpu);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c9dd6f4..4e97766 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -805,7 +805,7 @@ struct rq *_task_rq_lock(struct task_struct *p, struct rq=
_flags *rf)
=20
 /* Use CONFIG_PARAVIRT as this will avoid more #ifdef in arch code. */
 #ifdef CONFIG_PARAVIRT
-struct static_key paravirt_steal_rq_enabled;
+DEFINE_STATIC_KEY_FALSE(paravirt_steal_rq_enabled);
 #endif
=20
 static void update_rq_clock_task(struct rq *rq, s64 delta)
@@ -844,7 +844,7 @@ static void update_rq_clock_task(struct rq *rq, s64 delta)
 	}
 #endif
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-	if (static_key_false((&paravirt_steal_rq_enabled))) {
+	if (static_branch_unlikely(&paravirt_steal_rq_enabled)) {
 		u64 prev_steal;
=20
 		steal =3D prev_steal =3D paravirt_steal_clock(cpu_of(rq));
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa..f16970c 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -255,7 +255,7 @@ void __account_forceidle_time(struct task_struct *p, u64 =
delta)
  * occasion account more time than the calling functions think elapsed.
  */
 #ifdef CONFIG_PARAVIRT
-struct static_key paravirt_steal_enabled;
+DEFINE_STATIC_KEY_FALSE(paravirt_steal_enabled);
=20
 #ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
 static u64 native_steal_clock(int cpu)
@@ -270,7 +270,7 @@ DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 static __always_inline u64 steal_account_process_time(u64 maxtime)
 {
 #ifdef CONFIG_PARAVIRT
-	if (static_key_false(&paravirt_steal_enabled)) {
+	if (static_branch_unlikely(&paravirt_steal_enabled)) {
 		u64 steal;
=20
 		steal =3D paravirt_steal_clock(smp_processor_id());
