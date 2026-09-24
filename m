Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89AD472076
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246638; cv=none; b=FTV55gbFIREOAxgVPgHBCQZa8BKw8pJUhlupRMCicG9OsilcRfdDFkU9ouvdp3R+ZSS5jqioqATqcK0hfdujiVHh/IhcifnKGYsnP8PFPcG6P3wyN0UxrH6lMbelYCsMUedah8rRrPhu3Cj99G0rKf4k3iczhw6WISYQvESwCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246638; c=relaxed/simple;
	bh=OLoHY+FyUICD8dWnphPNXQ2t+WUXyrTRCne4onKt6Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDlDoLbzFvLVumWiJNmOowHiLMjZtSIfWnxyDH4pX6KE6n2eQkyjNkMDKSYbuBpHt3CcdbWKlYM1KWkR+oh5QefrR8HeEFS7oYZshgk49gDruuKUzwzoYmOrU0t691bIupSH7tA3RtYspUL6BWSgh8B14Hju61whcOwfz3eqLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oVdRR/Iv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVdRR/Iv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so1462856a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790246634; x=1790851434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTNEZ/oyDKDfNwQUBetTtK631YJ6UtkvM0QQj+GZNqo=;
        b=oVdRR/IvIHJkt9TLhH5lyuWf5OMUtdVkIwvLcBxlsK8XOt0fY2M0IdcmoUVFHaY4Vi
         VLUYUXHdEVPfyq217eOiy0Cl7URcLGRP96NZuJZpEVg8JmaWUxnLntEdzoqo0nX0yO6A
         WGqlLQwFo1/zgwCHQb6Y1g+a2ptHnh6+6HcO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246634; x=1790851434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTNEZ/oyDKDfNwQUBetTtK631YJ6UtkvM0QQj+GZNqo=;
        b=LhU09EDM80T54i+7D0oqSP001jIQyuYaMw2TSebopf2XM26XrxC5R5FFafU6lWwDcV
         q8h4p+xTZFHarrxQumlqjKSfBwG6HnRGtFtW5LjZizrJngRzjepiH4o6xbsqN2puYICV
         bT5sWPtpFcaAxb62SCkJbziDGMH6WwnQWbyG/yAQlk69y+HYei/0/g+X+cgLxv+rpAdy
         Fhv6y+oET524wDVYXPt+cYeFmvuUo2P+WobGApz8VEyKrPmDzOyFSdxuv1+WNayy8wAg
         mbTqvO4ODo2k0j32NpjCMrO1rbJi2usnRB21hGbWu7ypnKSaGwrP8sohy8/6SWkx0No6
         /c8A==
X-Gm-Message-State: AFuF++m8vJnGqasCm+zBYYIec6zsoHftGYNFqsqgaJk5UrY/1lSFslb3
	pIjgBRUk1XFxo6pz4peYL0Nj2tmg8OkV/V+l52HEDJe29D131lIEFj3rGsLeNJDj1w==
X-Gm-Gg: AYBFou3toBz7++x161mYFd98iD1kS46azSbtAdthrZO/g0QT28k61wqHkeaMdlDsjfw
	JDAU/AxqXzgHLbewbzoaIAgcKgwfSthWRgitUYiNYQbVjsNh/+WIB76tf8dzWmMTicmBq7dyzgL
	SuXnoEiqSFvLhdkRGhml6pop5IISA1QNIGBYmPfDJQRcFOtfjQf83xXrjZkjy2QMYMYb6QqOf5z
	7yA3+g+E0wafP3vC3MmTmL60pdz6P9GjTr68UvXxPQmCmDfHJqxzghCZEIA1Q44VRB2LaeANnfT
	BNKXDwneEhp7Pb+55rbtvvj2U9NToa4OayeZqQen+XmlVhSyNsyvEvBMp4gAecqfDwvCkBEmtSs
	HLjfj8dgTlKSSDUFJIxQ+vvm6cM+EG3xHElkzLItPXbR1W0SiwZFXj2/Dwo6r6H3suVr9Ul2tlW
	AWG2ByUxbWj/Sge889C0SKEe40kj8GKH8bKobDhigcFDvpF/CRYkO3hW7+91SbmheXocZvymEbk
	r/mRFWnrW388IvXjaPTmFRQQ5xLaOw2bWjFxDuxy4dCMAeJPwz0NBmUvStqXvyvFRqa
