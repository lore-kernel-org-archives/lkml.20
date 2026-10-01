Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A0347CA74
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886116; cv=none; b=uNx0hXMNf8eLg52WJe2wv4idZm5EAWSGLRLqt30ns19R6pxi3kPA/nSVTco64RrK1PgkCUsVB5RCpliuWaD5vNIxptqQX5p8uJnatmjMbz19I1sBZn1RLVlbOiyvEPAdGBj8cuPxjCBVIPQ10mEZe80atIMug7+HraHrcb2TfdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886116; c=relaxed/simple;
	bh=STsv8mYR/skHUAcnDs/T4Dr4IqZug3p1vHr97zyBt9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpEVl0/HccK35mRFl2RYl9Pm8hSzgWz55lyIerBAk+AgJSxaTs37QD8ItW0LnI1r5Lp6TbbnPVi0KLunAM2J7C6BeU79aIrCBWcqhBtZua7iGBE/dbyThyDzkSwG1d/1PKxFHhUj32AeFc1fV2YEow2V1bBuWJOZtZ/WhDw4pkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BWWHBpNd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BWWHBpNd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=ktfteUPM+fKqcRrgffTCCkvTkLLirAKuUFhvxIKlSmk=; b=BWWHBpNdXJ05ZDF/6CtKjSGZGB
	sx4jtBidVxlKbc66SeCwu92F1kDzW1wbCioB+YfMOlc966Gpf0II3Cv12iehoPj25A1pmuRc+Qd34
	51aA+QZSIhp3mrD1gopZ3KtoD9f/8W9qlkaFkzVfnYmhOGGvJ8ImQmNRy0r0ZI2YXdIYZzMOe+YUQ
	X848GhtDpl+MbWnOFfPFRttvU48YU13n1NuiDOBvEp9NJ97BKzUZngrpK2N2Bsw2Uxx77bOO0MegR
	+A3Bwei/IO4oqwYZpojGa9hc1eeKSr8LwVg6u4nW2+uHo67j3dHvcItRZTIt2mP7BBir+YPPWUw80
	zkjWXXVg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCNHg-00000005MQ6-1xei;
	Thu, 01 Oct 2026 20:21:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pc-3ulb;
	Thu, 01 Oct 2026 21:21:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Ryan Luu <rluu@amazon.com>,
	Julien Ridoux <ridouxj@amazon.com>,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 4/5] timekeeping: Reinstate proportional correction of ntp_error
