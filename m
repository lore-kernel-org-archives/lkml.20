Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059152D7DEF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031137; cv=none; b=XKEMn+XOnBVTaVC2QimGAn6vO+2XsYKWvF/g2hpYy52eZfBYTzKQHUt5dZ9OIdJhgLEERNc/4hn4/02E4rcLNx5ERLt/7ZHRzIYgVR+l4Bbb9MU8LH+Xl9tJf+LBkP5MJsAIjkz/OZ1xTFAakqGZ+Z50rtI9phWaNRJ2CaY0ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031137; c=relaxed/simple;
	bh=Jb5cxx/rRQ5QaEXL3ph1Ml62Ch5K5eiF/NPb4UF1J08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZfKSY4zh2ViYAM9qgMdkWPBDSpTMFEXMQ6aM4MD2BQdBCzdepY3yxYxjNnIKLCa9vXZy4/CF0Ei8WA3pLGelUVJcnrbDUb9Hk7lVm2hC9FrmWB3AlYZousHYn30JHrpceRePBRd+IeGPziGIvgEtqjDRGsnsP+k2uXjYwIWUcGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OnChAD8l; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OnChAD8l"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2055573c8cso953436066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789031134; x=1789635934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gROn6aUoUA6Mh9dBRv3z312hoWt/objGbQP3Br/Qjk=;
        b=OnChAD8lZciQcH1Lt+YwK+1kpgDi0lc3C1ZL+o4QAbdjjrLSDgLcb+qwa79PU8fRgi
         oqLMIz6VXgLxHNwZfiRDaqard9Ljl4tIjbbu9Ms56zth2u54vO8IZon4O/y0AGnwLX6H
         YOXJ7Umfp9v8dqbVsfcSK/imSntScN/pIwKbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031134; x=1789635934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gROn6aUoUA6Mh9dBRv3z312hoWt/objGbQP3Br/Qjk=;
        b=o/OO9rEBWitZHEHnEqMDR2I96G+BAXzdikylxfqtC4cvoC/7CV8WFUO/IiPHsd3MlO
         6Qm7mdE7r0NjxJKyr8EfuuUySbbcCk9DP+j7k2k7MlBRAJctdE9yfXDBXTS+/5hmvL58
         bUTIL6EFDo6UC+eD7ilWcKTldUPmnRhKf1I8yt9sUGr044WfHrNVuHJhmZDCOqqnanCt
         Ry9k+2EByLj64UpNbwo7Jc75zwMd8vd85NVy8HH3jV/reyV3+rTxrMGt9KucJh9jexqO
         pmMm1Z3tfUU1hELWsOGmFu8D8Vb43BwyN9mPN91lZq843wQdL+giLX+xvcF/WZZzkwg+
         +0kw==
X-Gm-Message-State: AFuF++nQ0UpMQYJsJYUdswPpoJmc2/HShAkTfJqGlpi/lBVdhRX2sRJW
	GgDIKr1vlt9vehiZ69UC9vUZm/wW/Zpnm2geoWiWmDmOLTKWNKq8j5GCq0BAmAQ0Gg==
X-Gm-Gg: AYBFou2MiQ2za360Lg2A6FNsaReCLnqUFLNF8oVa31U+3mRb35/3nVLIkQ9iEy66mgN
	09b/LQxnMTFDT0DIkPIi4yN2qsFyme15Qv/9lu67cpG36xOqLPwiyG8iJXfN0O29VxcBM1i6rtS
	wArsaxICciopOFvvYMVvcnl9Dek2OMz5RiQZ0zl9mq4BNldcnCNoAU6e2v0nGrFLrJ2QunZLkqW
	lbGHfVHRaGrQY2F3l4RMQJCW99t2KXVmTVygLF5+zAsd2wAyMFWM8ZE8A9puM82erumC33D3zzc
	nNcv8DPWj8Du7h6QvC3IOX4BWbBCUc0hr4PTKJ1IY6qvPR4b22orF9whGtZuAXRoIEt/PXrQx+4
	dmDJ2keSNs35Qqc9K3C9pFbhoq6lKUR4nnisvTO1Le8OuPjFfoUWA9g5fLDWsEtAOEpswdeck+h
	7M6rckqTNuSUMBDS3qRk+NV1GnovfiQky4n3UK/SQ/d/9NMmv3zQ+sdd9t8UzeAXSA4JlHeEVFM
	3ULnORWLwfahLdpS8fWh1a8MYDbyaUx/HJPm6zYpjUAd+XDBoOGgt+cmA==