X-Received: by 2002:a05:6402:2423:b0:6a9:9840:f3d with SMTP id 4fb4d7f45d1cf-6aac8ee8d64mr1932434a12.4.1790246634155;
        Thu, 24 Sep 2026 03:43:54 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm3464110a12.3.2026.09.24.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:43:53 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaluka@chromium.org,
	vineethrp@chromium.org,
	chuanxiao.dong@intel.com,
	jaszczyk@google.com,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Radu Rendec <radu@rendec.net>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Thierry Reding <treding@nvidia.com>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>,
	Melody Wang <huibo.wang@amd.com>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH v2 4/4] x86/apic: Switch to x2apic driver early if x2apic is enabled
Date: Thu, 24 Sep 2026 10:40:21 +0000
Message-ID: <20260924104102.3534474-5-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924104102.3534474-1-jaszczyk@chromium.org>
References: <20260924104102.3534474-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During early boot, the generic x86 kernel defaults to the MMIO-based
APIC driver (apic_physflat). However, if the kernel is booted (e.g., via
kexec) when x2APIC is already enabled in hardware, the MMIO interface to
the APIC is disabled.

Normally, ACPI MADT probing would install an x2APIC driver early.
However, if ACPI is disabled (e.g., CONFIG_ACPI is not set, as in
crashdump kernels), x86_64_probe_apic() does not run until
late_time_init() via apic_intr_mode_init().

This creates a window between local_irq_enable() and late_time_init()
where interrupts are enabled, but the APIC driver pointer still points
to apic_physflat. Because check_x2apic() detected hardware x2APIC mode
and set x2apic_mode = 1, register_lapic_address() and
apic_finalize_early_init() skip mapping the APIC fixmap. If a pending
interrupt (e.g., left in IRR across kexec on secondary CPUs) fires
during this window, native_apic_mem_eoi() is invoked, which attempts to
write to the unmapped APIC EOI register, triggering an immediate kernel
page fault (#PF).

To prevent this, replace apic_setup_apic_calls() with
apic_install_default_driver(), have check_x2apic() return
&apic_x2apic_phys when hardware x2APIC is enabled (or &apic_noop if
x2APIC is enabled on a kernel built without CONFIG_X86_X2APIC), and
install it as the default APIC driver in apic_early_init(). Similarly,
if the local APIC is disabled via command line (apic_is_disabled) or
acpi_mps_check(), install &apic_noop immediately as the default driver.

This ensures safe MSR-based or no-op APIC accesses during early boot
while still allowing normal APIC probing (such as upgrading to
apic_x2apic_cluster) to take place later during boot.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
---
 arch/x86/include/asm/apic.h        |  4 ----
 arch/x86/kernel/apic/apic.c        | 22 ++++++++++++++------
 arch/x86/kernel/apic/init.c        | 32 +++++++++++++++++++-----------
 arch/x86/kernel/apic/local.h       |  4 ++++
 arch/x86/kernel/apic/x2apic_phys.c |  2 +-
 5 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index b1610b8bc6544..0b11b7033458f 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -367,9 +367,6 @@ extern int lapic_can_unplug_cpu(void);
 #ifdef CONFIG_X86_LOCAL_APIC
 extern struct apic_override __x86_apic_override;
 
-void __init apic_setup_apic_calls(void);
-void __init apic_install_driver(struct apic *driver);
-
 #define apic_update_callback(_callback, _fn) {					\
 		__x86_apic_override._callback = _fn;				\
 		apic->_callback = _fn;						\
@@ -487,7 +484,6 @@ static inline void apic_icr_write(u32 low, u32 high) { }
 static inline void apic_wait_icr_idle(void) { }
 static inline u32 safe_apic_wait_icr_idle(void) { return 0; }
 static inline void apic_native_eoi(void) { WARN_ON_ONCE(1); }
-static inline void apic_setup_apic_calls(void) { }
 static inline void apic_update_vector(unsigned int cpu, unsigned int vector, bool set) { }
 
 #define apic_update_callback(_callback, _fn) do { } while (0)
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 721e194ceac2d..3583fcd6f0c55 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1869,7 +1869,7 @@ static __init void try_to_enable_x2apic(int remap_mode)
 	x2apic_enable();
 }
 
-static void __init check_x2apic(void)
+static __init struct apic *check_x2apic(void)
 {
 	if (x2apic_enabled()) {
 		pr_info("x2apic: enabled by BIOS, switching to x2apic ops\n");
@@ -1879,15 +1879,21 @@ static void __init check_x2apic(void)
 		else
 			x2apic_state = X2APIC_ON;
 		apic_read_boot_cpu_id(true);
+
+		/* Force the initial driver to X2APIC */
+		return &apic_x2apic_phys;
 	} else if (!boot_cpu_has(X86_FEATURE_X2APIC)) {
 		x2apic_state = X2APIC_DISABLED;
 	}
+
+	/* Keep the default driver */
+	return NULL;
 }
 #else /* CONFIG_X86_X2APIC */
