Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521147;
	b=nrXQlODTa0tG52IVVaoGoU6/O1oZvLLf9141LK94eaKuERwGxIQOHco0fonzPkdw6Gmx
	 HnwsE99UjBxJMe6dTk7fqfn5JfZ3oOTaevcXFO0uRdGbFkUX3H2nIzvjmMOoMnfs7fHdD
	 muqGJFrOFRnG0dvjpqoWUGxLJG8ykwCuohaBecnymxegfMypV4hY84B40BzTG8aaQ2z+R
	 HVWKZsU2+NarEneGRg6U1S4FUw1VyVrScdSMs8EpSDjtBtfE7BVINFy5/unQP/5JUoy41
	 ntMdNHOXk4fPcU1MiWtymBby3qGXTFwzUiaqCjXmvjRGALwwdPE13SpuomNg8hKStkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521147;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=8gpZqQR8Bm+rpn9a6shYPlO3ae5JX1l239NIKj38YE0=;
	b=h6GvkMONQis9SmfUYCMlrt4qQRMrtnnL4odAKzWYv0QeVXd/kUaRayZaEtF33/Lvkkxk
	 H685r6LUsPWd8MbFjWhY7/pt/RED8LuM9fio2eSOLIUX125PoCf7i4PbuAM1VbdfavdLu
	 uDpTzvmKFU+Bj64IY2v9P/LDFc7bWI7rZc9kehyS6aXNfNcc8UvTMuuJ693BeAm5fmIYH
	 2H8Mi49pNPwQMcq92IxFqMGLJqN+0rNhzCOOFtqcT8uH8YmyotGBBG71Yqru1QZM43xpP
	 C2CyiNnA0Ccxrn/6c5349cCMxv0sJ9JAWfjoS/Hd3gX6czctvn0s9Iz9MLwBd61xIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="W/LrzM6F";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7LSo6L9T;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C2606A31B;
	Tue, 20 Oct 2026 18:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=W/LrzM6F;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7LSo6L9T
Date: Tue, 20 Oct 2026 18:32:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792521145;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gpZqQR8Bm+rpn9a6shYPlO3ae5JX1l239NIKj38YE0=;
	b=W/LrzM6FLHMVBaexlCD2SCU6g5NmPGO2eU3d75jaXj/oZ40zBgvWGsftzYm9+cm1v2kaH9
	ExcJxUMy+5WI21cH6rr34+W2vjC4ABEnwAx9g4YOExDbU7ueChP6s36j9WBTIuDB76AJd+
	ew/hydSJmNLCtk7EaVA9Vj/RGrrb8K1jiThu+UJ/qr0u7tthWdEIPcH+7oEtAA7VNQivS7
	5bye1Y8DqhjvoXEWvxc5hf1rR5Ri56lkk83IGJvajAdNe1+XKRPMkD38AfQqCLKLXVoOLL
	Me48loWkyN/uHkwKlNqpU4Ti/TbB8t4op2q3E/soEEtr+/GhF8Eqk6913nTR+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792521145;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gpZqQR8Bm+rpn9a6shYPlO3ae5JX1l239NIKj38YE0=;
	b=7LSo6L9T1Vs7VFs1BIoyk7MsJSEkIRCWphcJQ1Q4tXLk57IjRGDkpw/qWyCB5CfMjb5hKU
	uv1g4onyAPaCOjDA==
From: "tip-bot2 for Grzegorz Jaszczyk" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/apic] x86/apic: Consolidate early APIC initialization into
 apic_early_init()
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Grzegorz Jaszczyk <jaszczyk@chromium.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924104102.3534474-3-jaszczyk@chromium.org>
References: <20260924104102.3534474-3-jaszczyk@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179252114409.3012171.2565095980733227098.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     90f8b3e500657beeeb0f67bbb27c53b9707202a2
Gitweb:        https://git.kernel.org/tip/90f8b3e500657beeeb0f67bbb27c53b9707=
202a2
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:19=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 19 Oct 2026 17:54:29 -07:00

x86/apic: Consolidate early APIC initialization into apic_early_init()

Early APIC initialization is currently scattered across setup_arch():

apic_setup_apic_calls() and acpi_mps_check() run early, check_x2apic() is inv=
oked
much later during memory range setup, and apic_finalize_early_init() runs nea=
r the
end of setup_arch().

Consolidate the initial setup into apic_early_init() in arch/x86/kernel/apic/=
apic.c
so that acpi_mps_check(), check_x2apic(), and static call initialization happ=
en
together in one place.

Place apic_setup_apic_calls() at the end of apic_early_init() in preparation =
for
replacing it with apic_install_default_driver(). This ordering change is safe=
 because
neither acpi_mps_check() nor check_x2apic() uses APIC static calls (check_x2a=
pic()
accesses x2APIC MSRs directly via native_apic_msr_read()).

  [ bp: Tone down the patch explanation text. ]

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260924104102.3534474-3-jaszczyk@chromium.org
---
 arch/x86/include/asm/apic.h |  3 ++-
 arch/x86/kernel/apic/apic.c | 16 ++++++++++++++--
 arch/x86/kernel/setup.c     | 10 +---------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index b4c112b..b1610b8 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -133,6 +133,7 @@ extern void sync_Arb_IDs(void);
 extern void init_bsp_APIC(void);
 extern void apic_intr_mode_select(void);
 extern void apic_intr_mode_init(void);
+void apic_early_init(void);
 void apic_finalize_early_init(void);
 void register_lapic_address(unsigned long address);
 extern void setup_boot_APIC_clock(void);
@@ -183,6 +184,7 @@ extern void topology_reset_possible_cpus_up(void);
 #else /* !CONFIG_X86_LOCAL_APIC */
 static inline void lapic_shutdown(void) { }
 #define local_apic_timer_c2_ok		1
+static inline void apic_early_init(void) { }
 static inline void apic_finalize_early_init(void) { }
 static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
@@ -254,7 +256,6 @@ static inline u32 native_apic_msr_read(u32 reg) { BUG(); }
 #define x2apic_mode		(0)
 #define	x2apic_supported()	(0)
 #endif /* !CONFIG_X86_X2APIC */
-extern void __init check_x2apic(void);
=20
 struct irq_data;
=20
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index cb78e0d..721e194 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1869,7 +1869,7 @@ static __init void try_to_enable_x2apic(int remap_mode)
 	x2apic_enable();
 }
=20
-void __init check_x2apic(void)
+static void __init check_x2apic(void)
 {
 	if (x2apic_enabled()) {
 		pr_info("x2apic: enabled by BIOS, switching to x2apic ops\n");
@@ -1884,7 +1884,7 @@ void __init check_x2apic(void)
 	}
 }
 #else /* CONFIG_X86_X2APIC */
-void __init check_x2apic(void)
+static void __init check_x2apic(void)
 {
 	if (!apic_is_x2apic_enabled())
 		return;
@@ -2064,6 +2064,18 @@ no_apic:
 }
 #endif
=20
+void __init apic_early_init(void)
+{
+	if (acpi_mps_check()) {
+		apic_is_disabled =3D true;
+		setup_clear_cpu_cap(X86_FEATURE_APIC);
+	} else {
+		check_x2apic();
+	}
+
+	apic_setup_apic_calls();
+}
+
 void __init apic_finalize_early_init(void)
 {
 	if (apic_validate_deadline_timer())
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 06522a2..2bab41e 100644
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
