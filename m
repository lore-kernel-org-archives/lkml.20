Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36F219CCF5;
	Sat, 19 Sep 2026 00:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776720; cv=none; b=FNk0V42bMcGrlD+cuMZIaxNYVxnKBjIRyoqw54bSS31WVXhQFU6dZv7O8qiqCeysTBkatCe793803CtGvar+edsZ1jOM6vIP0yJZniaRwKz4D9KnfrP9ya6IPupp9eFUzmGBeL5zKDaJt6YRFk7RKLLDS8OSPxDUmUXL+/EbIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776720; c=relaxed/simple;
	bh=xvHAiWNjfaPr9y3r0s64W+w6VukZYkKJF/ehztuE1L0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZymWuhIEDwLYO6ZK8ALqt4st7Evo4gP3ZLv8aG2OK9eam4F9P/hme0CwmBwmGdCnOhQ6zQ8YnXd2Nu/DmAM7+mnwHUMrDuna86vlAhf4bZga69h0SOHSzBjxJPygiW7EgctH3LAWCaERox7v9ajp2ioJfQcgfw/WlAzBZ7LWdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K5lKVRXL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=btZRJ/Ct; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K5lKVRXL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="btZRJ/Ct"
Date: Sat, 19 Sep 2026 00:11:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789776717;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7md2T4zYH2erON7nRJ633MiZHse+fA/QTM4IYkO1Uo=;
	b=K5lKVRXLhZ1Nyh9Lt8vRDOG2fxw9W01IW6h1nYTKEmuHK4+PWEVJSjGc9Sm9hk+8jXztZS
	FuAIL0agBdpzZqv/v3f7qhnEVaW9/WlRs/C0sCLQALuZF8KkjDTpErgCzBjmMaEpahTcU9
	JE1UQOrfD2LRBB5jkaUm6MpB5GMlLCn1jL9Lkzgjy74MoLFxIsCke4zVRdDlL6UEmvvA4C
	gyrWi9Bz2ehgmfu9J+w2QOh8r4SpQPaBu0gqZ2rH549F+PhdgZGDZavwgLdObZ9BbJ7Kui
	us6rKozZ8PsSTI8hthV6hZCJdM0RemXMrEVg+y/VneU1tZobHJssM60RSnVINg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789776717;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7md2T4zYH2erON7nRJ633MiZHse+fA/QTM4IYkO1Uo=;
	b=btZRJ/Ct/2+CQseGfzvqptiFPNbDnqAO6AXi7lTQUsOH6eLtpPa+hZKiD48XHYmNgKIGTA
	iaHohWeBsjhEZCAQ==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/sev: Initialize RMPOPT configuration MSRs
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ashish Kalra <ashish.kalra@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C7fdf0f5b1be4b561c884c5200d6606a947cbc09d=2E1789594?=
 =?utf-8?q?774=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C7fdf0f5b1be4b561c884c5200d6606a947cbc09d=2E17895947?=
 =?utf-8?q?74=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178977671552.1720534.12328184164752711111.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     15d974be0a3ba37091083028d16237ff49eb05b5
Gitweb:        https://git.kernel.org/tip/15d974be0a3ba37091083028d16237ff49e=
b05b5
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Wed, 16 Sep 2026 22:14:52=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 18 Sep 2026 15:51:34 -07:00

x86/sev: Initialize RMPOPT configuration MSRs

The new RMPOPT instruction helps manage per-CPU RMP optimization
structures inside the CPU. It takes a 1GB-aligned physical address and
either returns the status of the optimizations or tries to enable the
optimizations.

Initialize the per-CPU RMPOPT table base to the starting physical
address.  This enables RMP optimization for up to 2 TB of system RAM on
all CPUs because this is the maximum the RMPOPT tables support.

The RMPOPT_BASE MSR can only be written after SNP is enabled, so the
enabling runs from the ccp SNP init path (and again on guest teardown)
rather than from an initcall. This is also in line with the intention to
not enable SNP by default but enable it on demand, when the ccp module
is loaded.

RMPOPT_BASE is programmed on all primary threads.  RMPOPT_EN cannot be
cleared while SNP is enabled, and CPU hotplug is disabled while SNP is
active, so once programmed the MSRs stay set on all CPUs until SNP is
disabled.  A set RMPOPT_EN on the local CPU therefore means the
programming has already been done and thus it can be skipped.

  [ bp:
    - Massage commit message
    - move enabling logic into the commit message
    - zap unnecessary comments
    - cleanup ]

Suggested-by: Thomas Lendacky <thomas.lendacky@amd.com>
Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://patch.msgid.link/7fdf0f5b1be4b561c884c5200d6606a947cbc09d.17895=
94774.git.ashish.kalra@amd.com
---
 arch/x86/include/asm/msr-index.h |  3 ++-
 arch/x86/include/asm/sev.h       |  2 +-
 arch/x86/virt/svm/sev.c          | 48 +++++++++++++++++++++++++++----
 drivers/crypto/ccp/sev-dev.c     |  2 +-
 4 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-inde=
