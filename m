Received: from mail-ed2-f26.google.com (mail-ed2-f26.google.com [74.125.228.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD246D57D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246617; cv=none; b=Qg7NaFnf1jZC55dF+GlMag1dkn3+QKeX5hG0lvGjhtqeMkYBLwBhYkSdi71XQRYz8po+r5PFvaMD0I7F/HrrPaiMEytonNm3fsjtJY7Gy9U2syO2R6L50pOT/BrAf2k1jlwyURcrnItUY+7tIvTgCcNqddk6aEGIxrCdCZ7yvCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246617; c=relaxed/simple;
	bh=znQCkZiwXDA6xtbCew4FTNUaqWlHxx5GH+Dmszqo/rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g43pca5xqfeFEV6/SVtPBJ5WDkICtdDvFqoKMfQc7arLa2VR+7JnFHlPyZRz/1BAAO2B4Nshn1teeC6Sv96CE1z0vOWW6ozwXCf8DIGAHSW2IdZQwWPJCm8Um+rkgql7cYSZrF8O5EZgWUVIaW61dM1gAazmCmIAavMNDFoXLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H6wHdflL; arc=none smtp.client-ip=74.125.228.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H6wHdflL"
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo2989951a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790246613; x=1790851413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmEgoDglJE58sX93O4sMAW1+Q9sgaDg8o/iCOyMsGnw=;
        b=H6wHdflLXrDEqgOZDW9w7RNcvlyiNhEKvmvBUfCea+7okRFz40dKjrUx54HW7SkiXf
         OaXt794uSHFwRi/JH4wHJCLU6UWAXD/hT96UcRLJUaT4EWsCasll2hXC+Is5nVMSuZSA
         NJJQ5lJPsI5A4g+p39Ut0MEjWXTgJr7yPWfkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246613; x=1790851413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmEgoDglJE58sX93O4sMAW1+Q9sgaDg8o/iCOyMsGnw=;
        b=bnUgFB6+7GDV5EiuXjtTydDBn5kCrkaVR8uJtcFseyvaZ+zql2zpdYr+iPvvAcnvYW
         a4n4WCo4Wh0iDW/lpv2MpaJ91PFqgBCe70KJtqRj4XqroRZeAxB4jollXS2zo43HdU3P
         4S5B1GWumaqpjeydXs++uF8SQEkUuKpTtun6Wq4OmIsGXW2W+ZumxYkeIo4SVClvWnZ2
         TW3Crl94l9I0QFIDyFT7IjBP6uL9ZRPug4XtS3cKIkwsN+eb9+5RBshQnboWrGeR0FUp
         JLeW83iNTOPHscZLzOm3jPIXC2PnywgAxWpiYYdRPJUWMSE+xlkjR2YyWVy5+n+MB/z5
         9gnw==
X-Gm-Message-State: AFuF++mBNb4+oXZ+QmNiDo595wYmSD0BA8Zyc+04aV0PuTRFINa9I+aq
	c6Dh9TmF95Gtc/14XqurSklxpa8rfWnPh5BA093tYH7M5PBwchfyJX6VRgEhpTtAew==
X-Gm-Gg: AYBFou30RpDlD4KO/gWmTeSSal2K41exlefjB3pb793zXDe7o3vGt9oJRj8HkV99QUl
	guyuiNuiASvtz25DK0ATtFTAkTjYVysceijU9pz6BwjSTm7A69CYXglKXjlRe+rse5LX+IrDC7i
	+fAy9vju9LTQxfTqCeZwLm7E5oYvyO6Xzo58yTSzUQq2hXIuHi0I8AAzPpbED1kcrJLKHi41voK
	klNIEzS6iiJYmBS/zhU8stFcjwF705bBMv8st5ICCX3RNkHwfIydWZfidiQism0Z5soOhqIPEzF
	lorqBmrPkVu+kZhFkH0s9RV5DfSusnwDatZRBjMu+T4reF9OKucqyxOkdFxgIyALyH7uaXgpbVu
	hYotheR/siU0X664XzRCzQKsOKaAm6ANhEP1UK2rLMzC4eUMCh6En6INhORWDRsqSwXppYqL1X6
	Za35JezCGIeV0WCgUGNAvfTEcR97dVyUOMG3nFa0l2GQ82m/+Q0GEzDwdkkU3tEjB1SU+Srj8+r
	hhuNlDqwG5H1E41UUfOWvHKpLnKhBRzHtYTFx1b8hDUVlm5VPtcqmDong==
X-Received: by 2002:a05:6402:325b:b0:6a9:a07e:c633 with SMTP id 4fb4d7f45d1cf-6aac90dd1aamr1404078a12.30.1790246613355;
        Thu, 24 Sep 2026 03:43:33 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm3464110a12.3.2026.09.24.03.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:43:33 -0700 (PDT)
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Radu Rendec <radu@rendec.net>,
	Thierry Reding <treding@nvidia.com>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Sean Christopherson <seanjc@google.com>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thorsten Blum <blum@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH v2 2/4] x86/apic: Consolidate early APIC initialization into apic_early_init()
Date: Thu, 24 Sep 2026 10:40:19 +0000
Message-ID: <20260924104102.3534474-3-jaszczyk@chromium.org>
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

Early APIC initialization is currently scattered across setup_arch():
apic_setup_apic_calls() and acpi_mps_check() run early, check_x2apic()
is invoked much later during memory range setup, and
apic_finalize_early_init() runs near the end of setup_arch().

Consolidate the initial setup into apic_early_init() in
arch/x86/kernel/apic/apic.c so that acpi_mps_check(), check_x2apic(),
and static call initialization happen together in one place. Make
check_x2apic() static as it no longer has external callers.

Place apic_setup_apic_calls() at the end of apic_early_init() in
preparation for replacing it with apic_install_default_driver() in the
subsequent patch. This ordering change is safe because neither
acpi_mps_check() nor check_x2apic() uses APIC static calls
(check_x2apic() accesses x2APIC MSRs directly via native_apic_msr_read()).

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
---
 arch/x86/include/asm/apic.h |  3 ++-
 arch/x86/kernel/apic/apic.c | 16 ++++++++++++++--
 arch/x86/kernel/setup.c     | 10 +---------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index b4c112b6d3ab3..b1610b8bc6544 100644
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
 
 struct irq_data;
 
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index cb78e0d6c9317..721e194ceac2d 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1869,7 +1869,7 @@ static __init void try_to_enable_x2apic(int remap_mode)
 	x2apic_enable();
 }
 
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
@@ -2064,6 +2064,18 @@ static bool __init detect_init_APIC(void)
 }
 #endif
 
+void __init apic_early_init(void)
+{
+	if (acpi_mps_check()) {
+		apic_is_disabled = true;
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
index 06522a205dd93..2bab41e073d52 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -993,14 +993,7 @@ void __init setup_arch(char **cmdline_p)
 
 	x86_report_nx();
 
-	apic_setup_apic_calls();
-
-	if (acpi_mps_check()) {
-#ifdef CONFIG_X86_LOCAL_APIC
-		apic_is_disabled = true;
-#endif
-		setup_clear_cpu_cap(X86_FEATURE_APIC);
-	}
+	apic_early_init();
 
 	e820__finish_early_params();
 
@@ -1062,7 +1055,6 @@ void __init setup_arch(char **cmdline_p)
 	/* max_low_pfn get updated here */
 	find_low_pfn_range();
 #else
-	check_x2apic();
 
 	/* How many end-of-memory variables you have, grandma! */
 	/* need this before calling reserve_initrd */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

