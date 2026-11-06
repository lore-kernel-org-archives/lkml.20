Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934543;
	b=FNtXHRgzk+X8mV7U/LM8CXbXGx7AIIcfx7pan3P690/8dGlybEzMGbZPGPp0qTomQT2G
	 VYLA7nMtl8Ij9MKEo8TQtxTrWWAoASpJ5dFyCStlnhSSr++fK/HPZuzRU5C7xHbP/Azca
	 Ke0UkidqHE1BPXAuUOTvCjQA90gBWYw1nTmbp956T4UMBmXcxuzd8Gni6V0G2Uoj7iv/6
	 ifLMy5/XPddHRFb1ZPwnFtbolV+bhljoA6vXNjbq2hWgJQoo7Pu767qnVqgRgSTLnxsIF
	 ncs9nbpqr+He5Mqk6NOzYppWK0/JLQD8JaT/etZKxI3zNBLZGYeZE3aHaINDSFEfrlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934543;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=/UEghncL3VXAQ5UxiKCYc4rLg17YbRhuMlpZPO93UaQ=;
	b=KFKXzTbNYwJ19MfmuxBW6qfvWn2/g5fiNdobyFrgKc7suxdsKykAsqQ/y42AjvisMZIS
	 LhhVJoqiy34hclifLJTIiQpNdnm7HEr2Wboj1c5jqa3kAhYAmAMqFwTG6P99O6pB8tOcK
	 mQzGvZlPd3dqVyqhv29YxRXnyD+rsBi+HzM9FqZVJntNe93wfwaGsOkYnKfm4+mwLUScD
	 kZtT/uqFmz+sqLLZY5awRz257rMmZLVSrFtgTNL+kMRmVrXPr+ASzeojQItZNGxdCfh+O
	 ti2pNxqCKZyOlI/WY637G1VXPFG9gSF+fNFLWjmSfDuutal2fL43ynOtLIMgtBNgbRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Cyhotmb5;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C43606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Cyhotmb5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=/UEghncL3VXAQ5UxiKCYc4rLg17YbRhuMlpZPO93UaQ=; b=Cyhotmb5w+q7SIMRvPHIzmwhIQ
	0N8a06HSGhWe81kaqVWI8adeCOhVG16xmNpyCy1Mv78kRAdSzk1O3gseRstvXlysAzS1EkMHCe2uS
	xrL/SHoZM6XPu6ecLIJw12DpAbhOSduRHa21g8eLMJffCalbvbIdPuiiHwJV/8LSLBLbU5fQQNHLo
	0Omgttw0jSgeUDyVxJLSZGiB1NOdM8gPO8QBW9Bu9VHGpzSYvijoQqCZ89G0izVO9wvk2yL9NfAgB
	LLUagfO+lzathuJoBbBRRzZ8FUmexpxUVi1qucs4a1P+aSdOXvLTSBZjS6Nx0KhiIjCp2c83RBgQt
	gCRXmtPw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK1-0000000FwPj-1jZe;
	Fri, 06 Nov 2026 03:08:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGU-0uBx;
	Fri, 06 Nov 2026 03:08:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jie Wang <jie.wang@intel.com>,
	Yuan Wang <yuan1.wang@intel.com>,
	Ryan Luu <rluu@amazon.com>,
	Julien Ridoux <ridouxj@amazon.com>,
	linux-kernel@vger.kernel.org,
	nh-open-source@amazon.com,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 4/6] timekeeping: Reinstate proportional correction of ntp_error
