Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747108;
	b=zKOvuTgagmL5FZtUWcwRPIFDkyLfj15kwXBmAMqSAtO7FQkG4yrtOInlLPjb1WAy1zUi
	 zvUHyno9vPNKOIlqEn43smPMXh52JafT7hhr62hs+y8B5rR22WAdLQ9fqBupfDYt6HLjH
	 DCpKunEFFic5GkAMPSPJS+y98g36+esneCGqMLAbPBWmtkGBSZIhI6P3ELd2z0zLVQD+N
	 EVHg4MPohy2uwfqxxmXijj1yU8oJQBYVDDarY5pTTLA6TVgovu0J8LqqYaYn791E1Efvj
	 j520U8z8aZz9I4/LcQI5KulbVYVILgjetGGE9zbExJVY3n1i3OTlqRrCJWMwJfPhAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747108;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=cooTeVSgcIwGNIxxdK26HI8B3X2YACnR+D0s6+k5TT8=;
	b=faxecWVpL6Qmrff8M9xrwBnt5rccplT79VNeUqP6JX7B0hU3W6eqF9TVsIhdyWdadvJH
	 NgP3X4lP0/a57vLTe4OaFbG65eDVc/ahyeT92T988wLqyW/jVXJbv6wMzgx8vQX8vwfJE
	 dVQWrY908JOfU7NOVkHbFTqg/5zvJH366u32+M9mVF04ha/1tWRlL3O2tgTgB2onvrGyN
	 4ozota/2GPSAkDqDdBrMP0k2tlyYGrx6xNnAk35Zws1O0018vdmWMMvdXjXtVfmzeXTlW
	 jL9I2aTVNVAOXgpvWGqBfYaD3V21oBe/BmIPmMJ4GVeBSCHK8EBZr80/eq1Bg2lZsGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA2ht3NE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE0606A31A;
	Fri, 23 Oct 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA2ht3NE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A51F01829;
	Fri, 23 Oct 2026 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747107;
	bh=cooTeVSgcIwGNIxxdK26HI8B3X2YACnR+D0s6+k5TT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hA2ht3NEDVJePw5XU7zAd1eSPVWfxFRDUTWYOhh4VXvy4PtOy/nD6bJ0XkWcmw2Bx
	 MvrSovFCnn6A4kbSlOTJ1EVE6aMC9vLIUgjM0olTH20PQeJ2kdeF07ENOL580Ig/jS
	 jGuZkZUtaYnSO/XpUW4MpJo+sFY7ZnADHyCMd7VtZAAKRmOL90HWsQfFFmquOo4LaU
	 VFfHDVJxq3AEGtqCctxFwZAZejTdckQ0aoak8+kBVJ78uQ+76MAa87/BigLSGLfoiU
	 lFSoTbiGlr92/UXWfI9atFQRcg4hH1eX8ITKTH0Unb+7ks4BXwqP6B9mNpd/0ogPfy
	 4SPy624osZlPQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: [PATCH] x86/mce: Serialize sysfs controls against CPU hotplug
In-Reply-To: <878q63lrqr.ffs@fw13>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13> <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local> <878q63lrqr.ffs@fw13>
Date: Fri, 23 Oct 2026 11:18:24 +0200
Message-ID: <874iec22sf.ffs@fw13>
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

   1) Acquiring the mce_sysfs_mutex in the hotplug callbacks

   2) Excluding CPUs which do not have MCE fully initialized from the sysfs
      control IPIs.

That covers both the CPU up and down situations.

Fixes: 9af43b54ab45 ("x86, mce: sysfs entries for new mce options")
Reported-by: syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com
---
 arch/x86/kernel/cpu/mce/core.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2447,6 +2447,12 @@ static struct syscore mce_syscore = {
 /*
  * mce_device: Sysfs support
  */
+static cpumask_var_t mce_device_initialized;
+
+static inline void on_each_enabled_cpu(smp_call_func_t func, void *arg)
+{
+	on_each_cpu_cond_mask(NULL, func, arg, true, mce_device_initialized);
+}
 
 static void mce_cpu_restart(void *data)
 {
@@ -2462,7 +2468,7 @@ static void mce_cpu_restart(void *data)
 static void mce_restart(void)
 {
 	mce_timer_delete_all();
-	on_each_cpu(mce_cpu_restart, NULL, 1);
+	on_each_enabled_cpu(mce_cpu_restart, NULL);
 	mce_schedule_work();
 }
 
@@ -2553,12 +2559,12 @@ static ssize_t set_ignore_ce(struct devi
 		if (new) {
 			/* disable ce features */
 			mce_timer_delete_all();
-			on_each_cpu(mce_disable_cmci, NULL, 1);
+			on_each_enabled_cpu(mce_disable_cmci, NULL);
 			mca_cfg.ignore_ce = true;
 		} else {
 			/* enable ce features */
 			mca_cfg.ignore_ce = false;
-			on_each_cpu(mce_enable_ce, (void *)1, 1);
+			on_each_enabled_cpu(mce_enable_ce, (void *)1);
 		}
 	}
 	mutex_unlock(&mce_sysfs_mutex);
@@ -2579,12 +2585,12 @@ static ssize_t set_cmci_disabled(struct
 	if (mca_cfg.cmci_disabled ^ !!new) {
 		if (new) {
 			/* disable cmci */
-			on_each_cpu(mce_disable_cmci, NULL, 1);
+			on_each_enabled_cpu(mce_disable_cmci, NULL);
 			mca_cfg.cmci_disabled = true;
 		} else {
 			/* enable cmci */
 			mca_cfg.cmci_disabled = false;
-			on_each_cpu(mce_enable_ce, NULL, 1);
+			on_each_enabled_cpu(mce_enable_ce, NULL);
 		}
 	}
 	mutex_unlock(&mce_sysfs_mutex);
@@ -2641,8 +2647,6 @@ static struct device_attribute *mce_devi
 	NULL
 };
 
-static cpumask_var_t mce_device_initialized;
-
 static void mce_device_release(struct device *dev)
 {
 	kfree(dev);
@@ -2759,6 +2763,7 @@ static int mce_cpu_online(unsigned int c
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
+	guard(mutex)(&mce_sysfs_mutex);
 	mce_device_create(cpu);
 	mce_threshold_create_device(cpu);
 	mce_reenable_cpu();
@@ -2770,6 +2775,7 @@ static int mce_cpu_pre_down(unsigned int
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
+	guard(mutex)(&mce_sysfs_mutex);
 	mce_disable_cpu();
 	timer_delete_sync(t);
 	mce_threshold_remove_device(cpu);
