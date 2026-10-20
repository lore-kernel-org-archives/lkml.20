Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521149;
	b=3L8rjZjt8KtZuoLDhqOhlN17Mh0h5jFsV8m6Ruuoyav53jA8Lcq5sVVdq1Q7hY3Dsf/u
	 eK4HtTVnxbo+Y0qGROxeUcsg3G3tGZ0fkv03y4fblQvc8t9PF+biQw5OgjYHA0IArJzvh
	 Ua/2y+gikVcNBZ7WDD613q3C79zfip2UIJS56+aJbKEz1151svjLGubuB7X0NCeG/fgwj
	 psNnf+8EzKW8n1RWKHdRBSsT15hubgEDVPp38TolivFObz/N5weE5D7482UOnXGFEkA9l
	 moNujWQy+07+8FsYxdESw7fA5140XsG+Rw/N8Hu/cMjw798aVBOZ6vZu1lIKJNU7WIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521149;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=p1k4rlnnGU75LKWBbyhgmrFM8N6y8yLd0lkDDbjzTEA=;
	b=Fqk52NNCAwVKIvfHjMcPlW+VYNPRatlQmGn8Vl/Mk9IySQbyHOJjyC3MZZHSwnHk6/Fa
	 3064v/4qfWD1wg4S8WyOtZrjPbMivO6Cj69IezEOMeRFEmpCaDQMVoNLG56gnok1SqfJV
	 7tkhVDVhX6GNbW2g8WLtF5NUO6f7mLpaKuHNEUXTAwgXU+e1NCZMlFCSUufsV0LFHM8z/
	 WtUs2a5RP++6dBuOtX75da/b2phgkmqngUIHMhJH8Qnc8qKB2P6NbnxoaB7KAGa8DQy9D
	 lOOqkGywDN+OKm9hLkpqh6+7PmDqcrb9hgYEeUsYTNxB0z4IUhgVGOj3U4VhOOacJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JgXGoSgr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Tw0nxSp1;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F2606A322;
	Tue, 20 Oct 2026 18:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17F2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JgXGoSgr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Tw0nxSp1
Date: Tue, 20 Oct 2026 18:32:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792521147;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1k4rlnnGU75LKWBbyhgmrFM8N6y8yLd0lkDDbjzTEA=;
	b=JgXGoSgrGzXPGeo93G+3ctfjLawal2b5VB0NY9tX0GlovrkUfUsuH9jZAXQFN3bTWIGpQ4
	NZj67FEg5/Z8DP2CUeizQMc5i380tQLnNkL90c26FCTs6R9IuznYWl5nh7nESlKWFrfCp5
	FDjWcL1kHfuddlF7t9Yp72mP4ARfFPGIN6odOJmX5Nu5/kzwsylHFENIiKMjkJ2GWZgaJa
	mTT9bpSsySvbHZUv/CFJeDmeh44vWr+Rsw3t4JR21JrF2kDdFimCQ3s3OZnkdbOoE4d7Sh
	eKasW5giODaFzZIZlEd6nXLFDN7B8bB+7jp6Y6tB+8SoAueZ43W0Ii3A3x3zXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792521147;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1k4rlnnGU75LKWBbyhgmrFM8N6y8yLd0lkDDbjzTEA=;
	b=Tw0nxSp1fcx/d+CVIX4PqPqxbGd3fdj2gPqK91EI/jbloE8x2Ha60Ke8p06U3UVMEtBjV+
	0JtM01qq9uL8GSAA==
From: "tip-bot2 for Grzegorz Jaszczyk" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/apic] x86/apic: Rename init_apic_mappings() to
 apic_finalize_early_init()
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Grzegorz Jaszczyk <jaszczyk@chromium.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924104102.3534474-2-jaszczyk@chromium.org>
References: <20260924104102.3534474-2-jaszczyk@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179252114547.3012171.15528142281695123024.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     ecb8135571e435bc38c86d363f231681562c9ba6
Gitweb:        https://git.kernel.org/tip/ecb8135571e435bc38c86d363f231681562=
c9ba6
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:18=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 19 Oct 2026 17:06:49 -07:00

x86/apic: Rename init_apic_mappings() to apic_finalize_early_init()

Rename init_apic_mappings() to apic_finalize_early_init() to accurately
reflect its purpose (validating the TSC deadline timer and finalizing early
APIC detection and fallback mapping when no SMP config was found).

No functional changes.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260924104102.3534474-2-jaszczyk@chromium.org
---
 arch/x86/include/asm/apic.h | 4 ++--
 arch/x86/kernel/apic/apic.c | 5 +----
 arch/x86/kernel/setup.c     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d..b4c112b 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -133,7 +133,7 @@ extern void sync_Arb_IDs(void);
 extern void init_bsp_APIC(void);
 extern void apic_intr_mode_select(void);
 extern void apic_intr_mode_init(void);
-extern void init_apic_mappings(void);
+void apic_finalize_early_init(void);
 void register_lapic_address(unsigned long address);
 extern void setup_boot_APIC_clock(void);
 extern void setup_secondary_APIC_clock(void);
@@ -183,7 +183,7 @@ extern void topology_reset_possible_cpus_up(void);
 #else /* !CONFIG_X86_LOCAL_APIC */
 static inline void lapic_shutdown(void) { }
 #define local_apic_timer_c2_ok		1
-static inline void init_apic_mappings(void) { }
+static inline void apic_finalize_early_init(void) { }
 static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
 # define setup_secondary_APIC_clock x86_init_noop
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 9002545..cb78e0d 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2064,10 +2064,7 @@ no_apic:
 }
 #endif
=20
-/**
- * init_apic_mappings - initialize APIC mappings
- */
-void __init init_apic_mappings(void)
+void __init apic_finalize_early_init(void)
 {
 	if (apic_validate_deadline_timer())
 		pr_info("TSC deadline timer available\n");
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb..06522a2 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1242,7 +1242,7 @@ void __init setup_arch(char **cmdline_p)
 	x86_init.mpparse.parse_smp_cfg();
=20
 	/* Last opportunity to detect and map the local APIC */
-	init_apic_mappings();
+	apic_finalize_early_init();
=20
 	topology_init_possible_cpus();
=20