Date: Thu,  5 Nov 2026 19:08:53 -0800
Message-ID: <20261106030856.2538039-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106030856.2538039-1-dwmw2@infradead.org>
References: <20261106030856.2538039-1-dwmw2@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The +0/+1 mult dithering is sufficient to keep ntp_error at zero once
it's already there, but it doesn't do much to reduce it once any
significant ntp_error has accumulated (e.g. from frequency or phase
adjustments) — it can typically only drain single-digit nanoseconds
per second, only in one direction, and potentially not at all when the
mult division is exact. Commit dc491596f639 ("timekeeping: Rework
frequency adjustments to work better w/ nohz") removed a larger skew
because in a tickless kernel, it would remain in effect for a full
idle period and overshoot. Now that timekeeping_max_deferment()
ensures that the system wakes at the top of the second when skew is
active, the correction can be reinstated. If ntp_error exceeds an
amount that a single +1 change to mult can drain within a minute, add
an additional bias to mult to close the gap over ~10 seconds.

The deliberate frequency excursion this causes is bounded. In correct
operation the only remaining source of significant ntp_error is mult
quantisation drift across tickless idle, which accrues at well under
one mult-LSB-second per second and is bounded by the clocksource's
maximum idle deferment, so the drain engages rarely and at single-digit
ppm for ~10s; the worst error observed in the wild (83µs, from an
accounting bug since fixed) would drain at 8.3ppm. A clamp caps the
drain at 50ppm — an order of magnitude below the 500ppm adjtime()
slew rate — purely so that any future accounting bug results in a
slow, bounded drain rather than an unbounded frequency excursion
visible to NTP daemons measuring the clock; errors above 500µs simply
take proportionally longer than the 10 second horizon to repay.

The drain, like a slew, relies on the per-second wakeup from
timekeeping_max_deferment(). It is sized during accumulation, which may
be running from an idle CPU's interrupt with the do_timer duty vacant
and its last holder asleep on a long timer — so claim the vacant duty
there too, as __do_adjtimex() does when starting a slew.

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
v2: Describe the dithering as +0/+1 rather than ±1 (Miroslav). Clamp
    the drain at 50ppm instead of maxadj/4, and document the bounded
    frequency excursion in the commit message; the clamp also bounds
    the extrapolation arithmetic in patch 6. Spell the negative-drain
    wakeup test explicitly instead of via a u32 cast (Sashiko). Claim
    the do_timer duty when the drain engages, as patch 3 now does for
    slews.

 include/linux/timekeeper_internal.h |  5 +-
 kernel/time/timekeeping.c           | 73 +++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 6 deletions(-)

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
index 667b4c2817b5..1f3fde0c37b2 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -326,6 +326,22 @@ static inline void clocksource_disable_inline_read(void) { }
 static inline void clocksource_enable_inline_read(void) { }
 #endif
 
+/*
+ * The proportional ntp_error drain engages when the error exceeds
+ * TK_NTP_ERR_THRESH seconds' worth of the +0/+1 dither's delivery (so
+ * noise the dither handles alone never wakes the CPU), and then
+ * repays over ~TK_NTP_ERR_HORIZON seconds. The drain rate is capped
+ * at TK_NTP_ERR_MAX_PPM: in correct operation it is unreachable (the
+ * worst error ever observed, 83µs from a since-fixed accounting bug,
+ * drains at 8.3ppm), so it exists purely to bound the frequency
+ * excursion any future accounting bug could inflict on NTP daemons
+ * measuring the clock. Errors above 500µs just take proportionally
+ * longer than the usual horizon to repay.
+ */
+#define TK_NTP_ERR_THRESH	60
+#define TK_NTP_ERR_HORIZON	10
+#define TK_NTP_ERR_MAX_PPM	50
+
 /**
  * tk_setup_internals - Set up internals to use clocksource clock.
  *
@@ -423,6 +439,7 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 	tk->tkr_mono.mult = clock->mult;
 	tk->tkr_raw.mult = clock->mult;
 	tk->ntp_err_mult = 0;
+	tk->err_drain = 0;
 	tk->skip_second_overflow = 0;
 	tk->skew_delta = 0;
 
@@ -831,6 +848,7 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 
 	if (action & TK_CLEAR_NTP) {
 		tk->ntp_error = 0;
+		tk->err_drain = 0;
 		ntp_clear(tk->id, tk->cs_tick_adj);
 	}
 
@@ -1980,11 +1998,12 @@ u64 timekeeping_max_deferment(void)
 
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
+		if (abs(tk->skew_delta) > 1 ||
+		    tk->ntp_err_mult < 0 || tk->ntp_err_mult > 1) {
 			u64 nsec_in_sec = tk->tkr_mono.xtime_nsec >>
 					  tk->tkr_mono.shift;
 			u64 remaining = NSEC_PER_SEC - min_t(u64, nsec_in_sec,
@@ -2254,6 +2273,7 @@ void timekeeping_resume(void)
 	tks->tkr_raw.cycle_last  = cycle_now;
 
 	tks->ntp_error = 0;
+	tks->err_drain = 0;
 	timekeeping_suspended = 0;
 	timekeeping_update_from_shadow(&tk_core, TK_CLOCK_WAS_SET);
 	raw_spin_unlock_irqrestore(&tk_core.lock, flags);
@@ -2509,7 +2529,16 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
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
@@ -2552,6 +2581,7 @@ static inline unsigned int accumulate_nsecs_to_secs(struct timekeeper *tk)
 {
 	u64 nsecps = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;
 	unsigned int clock_set = 0;
+	bool crossed = false;
 
 	while (tk->tkr_mono.xtime_nsec >= nsecps) {
 		int leap;
@@ -2584,6 +2614,39 @@ static inline unsigned int accumulate_nsecs_to_secs(struct timekeeper *tk)
 
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
+			s32 max_drain = (u64)tk->tkr_mono.clock->mult *
+					TK_NTP_ERR_MAX_PPM / 1000000;
+
+			tk->err_drain = clamp_t(s64,
+						div64_s64(tk->ntp_error,
+							  lsb_sec * TK_NTP_ERR_HORIZON),
+						-max_drain, max_drain);
+
+			/*
+			 * This accumulation may be running from an idle
+			 * CPU's interrupt (jiffies catch-up). Make sure
+			 * some CPU will honour the per-second deferment
+			 * bound while the drain is active.
+			 */
+			if (tk->err_drain)
+				tick_nohz_claim_do_timer();
+		}
 	}
 	return clock_set;
 }
-- 
2.43.0

