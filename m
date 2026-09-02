Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99A396B84;
	Wed,  2 Sep 2026 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335690; cv=none; b=hbydO8reYiRgoENcLtNvvylg/DtTJvAtsIAYeHl2KTkbgV3coGiuNxbHJXyzK08YE0hHNJBsL4bYsSJKg4w5KV662/uB3etwgY5aG0v+pr1XslW4zBnPFVRl9Qi1rAwbfKCROjObGRaxlY2Vts0dLdth5knfoN5whnnhXwqyXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335690; c=relaxed/simple;
	bh=Xchs0jxvAuZuI5al5BRjEfE8F3ak6FH892LC4Q5I7U4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=f1XT2MJSab9C7oWfTODKlNPl5qAyJ8VSo66eRWh/FXlqZZfr6V/j+zC6jwqNz7RsanuPDwnyjprDSdruX5CufUqDmYGs61OxW/GstEQ+njnt5xTRxBLafy8M/OhuUqOMHk4uKO096aMIf8LD8miK04EVzeM1Fy3HzVQy2sS7rdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zC7inQ5u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nPSwbKrf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zC7inQ5u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nPSwbKrf"
Date: Wed, 02 Sep 2026 07:54:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335686;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZTivq+Jt/F8MZb9eiqbZbvU05UyXsP7ooeeKcCKqD8=;
	b=zC7inQ5utiBZ7mw8HU1RHWsIGmK4T3tWa+6NSwPFhfsfqmD035NjPoQZ8q8WvPkkD0UUBL
	CZWl+B94imA+iWmZx4jXRBDlm403x7+wY5cmN1n4e1cUPJIQpqNBRPGtYxKM6L3gh2XPeL
	OhlWpRASe6AxEQdbJtOsKf+9fxRRJu91725ca4NYfFc9R3xZM3SiCVB1kU1ZQ3iBi7eYJK
	Q611F9YXQOrs4bFyU44btyelUwZy8zMuZcbidX1R1r6XoWBjMLacl00gik8PGC4MsqBS3G
	lCyzgcEgpv1AOmyT9czkbtHdSFFW75xRZ6krGxl4hizPk0jcyPb3nTQr28VLQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335686;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZTivq+Jt/F8MZb9eiqbZbvU05UyXsP7ooeeKcCKqD8=;
	b=nPSwbKrfHDCewicLJzqg+K1PkseLzALk+W1IpEwHNlmjmB9hnNrlQulGR2Q16zON3ULBxF
	n3n0ZvM/LihR6jDA==
From: "tip-bot2 for Hongyan Xia =0A=" <tip-bot2@linutronix.de>
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
Message-ID: <178833568513.3717435.14212326486626134934.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     087b40fe5934e4b8aa80b29b3debbd6542756ffd
Gitweb:        https://git.kernel.org/tip/087b40fe5934e4b8aa80b29b3debbd65427=
56ffd
Author:        Hongyan Xia =3D0A=3D <hongyan.xia@transsion.com>
AuthorDate:    Wed, 19 Aug 2026 08:12:09=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:24 +02:00

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
