Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922918A6D4;
	Mon,  5 Oct 2026 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186957; cv=none; b=AE7fh1V4uty02zgoObUzOdE7YXKxojyusHZNBhVx65dUbI5Py52/MgUtJ1NTS5mmG1CHhCg3sCzTk9++sxVyGyTCB82wVOSPj0Sa2HhOMizxrZ2mPfJDPowoXVaw9OPyCB13BfGGbZ9pfTJS3A3G1SzqXwGNu40XKWDirac/1+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186957; c=relaxed/simple;
	bh=3U4X5UvYnUo/TN+47/qhU7ABi2eQ5DBjpw1gGMkM6/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYywPDT7kV4poq6yM0ZoczGAGHcGvE5cGuD5YofcSBNEocLSq4Z1GTG/4TDJZNN41nJHluAdvSTeiKUTyJo11iwc+bkjYJk5XQQz1av0ARCgzngczl6ZQqIh5BBBUUT2egXkyYi8MRkfEUYb7QGpG+cqK+5PDZlOU0yGjujokqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOqoEEn3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOqoEEn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791186955; x=1822722955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3U4X5UvYnUo/TN+47/qhU7ABi2eQ5DBjpw1gGMkM6/o=;
  b=AOqoEEn3OjoBU5UkrM2FY9s/CXFZtObOZvGukgSC8LzKcI8Mx+ZH0WWt
   qbOY6uZg4VVzgGhutjEeJV+4VTPY3w6ED/wkUP58kZQnl0x/onobzZ1WO
   Z3huIxdGlmG2GYb1gmwKQeJqDqZQEZSr1MHYwuas6htoOJb7IvOWLr/2h
   7n3vVkjkg8bdZ5GEYsS4LNerI+gvLBRmjXF+xMml0+tJ830VCkkHujJVo
   M5nXtzAd+lSwAEdzDXuWl5id62guAdXKdCsaHf/UckKO9p2yFJC2VQFHR
   HWkpL+iPwa6XwQEHHiYey041oItiUfW65w3UEzio7boztD+hvaskPGiq+
   Q==;
X-CSE-ConnectionGUID: 6051GPD0STaT7vUgroOjTA==
X-CSE-MsgGUID: xEo5MRRWSZGBPnYLc+lYxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90982549"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90982549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:55:54 -0700
X-CSE-ConnectionGUID: C+k4WJjWRKCC4jWpsC6isA==
X-CSE-MsgGUID: RInxy9gwRKKTFHpSf2z7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276896605"
Received: from srf-bkc.iind.intel.com ([10.49.110.107])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2026 00:55:51 -0700
From: tirthendu.sarkar@intel.com
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/time: Enable HPET under ACPI hardware-reduced mode with hpet=force
Date: Mon,  5 Oct 2026 03:55:50 -0400
Message-ID: <20261005075550.463089-1-tirthendu.sarkar@intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tirthendu Sarkar <tirthendu.sarkar@intel.com>

ACPI hardware-reduced platforms unconditionally stub
x86_init.timers.timer_init() to a noop, on the assumption that such
platforms never provide legacy timer hardware. That is not universally
true: virtualized/embedded x86 platforms can declare hardware-reduced
mode while still enumerating a genuine HPET via the standard ACPI HPET
table. On those, HPET never gets a chance to initialize at all,
regardless of whether one is present.

"hpet=force" is the existing opt-in for forcing HPET on in unusual
situations, but today its effect is limited to a later PCI-quirk
address override and bypassing the PC10-damaged auto-disable; it does
not reach this earlier stubbing. Passing it on such a platform
silently does nothing.

Let "hpet=force" call hpet_enable() when .timer_init() was stubbed by
ACPI hardware-reduced mode. This has to happen in x86_late_time_init()
rather than at the stub site: that decision runs from setup_arch(),
while "hpet=" is a __setup() handler and so is not parsed until
parse_args(), further into start_kernel().