X-Received: by 2002:a17:906:730e:b0:c24:6390:decf with SMTP id a640c23a62f3a-c260c9f0285mr1609958666b.16.1789031134110;
        Thu, 10 Sep 2026 02:05:34 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293039a5e2sm227484366b.43.2026.09.10.02.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:05:33 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaluka@chromium.org,
	vineethrp@chromium.org,
	chuanxiao.dong@intel.com,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric Dumazet <edumazet@google.com>,
	Melody Wang <huibo.wang@amd.com>
Subject: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is enabled
Date: Thu, 10 Sep 2026 09:04:51 +0000
Message-ID: <20260910090512.1197517-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During early boot, the generic x86 kernel defaults to the MMIO-based
APIC driver (apic_physflat). However, if the kernel is booted (e.g. via
kexec) when x2apic is already enabled in hardware, the MMIO interface to
the APIC is disabled.

Normally, ACPI MADT probing would install an x2APIC driver early.
However, if ACPI is disabled (e.g., CONFIG_ACPI is not set, as in
crashdump kernels), x86_64_probe_apic() does not run until late_time_init()
via apic_intr_mode_init().

This creates a window between local_irq_enable() and late_time_init()
where interrupts are enabled, but the APIC driver pointer still points
to apic_physflat. Because check_x2apic() detected hardware x2APIC mode
and set x2apic_mode = 1, init_apic_mappings() skipped mapping the APIC
fixmap. If a pending interrupt (e.g., left in IRR across kexec on
secondary CPUs) fires during this window, native_apic_mem_eoi() is
invoked, which attempts to write to the unmapped APIC EOI register,
triggering an immediate kernel page fault (#PF).

To prevent this, check if x2apic is enabled in hardware during early APIC
call setup in apic_setup_apic_calls() and switch the default APIC driver
from apic_physflat to apic_x2apic_phys immediately. This ensures that any
early EOI writes use safe MSR-based accesses. The driver can still be
upgraded later during the normal APIC probe phase.

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
---
 arch/x86/kernel/apic/init.c        |  2 ++
 arch/x86/kernel/apic/local.h       |  5 +++++
 arch/x86/kernel/apic/x2apic_phys.c | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/x86/kernel/apic/init.c b/arch/x86/kernel/apic/init.c
index 821e2e536f19..c48323f725e7 100644
--- a/arch/x86/kernel/apic/init.c
+++ b/arch/x86/kernel/apic/init.c
@@ -82,6 +82,8 @@ static __init void update_static_calls(void)
 
 void __init apic_setup_apic_calls(void)
 {
+	x2apic_phys_early_init();
+
 	/* Ensure that the default APIC has native_eoi populated */
 	apic->native_eoi = apic->eoi;
 	update_static_calls();
diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
index 090dd71837aa..0c33eaa3b03a 100644
--- a/arch/x86/kernel/apic/local.h
+++ b/arch/x86/kernel/apic/local.h
@@ -20,6 +20,11 @@ void x2apic_send_IPI_all(int vector);
 void x2apic_send_IPI_allbutself(int vector);
 void x2apic_send_IPI_self(int vector);
 extern u32 x2apic_max_apicid;
+#ifdef CONFIG_X86_X2APIC
+void x2apic_phys_early_init(void);
+#else
+static inline void x2apic_phys_early_init(void) { }
+#endif
 
 /* IPI */
 
diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic_phys.c
index 090647cc5a78..c41f47aed7ab 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -155,3 +155,13 @@ static struct apic apic_x2apic_phys __ro_after_init = {
 };
 
 apic_driver(apic_x2apic_phys);
+
+void __init x2apic_phys_early_init(void)
+{
+	if (x2apic_enabled()) {
+		apic = &apic_x2apic_phys;
+		if (apic->x2apic_set_max_apicid)
+			apic->max_apic_id = x2apic_max_apicid;
+		pr_info("Switched default APIC to: %s\n", apic->name);
+	}
+}
-- 
2.55.0.1003.g10538fe699-goog

