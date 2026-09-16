Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D293D891F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593623; cv=none; b=HI6FIWPeIl0H/VND6Sp3iOUGhH/FVTR8XnWf67Y6Az63q2FV071tV2Qcl62uOOsyVONGn55p75qY/5zKMaM5sNJG7JUW7Zhg5Ccb8jHLPkU87ww8OU6Gp3dbJ5tskox4Whm11/XP21hOm/rZphLeKeJhkuudA5HD6sa3bh1AH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593623; c=relaxed/simple;
	bh=pee1z2UJL9xdaD3L056DYXmrTlFh9o/gVqUP4f/yWPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EtHDgWCSWaVn7FrUDZzlyURbF4FELW8rxfH8bikmyA59Zj9KwWYJxBKIe8ukw+kN7KkGQ/7tes9e6nxHOHwxmps+75ljkGh5PxiaTB5Cj/P93//7OqJGTeU2jxqtcrJIsmVshNdXp95tMOJb5XQkcl+/E5AyVtKt9U4QcMLUsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HADrWZ9W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HADrWZ9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B23E1F000FF;
	Wed, 16 Sep 2026 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789593608;
	bh=Oe6mW2CXrVR5WY7fsD36LGo48FbH9kjoarD1uR/66r4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HADrWZ9WCAPNuNXv2XeVFLsYqSWm9p18O2sv3ufm2i5Oszyw1ukSlbwg4i01yCVwe
	 jF/arwxKjW35Nm5OhJK/Cq2tSRU8JrVTz3XFWp5z2L4Nz4xkr008qGhZeLzVITvyWI
	 XomZ619dkp9oqpkCOXovdI/CYe18vQ049u2omDtKSF4ZXXCk/NOPVefwcFVcMj1M+6
	 +5qqEULm/fqLfaF0Gj5McoNUPJFIma9u7wHqFxLdTFAk9/f4ihPEkW9l8ygyWDbegq
	 0GCkdDn1e2vubKpJpP91hchStHHWN8ZrV/Wces2g8ikzGo6MIeGwg2WW+dX7aGGUQG
	 UWVwF9vPVfgxA==
From: Thomas Gleixner <tglx@kernel.org>
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org,
 vineethrp@chromium.org, chuanxiao.dong@intel.com, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, Melody Wang
 <huibo.wang@amd.com>
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is
 enabled
In-Reply-To: <CAGptq8F7MgYt94QuCFF0hRGDAw851sK_xByBJc_cnUpYAF2yMQ@mail.gmail.com>
References: <20260910090512.1197517-1-jaszczyk@chromium.org>
 <875x0cymr5.ffs@fw13>
 <CAGptq8F7MgYt94QuCFF0hRGDAw851sK_xByBJc_cnUpYAF2yMQ@mail.gmail.com>
Date: Wed, 16 Sep 2026 23:20:05 +0200
Message-ID: <87qzis7v22.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11 2026 at 17:17, Grzegorz Jaszczyk wrote:
> On Fri, Sep 11, 2026 at 2:51=E2=80=AFPM Thomas Gleixner <tglx@kernel.org>=
 wrote:
>>
>> On Thu, Sep 10 2026 at 09:04, Grzegorz Jaszczyk wrote:
>> > To prevent this, check if x2apic is enabled in hardware during early A=
PIC
>> > call setup in apic_setup_apic_calls() and switch the default APIC driv=
er
>> > from apic_physflat to apic_x2apic_phys immediately. This ensures that =
any
>> > early EOI writes use safe MSR-based accesses. The driver can still be
>> > upgraded later during the normal APIC probe phase.
>>
>> That's really the wrong place. Initializing those calls has absolutely
>> nothing to do with the driver probing.
>>
>> There is quite some historical ballast in this whole APIC driver
>> probing, which I never came around to clean up.
>>
>> I'll have a look how this can be done sanely without replicating half of
>> the existing code just to paper over the real issue.
>>
> Ok, understood. Thank you. Let me know when you have something to look
> at or test.

