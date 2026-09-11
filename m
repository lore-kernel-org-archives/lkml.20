Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4F41C6A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124054; cv=none; b=SPyvYm/mBifPNsq2WXG+5zJCIINHvzhlyq/bhYz0Chl7Z+bubQGYx1tSyWm4HN1F1VMRhWrFlXg/MK7+rQC0y8GE8ILcF7L+95zRQwHvoC5T6yZTSwlTQj013VJt7fr7qKl6/V0ynzSvxmUfYvHfYrirrEvxU4Ha/qtMoeffIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124054; c=relaxed/simple;
	bh=3VfhdoUDK2fZtoyf9zPl96OWvCAWmSXYHS0zpfeHKJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NyYCqcKLT28LZpYNFosVvvWSzd/5qyP/mv01yErsNLG8yjXcrFuwLmkViS68IhZ6ZarKzL+hAHkrgn9m3XqTDqujlzwkdXwW5+TjH7kRCTKkw/C+tPOM7W0cnKwM7c3shDaomT+JrxWHg/ZvMUPmL81l0gzdAcWefKPbjKujPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=urG2pa2Z; arc=none smtp.client-ip=145.253.228.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="urG2pa2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1789124048;
	bh=WZwsAz3BYZk7m4w3I6i6HHrzLZtKUQ0T0ts/scR9iWY=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=urG2pa2ZpugscI+7CE6mRfK9SdTcvflsF68hjY5a/H14bskzqcxT9Y4h9hJREsAaS
	 HgPVgXyb2JcVtM3EgR4anTeu52QwbaK4ULk+gB8mT7A+sTPWS4x0dacL7D9qw1Y4tG
	 eBJhea/mupzd7QLG9crRKCdXlR8EamGZhMLho/eA=
Received: from smtp.vodafone.de (unknown [10.5.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr3.vodafonemail.de (Postfix) with ESMTPS id 4hhBHf6Rsnz3sHpq;
	Fri, 11 Sep 2026 10:54:06 +0000 (UTC)
Received: from tachyon.qsoe.net (ipservice-092-208-226-177.092.208.pools.vodafone-ip.de [92.208.226.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4hhBH54JhHz8sXh;
	Fri, 11 Sep 2026 10:53:34 +0000 (UTC)
Received: by tachyon.qsoe.net (Postfix, from userid 516)
	id E77C42E018A; Fri, 11 Sep 2026 12:53:33 +0200 (CEST)
Date: Fri, 11 Sep 2026 12:53:33 +0200
From: Yuri Zaporozhets <yuriz@vodafonemail.de>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Fei Li <fei1.li@intel.com>,
	acrn-dev@lists.projectacrn.org, linux-kernel@vger.kernel.org
Subject: [PATCH] x86/acrn: Set the LAPIC timer period from CPUID leaf
 0x40000010 EBX
Message-ID: <aqPdrVJjJFBmC1m1@tachyon.qsoe.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-server: smtpa06
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 3043
X-purgate-ID: 155817::1789124042-AFCF0C80-06ADB81C/0/0

ACRN guests without a TSC-deadline timer currently always need the PIT:
apic_needs_pit() returns true because lapic_timer_period is never set,
even though the hypervisor knows the LAPIC bus frequency and could
provide it, in the same way it already provides the TSC frequency.

The ACRN timing information leaf 0x40000010 only defines EAX (TSC
frequency in kHz); EBX, ECX and EDX are reserved and return zero.
Define EBX as the LAPIC bus frequency in kHz and use it to preset
lapic_timer_period, so that the kernel skips both the PIT and the LAPIC
timer calibration. This mirrors what Hyper-V (HV_X64_MSR_APIC_FREQUENCY)
and VMware (VMWARE_CMD_GETHZ) already do, and matches the register layout
VMware defines for its own timing information leaf, which also lives at
0x40000010.

Hypervisors which do not implement this return zero in EBX, in which
case the current behaviour is kept.

Signed-off-by: Yuri Zaporozhets <yuriz@vodafonemail.de>
---
 arch/x86/include/asm/acrn.h | 10 ++++++++--
 arch/x86/kernel/cpu/acrn.c  | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index fab11192c60a..5db1b6e17f7c 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -12,10 +12,11 @@
 
 /*
  * Timing Information.
- * This leaf returns the current TSC frequency in kHz.
+ * This leaf returns the current TSC and LAPIC bus frequencies in kHz.
  *
  * EAX: (Virtual) TSC frequency in kHz.
- * EBX, ECX, EDX: RESERVED (reserved fields are set to zero).
+ * EBX: LAPIC bus frequency in kHz (0 if not provided by hypervisor).
+ * ECX, EDX: RESERVED (reserved fields are set to zero).
  */
 #define ACRN_CPUID_TIMING_INFO		0x40000010
 
@@ -35,6 +36,11 @@ static inline unsigned long acrn_get_tsc_khz(void)
 	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
 }
 
+static inline unsigned long acrn_get_lapic_khz(void)
+{
+	return cpuid_ebx(ACRN_CPUID_TIMING_INFO);
+}
+
 /*
  * Hypercalls for ACRN
  *
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index 2c5b51aad91a..23b6d895cccd 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -31,6 +31,21 @@ static void __init acrn_init_platform(void)
 
 	x86_platform.calibrate_tsc = acrn_get_tsc_khz;
 	x86_platform.calibrate_cpu = acrn_get_tsc_khz;
+
+	/*
+	 * Set the LAPIC bus frequency if provided by the hypervisor (EBX of
+	 * leaf 0x40000010). Hypervisors which do not implement this return 0,
+	 * which has no effect. When set, apic_needs_pit() returns false and
+	 * the kernel skips PIT initialization entirely.
+	 */
+	if (boot_cpu_has(X86_FEATURE_APIC)) {
+		unsigned long lapic_khz = acrn_get_lapic_khz();
+
+		if (lapic_khz) {
+			lapic_timer_period = lapic_khz * (1000 / HZ);
+			pr_info("ACRN: LAPIC bus frequency: %lu kHz\n", lapic_khz);
+		}
+	}
 }
 
 static bool acrn_x2apic_available(void)

base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.55.0
