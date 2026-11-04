Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755761;
	b=ttVOrMnLY3f4xkLWwRc7r+eL799jY/fHRcY1KMGGg4qXKa12CMTszJz5f0XEliaEtsLS
	 VKNI9/1+Cz2jawQLsFHXyHDDEOaXIFqqXzAP4TdxrqdWi3RUUdvAbRBJ/39VuyZEJYe5J
	 lBkXuj/7GiWAFg5E4E1qcikp+CIH/8Pj+eKgaypOOdGlj8bcfNpjeL1Acolr8fWVerH8S
	 GZBNruNvQAWuS23/AjKJLM8F4/mND3IJ2CK0KD4kNmZXHhPDjxBaUtpZRY7DyfgQCrdYi
	 RSZvHMU/mPMiUm1/13lw800l7/99TxCy2qiWfBH5lLpRQZ5djgnczeSNLijZkkLvDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755761;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=c7qsr+ciMQr1kqRijnQ1OHmAsfLx55S7RNrjDukOppI=;
	b=ff3uzdeHuVLhiE/A9jTFQrU/FsRK59EZyf0vUrOv/tjhCHMFvhMOT5jFBodm5rmZ+/nE
	 YGeZi0Nj8d6FXcIQBpDbCGz+N0JyGl76mBfVZXgCu8fU5l4+BB7tMcsD6YJ4oTd+hjh02
	 0IrmCs8zJ4GUp5M1l+KE+5mbpvTcLNpISrerldPY84td5n7r2iyKHHenv1XhhtkEMYO5m
	 9Qxw6ggzngM96Ir80Rwpe4Absx25cziIH3OifMAmA1+iMJTOKzvdp9wKSTNCIYTyDCSEc
	 Zr6N9ShtgVTXjHbI0SMpjU39a13fWFfiqVie60XTqIHJKtP7gumHpzHPhCTynFAbxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B6rl4eE9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SlsNwM9J;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB9606A330;
	Wed,  4 Nov 2026 01:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EB9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B6rl4eE9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SlsNwM9J
Date: Wed, 04 Nov 2026 01:29:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793755759;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7qsr+ciMQr1kqRijnQ1OHmAsfLx55S7RNrjDukOppI=;
	b=B6rl4eE9FQUPUuCn69Gnc387bbyFrs/NDzEQH/AbioOArgtaE25t/1YG9oC4bNecip5xwU
	fy2J6XB6xkexzjcWnI0cKT9wce62sXHoXv7Aotr8Uwki99EQnxVHGqfid2ExjOXXKYFoTk
	JaXhUzS8c6LmSm2sSiJfkZn0AAZt2EmLFSzi5sdrCu0F5mjPi6k14R2aw5T/pebF+ALFrW
	phyvMskbJ7z012Ac//Rg9xlxWoGhRH5ctfOk8a8lq5WU/jBwPYUrEWWJQKnAdoZQ2EpfuB
	Wx7Tjn9sNRqIDkcQ0LM8mI01RIhdOfu+qbOp11TlagIjIvAxTCaQguAtaw8qaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793755759;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7qsr+ciMQr1kqRijnQ1OHmAsfLx55S7RNrjDukOppI=;
	b=SlsNwM9JGYZJf5qB1YzGGAAaXxRNyOuoJJA2A08CpD05RF+385Yk5CBHZEYmVqbv+UHOX0
	zBpaKBRrjYBZpgAA==
From: "tip-bot2 for Grzegorz Jaszczyk" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/apic] x86/apic: Switch to x2apic driver early if x2apic is enabled
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Grzegorz Jaszczyk <jaszczyk@chromium.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924104102.3534474-5-jaszczyk@chromium.org>
References: <20260924104102.3534474-5-jaszczyk@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179375575741.1009794.16398693045783696604.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     85c0baaf44b53389e997176dc0cf006416456050
Gitweb:        https://git.kernel.org/tip/85c0baaf44b53389e997176dc0cf0064164=
56050
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:21=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 03 Nov 2026 17:04:03 -08:00

x86/apic: Switch to x2apic driver early if x2apic is enabled

During early boot, the generic x86 kernel defaults to the MMIO-based APIC dri=
ver
(apic_physflat). However, if the kernel is booted (e.g., via kexec) when x2AP=
IC is
already enabled in hardware, the MMIO interface to the APIC is disabled.

Normally, ACPI MADT probing would install an x2APIC driver early.  However, i=
f ACPI
is disabled (e.g., CONFIG_ACPI is not set, as in crashdump kernels), x86_64_p=
robe_apic()
does not run until late_time_init() via apic_intr_mode_init().

This creates a window between local_irq_enable() and late_time_init() where
interrupts are enabled, but the APIC driver pointer still points to apic_phys=
flat.
Because check_x2apic() detected hardware x2APIC mode and set x2apic_mode =3D =
1,
register_lapic_address() and apic_finalize_early_init() skip mapping the APIC=
 fixmap.

If a pending interrupt (e.g., left in IRR across kexec on secondary CPUs) fir=
es
during this window, native_apic_mem_eoi() is invoked, which attempts to write=
 to the