x.h
index 3a8e51a..1635e2e 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -761,6 +761,9 @@
 #define MSR_AMD64_SEG_RMP_ENABLED_BIT	0
 #define MSR_AMD64_SEG_RMP_ENABLED	BIT_ULL(MSR_AMD64_SEG_RMP_ENABLED_BIT)
 #define MSR_AMD64_RMP_SEGMENT_SHIFT(x)	(((x) & GENMASK_ULL(13, 8)) >> 8)
+#define MSR_AMD64_RMPOPT_BASE		0xc0010139
+#define MSR_AMD64_RMPOPT_ENABLE_BIT	0
+#define MSR_AMD64_RMPOPT_ENABLE		BIT_ULL(MSR_AMD64_RMPOPT_ENABLE_BIT)
=20
 #define MSR_SVSM_CAA			0xc001f000
=20
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 9e7a077..fa81aa0 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -662,6 +662,7 @@ static inline void snp_leak_pages(u64 pfn, unsigned int p=
ages)
 	__snp_leak_pages(pfn, pages, true);
 }
 int snp_prepare(void);
+void snp_enable_rmpopt(void);
 void snp_shutdown(void);
 #else
 static inline bool snp_probe_rmptable_info(void) { return false; }
@@ -680,6 +681,7 @@ static inline void snp_leak_pages(u64 pfn, unsigned int n=
pages) {}
 static inline void kdump_sev_callback(void) { }
 static inline void snp_fixup_e820_tables(void) {}
 static inline int snp_prepare(void) { return -ENODEV; }
+static inline void snp_enable_rmpopt(void) {}
 static inline void snp_shutdown(void) {}
 #endif
=20
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 558f792..1fecd24 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -124,6 +124,8 @@ static void *rmp_bookkeeping __ro_after_init;
=20
 static u64 probed_rmp_base, probed_rmp_size;
=20
+static phys_addr_t rmpopt_pa_start;
+
 static LIST_HEAD(snp_leaked_pages_list);
 static DEFINE_SPINLOCK(snp_leaked_pages_list_lock);
=20
@@ -575,6 +577,34 @@ void snp_shutdown(void)
 }
 EXPORT_SYMBOL_FOR_MODULES(snp_shutdown, "ccp");
=20
+static bool rmpopt_capable(void)
+{
+	return cpu_feature_enabled(X86_FEATURE_RMPOPT) &&
+	       cc_platform_has(CC_ATTR_HOST_SEV_SNP);
+}
+
+void snp_enable_rmpopt(void)
+{
+	u64 base;
+	int cpu;
+
+	if (!rmpopt_capable())
+		return;
+
+	rmpopt_pa_start =3D ALIGN_DOWN(PFN_PHYS(min_low_pfn), SZ_1G);
+
+	/*
+	 * Per-CPU RMPOPT tables cover at most 2 TB.  Program each core's
+	 * RMPOPT_BASE with the start of RAM to optimize up to 2 TB.
+	 */
+	rdmsrq(MSR_AMD64_RMPOPT_BASE, base);
+	if (!(base & MSR_AMD64_RMPOPT_ENABLE))
+		for_each_cpu(cpu, cpu_primary_thread_mask)
+			wrmsrq_on_cpu(cpu, MSR_AMD64_RMPOPT_BASE,
+				      rmpopt_pa_start | MSR_AMD64_RMPOPT_ENABLE);
+}
+EXPORT_SYMBOL_FOR_MODULES(snp_enable_rmpopt, "ccp");
+
 /*
  * Do the necessary preparations which are verified by the firmware as
  * described in the SNP_INIT_EX firmware command description in the SNP
@@ -699,13 +729,21 @@ static bool probe_segmented_rmptable_info(void)
=20
 bool snp_probe_rmptable_info(void)
 {
-	if (cpu_feature_enabled(X86_FEATURE_SEGMENTED_RMP))
+	if (cpu_feature_enabled(X86_FEATURE_SEGMENTED_RMP)) {
 		rdmsrq(MSR_AMD64_RMP_CFG, rmp_cfg);
=20
-	if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED)
-		return probe_segmented_rmptable_info();
-	else
-		return probe_contiguous_rmptable_info();
+		if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED) {
+			if (probe_segmented_rmptable_info())
+				return true;
+
+			setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
+			return false;
+		}
+	} else {
+		setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
+	}
+
+	return probe_contiguous_rmptable_info();
 }
=20
 /*
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index f833cb7..5c996ab 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -1663,6 +1663,8 @@ static int __sev_snp_init_locked(int *error, unsigned i=
nt max_snp_asid)
=20
 	sev_es_tmr_size =3D SNP_TMR_SIZE;
=20
+	snp_enable_rmpopt();
+
 	return 0;
 }
=20