Only hpet_enable() is wanted here, not hpet_time_init(), which also
falls back to the PIT and requests the legacy timer interrupt. Neither
has hardware behind it on such a platform, and the fallback is not
merely inert: the PIT clockevent it registers as global_clock_event
never ticks, and calibrate_APIC_clock() cross-checks the APIC timer
against jiffies advancing via exactly that clockevent, so the APIC
timer is marked CLOCK_EVT_FEAT_DUMMY and disabled as well ("APIC timer
disabled due to verification failure"). Where the APIC timer was the
only usable clockevent, that is a boot hang.

This covers hardware-reduced platforms that install their own
.timer_init() rather than being stubbed, too. Intel MID points
x86_init.acpi.reduced_hw_early_init() at a noop, so
acpi_generic_reduced_hw_init() never runs there and .timer_init() keeps
pointing at intel_mid_time_init(), which sets up the local APIC timer
only and never touches the HPET - even though Tangier does have one at
0xfed00000. None of the platform .timer_init() implementations enable
the HPET themselves, so it cannot end up registered twice.

The ACPI hardware-reduced check is still required: without it,
"hpet=force" on an ordinary platform would call hpet_enable() a second
time after hpet_time_init() already did, registering the clocksource
twice. Hyper-V guests run hardware-reduced too, so the path is
reachable there as well, but only ever behind the explicit opt-in.

Nothing changes for non-hardware-reduced platforms, or for
hardware-reduced platforms booted without "hpet=force". With
"hpet=force" but no usable HPET, hpet_enable() fails and nothing else
happens, matching today's outcome.

Also document the new behaviour under "hpet=", and fix that entry's
stale "[X86-32,HPET]" tag.

Signed-off-by: Tirthendu Sarkar <tirthendu.sarkar@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Tested under QEMU on a hardware-reduced platform with no HPET table, and
with an HPET table describing an HPET that does not come up; neither falls
through to the PIT. Also forced the Intel MID boot path under QEMU
(hardware_subarch = X86_SUBARCH_INTEL_MID), which exercises that code path
but not real Merrifield/Moorefield silicon. On a hardware-reduced platform
with a genuine HPET, the HPET initializes and is confirmed to drive
timekeeping.

 .../admin-guide/kernel-parameters.txt         |  8 +++++--
 arch/x86/include/asm/hpet.h                   |  1 +
 arch/x86/kernel/time.c                        | 22 ++++++++++++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..2722c74eb5a57 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2033,12 +2033,16 @@ Kernel parameters
 			not exceed the maximum allowed hostname length (usually
 			64 characters) and will be truncated otherwise.
 
-	hpet=		[X86-32,HPET] option to control HPET usage
+	hpet=		[X86,HPET] option to control HPET usage
 			Format: { enable (default) | disable | force |
 				verbose }
 			disable: disable HPET and use PIT instead
 			force: allow force enabled of undocumented chips (ICH4,
-				VIA, nVidia)
+				VIA, nVidia). Also attempts HPET initialization
+				on ACPI hardware-reduced platforms, which
+				otherwise skip legacy timer init entirely. The
+				legacy PIT is never used as a fallback there,
+				since such platforms do not provide one.
 			verbose: show contents of HPET registers during setup
 
 	hpet_mmap=	[X86, HPET_MMAP] Allow userspace to mmap HPET
diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index ab0c78855ecb2..4cb8f6d2e13dc 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -97,6 +97,7 @@ static inline int hpet_enable(void) { return 0; }
 static inline int is_hpet_enabled(void) { return 0; }
 #define hpet_readl(a) 0
 #define default_setup_hpet_msi	NULL
+#define hpet_force_user		false
 
 #endif
 #endif /* _ASM_X86_HPET_H */
diff --git a/arch/x86/kernel/time.c b/arch/x86/kernel/time.c
index 4061430ac74c5..5184493689396 100644
--- a/arch/x86/kernel/time.c
+++ b/arch/x86/kernel/time.c
@@ -10,13 +10,14 @@
  *
  */
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/i8253.h>
 #include <linux/time.h>
-#include <linux/export.h>
 
 #include <asm/vsyscall.h>
 #include <asm/x86_init.h>
@@ -72,6 +73,25 @@ static __init void x86_late_time_init(void)
 	 */
 	x86_init.irqs.intr_mode_select();
 
+	/*
+	 * ACPI hardware-reduced mode unconditionally stubs .timer_init() to
+	 * a noop, on the assumption that no legacy timer exists. Some such
+	 * platforms do provide a real HPET, so let "hpet=force" give it a
+	 * chance to come up. Only hpet_enable() is wanted here, not
+	 * hpet_time_init(): its PIT fallback and legacy timer interrupt have
+	 * no hardware behind them on such platforms, and registering a PIT
+	 * clockevent whose interrupt can never be delivered also fails the
+	 * local APIC timer's calibration cross-check, disabling that too.
+	 *
+	 * This also covers hardware-reduced platforms that install their own
+	 * .timer_init() rather than being stubbed (e.g. Intel MID, which
+	 * sets up the local APIC timer only). None of them enable the HPET
+	 * themselves, so it cannot end up registered twice.
+	 */
+	if (IS_ENABLED(CONFIG_HPET_TIMER) && acpi_reduced_hardware() &&
+	    hpet_force_user)
+		hpet_enable();
+
 	/* Setup the legacy timers */
 	x86_init.timers.timer_init();
 
-- 
2.52.0