It actually needs a larger overhaul because when the x2apic_phys driver
is installed early on then its probe function will prevent installing
the cluster driver.

So your claim that any other driver can still be selected is only true
when ACPI invokes the MADT check function, but not via the probe
mechanism.

I'm not really happy about the untested below, but something like that
should solve your problem and still keep all options open. That patch
needs to be split up in more digestable pieces.

FYI, I'm on vacation and only sporadically at the keyboard. So if you
get it working feel free to polish it up and submit the whole pile with
a "Suggested-by: tglx..." tag. It definitely needs some eyeballs and
testing time in tip.

Thanks,

        tglx
---
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -133,7 +133,8 @@ extern void sync_Arb_IDs(void);
 extern void init_bsp_APIC(void);
 extern void apic_intr_mode_select(void);
 extern void apic_intr_mode_init(void);
-extern void init_apic_mappings(void);
+void apic_early_init(void);
+void apic_finalize_early_init(void);
 void register_lapic_address(unsigned long address);
 extern void setup_boot_APIC_clock(void);
 extern void setup_secondary_APIC_clock(void);
@@ -254,7 +255,6 @@ static inline u32 native_apic_msr_read(u
 #define x2apic_mode		(0)
 #define	x2apic_supported()	(0)
 #endif /* !CONFIG_X86_X2APIC */
-extern void __init check_x2apic(void);
=20
 struct irq_data;
=20
@@ -288,7 +288,8 @@ struct apic {
 	u32	disable_esr		: 1,
 		dest_mode_logical	: 1,
 		x2apic_set_max_apicid	: 1,
-		nmi_to_offline_cpu	: 1;
+		nmi_to_offline_cpu	: 1,
+		probed			: 1;
=20
 	u32	(*calc_dest_apicid)(unsigned int cpu);
=20
@@ -366,9 +367,6 @@ extern int lapic_can_unplug_cpu(void);
 #ifdef CONFIG_X86_LOCAL_APIC
 extern struct apic_override __x86_apic_override;
=20
-void __init apic_setup_apic_calls(void);
-void __init apic_install_driver(struct apic *driver);
-
 #define apic_update_callback(_callback, _fn) {					\
 		__x86_apic_override._callback =3D _fn;				\
 		apic->_callback =3D _fn;						\
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1869,7 +1869,7 @@ static __init void try_to_enable_x2apic(
 	x2apic_enable();
 }
=20
-void __init check_x2apic(void)
+static __init struct apic *check_x2apic(void)
 {
 	if (x2apic_enabled()) {
 		pr_info("x2apic: enabled by BIOS, switching to x2apic ops\n");
@@ -1879,15 +1879,19 @@ void __init check_x2apic(void)
 		else
 			x2apic_state =3D X2APIC_ON;
 		apic_read_boot_cpu_id(true);
+		/* Force the initial driver to X2APIC */
+		return &apic_x2apic_phys;
 	} else if (!boot_cpu_has(X86_FEATURE_X2APIC)) {
 		x2apic_state =3D X2APIC_DISABLED;
 	}
+	/* Keep the default driver */
+	return NULL;
 }
 #else /* CONFIG_X86_X2APIC */
-void __init check_x2apic(void)
+static __init struct apic *check_x2apic(void)
 {
 	if (!apic_is_x2apic_enabled())
-		return;
+		return NULL;
 	/*
 	 * Checkme: Can we simply turn off x2APIC here instead of disabling the A=
PIC?
 	 */
@@ -1896,6 +1900,7 @@ void __init check_x2apic(void)
=20
 	apic_is_disabled =3D true;
 	setup_clear_cpu_cap(X86_FEATURE_APIC);
+	return &apic_noop;
 }
=20
 static inline void try_to_enable_x2apic(int remap_mode) { }
@@ -2064,10 +2069,22 @@ static bool __init detect_init_APIC(void
 }
 #endif
=20
-/**
- * init_apic_mappings - initialize APIC mappings
- */
-void __init init_apic_mappings(void)
+void __init apic_early_init(void)
+{
+	struct apic *driver;
+
+	if (acpi_mps_check()) {
+		apic_is_disabled =3D true;
+		setup_clear_cpu_cap(X86_FEATURE_APIC);
+		driver =3D &apic_noop;
+	} else {
+		driver =3D check_x2apic();
+	}
+
+	apic_install_default_driver(driver);
+}
+
+void __init apic_finalize_early_init(void)
 {
 	if (apic_validate_deadline_timer())
 		pr_info("TSC deadline timer available\n");
--- a/arch/x86/kernel/apic/init.c
+++ b/arch/x86/kernel/apic/init.c
@@ -80,19 +80,8 @@ static __init void update_static_calls(v
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
@@ -105,6 +94,24 @@ void __init apic_install_driver(struct a
 	/* Apply any already installed callback overrides */
 	restore_override_callbacks();
 	update_static_calls();
+}
=20
-	pr_info("Switched APIC routing to: %s\n", driver->name);
+void __init apic_install_default_driver(struct apic *driver)
+{
+	if (driver && driver !=3D apic) {
+		__apic_install_driver(driver);
+	} else {
+		/* Ensure that the default APIC has the native_eoi() callback populated =
*/
+		apic->native_eoi =3D apic->eoi;
+		update_static_calls();
+	}
+	pr_info("Set default APIC routing to: %s\n", apic->name);
+}
+
+void __init apic_install_driver(struct apic *driver)
+{
+	if (apic !=3D driver)
+		__apic_install_driver(driver);
+	apic->probed =3D true;
+	pr_info("Switched APIC routing to: %s\n", apic->name);
 }
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
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -7,7 +7,6 @@
=20
 int x2apic_phys;
=20
-static struct apic apic_x2apic_phys;
 u32 x2apic_max_apicid __ro_after_init =3D UINT_MAX;
=20
 void __init x2apic_set_max_apicid(u32 apicid)
@@ -113,7 +112,7 @@ static int x2apic_phys_probe(void)
 	if (x2apic_phys || x2apic_fadt_phys())
 		return 1;
=20
-	return apic =3D=3D &apic_x2apic_phys;
+	return apic =3D=3D &apic_x2apic_phys && apic->probed;
 }
=20
 u32 x2apic_get_apic_id(u32 id)
@@ -121,7 +120,7 @@ u32 x2apic_get_apic_id(u32 id)
 	return id;
 }
=20
-static struct apic apic_x2apic_phys __ro_after_init =3D {
+struct apic apic_x2apic_phys __ro_after_init =3D {
=20
 	.name				=3D "physical x2apic",
 	.probe				=3D x2apic_phys_probe,
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -993,14 +993,7 @@ void __init setup_arch(char **cmdline_p)
=20
 	x86_report_nx();
=20
-	apic_setup_apic_calls();
-
-	if (acpi_mps_check()) {
-#ifdef CONFIG_X86_LOCAL_APIC
-		apic_is_disabled =3D true;
-#endif
-		setup_clear_cpu_cap(X86_FEATURE_APIC);
-	}
+	apic_early_init();
=20
 	e820__finish_early_params();
=20
@@ -1062,7 +1055,6 @@ void __init setup_arch(char **cmdline_p)
 	/* max_low_pfn get updated here */
 	find_low_pfn_range();
 #else
-	check_x2apic();
=20
 	/* How many end-of-memory variables you have, grandma! */
 	/* need this before calling reserve_initrd */
@@ -1242,7 +1234,7 @@ void __init setup_arch(char **cmdline_p)
 	x86_init.mpparse.parse_smp_cfg();
=20
 	/* Last opportunity to detect and map the local APIC */
-	init_apic_mappings();
+	apic_finalize_early_init();
=20
 	topology_init_possible_cpus();
=20

