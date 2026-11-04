Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755764;
	b=NIc8lMShzuk23u+Cu+OOxHRqqorzOftni7ZfkjpW2a6pGd+dMKA8uRqPkmz8d3T3Bafn
	 sSO7PEWsnOBsKrfDl4sXxISvFWIfvCC6gC7NxMyPuK3+H9s12YFlVXzxwC6CD4msa++Ja
	 XdailDWuMPHcNXXdi6QFLAfH6Ex9N0YxNIOpAqueFFRvH6VrTx2HpHWzpIqYm+qlwHLwu
	 V9QFdcdOSSyfrDEUg3R9F95s3VtepuiirESMXc6iS/TeWnsuhXLNrW8cmopk6vK1z/K8q
	 T6RmQgkUqjCunF4M1qOTQHPrrFcSOgsp71B/u0JjuJkiIJ6OUZ34miCpvtFNmu2lumQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755764;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=AyfmC96cP6VS+r8xnzYtJ4v3zDkKTKoagln7+e7lcSE=;
	b=Scg6KJNNBAIjhpaZ461CxUflm+mleFX+MLrmBTpgFKpmn4c/nsZekGFjkYXT7gI2clf+
	 q+q2Kn4uBMF8h7o6CZ6d/EvHGFph+Xe6To3MPIkOvVToVu3luBxoXUNSeE0XOMDTbr3mj
	 Zt28wb9CkZJzJuPLOOufWbqAn0+5Vqb4UU4k98D9mYU4QmzGzri2egemXVGa6pv/8tfbG
	 4ZbZD3St7DleBj0QCGvagidbWeU2bmWA1wo/AmX9CIjToHjsjGqN5abafq9NFQBBDhCHs
	 ZNeO7Fxhfijly3Wk9eVtdWS9vkkecaUKHUOLKuM39B87hMUuGXjfqYzp7NPDMD9ggtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lfWHZxSP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jc0BObhh;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A3606A33A;
	Wed,  4 Nov 2026 01:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941A3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lfWHZxSP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jc0BObhh
Date: Wed, 04 Nov 2026 01:29:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793755762;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyfmC96cP6VS+r8xnzYtJ4v3zDkKTKoagln7+e7lcSE=;
	b=lfWHZxSPehxCAAmIHQc6nyfJLSep/R8YqgZHT//9eScERCU7pw+9nt3BE+g0GB7baE5Txf
	IPwYSrqNrinsGnVSEW9Evrl2VkD4JZ43hFPrTEZ35eobcKoJUt6KJR82W4SfV/LUKsKOOy
	IAiS7mLeW8SI0XlK5L47WbP8TmozGP5og5mo3kuh0st2AC3GHkX2zJ5RozN5I28lcvSA/G
	1pl9YIUjRs0yzXmBRA0Mck3b48L4P4B7fmu6KQohW8WTn7YMwu2ZTqTPwluKVfTK5hSa5I
	w512qGdFpa1AkWspubANN5YGBjhvCNIqgTLOdX3WbomuNIeZrekE9JJowb25UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793755762;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyfmC96cP6VS+r8xnzYtJ4v3zDkKTKoagln7+e7lcSE=;
	b=Jc0BObhhG62bDfwb4+j6z+AVHPV+vUeaExPt9FjkYYZ8A5PG2idXMT10nYt/4yn8F7hDq/
	68iRZr1w73bbEQBA==
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
Message-ID: <179375576045.1009794.3005200903147021236.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     ae32c6e2679b05e1aab256af19599cec0abc5219
Gitweb:        https://git.kernel.org/tip/ae32c6e2679b05e1aab256af19599cec0ab=
c5219
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:19=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 03 Nov 2026 17:04:02 -08:00

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
index 0c252d9..5640350 100644
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
