Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB152269E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984590; cv=none; b=ouxaLQADiWFeQUhH3ILCvgYNUpztBhRAdf1JiknHbxesNNi3ea3UwpXwIkmqGggf7DSIs9+yohqcaQTytRG27Mv2Kr1DaNYEJRYhMqpmYNKZroWGFMpuK4K4x1NBd44gQAlK0jOeOqPl0lVaBQvFDKLnVOiPgJamCyYaF42mMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984590; c=relaxed/simple;
	bh=JcFjC1oELyQhI2B2WWv3WSwa6cOV++RVZT6UO0YaazQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GykgE/Erxb7ANqGI7s7U3CyvyMwffBpFSaHC6IRA8H0idHQCEFDt7WQr6ZhAhpmwKtr1D7jVUIeDr3USNtiYtLxVDUlmJR2iPhsrJaDh9/blZVKUUqAP6kCPJFHSUfJ4OYJVsa4Ux3hyHrvA9SvSTz5gwsrmelWX7/HNG0Y/M6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PYb1M6OS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PYb1M6OS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e71fc84bbso3931315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984581; x=1792589381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtRLr/iHSkVEBt4O/jB/cckYl17eeDc6+WxF7ZkRI6E=;
        b=PYb1M6OS7Cz/EB1QANSpj6Dx+0thO0CdupUGoTta2OynfgpieiSG+plehcOP+1N+lT
         hvBx+e/EDEYkEhqUrK/LZL7Noe4p2jvJF+civLMIT4HCh7BgppnXxGG2IEmEh2GVj90O
         ekrqmyTJ4fH6XhWoNBn5LJku1zWpvKF0h2KlKZ7S/1bNQNqvcSTG4YTQiLR2I+A0Dpzb
         gOAnaS/R3ibmOi62dtE9csxGLtyA4/O/FG8o2+1/IFvWJ2M2AQ1V8w/twmHQspqnP8zz
         nt3ZxxIqNayTvM4HW3tJyEz9UHzbktaVh0TPBiLIh90KOyWhYKfUgu/KZyCInB/vEmr8
         hxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984581; x=1792589381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtRLr/iHSkVEBt4O/jB/cckYl17eeDc6+WxF7ZkRI6E=;
        b=owSWMbjjESF/w24fxKsAQYwcugHZjVVzVLCKtAtNknKWyMNkdMTkJ2sRL9stA4XtMN
         wIHPsKMFvOQytA1TzdkHii95enGPAEmJTAXDvvpgsguz7WBgAZzaVGKQZQ21ofBLdPaw
         FAaPvHXIAcNEDUl7qGiS5NEpXBgRgzno0tqhnorCd0y9gYLE6NITiNhkoeCY72qecJh6
         jokZ7/sR71DFpL04aR5CknxW0mkeEFDBcygfnDUe5kdwkKMfSMt7W/CuUUe4k6dpTUDM
         yimD1qSCuCt2DWfL27uSSlAar+BxiX4kvOLLE2NQXz6WVbilO0WS/1vdbtSg1adfiV+2
         c2lg==
X-Gm-Message-State: AFq9FYJoH0OsSCif1FWLML4XBvtU+siVbN0rgCUiBTJPJcfbVhe07qAj
	7/ntEOqomsHDyzJqCcmS+i8cd3uUtRwPQML3gIkzRaQ3H7j2jowwgeyOUaA0JUBWbKI=
X-Gm-Gg: AYBFou1Lxmm0/CVv8UKcUewFYx6GpXX5FTYaFiViwZHQQz1QcZcUJP3Faks7/LJNyqB
	gy7FhtBhDep9gjZc9MpQxYnLa25zffezFeshhYMU7nYT4/TKOxPCEAK37bx599AguqUMGUs+3l0
	jAwi8DtC09BfBTtjq2bL+VkZrDE91hb0eMFDY7gQ/sWW2baFgnRFw4Pcg2QElXgx9pLmrMK+HzT
	y9A6RG+xzJ92DnHsqqxiDSe6xjcWPOeauhiDInIHr6z4FNmvp2uvEcDb5GgZ4vdRyggVA8lAfgD
	ViKoFEuOytvW7uPfoTGlzX0VKynhbwcXgDlr3vHgDNrrZll3R/rA5ExBUCfX9YLNL+CwT7WicnO
	CE3mCh7yF2jexPQ/H5G53RSCWI3Dvw/6MxiLdCUNFddPlenr9dN9SukESFJVfzM3g8i0NeSw0QW
	azJz93xzVEEYrQkKlhcfKhdJFJjS44okxQiJcYscT1xYef0lcXBQbnAh4d75qISOuU+VD2A1aUN
	9ds7g==
X-Received: by 2002:a05:600c:8b02:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a18e47e19fmr336849305e9.2.1791984581509;
        Wed, 14 Oct 2026 06:29:41 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f99f0bsm695008f8f.21.2026.10.14.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:29:41 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 2/3] x86/tsc: Use HZ_PER_KHZ and KHZ_PER_MHZ
Date: Wed, 14 Oct 2026 15:29:31 +0200
Message-ID: <20261014132932.1495303-3-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014132932.1495303-1-ptesarik@suse.com>
References: <20261014132932.1495303-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KHZ macro is ambiguous. Sometimes it is used for conversion between Hz
and KHz, and sometimes for conversion between KHz and MHz. Use two other
existing macros to distinguish between them.

Convert plain 1000 constants to one of the two macros where appropriate.

No functional change intended.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/x86/kernel/tsc.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 7adab8b614336..7e31acad2b055 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -16,6 +16,7 @@
 #include <linux/timex.h>
 #include <linux/static_key.h>
 #include <linux/static_call.h>
+#include <linux/units.h>
 
 #include <asm/cpuid/api.h>
 #include <asm/hpet.h>
