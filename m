Received: from out30-83.freemail.mail.aliyun.com (out30-83.freemail.mail.aliyun.com [115.124.30.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC44A13B6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865842; cv=none; b=JpyKD1+8EJ00Xzebr5lgKiJvZtdT44RRGkavWMjWTIiYWgsVDc3MqJUDZtAV0dxe5NQqfv1Pg/MVJaDgm/dBBi9GDRACgFN1chrPQE0DU7HSHrII8jjwhpvN1L25dfwn+VHxTGiiPiLtktdbqYfbbDUuDXtk63zRC2DIZ136DS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865842; c=relaxed/simple;
	bh=VUP62x7VkwcFvMf2uv2PmRlwHg3MFInNtlkOONvtKsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FG1mZwui0x4rFae8v9/StTKiq1RkKsM98imqFS5ZFen8VjgMbq4IoS4wGUlCVLBiw2uZct1Mg9Y2v365+THw/G+rsXtNSJCcoBsDBfDXKWQOaaxIuenV9dmpofhl9Vj/LZwI0ttKnEnjnQH4f804Utsj2ZifurJqAt/lTdA2ivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aliyun.com; spf=pass smtp.mailfrom=aliyun.com; dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b=BFnyO0Tz; arc=none smtp.client-ip=115.124.30.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="BFnyO0Tz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1788865835; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=RfQ8lm0dz5TmzGagtJOcmKA+g4Te7Nv/belQ/XROTTc=;
	b=BFnyO0TzOmKBGojMKV72qEtyHKlL9tOhCKdR4oCF6PP7k+868+CX8j524rM+4UPsnkJKHVkMPlwWhUe64kzdlv/v46lA4AsaJ+bOANij6siN1yvTvcBnbE3aSHspyEF6yQpJdSUVi8AzzbzQ8tpGwxR5Kvfyggk3gafwIUWF3+w=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07492555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0144784-0.00167783-0.983844;FP=12876136704186581242|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=wdhh6@aliyun.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---0XAbJoBY_1788865827;
Received: from localhost.localdomain(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0XAbJoBY_1788865827 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 19:10:34 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: jstultz@google.com,
	tglx@kernel.org,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Chaohai Chen <wdhh6@aliyun.com>
Subject: [PATCH] clocksource: Require consecutive frequency skew samples before demotion
Date: Tue,  8 Sep 2026 19:10:16 +0800
Message-ID: <20260908111017.3277404-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocksource watchdog marks a clocksource unstable as soon as a single
frequency comparison against the watchdog clocksource exceeds the allowed
skew:

	if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
		return true;
	watchdog_data.result = WD_FREQ_SKEWED;

While the readout window is already protected against transient
disturbances (SMIs, NMIs, long IRQs, vCPU preemption) via the
WATCHDOG_READOUT_MAX_NS check and WATCHDOG_FREQ_RETRIES, the frequency
skew decision itself has no hysteresis: a single outlier sample is enough
to demote the clocksource. This demotion is irreversible at runtime -
the rating is cleared to 0, CLOCK_SOURCE_VALID_FOR_HRES is dropped, and on
x86 the one-shot tsc_unstable latch prevents any recovery.

A single skew sample can be produced by a transient glitch of the
watchdog clocksource itself (HPET/PMTMR are not immune to hiccups or
errata) rather than by an actual defect of the watched clocksource.
On such systems a healthy TSC gets demoted to HPET/PMTMR by mistake,
causing a significant, non-recoverable performance regression on
production machines that cannot be rebooted.

Add hysteresis to the frequency skew decision: only demote a clocksource
after wd_freq_skew_confirm consecutive skew samples. Any in-tolerance
sample, or a watchdog reset (first round, resume, or an over-long delta),
clears the per-clocksource counter. A new WD_FREQ_SKEW_PENDING result is
used to skip both demotion and high-res enablement while the streak is
being confirmed.

The threshold defaults to 3 and is tunable via the
clocksource.wd_freq_skew_confirm module parameter (also usable on the
kernel command line and writable at runtime through
/sys/module/clocksource/parameters/wd_freq_skew_confirm), clamped to
[1, 16]. A value of 1 restores the previous "single skew kills" behaviour,
so the default (3) is the only behavioural change and existing setups can
opt back into the old semantics.

Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 include/linux/clocksource.h |  2 +
 kernel/time/clocksource.c   | 76 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 283d7297aa79..0703f27f1c08 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -106,6 +106,7 @@ struct clocksource_hw_snapshot {
  * @wd_list:		List head to enqueue into the watchdog list (internal)
  * @cs_last:		Last clocksource value for clocksource watchdog
  * @wd_last:		Last watchdog value corresponding to @cs_last
+ * @wd_skew_count:	Consecutive frequency skew samples seen by the watchdog
  * @owner:		Module reference, must be set by clocksource in modules
  *
  * Note: This struct is not used in hotpathes of the timekeeping code
@@ -151,6 +152,7 @@ struct clocksource {
 	u64			cs_last;
 	u64			wd_last;
 	unsigned int		wd_cpu;
+	unsigned int		wd_skew_count;
 #endif
 	struct module		*owner;
 };
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f1253f5795c6..939620da410c 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/kstrtox.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/prandom.h>
@@ -153,6 +154,47 @@ static atomic_t watchdog_reset_pending;
 /* Number of attempts to read the watchdog */
 #define WATCHDOG_FREQ_RETRIES		3
 
+/*
+ * Number of consecutive frequency skew detections required before a
+ * clocksource is marked unstable. A single skew sample can be caused by a
+ * transient disturbance of the watchdog clocksource itself (e.g. HPET/PMTMR
+ * hiccups) or by a rare readout artefact that slips past the readout window
+ * check. Requiring several consecutive skew samples adds hysteresis and
+ * greatly reduces the chance of demoting an otherwise healthy clocksource
+ * (typically the TSC) by mistake. A single good sample clears the count.
+ *
+ * Can be tuned via the "clocksource.wd_freq_skew_confirm" module parameter
+ * (also as a kernel command line option). Clamped to [1, 16]; 1 restores the
+ * legacy "single skew kills" behaviour.
+ */
+#define WATCHDOG_FREQ_SKEW_CONFIRM_DEFAULT	3
+#define WATCHDOG_FREQ_SKEW_CONFIRM_MAX		16
+
+static unsigned int wd_freq_skew_confirm = WATCHDOG_FREQ_SKEW_CONFIRM_DEFAULT;
+
+static int wd_freq_skew_confirm_set(const char *val, const struct kernel_param *kp)
+{
+	unsigned int n;
+	int ret;
+
+	ret = kstrtouint(val, 0, &n);
+	if (ret)
+		return ret;
+	if (n < 1 || n > WATCHDOG_FREQ_SKEW_CONFIRM_MAX)
+		return -EINVAL;
+	*((unsigned int *)kp->arg) = n;
+	return 0;
+}
+
+static const struct kernel_param_ops wd_freq_skew_confirm_ops = {
+	.set = wd_freq_skew_confirm_set,
+	.get = param_get_uint,
+};
+module_param_cb(wd_freq_skew_confirm, &wd_freq_skew_confirm_ops,
+		&wd_freq_skew_confirm, 0644);
+MODULE_PARM_DESC(wd_freq_skew_confirm,
+		 "Consecutive frequency skew samples required to mark a clocksource unstable (1-16, default 3)");
+
 /* Five reads local and remote for inter CPU skew detection */
 #define WATCHDOG_REMOTE_MAX_SEQ		10
 
@@ -248,6 +290,7 @@ enum wd_result {
 	WD_FREQ_NO_WATCHDOG,
 	WD_FREQ_TIMEOUT,
 	WD_FREQ_RESET,
+	WD_FREQ_SKEW_PENDING,
 	WD_FREQ_SKEWED,
 	WD_CPU_TIMEOUT,
 	WD_CPU_SKEWED,
@@ -509,8 +552,21 @@ static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
 		 * value of the maximum delta plus the watchdog readout
 		 * time.
 		 */
-		if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
+		if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq) {
+			/* Good sample: clear any pending skew streak. */
+			cs->wd_skew_count = 0;
 			return true;
+		}
+
+		/*
+		 * Skew detected. Require several consecutive skew samples
+		 * before demoting the clocksource to avoid marking a healthy
+		 * clocksource unstable due to a transient watchdog glitch.
+		 */
+		if (++cs->wd_skew_count < READ_ONCE(wd_freq_skew_confirm)) {
+			watchdog_data.result = WD_FREQ_SKEW_PENDING;
+			return false;
+		}
 
 		watchdog_data.result = WD_FREQ_SKEWED;
 		return false;
@@ -520,6 +576,7 @@ static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
 	return false;
 
 reset:
+	cs->wd_skew_count = 0;
 	cs->flags |= CLOCK_SOURCE_WATCHDOG;
 	watchdog_data.result = WD_FREQ_RESET;
 	return false;
@@ -584,6 +641,14 @@ static void watchdog_print_freq_skew(struct clocksource *cs)
 	pr_warn("Clocksource %20s interval: %16lluns\n", cs->name, watchdog_data.cs_delta);
 }
 
+static void watchdog_print_freq_skew_pending(struct clocksource *cs)
+{
+	if (!__ratelimit(&ratelimit_state))
+		return;
+	pr_info("Clocksource %s frequency skew observed (%u/%u), deferring demotion\n",
+		cs->name, cs->wd_skew_count, READ_ONCE(wd_freq_skew_confirm));
+}
+
 static void watchdog_handle_remote_timeout(struct clocksource *cs)
 {
 	pr_info_once("Watchdog remote CPU %u read timed out\n", watchdog_data.curr_cpu);
@@ -623,6 +688,15 @@ static void watchdog_check_result(struct clocksource *cs)
 		 */
 		return;
 
+	case WD_FREQ_SKEW_PENDING:
+		/*
+		 * Skew detected but the consecutive confirmation threshold
+		 * has not been reached yet. Keep observing; do not demote and
+		 * do not enable high-res based on this cycle.
+		 */
+		watchdog_print_freq_skew_pending(cs);
+		return;
+
 	case WD_FREQ_SKEWED:
 		watchdog_print_freq_skew(cs);
 		break;
-- 
2.43.7

