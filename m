Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68184A43FF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540315; cv=none; b=H6e/aTVxkuScIoJaEyXQvWVXSzQRW3oFlK3+bBGAfrrXnCevpj4vnU/rH655pzIvwzNFG7QMiHUrgHErfi4Rrn82uece3Jf7xZftKhc4tKzk8sSyPeNteR9f/DSh6rSULCHB8eioZLkyPYLCVBxqPVoUlpfcMX5ribs907cvyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540315; c=relaxed/simple;
	bh=cP8cYllWo390+IYZw5Y1+BdptrgrcIdZ/CW93k8zyQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4hMFSEs66xwHTvtI4FL6zOaQxIBUEy0anhGagMtEU+w0HO+Hcu3q4/tl9IJTm/ouZcch/Gz6nNiZCGPesou9HmyjKmV1tQeedOxxLl2lt+DEBAtunkjTv5zQUq5tw9vxibEbBdf/qW1VLjO93dD0I+ZhcCfoKxx+69HVqCjUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TfGo7cr1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TfGo7cr1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so2635765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791540306; x=1792145106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKicW/sNywODGulTGnOEpic+U/1JVU+qu5Ax1f4MUts=;
        b=TfGo7cr1jX0on7exff8MVEZnoSg9fvymzpsArjdbrdOGTSgIof94UcISXipczTOgT5
         qmInf4jYKjNb5oCM79vil9/1Rgmj30qLAyEV0/VFJ1ILQO1mJhEW24ioLxSBpQXasgwi
         ZcpuKkOWd+lnR9uW50Q4yYuqu4CvpaFawo7Ox5jMQZq1xAqi9iI/qhmvMFmJUUp3KSva
         UZLgR1tVEIanZt/NG7tWsM5ffT2hsApfMYuXSZ6eGs+zXN4OAArvwsHWJiB3lU5Rhk6o
         tY1C3bf+CUWoCp9s7gLo6UYPVxD/9ToI3yuOSIaUxYX+3McrHeWk4NSDu3iw+L3Foh5p
         qKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540306; x=1792145106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKicW/sNywODGulTGnOEpic+U/1JVU+qu5Ax1f4MUts=;
        b=m9DpS2vFPj99FJVHuDiW75e0QtN8ZH1Pq40DnTSKAUcNBzWOqzp70l+ljUHORUaZgs
         E3KzSHdUayKytZsb08qyKYD+r0Yf/9KyfmIEptd7XRpKHOLSYeu+D2xf46D+Yrswa38B
         wmo1isQ45jaLngiEQEQotfJxAGnXknoyFTd7S859gvThGOw27IG08jO7lrqm6jtbC26r
         Kh6N/8tx55R34q/3M8xGvJGGzADS5rgEXb7DybcfheokhOMmTNs0Nw1WeqEArwf7RVOF
         Z8klN2wdvMuhPopEyKj6kD2xdEy+nqsm19T/uca2v077lS5rvptyAZBND1aeUbd45lYw
         w0vg==
X-Gm-Message-State: AFuF++mZJxsVe9TLN2hpyqxiczBZf67Ina72SaKmvW/we+1RXNMmIoar
	6E3gMH88isgHNK1q/r5bCUDDAkO6csT4jglcOS1FFR5H5TF+CExmRqxIJ9rRL0HpWUs=
X-Gm-Gg: AYBFou0c/wgsrbSfqsA5T02iPH97e2yFTyt/P368zx/K7GrxtDFYvDTpAjk2rD6Kj+9
	FKwcUaEVKBQ51jEgjTOw6d56dWDWGEXdSRXIItPMBAiYYxGCtUVzav123ctQZVhBbT8a/eSQ2wj
	mzTssZeV/q6ThHlbykRVZ8mSiB9ci4hkIiPjaDKBkmn8HaQWAe9EntDIQn8TsSgqsfMCCbkGqa5
	HLp39xNUehA5TselmlKBi5FxjBRKeaNN5JcZo2oS0puUN1Km8/SgLE4LRHsCFDPLyhnEk4EAiFE
	mS9bmEMzmLL0EB48BwrF166+/fxF6gCKSsU6M+S8puL+ER1EZuWX/w5QpqjbgGlpYAe2WOUGidu
	sShc9P9Zk3wJ+juhbs5RCg//hNff0IPL5n255u2AfsiqZ0g9NPX2WEh/oaiNapHP/p1Q3A+Cn5f
	yWtNKQB+Q0haWIKqK5jzs4moGzFT+HhJ5QuW2GwbI2euDsENWuV1QC4bkqjsuEy91wp0s=
