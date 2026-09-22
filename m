Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BE4DA9DA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068685; cv=none; b=W9RVud882xYA+i7QIEVvNMqeIW3r8Jm5lWIAZuxbvml5fmcuuidNdbkZihSpbhOxcuYE9Z0rSYvSuD12sMxQYlVsBvYCBi/f+tV2ybXk/xIGV4gOaG85R2G2asaCuyYdDtgA1fEmzoQkOMPnJC431lodjIB3/86kawOvj8UAQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068685; c=relaxed/simple;
	bh=7J43zfow/KDIJpufRkxn+gN+vTtRzrdWuJEUqmGlG5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQ6NKjLAhjxxltP2jqggsHO2ceB6SxH6o0cWTE/qqLqKGqfmsKug+zara+n+dqMXFGfr5H5ZHLWJU9oNr2dQ0B82C5Vsyo0ZHizO56/hGfuHqqzFfrjtOpwdJmlxw9FVOV3Rpa2pttpRoZzZm78ml4g2+PKsO5sEh0BZnP0PTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EumMMTG4; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EumMMTG4"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hpvdf2jJ6zKnRc;
	Tue, 22 Sep 2026 11:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790068678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mYumJOloRRfmNBmVMGei7wJJnsfP989aOMbaRRvFUAg=;
	b=EumMMTG4eBrq3E7XnEsQ9rC1RLjbDlPPchXPvamaeWyKHZtE/cm2vRhFhsoRUw9/m7hD3O
	Kn6z2MxP9UhjxMEjavlvCV5Du4qw0jm/67Me7eAQJDlXEblpwBUK7xWuBmacc5KOvLQUA5
	SPb6mJgx+XTEhgtZv//Qn0MkaBiov5RcvO1k9zRmYk/FSUbCkv9JeqUguwUMAWXG6DFxLf
	TgdI2c+7HrmCtfr2uYfZFuh2AvZUJjV6yysWB6hqf7aptOInQJ8AJ6yyehJlHA7u/AGnzp
	FcHP5rTaimBmVWgJCT6J5uM2jILekyexQZ9wo3oO6hK0AvyKZmuy2LRTeDUUGg==
From: Alexander Warth <alexander.warth@mailbox.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/tsc: Require a deviating refined calibration to be reproduced
Date: Tue, 22 Sep 2026 11:17:40 +0200
Message-ID: <20260922091740.344611-1-alexander.warth@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 309f04ad06017c1ae4a
X-MBO-RS-META: neiw9k5wyd3knd5bm8aezurwtp7my49s

tsc_refine_calibration_work() measures the TSC against HPET or the ACPI PM
timer over one second and installs the result when it is within 1% of the
early calibration. One sample is final. The comment above the function
acknowledges that the window can be disturbed, but the 1% comparison is
the only defense.

That stopped being sufficient when the clocksource watchdog started to
enforce skew limits of a few hundred ppm. The refined value is installed
along with CLOCK_SOURCE_CALIBRATED, and the watchdog holds two calibrated
clocksources to SHIFT_500PPM. A refined value which is off by more than
~500ppm, but by less than 1%, is accepted and gets the TSC marked
unstable in the next watchdog period. The early calibration which it
replaced was usable: quick_pit_calibrate() only succeeds when its error
is below 2^-11.

tsc_read_refs() does not catch this. It bounds the latency of each
reference readout, but not what happens between the two readouts which
delimit the window.

