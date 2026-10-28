Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216711;
	b=zZxqGAW0cA/Lk6nvT1oEM3jpo2BtCnTaETMD7DMhAapO4wLXI0RwKy6KqDydsn3nsBcV
	 +QAPmAvvr7p7xo0h6TAlVcmrTwFSqpFNvb2AFSljiyCDjAZwyA7VMEcpiEV+W3blFVLWm
	 6PJ7OThwboh3nwUpHuLkCYHsw4X7GfYB5pgf0c2pooYNEgxO65IEQ+WwlP9jYA/e1ePmZ
	 V8EUvwrmV1ZzGcGzNPCF4Te/5NWrxLNqRU7D/coiIxPqnIg4z6o/URtQ4J92cjFlNgX1v
	 nE2CKK5bDUx0Fh14vdqr83AxxJU2Igi0VsOgCOHryQEJgyOhezgMoWWIBtfK47DEMtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216711;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=tek13fxJoZfjW2FSKbZ581rkWJyGs0cGl3iGenG4E+8=;
	b=BUj1kq6FQ7I+g/cCnxflDTT5CHhboa5nzODsWH4viov+iQXXhu/nVRjYr+UB819+RxO6
	 B/4acqgUdzRPl0j4T4FedmULWni5ZCeXYYL7IZGYL/dgBDjUO8fqidlZs8MvPJ4zd1pfk
	 zQdzvLaG8ch9NzwXvbhKY04SZ900LKRFMvE6adSfWELGq1WukYfiTqkPCpkT4pPSHGOGl
	 r3cIBUzSoHXAFfc0IPzw1CDQH5o1xbXpDHCOdsI9qHIdMbqDcK955RwU4USWqhP3vM22C
	 lAvLgPA0aHaM/wesWXmd21IkzyPr19CN7nxk8r2Q1FwguQ+KDokdWEIBO1qpwa5Uzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWZmpme9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D0606A31E;
	Wed, 28 Oct 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWZmpme9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16B01F01825;
	Wed, 28 Oct 2026 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793216710;
	bh=tek13fxJoZfjW2FSKbZ581rkWJyGs0cGl3iGenG4E+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gWZmpme9kTqFriY+QwQYxjoIGMEvLEbtMPuHJOgmvbAnl2lmsogNSuyup94RF9mpO
	 bMPJbhaN2SsW474C+0CuzgTp91ty1oxwwcQB8f/dMmtJrAm75zS4EZRTNyDtB3HaAT
	 nqsfwSchMCCy6EpHo1ujakNPIDfEJK2xpDPIUs/erB+6lqGAEHcupoqsJ98/Z1SMih
	 T6BLteWNVnfOxTprBxOoXHC91wTbdsoq5OgfSxVonAR4RCvt6DbveEc9XhFyA5RcxL
	 hbrhsmzuwjFWq+uJ2u7iWwG/TE8AdOBt47EodIyU2dX6i8i4X2Bu9l8wceNBg/VM14
	 qewTRxKYbJptw==
From: Thomas Gleixner <tglx@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
In-Reply-To: <874iec22sf.ffs@fw13>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13> <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local> <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13>
Date: Wed, 28 Oct 2026 20:45:07 +0100
Message-ID: <87y0bhy5h8.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 23 2026 at 11:18, Thomas Gleixner wrote:
syzbot reported a NULL pointer dereference in the CPU hotplug code. It
is caused by the lack of synchronizaton between CPU hotplug and MCE
sysfs controls, which allows the sysfs controls to reenable not only the
timer, but also the CMCI reporting on a CPU which is about to go out. A
similar issue exists in the CPU online path where the timer can be
enabled via sysfs control before the CPU runs the initialization of the
timer.

Prevent this by:

   1) Serializing the sysfs writes against CPU hotplug.

   2) Removing the redundant timer_setup() call in
      __mcheck_cpu_init_timer(), which can end up in initializing an
      active timer.

   3) Splitting the hotplug callbacks into starting/dying and
      online/offline parts.
   
      The starting/dying callbacks control the timer and the CMCI
      setup/teardown. The online/offline callbacks handle the device
      creation and teardown.

This ensures that the sysfs operations always see consistent CPU online
state and the timer and CMCI are shut down at the time when the CPU goes
offline and re-enabled when the CPU starts without interfering with the
sysfs operations.

Fixes: 9af43b54ab45 ("x86, mce: sysfs entries for new mce options")
Reported-by: syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com
---
V2: Use the seperate hotplug state as sashiko rightfully pointed out
    that taking the sysfs mutex in the hotplug callback can deadlock
    against the device creation/deletion.
