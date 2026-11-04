Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755765;
	b=uK9U5xSQkkUURD15GzTi9065I90bz9Z3UUWenTnk57dmAc+JMXhxqWhNUkTSarAleway
	 gpEu6T2UMd+EsLENbyLyxAkIv1B+BzfI5PLyiwDZgwJFds9cRvrjet4jgaLBuX5JZMEff
	 fV2XKFKw4kNTGTqFuEy8CBX6Dua0LvX/UmUbgo0j+/WYFS8l0iCPahbQylVxl3kUtBZKn
	 mJu61DAy9qsRfoWPrbVcWcfNbT8WH2oy3e4+SI9znMk/PAbl+PCLw7B6F9ZrUC8j8t70V
	 h3pRBnKuWp35HHiKZWzI7PYE/b3HBw+PplUWHhtUkjzjKDfAzp9bw8aX91iRIUUjjfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755765;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Sjpyrm8lUioYXEt0W5J93VTJ/osugelyO+yCN0oO4Gw=;
	b=zBE5M4G7ZS8eUyYZaAYE+JG5Wn0fg7Ve1tKLYYvdnCf8VocCQqI+lhHekjXR4yp/2Caw
	 O4vSw3MV5oPXM/7qF1Xfmy7islxqkn2QDzSdUWG5tq5O40kTj7Y0Cp37MfK4wXyaQqrhD
	 lhpp+CnWMgG4kpBxEZscxBv80lmYJqin2a681LEBwtK8D55v6HRJYZijo4LX2oC6NNPWQ
	 4yF/XBadv9THucoprdAPDi5GrzFVrgbY63aV36A6MBHjDZ7feUAndaSSqId1QyFtP7M5E
	 QyVBdSr76Vj9GCLyKSlj6MpvWMG5aQYH+GIuhRU8FqbsVv6+uMbptLusn6RYWDCnH5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=drl3Uo6r;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qAywzIpt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4151E606D806;
	Wed,  4 Nov 2026 01:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4151E606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=drl3Uo6r;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qAywzIpt
Date: Wed, 04 Nov 2026 01:29:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793755763;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sjpyrm8lUioYXEt0W5J93VTJ/osugelyO+yCN0oO4Gw=;
	b=drl3Uo6rBatrSoiB1eiVACy3NNhKB0FG6C4moYkdj+YxVyNHB+kHYQg23x3NYy6R53+cMp
	mVIwa+6OLccDGl3kBWwSG9kUcjIU+M8RQ+B8OyiXaAOsOr5X83uL2pG6uWk/4tQ/1fBKTI
	9byfAyHTGMYRdtbRx2J5wD1eRzEKsM9t6A2vIiIUwNKg+3Cb2BB8afvvMlNKRXbT3p9PyO
	BmKvXffG73uKQK9DR9TDQvlCvWorsFYCTp6L15IOev5AOwVGmRDNoHi8U3ThTK7ZEx35DO
	bCSI1LpT2e8r8WfwAiMIQARgWA/V87PLnjL3B7IX6+iDGthEBtLDtQw7RzZdxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793755763;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sjpyrm8lUioYXEt0W5J93VTJ/osugelyO+yCN0oO4Gw=;
	b=qAywzIptG9/8xoVdM+M/yv3iuFqOEp06W8FE7nRyiOyrVl6zFIM9Vyml7gn9fn/P1wrxBB
	CtIZjmVKl4G2OwAw==
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
Message-ID: <179375576192.1009794.8961140841963067939.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     fc99757165a6b6662e3c5b24986f887a0269495f
Gitweb:        https://git.kernel.org/tip/fc99757165a6b6662e3c5b24986f887a026=
9495f
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:18=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 03 Nov 2026 17:04:02 -08:00

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
index 19fc8e1..0c252d9 100644
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
