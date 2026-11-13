Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580044;
	b=qnIYcoffncz/cTakCYuLmgwjVwFO4uHFWOSEgsHf6pJ2qhWPNkuwiKBd82OSLtZgCVXm
	 4PAnOsuNS0Ctw/IV+7vU5CkHam5rZqjXIqQ3yTHi8SGjkI7po6EvKt8cjIeSK3ri0HLS3
	 JRB9zohiGAfy/KdZvoG2KexY8bxCxFkwAul/VA1SKhgBpVu+pngGPGHfTzDSnlPyJ5Eyy
	 aRTRhLkyjeBLIoss0TepVrOkrjDRRzKdy857z/yGPMZOENT3GDsFXaPLwqij/rgpd+QDj
	 Rq5WGW96CrE4GE9ezMONoQWtVu0RiQT/k4U4OWnmbPRCN5d4fHEmkJ637qUQ9tdWuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580044;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=V0GkDZJ9WagRHOVr0qBoHtl+w2PkPL3ZPFIC2izcDKQ=;
	b=EDaxfQRefMP1qr5xJJG4Yt/NStMUQy3S0l7XTIea/MvGAcde4K5VF1hzkJhMiIlTa60u
	 HHtZuoI23T7FwQ6tY6cBwnD1SCq0CXvPJWSs2IODWbe0Demt0w6+5BOHuo0k+dfEEtHMG
	 KZ4n6FIowYIEyIb9wWQv2ucXjDma4CxnrFpPqzipArf8lILSgEWiD9pehE+Ce/ZNDf74U
	 w8F9l7WhPPUIaPnUoYgYu7D3hl0RNvMT07bEHmKOz9Z9zghGF1HrzjZz7mdcknHff1z9e
	 IM2WLOkDaTgIvh8/Pr8OnCmw2mzgPq/JRhFMZ8/Cjb52PK7Fxf16882f4oUcXW2315Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bT7WbSA/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9067E606A323;
	Fri, 13 Nov 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bT7WbSA/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885FB1F000C4;
	Fri, 13 Nov 2026 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580044;
	bh=V0GkDZJ9WagRHOVr0qBoHtl+w2PkPL3ZPFIC2izcDKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bT7WbSA/umsDZfx2FRvT6CH5Bu8Szs0PSsjId5PDN6B4Cc2xeDsFfpA1+x7hB/nDI
	 lgKbnOYFagHTDe+M+cS2eD1bNng8EN81+ouHkp7aqrgTKlhdpwgtdpBdDOjGfHv1kb
	 DUNnXDPwYHofAYU6l7TGQ5CMBa36lFDR4nDt92x5FPSXRnM+usGTdGZ7e/RNUX1dM1
	 l7U+RhlFezTxG1gDpNTGIoAjxt8NndCx9OWDLH7Hqw9C/FvxOy+vy4tO9pXcwLgpvi
	 aUKAxXPCRW7j47loohxm04OlQXkvlZRmumEBNPnhmGs5jpF9SCY99FhBcl2bQZMOBY
	 4QI4GlWvatuig==
From: Thomas Gleixner <tglx@kernel.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, syzbot
 <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: [PATCH V3 RFC] x86/mce: Serialize sysfs controls against CPU hotplug
In-Reply-To: <87jymzxaj7.ffs@fw13>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13> <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local> <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13> <87y0bhy5h8.ffs@fw13>
 <20261029165636.GA5110@yaz-khff2.amd.com> <87jymzxaj7.ffs@fw13>
Date: Fri, 13 Nov 2026 15:27:20 +0100
Message-ID: <87h5hkst6f.ffs@fw13>
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

syzbot reported a NULL pointer dereference in the CPU hotplug code. It
is caused by the lack of synchronizaton between CPU hotplug and MCE
sysfs controls, which allows the sysfs controls to reenable not only the
timer, but also the CMCI reporting on a CPU which is about to go out. A
similar issue exists in the CPU online path where the timer can be
enabled via sysfs control before the CPU runs the initialization of the
timer.