Date: Thu,  1 Oct 2026 21:21:33 +0100
Message-ID: <20261001202134.33929-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001202134.33929-1-dwmw2@infradead.org>
References: <20261001202134.33929-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The ±1 mult dithering is sufficient to keep ntp_error at zero once
it's already there, but it doesn't do much to reduce it once any
significant ntp_error has accumulated (e.g. from frequency or phase
adjustments) — it can typically only drain single-digit nanoseconds
per second. Commit dc491596f639 ("timekeeping: Rework frequency
adjustments to work better w/ nohz") removed a larger skew because in
a tickless kernel, it would remain in effect for a full idle period
and overshoot. Now that timekeeping_max_deferment() ensures that the
system wakes at the top of the second when skew is active, the
correction can be reinstated. If ntp_error exceeds an amount that a
single ±1 change to mult can drain within a minute, add an
additional bias to mult to close the gap.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 include/linux/timekeeper_internal.h |  5 ++-
 kernel/time/timekeeping.c           | 55 ++++++++++++++++++++++++++---
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
index fe077d97b5f8..85d123bcb270 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -97,6 +97,8 @@ struct tk_read_base {
  * @ntp_error_shift:		Shift conversion between clock shifted nano seconds and
  *				ntp shifted nano seconds.
  * @ntp_err_mult:		Multiplication factor for scaled math conversion
+ * @err_drain:			Extra mult bias repaying ntp_error beyond the
+ *				dither's reach; sized at second boundaries
  * @cs_tick_adj:		Per-second adjustment handed to NTP via ntp_clear()
  *				accounting for the difference between the nominal
  *				NTP interval and the real time taken by the
@@ -186,7 +188,8 @@ struct timekeeper {
 	u64			ntp_tick;
 	s64			ntp_error;
 	u32			ntp_error_shift;
-	u32			ntp_err_mult;
+	s32			ntp_err_mult;
+	s32			err_drain;
 	s64			cs_tick_adj;
 	u32			skip_second_overflow;
 	s64			skew_delta;
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 986649cae46d..48d916a6c433 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -325,6 +325,15 @@ static inline void clocksource_disable_inline_read(void) { }
 static inline void clocksource_enable_inline_read(void) { }
 #endif
 
+/*
+ * The proportional ntp_error drain engages when the error exceeds
+ * TK_NTP_ERR_THRESH seconds' worth of the ±1 dither's delivery (so
+ * noise the dither handles alone never wakes the CPU), and then
+ * repays over ~TK_NTP_ERR_HORIZON seconds.
+ */
+#define TK_NTP_ERR_THRESH	60
+#define TK_NTP_ERR_HORIZON	10
+
 /**
  * tk_setup_internals - Set up internals to use clocksource clock.
  *
@@ -422,6 +431,7 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 	tk->tkr_mono.mult = clock->mult;
 	tk->tkr_raw.mult = clock->mult;
 	tk->ntp_err_mult = 0;
+	tk->err_drain = 0;
 	tk->skip_second_overflow = 0;
 	tk->skew_delta = 0;
 
@@ -830,6 +840,7 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 
 	if (action & TK_CLEAR_NTP) {
 		tk->ntp_error = 0;
+		tk->err_drain = 0;
 		ntp_clear(tk->id, tk->cs_tick_adj);
 	}
 
@@ -1977,11 +1988,11 @@ u64 timekeeping_max_deferment(void)
 
 		/*
 		 * Skew introduced for phase offset is intended to be
-		 * recalculated each second. Ensure a tickless kernel
-		 * wakes up for that and does not overshoot, while skew
-		 * is being applied.
+		 * recalculated each second, as is the proportional
+		 * ntp_error drain. Ensure a tickless kernel wakes up
+		 * for that and does not overshoot.
 		 */
-		if (abs(tk->skew_delta) > 1) {
+		if (abs(tk->skew_delta) > 1 || (u32)tk->ntp_err_mult > 1) {
 			u64 nsec_in_sec = tk->tkr_mono.xtime_nsec >>
 					  tk->tkr_mono.shift;
 			u64 remaining = NSEC_PER_SEC - min_t(u64, nsec_in_sec,
@@ -2251,6 +2262,7 @@ void timekeeping_resume(void)
 	tks->tkr_raw.cycle_last  = cycle_now;
 
 	tks->ntp_error = 0;
+	tks->err_drain = 0;
 	timekeeping_suspended = 0;
 	timekeeping_update_from_shadow(&tk_core, TK_CLOCK_WAS_SET);
 	raw_spin_unlock_irqrestore(&tk_core.lock, flags);
@@ -2493,7 +2505,16 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 	 * tick division, the clock will slow down. Otherwise it will stay
 	 * ahead until the tick length changes to a non-divisible value.
 	 */
-	tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
+	/* Drop the ntp_error drain the moment it overshoots */
+	if (tk->err_drain &&
+	    (((s64)tk->err_drain ^ tk->ntp_error) < 0 || !tk->ntp_error))
+		tk->err_drain = 0;
+
+	if (tk->err_drain)
+		tk->ntp_err_mult = tk->err_drain;
+	else
+		tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
+
 	mult += tk->ntp_err_mult;
 
 	timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
@@ -2536,6 +2557,7 @@ static inline unsigned int accumulate_nsecs_to_secs(struct timekeeper *tk)
 {
 	u64 nsecps = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;
 	unsigned int clock_set = 0;
+	bool crossed = false;
 
 	while (tk->tkr_mono.xtime_nsec >= nsecps) {
 		int leap;
@@ -2568,6 +2590,29 @@ static inline unsigned int accumulate_nsecs_to_secs(struct timekeeper *tk)
 
 			clock_set = TK_CLOCK_WAS_SET;
 		}
+
+		crossed = true;
+	}
+
+	/*
+	 * Core timekeeper only; aux timekeepers are not covered by the
+	 * timekeeping_max_deferment() wakeup which re-sizes the drain
+	 * each second before it can overshoot.
+	 */
+	if (crossed && tk->id == TIMEKEEPER_CORE) {
+		/* Re-size the proportional ntp_error drain for this second */
+		s64 lsb_sec = ((s64)tk->cycle_interval <<
+			       tk->ntp_error_shift) * NTP_INTERVAL_FREQ;
+
+		tk->err_drain = 0;
+		if (abs(tk->ntp_error) > lsb_sec * TK_NTP_ERR_THRESH) {
+			s32 headroom = tk->tkr_mono.clock->maxadj / 4;
+
+			tk->err_drain = clamp_t(s64,
+						div64_s64(tk->ntp_error,
+							  lsb_sec * TK_NTP_ERR_HORIZON),
+						-headroom, headroom);
+		}
 	}
 	return clock_set;
 }
-- 
2.43.0