-static void __init check_x2apic(void)
+static __init struct apic *check_x2apic(void)
 {
 	if (!apic_is_x2apic_enabled())
-		return;
+		return NULL;
 	/*
 	 * Checkme: Can we simply turn off x2APIC here instead of disabling the APIC?
 	 */
@@ -1896,6 +1902,7 @@ static void __init check_x2apic(void)
 
 	apic_is_disabled = true;
 	setup_clear_cpu_cap(X86_FEATURE_APIC);
+	return &apic_noop;
 }
 
 static inline void try_to_enable_x2apic(int remap_mode) { }
@@ -2066,14 +2073,17 @@ static bool __init detect_init_APIC(void)
 
 void __init apic_early_init(void)
 {
-	if (acpi_mps_check()) {
+	struct apic *driver;
+
+	if (apic_is_disabled || acpi_mps_check()) {
 		apic_is_disabled = true;
 		setup_clear_cpu_cap(X86_FEATURE_APIC);
+		driver = &apic_noop;
 	} else {
-		check_x2apic();
+		driver = check_x2apic();
 	}
 
-	apic_setup_apic_calls();
+	apic_install_default_driver(driver);
 }
 
 void __init apic_finalize_early_init(void)
diff --git a/arch/x86/kernel/apic/init.c b/arch/x86/kernel/apic/init.c
index 821e2e536f19c..a25ad263c4236 100644
--- a/arch/x86/kernel/apic/init.c
+++ b/arch/x86/kernel/apic/init.c
@@ -80,19 +80,8 @@ static __init void update_static_calls(void)
 	update_call(wakeup_secondary_cpu_64);
 }
 
-void __init apic_setup_apic_calls(void)
+static void __init __apic_install_driver(struct apic *driver)
 {
-	/* Ensure that the default APIC has native_eoi populated */
-	apic->native_eoi = apic->eoi;
-	update_static_calls();
-	pr_info("Static calls initialized\n");
-}
-
-void __init apic_install_driver(struct apic *driver)
-{
-	if (apic == driver)
-		return;
-
 	apic = driver;
 
 	if (IS_ENABLED(CONFIG_X86_X2APIC) && apic->x2apic_set_max_apicid)
@@ -105,6 +94,25 @@ void __init apic_install_driver(struct apic *driver)
 	/* Apply any already installed callback overrides */
 	restore_override_callbacks();
 	update_static_calls();
+}
+
+void __init apic_install_default_driver(struct apic *driver)
+{
+	if (driver) {
+		__apic_install_driver(driver);
+	} else {
+		/* Ensure that the default APIC has the native_eoi() callback populated */
+		apic->native_eoi = apic->eoi;
+		update_static_calls();
+	}
+	pr_info("Set default APIC routing to: %s\n", apic->name);
+}
+
+void __init apic_install_driver(struct apic *driver)
+{
+	if (apic == driver)
+		return;
 
+	__apic_install_driver(driver);
 	pr_info("Switched APIC routing to: %s\n", driver->name);
 }
diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
index 090dd71837aab..84890e428abf2 100644
--- a/arch/x86/kernel/apic/local.h
+++ b/arch/x86/kernel/apic/local.h
@@ -13,12 +13,16 @@
 #include <asm/irq_vectors.h>
 #include <asm/apic.h>
 
+void __init apic_install_default_driver(struct apic *driver);
+void __init apic_install_driver(struct apic *driver);
+
 /* X2APIC */
 u32 x2apic_get_apic_id(u32 id);
 
 void x2apic_send_IPI_all(int vector);
 void x2apic_send_IPI_allbutself(int vector);
 void x2apic_send_IPI_self(int vector);
+extern struct apic apic_x2apic_phys;
 extern u32 x2apic_max_apicid;
 
 /* IPI */
diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic_phys.c
index 5bf86839e84c3..74d7c0d5b203e 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -116,7 +116,7 @@ u32 x2apic_get_apic_id(u32 id)
 	return id;
 }
 
-static struct apic apic_x2apic_phys __ro_after_init = {
+struct apic apic_x2apic_phys __ro_after_init = {
 
 	.name				= "physical x2apic",
 	.probe				= x2apic_phys_probe,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