Prevent this by:

  1) Tracking per CPU active state which prevents sysfs operations
     on CPUs which are not set active

  2) Serialize against CPU hotplug with a trylock() to avoid a circular
     lock dependency between sysfs internal protections and the CPU
     hotplug operations.

This ensures that the sysfs operations always see consistent CPU online
state and the timer and CMCI are shut down at the time when the CPU goes
offline and re-enabled when the CPU starts without interfering with the
sysfs operations.

Fixes: 9af43b54ab45 ("x86, mce: sysfs entries for new mce options")
Reported-by: syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com
---
V3: Change it back to the initial per CPU state approach and serialize
    against hotplug with a trylock() to address the sashiko findings
    and the reports from various folks

V2: Use the seperate hotplug state as sashiko rightfully pointed out
    that taking the sysfs mutex in the hotplug callback can deadlock
    against the device creation/deletion.
---
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1734,8 +1734,13 @@ int memory_failure(unsigned long pfn, in
  */
 static unsigned long check_interval = INITIAL_CHECK_INTERVAL;
 
-static DEFINE_PER_CPU(unsigned long, mce_next_interval); /* in jiffies */
-static DEFINE_PER_CPU(struct timer_list, mce_timer);
+struct mce_poll_state {
+	struct timer_list	timer;
+	unsigned long		next_interval;
+	bool			active;
+};
+
+static DEFINE_PER_CPU(struct mce_poll_state, mce_poll_state);
 
 static void __start_timer(struct timer_list *t, unsigned long interval)
 {
@@ -1764,12 +1769,13 @@ static bool should_enable_timer(unsigned
 
 static void mce_timer_fn(struct timer_list *t)
 {
-	struct timer_list *cpu_t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 	unsigned long iv;
 
-	WARN_ON(cpu_t != t);
+	if (WARN_ON_ONCE(&pst->timer != t))
+		return;
 
-	iv = __this_cpu_read(mce_next_interval);
+	iv = pst->next_interval;
 
 	if (mce_available(this_cpu_ptr(&cpu_info)))
 		mc_poll_banks();
@@ -1786,7 +1792,7 @@ static void mce_timer_fn(struct timer_li
 	if (mce_get_storm_mode()) {
 		__start_timer(t, HZ);
 	} else if (should_enable_timer(iv)) {
-		__this_cpu_write(mce_next_interval, iv);
+		pst->next_interval = iv;
 		__start_timer(t, iv);
 	}
 }
@@ -1798,14 +1804,14 @@ static void mce_timer_fn(struct timer_li
  */
 void mce_timer_kick(bool storm)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
 	mce_set_storm_mode(storm);
 
 	if (storm)
-		__start_timer(t, HZ);
+		__start_timer(&pst->timer, HZ);
 	else
-		__this_cpu_write(mce_next_interval, check_interval * HZ);
+		pst->next_interval = check_interval * HZ;
 }
 
 /* Must not be called in IRQ context where timer_delete_sync() can deadlock */
@@ -1814,7 +1820,7 @@ static void mce_timer_delete_all(void)
 	int cpu;
 
 	for_each_online_cpu(cpu)
-		timer_delete_sync(&per_cpu(mce_timer, cpu));
+		timer_delete_sync(&per_cpu(mce_poll_state.timer, cpu));
 }
 
 static void __mcheck_cpu_mce_banks_init(void)
@@ -2070,29 +2076,27 @@ static void __mcheck_cpu_clear_vendor(st
 	}
 }
 
-static void mce_start_timer(struct timer_list *t)
+static void mce_start_timer(struct mce_poll_state *pst)
 {
 	unsigned long iv = check_interval * HZ;
 
 	if (should_enable_timer(iv)) {
-		this_cpu_write(mce_next_interval, iv);
-		__start_timer(t, iv);
+		pst->next_interval = iv;
+		__start_timer(&pst->timer, iv);
 	}
 }
 
-static void __mcheck_cpu_setup_timer(void)
+static void __mcheck_cpu_init_timer(void)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
+	mce_start_timer(pst);
 }
 
-static void __mcheck_cpu_init_timer(void)
+static void mce_setup_timer(struct mce_poll_state *pst)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
-
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
-	mce_start_timer(t);
+	timer_setup(&pst->timer, mce_timer_fn, TIMER_PINNED);
+	mce_start_timer(pst);
 }
 
 bool filter_mce(struct mce *m)