unmapped APIC EOI register, triggering an immediate kernel page fault (#PF).

To prevent this, make x2APIC the default driver on hardware which supports it.

Similarly, if the local APIC is disabled via command line (apic_is_disabled) =
or
acpi_mps_check(), install &apic_noop immediately as the default driver.

This ensures safe MSR-based or no-op APIC accesses during early boot while st=
ill
allowing normal APIC probing (such as upgrading to apic_x2apic_cluster) to ta=
ke place
later during boot.

  [ bp: Massage commit message. ]

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260924104102.3534474-5-jaszczyk@chromium.org
---
 arch/x86/include/asm/apic.h        |  4 +----
 arch/x86/kernel/apic/apic.c        | 22 ++++++++++++++------
 arch/x86/kernel/apic/init.c        | 32 ++++++++++++++++++-----------
 arch/x86/kernel/apic/local.h       |  4 ++++-
 arch/x86/kernel/apic/x2apic_phys.c |  2 +-
 5 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index b1610b8..0b11b70 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -367,9 +367,6 @@ extern int lapic_can_unplug_cpu(void);
 #ifdef CONFIG_X86_LOCAL_APIC
 extern struct apic_override __x86_apic_override;
=20
-void __init apic_setup_apic_calls(void);
-void __init apic_install_driver(struct apic *driver);
-
 #define apic_update_callback(_callback, _fn) {					\
 		__x86_apic_override._callback =3D _fn;				\
 		apic->_callback =3D _fn;						\
@@ -487,7 +484,6 @@ static inline void apic_icr_write(u32 low, u32 high) { }
 static inline void apic_wait_icr_idle(void) { }
 static inline u32 safe_apic_wait_icr_idle(void) { return 0; }
 static inline void apic_native_eoi(void) { WARN_ON_ONCE(1); }
-static inline void apic_setup_apic_calls(void) { }
 static inline void apic_update_vector(unsigned int cpu, unsigned int vector,=
 bool set) { }
=20
 #define apic_update_callback(_callback, _fn) do { } while (0)
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 721e194..3583fcd 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1869,7 +1869,7 @@ static __init void try_to_enable_x2apic(int remap_mode)
 	x2apic_enable();
 }
=20
-static void __init check_x2apic(void)
+static __init struct apic *check_x2apic(void)
 {
 	if (x2apic_enabled()) {
 		pr_info("x2apic: enabled by BIOS, switching to x2apic ops\n");
@@ -1879,15 +1879,21 @@ static void __init check_x2apic(void)
 		else
 			x2apic_state =3D X2APIC_ON;
 		apic_read_boot_cpu_id(true);
+
+		/* Force the initial driver to X2APIC */
+		return &apic_x2apic_phys;
 	} else if (!boot_cpu_has(X86_FEATURE_X2APIC)) {
 		x2apic_state =3D X2APIC_DISABLED;
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
 	 * Checkme: Can we simply turn off x2APIC here instead of disabling the API=
C?
 	 */
@@ -1896,6 +1902,7 @@ static void __init check_x2apic(void)
=20
 	apic_is_disabled =3D true;
 	setup_clear_cpu_cap(X86_FEATURE_APIC);
+	return &apic_noop;
 }
=20
 static inline void try_to_enable_x2apic(int remap_mode) { }
@@ -2066,14 +2073,17 @@ no_apic:
=20
 void __init apic_early_init(void)
 {
-	if (acpi_mps_check()) {
+	struct apic *driver;
+
+	if (apic_is_disabled || acpi_mps_check()) {
 		apic_is_disabled =3D true;
 		setup_clear_cpu_cap(X86_FEATURE_APIC);
+		driver =3D &apic_noop;
 	} else {
-		check_x2apic();
+		driver =3D check_x2apic();
 	}
=20
-	apic_setup_apic_calls();
+	apic_install_default_driver(driver);
 }
=20
 void __init apic_finalize_early_init(void)
diff --git a/arch/x86/kernel/apic/init.c b/arch/x86/kernel/apic/init.c
index 821e2e5..a25ad26 100644
--- a/arch/x86/kernel/apic/init.c
+++ b/arch/x86/kernel/apic/init.c
@@ -80,19 +80,8 @@ static __init void update_static_calls(void)
 	update_call(wakeup_secondary_cpu_64);
 }
=20
-void __init apic_setup_apic_calls(void)
+static void __init __apic_install_driver(struct apic *driver)
 {
-	/* Ensure that the default APIC has native_eoi populated */
-	apic->native_eoi =3D apic->eoi;
-	update_static_calls();
-	pr_info("Static calls initialized\n");
-}
-
-void __init apic_install_driver(struct apic *driver)
-{
-	if (apic =3D=3D driver)
-		return;
-
 	apic =3D driver;
=20
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
+		apic->native_eoi =3D apic->eoi;
+		update_static_calls();
+	}
+	pr_info("Set default APIC routing to: %s\n", apic->name);
+}
+
+void __init apic_install_driver(struct apic *driver)
+{
+	if (apic =3D=3D driver)
+		return;
=20
+	__apic_install_driver(driver);
 	pr_info("Switched APIC routing to: %s\n", driver->name);
 }
diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
index 090dd71..84890e4 100644
--- a/arch/x86/kernel/apic/local.h
+++ b/arch/x86/kernel/apic/local.h
@@ -13,12 +13,16 @@
 #include <asm/irq_vectors.h>
 #include <asm/apic.h>
=20
+void __init apic_install_default_driver(struct apic *driver);
+void __init apic_install_driver(struct apic *driver);
+
 /* X2APIC */
 u32 x2apic_get_apic_id(u32 id);
=20
 void x2apic_send_IPI_all(int vector);
 void x2apic_send_IPI_allbutself(int vector);
 void x2apic_send_IPI_self(int vector);
+extern struct apic apic_x2apic_phys;
 extern u32 x2apic_max_apicid;
=20
 /* IPI */
diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic=
_phys.c
index 5bf8683..74d7c0d 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -116,7 +116,7 @@ u32 x2apic_get_apic_id(u32 id)
 	return id;
 }
=20
-static struct apic apic_x2apic_phys __ro_after_init =3D {
+struct apic apic_x2apic_phys __ro_after_init =3D {
=20
 	.name				=3D "physical x2apic",
 	.probe				=3D x2apic_phys_probe,