@@ -41,8 +42,6 @@ EXPORT_SYMBOL(cpu_khz);
 unsigned int __read_mostly tsc_khz;
 EXPORT_SYMBOL(tsc_khz);
 
-#define KHZ	1000
-
 /*
  * TSC can be unstable due to cpufreq or due to unsynced TSCs
  */
@@ -393,7 +392,7 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 	if (pm2 < pm1)
 		pm2 += (u64)ACPI_PM_OVRRUN;
 	pm2 -= pm1;
-	tmp = pm2 * 1000000000LL;
+	tmp = pm2 * 1000000LL * HZ_PER_KHZ;
 	do_div(tmp, PMTMR_TICKS_PER_SEC);
 	do_div(deltatsc, tmp);
 
@@ -640,7 +639,7 @@ static unsigned long quick_pit_calibrate(void)
 	 * kHz = ((t2 - t1) * PIT_TICK_RATE) / (I * 256 * 1000)
 	 */
 	delta *= PIT_TICK_RATE;
-	do_div(delta, i*256*1000);
+	do_div(delta, i*256*HZ_PER_KHZ);
 	pr_info("Fast TSC calibration using PIT\n");
 	return delta;
 }
@@ -668,7 +667,7 @@ unsigned long native_calibrate_tsc(void)
 	if (ebx_numerator == 0 || eax_denominator == 0)
 		return 0;
 
-	crystal_khz = ecx_hz / 1000;
+	crystal_khz = ecx_hz / HZ_PER_KHZ;
 
 	/*
 	 * Denverton SoCs don't report crystal clock, and also don't support
@@ -696,7 +695,7 @@ unsigned long native_calibrate_tsc(void)
 		unsigned int eax_base_mhz, ebx, ecx, edx;
 
 		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
+		crystal_khz = eax_base_mhz * KHZ_PER_MHZ *
 			eax_denominator / ebx_numerator;
 	}
 
@@ -717,7 +716,7 @@ unsigned long native_calibrate_tsc(void)
 	 * lapic_timer_period here to avoid having to calibrate the APIC
 	 * timer later.
 	 */
-	lapic_timer_period = crystal_khz * 1000 / HZ;
+	lapic_timer_period = crystal_khz * HZ_PER_KHZ / HZ;
 #endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
@@ -737,7 +736,7 @@ static unsigned long cpu_khz_from_cpuid(void)
 
 	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
 
-	return eax_base_mhz * 1000;
+	return eax_base_mhz * KHZ_PER_MHZ;
 }
 
 /*
@@ -1084,7 +1083,7 @@ static void __init detect_art(void)
 	cpuid(CPUID_LEAF_TSC, &art_base_clk.denominator,
 	      &art_base_clk.numerator, &art_base_clk.freq_khz, &unused);
 
-	art_base_clk.freq_khz /= KHZ;
+	art_base_clk.freq_khz /= HZ_PER_KHZ;
 	if (art_base_clk.denominator < ART_MIN_DENOMINATOR)
 		return;
 
@@ -1348,14 +1347,14 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 		if (abs(tsc_khz - freq) > (tsc_khz >> 11)) {
 			pr_warn("Warning: TSC freq calibrated by CPUID/MSR differs from what is calibrated by HW timer, please check with vendor!!\n");
 			pr_info("Previous calibrated TSC freq:\t %lu.%03lu MHz\n",
-				(unsigned long)tsc_khz / 1000,
-				(unsigned long)tsc_khz % 1000);
+				(unsigned long)tsc_khz / KHZ_PER_MHZ,
+				(unsigned long)tsc_khz % KHZ_PER_MHZ);
 		}
 
 		pr_info("TSC freq recalibrated by [%s]:\t %lu.%03lu MHz\n",
 			hpet ? "HPET" : "PM_TIMER",
-			(unsigned long)freq / 1000,
-			(unsigned long)freq % 1000);
+			(unsigned long)freq / KHZ_PER_MHZ,
+			(unsigned long)freq % KHZ_PER_MHZ);
 
 		return;
 	}
@@ -1366,8 +1365,8 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 
 	tsc_khz = freq;
 	pr_info("Refined TSC clocksource calibration: %lu.%03lu MHz\n",
-		(unsigned long)tsc_khz / 1000,
-		(unsigned long)tsc_khz % 1000);
+		(unsigned long)tsc_khz / KHZ_PER_MHZ,
+		(unsigned long)tsc_khz % KHZ_PER_MHZ);
 
 	clocksource_tsc.flags |= CLOCK_SOURCE_CALIBRATED;
 
@@ -1470,20 +1469,20 @@ static bool __init determine_cpu_tsc_frequencies(bool early)
 		return false;
 
 	pr_info("Detected %lu.%03lu MHz processor\n",
-		(unsigned long)cpu_khz / KHZ,
-		(unsigned long)cpu_khz % KHZ);
+		(unsigned long)cpu_khz / KHZ_PER_MHZ,
+		(unsigned long)cpu_khz % KHZ_PER_MHZ);
 
 	if (cpu_khz != tsc_khz) {
 		pr_info("Detected %lu.%03lu MHz TSC",
-			(unsigned long)tsc_khz / KHZ,
-			(unsigned long)tsc_khz % KHZ);
+			(unsigned long)tsc_khz / KHZ_PER_MHZ,
+			(unsigned long)tsc_khz % KHZ_PER_MHZ);
 	}
 	return true;
 }
 
 static unsigned long __init get_loops_per_jiffy(void)
 {
-	u64 lpj = (u64)tsc_khz * KHZ;
+	u64 lpj = (u64)tsc_khz * HZ_PER_KHZ;
 
 	do_div(lpj, HZ);
 	return lpj;
-- 
2.55.0