The single sample within 1% has been accepted since 08ec0c58fb8a ("x86:
Improve TSC calibration using a delayed workqueue"). At that time the
watchdog tolerated 62.5ms per 0.5s interval, i.e. 12.5%, so such a
sample was merely inaccurate and was kept. 2e27e793e280 ("clocksource:
Reduce clocksource-skew threshold") brought the tolerance for a pair of
fine-grained clocksources down to a few hundred ppm, and 763aacf86f1b
("clocksource: Rewrite watchdog code completely") made the calibrated
case explicit with SHIFT_500PPM.

This is reproducible on an AMD Ryzen 3 PRO 2200GE (Raven Ridge, ASUS
PRIME A320M-K, BIOS 6254). Raw values of two consecutive refinement
windows of the same boot:

  ref=HPET ref_delta=15135866 tsc_cycles=3385560864 -> 3202.662 MHz
  ref=HPET ref_delta=14659748 tsc_cycles=3276343968 -> 3200.006 MHz

Measured against NTP over several days the TSC runs at 3199.995 MHz. In
the first window TSC and HPET disagree by 881us, in the second one by a
few microseconds. Across boots that disagreement is 881..888us and does
not scale with the window length: 833ppm in a 1.057s window, 853ppm in a
1.041s window, 838ppm in a 1.054s window, and 1757ppm in a 0.503s
watchdog interval. A nearly constant accumulated error over windows of
different length is inconsistent with a frequency error and indicates a
one-off step of ~885us. A sampler which compares TSC and HPET every 20ms
shows a single 883us window and nothing in the following 15 seconds.

The step is in the TSC. A debug kernel which timestamps TSC, HPET and the
ACPI PM timer on every falling UIP edge of the RTC, which has an
oscillator of its own, reports for the second containing the event and
the one after it:

  rtc: second 1 tsc=1000864480ns hpet=999992377ns pm=999992177ns
  rtc: second 2 tsc= 999986137ns hpet=999993843ns pm=999994133ns

HPET and the ACPI PM timer advance by 999.992ms against the RTC in the
affected second, the same as in the other 39 seconds of the run, while
the TSC advances by 1000.864ms. The reference counters keep running and
the TSC jumps forward once. RTC, HPET and PMTMR all sit in the FCH, but
only the RTC is driven by a separate crystal.

The jump requires both a warm reset and the first entry into ACPI C2. It
is present in 9 of 9 warm reboots which are allowed to reach deep idle,
absent in 2 of 2 warm reboots with one CPU kept busy or with
processor.max_cstate=1, and absent in 2 of 2 boots from power off, S5 and
G3, with the same kernel and command line minutes apart. It coincides
with the first time all CPUs are idle. That points at the TSC restore on
the first C6 exit, i.e. at firmware. With hpet=disable the ACPI PM timer
produces the same result.

So the TSC on this machine takes a single ~880us step early in boot and
then runs at 0.1ppm for days. The change below does not make that TSC
trustworthy and does not try to. It prevents one disturbed measurement
from becoming a permanent frequency error. Where the step lands decides
what happens today: in a refinement window it corrupts tsc_khz for the
rest of the boot, in a watchdog interval it marks the TSC unstable. Only
the former is addressed here.

As a result every warm reboot of this machine ends up with HPET as
clocksource, which makes clock_gettime() take 1878ns instead of 23ns.

Keep the 1% sanity limit as is. Within that limit accept a refined
sample only when it matches a previous measurement within 2^-11:

  - A sample which matches the early calibration confirms it and is
    installed right away. When the first refined sample agrees with the
    early calibration, no additional delay is introduced and the
    installed value is the same as before.

  - A sample which does not match is recorded and the measurement is
    repeated. A later sample is installed when it matches either the
    early calibration or any recorded sample. If two refined samples
    match each other, then the early calibration is the value which is
    discarded, i.e. the early calibration is not treated as
    authoritative.

  - After three samples without a match keep the early calibration and
    do not set CLOCK_SOURCE_CALIBRATED. That is what already happens
    when the 1% check fails. Three samples because that is the minimum
    which still converges when both the early calibration and one
    refined sample are off.

In the worst case this delays the registration of the final TSC
clocksource by two seconds. clocksource_tsc_early stays in use
meanwhile.

On the affected machine the first sample after a warm reboot is
discarded and the second one is installed. The TSC stays the
clocksource.

Assisted-by: Claude:claude-fable-5-1 sparse
Signed-off-by: Alexander Warth <alexander.warth@mailbox.org>
---
Notes for reviewers, below the --- as this is a single patch.

Tested
 - v7.2.6 + this patch on the affected machine, two warm reboots: the
   first refinement sample is discarded, the second is installed,
   clocksource stays "tsc".
 - Mainline v7.3-rc3 + this patch + "make x86_debug.config", one warm
   reboot on the same machine. That kernel boots more slowly, the
   refinement window closed before the first common idle, and the ~880us
   step landed in a watchdog interval instead:
     clocksource: Marking clocksource tsc unstable due to frequency skew
     Watchdog hpet interval: 503192165ns
     Clocksource tsc interval: 504072662ns
   This patch does not help in that case, by construction. If you test it
   on a slow or instrumented kernel you may well still see an unstable
   TSC on such hardware.
 - No new diagnostics in: x86_64 defconfig W=1, defconfig +
   x86_debug.config W=1, allmodconfig W=1, i386 defconfig W=1, i386
   without HPET_TIMER W=1, clang 18 W=1, sparse C=2. (x86_64 without
   HPET_TIMER does not exist, CONFIG_HPET_TIMER is def_bool y there.)
 - The state machine was additionally exercised in a userspace copy over
   ten cases, including the 2^-11 boundary and A-B-A sequences.
 - checkpatch.pl --strict is clean.

Not tested
 - One machine, one model, one BIOS revision. I have no second affected
   system.
 - The give-up path after three non-matching samples was only exercised
   in the userspace copy, never on hardware.
 - No testing in virtual machines.

Open questions
 1. Three samples means up to two extra seconds before clocksource_tsc is
    registered on an affected machine, and no change at all on a machine
    whose first sample matches the early calibration. Is that trade
    acceptable, or should the retry be bounded differently?
 2. The give-up path deliberately leaves CLOCK_SOURCE_CALIBRATED unset,
    as the existing 1% path does, so the watchdog falls back to
    SHIFT_4000PPM. Setting it would be stricter on machines like mine,
    but it would change behaviour for every machine whose refinement is
    rejected, including those with no usable reference timer at all, and
    I have no data for those.
 3. pr_info() on the give-up path: keep, downgrade to pr_debug(), or drop?

Deliberately not addressed
 - The watchdog side. An earlier draft made the watchdog require a
   frequency skew to be confirmed by a second interval. The RTC
   measurement above rules that out: the watchdog is right when it sees
   this step, so forgiving the first interval would hide a real defect.
   Dropped.
 - Two refinement windows which are disturbed by the same amount would
   agree with each other and be installed. On the affected machine the
   step happens once per boot, so this was not observed; in general it
   is no worse than accepting a single sample, as the code does today.
 - The root cause, which is firmware and not the kernel: the TSC is
   apparently not restored correctly on the first C6 exit after a warm
   reset. BIOS 6254 (01/2026) is the latest for this board. A vendor bug
   report is the actual fix. This patch is about not letting a single
   unconfirmed measurement become permanent, which is a generic problem.
 - If the conclusion is that hardware which steps its TSC like this
   should simply lose the TSC clocksource, then say so and I will drop
   this. I would argue the other way: a one-off 0.9ms phase step during
   boot, followed by 0.1ppm over days, is not worth trading a 23ns
   clock_gettime() for a 1878ns one for the whole uptime, and it is
   currently a matter of timing whether a given boot survives it at all.

Tool transparency (Documentation/process/generated-content.rst)
 - The symptom was found by hand on my own machine: the TSC clocksource
   was lost on every warm reboot. The analysis, the instrumentation
   patches quoted above, this patch and this changelog were produced in a
   long interactive session with the AI assistant named in the
   Assisted-by tag - many prompts over several days, not a single
   generated diff. I supplied the symptoms, logs and measurements, asked
   for hypotheses and counter-arguments, and had the debug patches
   written whose output is quoted above. sparse and checkpatch.pl were
   run on the result.
 - I have read every line, built it, booted it, and I am answering review
   as its author.

 arch/x86/kernel/tsc.c | 60 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 723347e2c..b5b803950 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -341,6 +341,17 @@ __setup("tsc=", tsc_setup);
 #define MAX_RETRIES		5
 #define TSC_DEFAULT_THRESHOLD	0x20000
 
+/*
+ * Two frequency measurements are considered to describe the same clock
+ * when they agree within 2^-11 (~500ppm). That is the error bound of
+ * quick_pit_calibrate() and the skew which the clocksource watchdog
+ * tolerates between two CLOCK_SOURCE_CALIBRATED clocksources.
+ */
+#define TSC_FREQ_MATCH_SHIFT	11
+
+/* Maximum number of refined calibration samples */
+#define TSC_REFINE_MAX_SAMPLES	3
+
 /*
  * Read TSC and the reference counters. Take care of any disturbances
  */
@@ -1279,6 +1290,13 @@ int unsynchronized_tsc(void)
 	return 0;
 }
 
+static bool tsc_freq_matches(unsigned long a, unsigned long b)
+{
+	unsigned long hi = max(a, b), lo = min(a, b);
+
+	return hi - lo <= (hi >> TSC_FREQ_MATCH_SHIFT);
+}
+
 static void tsc_refine_calibration_work(struct work_struct *work);
 static DECLARE_DELAYED_WORK(tsc_irqwork, tsc_refine_calibration_work);
 /**
@@ -1292,15 +1310,19 @@ static DECLARE_DELAYED_WORK(tsc_irqwork, tsc_refine_calibration_work);
  *
  * If there are any calibration anomalies (too many SMIs, etc),
  * or the refined calibration is off by 1% of the fast early
- * calibration, we throw out the new calibration and use the
- * early calibration.
+ * calibration, or it deviates from the early calibration and
+ * cannot be reproduced, we throw out the new calibration and use
+ * the early calibration.
  */
 static void tsc_refine_calibration_work(struct work_struct *work)
 {
+	static unsigned long seen[TSC_REFINE_MAX_SAMPLES];
 	static u64 tsc_start = ULLONG_MAX, ref_start;
+	static unsigned int nr_seen;
 	static int hpet;
 	u64 tsc_stop, ref_stop, delta;
 	unsigned long freq;
+	unsigned int i;
 	int cpu;
 
 	/* Don't bother refining TSC on unstable systems */
@@ -1364,6 +1386,40 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 	if (abs(tsc_khz - freq) > tsc_khz/100)
 		goto out;
 
+	/*
+	 * tsc_read_refs() bounds the latency of the individual readouts, but
+	 * not what happens between them. If either counter is disturbed in the
+	 * middle of the window, e.g. the TSC steps forward once, then all
+	 * readouts are valid and the result is nevertheless off by hundreds of
+	 * ppm.
+	 *
+	 * The refined value is installed along with CLOCK_SOURCE_CALIBRATED,
+	 * which makes the clocksource watchdog apply its 500ppm limit. A
+	 * disturbed sample beyond that limit gets the TSC marked unstable in
+	 * the next watchdog period, which is worse than not refining at all.
+	 *
+	 * Therefore accept a sample only when it matches a previous
+	 * measurement, which is either the early calibration or an earlier
+	 * sample of the refinement. If no two measurements match, keep the
+	 * early calibration and leave the clocksource uncalibrated.
+	 */
+	if (!nr_seen)
+		seen[nr_seen++] = tsc_khz;
+
+	for (i = 0; i < nr_seen; i++) {
+		if (tsc_freq_matches(seen[i], freq))
+			break;
+	}
+
+	if (i == nr_seen) {
+		if (nr_seen == ARRAY_SIZE(seen)) {
+			pr_info("Refined TSC calibration not reproducible, using early calibration\n");
+			goto out;
+		}
+		seen[nr_seen++] = freq;
+		goto restart;
+	}
+
 	tsc_khz = freq;
 	pr_info("Refined TSC clocksource calibration: %lu.%03lu MHz\n",
 		(unsigned long)tsc_khz / 1000,

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3