---
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 50b1614968be..bcf4cba2b7ab 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2091,7 +2091,6 @@ static void __mcheck_cpu_init_timer(void)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
 	mce_start_timer(t);
 }
 
@@ -2532,9 +2531,9 @@ static ssize_t set_bank(struct device *s, struct device_attribute *attr,
 
 	b->ctl = new;
 
-	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
+	guard(mutex)(&mce_sysfs_mutex);
 	mce_restart();
-	mutex_unlock(&mce_sysfs_mutex);
 
 	return size;
 }
@@ -2548,7 +2547,9 @@ static ssize_t set_ignore_ce(struct device *s,
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
-	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
+	guard(mutex)(&mce_sysfs_mutex);
+
 	if (mca_cfg.ignore_ce ^ !!new) {
 		if (new) {
 			/* disable ce features */
@@ -2561,7 +2562,6 @@ static ssize_t set_ignore_ce(struct device *s,
 			on_each_cpu(mce_enable_ce, (void *)1, 1);
 		}
 	}
-	mutex_unlock(&mce_sysfs_mutex);
 
 	return size;
 }
@@ -2575,7 +2575,9 @@ static ssize_t set_cmci_disabled(struct device *s,
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
-	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
+	guard(mutex)(&mce_sysfs_mutex);
+
 	if (mca_cfg.cmci_disabled ^ !!new) {
 		if (new) {
 			/* disable cmci */
@@ -2587,7 +2589,6 @@ static ssize_t set_cmci_disabled(struct device *s,
 			on_each_cpu(mce_enable_ce, NULL, 1);
 		}
 	}
-	mutex_unlock(&mce_sysfs_mutex);
 
 	return size;
 }
@@ -2602,10 +2603,9 @@ static ssize_t store_int_with_restart(struct device *s,
 	if (check_interval == old_check_interval)
 		return ret;
 
-	mutex_lock(&mce_sysfs_mutex);
+	guard(cpus_read_lock)();
+	guard(mutex)(&mce_sysfs_mutex);
 	mce_restart();
-	mutex_unlock(&mce_sysfs_mutex);
-
 	return ret;
 }
 
@@ -2755,23 +2755,33 @@ static int mce_cpu_dead(unsigned int cpu)
 	return 0;
 }
 
-static int mce_cpu_online(unsigned int cpu)
+static int mce_cpu_starting(unsigned int cpu)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	mce_device_create(cpu);
-	mce_threshold_create_device(cpu);
 	mce_reenable_cpu();
 	mce_start_timer(t);
 	return 0;
 }
 
-static int mce_cpu_pre_down(unsigned int cpu)
+static int mce_cpu_dying(unsigned int cpu)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
 	mce_disable_cpu();
 	timer_delete_sync(t);
+	return 0;
+}
+
+static int mce_cpu_online(unsigned int cpu)
+{
+	mce_device_create(cpu);
+	mce_threshold_create_device(cpu);
+	return 0;
+}
+
+static int mce_cpu_pre_down(unsigned int cpu)
+{
 	mce_threshold_remove_device(cpu);
 	mce_device_remove(cpu);
 	return 0;
@@ -2834,6 +2844,14 @@ static __init int mcheck_init_device(void)
 				mce_cpu_dead);
 	if (err)
 		goto err_out_mem;
+	/*
+	 * Invokes mce_cpu_starting() on all CPUs which are online when
+	 * the state is installed.
+	 */
+	err = cpuhp_setup_state(CPUHP_AP_X86_MCE_STARTING, "x86/mce:starting",
+				mce_cpu_starting, mce_cpu_dying);
+	if (err < 0)
+		goto err_out_starting;
 
 	/*
 	 * Invokes mce_cpu_online() on all CPUs which are online when
@@ -2849,6 +2867,9 @@ static __init int mcheck_init_device(void)
 	return 0;
 
 err_out_online:
+	cpuhp_remove_state(CPUHP_AP_X86_MCE_STARTING);
+
+err_out_starting:
 	cpuhp_remove_state(CPUHP_X86_MCE_DEAD);
 
 err_out_mem:
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 1b6dba159bb2..6503cb8e7f0e 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -185,6 +185,7 @@ enum cpuhp_state {
 	CPUHP_AP_HRTIMERS_DYING,
 	CPUHP_AP_TICK_DYING,
 	CPUHP_AP_X86_TBOOT_DYING,
+	CPUHP_AP_X86_MCE_STARTING,
 	CPUHP_AP_ARM_CACHE_B15_RAC_DYING,
 	CPUHP_AP_ONLINE,
 	CPUHP_TEARDOWN_CPU,