X-Received: by 2002:a05:600c:8b02:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a18e47e19fmr27007965e9.2.1791540306404;
        Fri, 09 Oct 2026 03:05:06 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm68468485e9.2.2026.10.09.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:05 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 2/3] x86/tsc: Define and use HZ_PER_KHZ and KHZ_PER_MHZ
Date: Fri,  9 Oct 2026 12:04:35 +0200
Message-ID: <20261009100436.1133518-3-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009100436.1133518-1-ptesarik@suse.com>
References: <20261009100436.1133518-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KHZ macro is ambiguous. Sometimes it is used for conversion between Hz
and KHz, and sometimes for conversion between KHz and MHz. Use two
different macros to distinguish between them.

Convert plain 1000 constants to one of the two macros where appropriate.

No functional change intended.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/x86/kernel/tsc.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index bac81d37a90ce..8b905c4dbefe2 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -41,7 +41,8 @@ EXPORT_SYMBOL(cpu_khz);
 unsigned int __read_mostly tsc_khz;
 EXPORT_SYMBOL(tsc_khz);
 
-#define KHZ	1000
+#define HZ_PER_KHZ	1000
+#define KHZ_PER_MHZ	1000
 
 /*
  * TSC can be unstable due to cpufreq or due to unsynced TSCs
@@ -393,7 +394,7 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 	if (pm2 < pm1)
 		pm2 += (u64)ACPI_PM_OVRRUN;
 	pm2 -= pm1;
-	tmp = pm2 * 1000000000LL;
+	tmp = pm2 * 1000000LL * HZ_PER_KHZ;
 	do_div(tmp, PMTMR_TICKS_PER_SEC);
 	do_div(deltatsc, tmp);
 
@@ -640,7 +641,7 @@ static unsigned long quick_pit_calibrate(void)
 	 * kHz = ((t2 - t1) * PIT_TICK_RATE) / (I * 256 * 1000)
 	 */
 	delta *= PIT_TICK_RATE;
-	do_div(delta, i*256*1000);
+	do_div(delta, i*256*HZ_PER_KHZ);
 	pr_info("Fast TSC calibration using PIT\n");
 	return delta;
 }
@@ -668,7 +669,7 @@ unsigned long native_calibrate_tsc(void)
 	if (ebx_numerator == 0 || eax_denominator == 0)
 		return 0;
 
-	crystal_khz = ecx_hz / 1000;
+	crystal_khz = ecx_hz / HZ_PER_KHZ;
 
 	/*
 	 * Denverton SoCs don't report crystal clock, and also don't support
@@ -696,7 +697,7 @@ unsigned long native_calibrate_tsc(void)
 		unsigned int eax_base_mhz, ebx, ecx, edx;
 
 		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
+		crystal_khz = eax_base_mhz * KHZ_PER_MHZ *
 			eax_denominator / ebx_numerator;
 	}
 
@@ -717,7 +718,7 @@ unsigned long native_calibrate_tsc(void)
 	 * lapic_timer_period here to avoid having to calibrate the APIC
 	 * timer later.
 	 */
-	lapic_timer_period = crystal_khz * 1000 / HZ;
+	lapic_timer_period = crystal_khz * HZ_PER_KHZ / HZ;
 #endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
@@ -737,7 +738,7 @@ static unsigned long cpu_khz_from_cpuid(void)
 
 	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
 
-	return eax_base_mhz * 1000;
+	return eax_base_mhz * KHZ_PER_MHZ;
 }
 
 /*
@@ -1084,7 +1085,7 @@ static void __init detect_art(void)
 	cpuid(CPUID_LEAF_TSC, &art_base_clk.denominator,
 	      &art_base_clk.numerator, &art_base_clk.freq_khz, &unused);
 
-	art_base_clk.freq_khz /= KHZ;
+	art_base_clk.freq_khz /= HZ_PER_KHZ;
 	if (art_base_clk.denominator < ART_MIN_DENOMINATOR)
 		return;
 
@@ -1348,14 +1349,14 @@ static void tsc_refine_calibration_work(struct work_struct *work)
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
@@ -1366,8 +1367,8 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 
 	tsc_khz = freq;
 	pr_info("Refined TSC clocksource calibration: %lu.%03lu MHz\n",
-		(unsigned long)tsc_khz / 1000,
-		(unsigned long)tsc_khz % 1000);
+		(unsigned long)tsc_khz / KHZ_PER_MHZ,
+		(unsigned long)tsc_khz % KHZ_PER_MHZ);
 
 	clocksource_tsc.flags |= CLOCK_SOURCE_CALIBRATED;
 
@@ -1470,20 +1471,20 @@ static bool __init determine_cpu_tsc_frequencies(bool early)
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