@@ -2259,7 +2263,6 @@ void mcheck_cpu_init(struct cpuinfo_x86
 
 	mca_cfg.initialized = 1;
 
-	__mcheck_cpu_setup_timer();
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_vendor(c);
 	__mcheck_cpu_init_prepare_banks();
@@ -2452,6 +2455,8 @@ static void mce_cpu_restart(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_prepare_banks();
 	__mcheck_cpu_init_timer();
@@ -2471,6 +2476,8 @@ static void mce_disable_cmci(void *data)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	cmci_clear();
 }
 
@@ -2478,6 +2485,8 @@ static void mce_enable_ce(void *all)
 {
 	if (!mce_available(raw_cpu_ptr(&cpu_info)))
 		return;
+	if (!this_cpu_read(mce_poll_state.active))
+		return;
 	cmci_reenable();
 	cmci_recheck();
 	if (all)
@@ -2532,9 +2541,13 @@ static ssize_t set_bank(struct device *s
 
 	b->ctl = new;
 
+	if (!cpus_read_trylock())
+		return -EBUSY;
+
 	mutex_lock(&mce_sysfs_mutex);
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
+	cpus_read_unlock();
 
 	return size;
 }
@@ -2548,6 +2561,9 @@ static ssize_t set_ignore_ce(struct devi
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
+	if (!cpus_read_trylock())
+		return -EBUSY;
+
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.ignore_ce ^ !!new) {
 		if (new) {
@@ -2562,6 +2578,7 @@ static ssize_t set_ignore_ce(struct devi
 		}
 	}
 	mutex_unlock(&mce_sysfs_mutex);
+	cpus_read_unlock();
 
 	return size;
 }
@@ -2575,6 +2592,9 @@ static ssize_t set_cmci_disabled(struct
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
+	if (!cpus_read_trylock())
+		return -EBUSY;
+
 	mutex_lock(&mce_sysfs_mutex);
 	if (mca_cfg.cmci_disabled ^ !!new) {
 		if (new) {
@@ -2588,6 +2608,7 @@ static ssize_t set_cmci_disabled(struct
 		}
 	}
 	mutex_unlock(&mce_sysfs_mutex);
+	cpus_read_unlock();
 
 	return size;
 }
@@ -2602,10 +2623,14 @@ static ssize_t store_int_with_restart(st
 	if (check_interval == old_check_interval)
 		return ret;
 
+	if (!cpus_read_trylock())
+		return -EBUSY;
+
 	mutex_lock(&mce_sysfs_mutex);
 	mce_restart();
 	mutex_unlock(&mce_sysfs_mutex);
 
+	cpus_read_unlock();
 	return ret;
 }
 
@@ -2757,21 +2782,23 @@ static int mce_cpu_dead(unsigned int cpu
 
 static int mce_cpu_online(unsigned int cpu)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
 	mce_device_create(cpu);
 	mce_threshold_create_device(cpu);
 	mce_reenable_cpu();
-	mce_start_timer(t);
+	mce_setup_timer(pst);
+	pst->active = true;
 	return 0;
 }
 
 static int mce_cpu_pre_down(unsigned int cpu)
 {
-	struct timer_list *t = this_cpu_ptr(&mce_timer);
+	struct mce_poll_state *pst = this_cpu_ptr(&mce_poll_state);
 
+	pst->active = false;
 	mce_disable_cpu();
-	timer_delete_sync(t);
+	timer_shutdown_sync(&pst->timer);
 	mce_threshold_remove_device(cpu);
 	mce_device_remove(cpu);
 	return 0;
