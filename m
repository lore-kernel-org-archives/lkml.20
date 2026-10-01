Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C535E956
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886115; cv=none; b=isgBOfpMUEYlFjr0109pIDuJHtjhfpyxeZwnsgMvlmVs/lng/uexk/Y6s6w/6XvrFZKP5oafTK5Q1r44g5nSn8lBPziX1KckmJ4ODYqlikpdo2bnDY9OzSZudMRA1taVqYiO8ehh9Ky/fE1RVQst3fK82KOP0DkoJ7PSO8NxNVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886115; c=relaxed/simple;
	bh=9VsLICFP/vI8dVODVI2Y8r8NxpGQ2qdmo4RXIfL0wMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7G/VcxdcI6sM5JZEFgCn5aFzDCibye2PeBW4sV//dTvIKcjDpECLldkW0ztYk/W96ZYqZDPXx01WtE2MSDPgmpZAwSaLxX5+t8CavyEfdDJS0KsmMCNsqeV7WIBA8hH+V+xqF35iL7+K5eV/kmrJoz/HJcU791g78r/cZV26gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ma2hPQ2c; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ma2hPQ2c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=iqvdFrr96lHXEBo6h+1QiwCKqQ9jLbgQn7yOeKP3Enc=; b=ma2hPQ2cbspM1RKueFEFHAkX9p
	3NWendFE/W/4DWvpSsQi+IE895hPXrgyl8jAqm+sB5vKRtdjaBcXonqn1rESolCNhjD3OTvPI/g3h
	N9VIgl10rvZCghg4mCeJ1EZx4E0EV0X6NVd5siNMNGaov4CcoAo9PvNQbjB2MznzpiL+DxXwRWQio
	6irKCquRHxUaDWkcuZlG8vHiAtyzvyyRdGNaSuj7M73xwM7gpCa58Uq2jky0Mas9xhIgvvv2OpRSH
	A7SN04vbZ1bXjlpaVLwo97MX5sT9QYBn18tRNVEaQ2c4n1ZpxhB3l6oJ54i05ds0pwmEfQ3mS58ZQ
	Oobg/p7g==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCNHg-00000005MQ7-1xtw;
	Thu, 01 Oct 2026 20:21:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pg-43kv;
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
Subject: [PATCH 5/5] [DO NOT MERGE] timekeeping: Apply extrapolated ntp_error to clock snapshots
Date: Thu,  1 Oct 2026 21:21:34 +0100
Message-ID: <20261001202134.33929-6-dwmw2@infradead.org>
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

The time reported in ::systime of a system_time_snapshot is known to be
slightly inaccurate because of the way that the reported realtime clock
sawtooths around the *intended* time series, limited by the integer mult
value used to calculate the inter-tick times, and designed to ensure
smoothness and monotonicity for its consumers.

It is particularly inaccurate in a tickless kernel, where ntp_err_mult
is not adjusted on each tick, allowing the reported clock to diverge
from the intended time for a large number of ticks before re-converging.

This appears to be the reason why CONFIG_NTP_PPS is not enabled on
tickless kernels — because at that scale of precision, the realtime
snapshot at the time of the pulse bears little relation to the time the
kernel *actually* believes it to be, thus introducing random errors into
the PPS phase correction.

It would be better for callers of get_device_system_crosststamp() and
ktime_get_snapshot_id() to receive the *accurate* time, not the
sanitized version provided to gettimeofday().

Compute the deviation in snapshot_ntp_error() and add it to the returned
::systime so the snapshot lands on the ideal line. It sums four terms in
ns << NTP_SCALE_SHIFT before converting to signed ns:

  - tk->ntp_error, the deviation as of the last update;
  - (cycle_delta * ntp_err_frac), the fractional-mult drift accrued
    since then (cycle_delta is at most a tick on a tickful kernel, but
    many ticks' worth under NO_HZ);
  - (cycle_delta * ntp_err_mult), subtracting the applied +1 mult dither
    over the same span;
  - the sub-nanosecond fraction dropped when the read was truncated to
    whole ns (low shift bits, exact despite the multiply overflowing).

The helper uses the timekeeper selected for the requested clock id, so
all NTP-disciplined clocks are corrected, including the AUX clocks (each
has its own NTP instance); only CLOCK_MONOTONIC_RAW is undisciplined and
gets no correction. The residual is then a single clocksource cycle, the
same bound as a tickful kernel.

Note that this *unconditionally* changes the ::systime returned by all
snapshot and cross timestamp consumers (PTP SYS_OFFSET_PRECISE/EXTENDED,
etc.): it is now the ideal NTP-disciplined time rather than the raw
accumulated clock.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 include/linux/timekeeper_internal.h |  5 ++
 kernel/time/timekeeping.c           | 71 +++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
index 85d123bcb270..1f69479dd846 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -99,6 +99,10 @@ struct tk_read_base {
  * @ntp_err_mult:		Multiplication factor for scaled math conversion
  * @err_drain:			Extra mult bias repaying ntp_error beyond the
  *				dither's reach; sized at second boundaries
+ * @ntp_err_frac:		Fractional part of the per-cycle NTP-ideal mult that the
+ *				integer @mult truncates, as a fraction of 2^32 in
+ *				clock-shifted nanoseconds per cycle. Describes the
+ *				working point of the +-1 mult dither.
  * @cs_tick_adj:		Per-second adjustment handed to NTP via ntp_clear()
  *				accounting for the difference between the nominal
  *				NTP interval and the real time taken by the
@@ -190,6 +194,7 @@ struct timekeeper {
 	u32			ntp_error_shift;
 	s32			ntp_err_mult;
 	s32			err_drain;
+	u64			ntp_err_frac;
 	s64			cs_tick_adj;
 	u32			skip_second_overflow;
 	s64			skew_delta;
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 48d916a6c433..83c3e5ef9c5f 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -431,6 +431,7 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 	tk->tkr_mono.mult = clock->mult;
 	tk->tkr_raw.mult = clock->mult;
 	tk->ntp_err_mult = 0;
+	tk->ntp_err_frac = 0;
 	tk->err_drain = 0;
 	tk->skip_second_overflow = 0;
 	tk->skew_delta = 0;
@@ -1241,6 +1242,55 @@ static inline u64 tk_clock_read_snapshot(const struct tk_read_base *tkr,
 	return clock->read(clock);
 }
 
+/*
+ * snapshot_ntp_error - record how far a snapshot's ::systime is from the
+ * ideal NTP-disciplined time at @now, in signed nanoseconds, so a caller
+ * can land exactly on the ideal line by adding it to ::systime.
+ *
+ * The value is summed in ns << NTP_SCALE_SHIFT from four parts:
+ *
+ *  - tk->ntp_error, the deviation accumulated as of the last timekeeping
+ *    update (tkr_mono.cycle_last);
+ *  - (cycle_delta * ntp_err_frac), the fractional-mult drift accrued over
+ *    the cycles read since then -- at most a tick on a tickful kernel, but
+ *    potentially many ticks' worth under NO_HZ;
+ *  - (cycle_delta * ntp_err_mult), subtracting the applied +1 mult dither
+ *    over the same span;
+ *  - the sub-nanosecond fraction that ::systime dropped when the read was
+ *    truncated to whole ns (the low @shift bits, exact even though the
+ *    multiply overflows).
+ *
+ * CLOCK_MONOTONIC_RAW is not NTP-disciplined and carries no error. Every
+ * other clock id uses its own timekeeper @tk -- including the AUX clocks,
+ * which each have their own NTP instance.
+ */
+static s64 snapshot_ntp_error(const struct timekeeper *tk, clockid_t clock_id,
+			      u64 now)
+{
+	u64 cycle_delta;
+	u32 nes;
+	s64 tmp, err;
+
+	if (clock_id == CLOCK_MONOTONIC_RAW)
+		return 0;
+
+	cycle_delta = (now - tk->tkr_mono.cycle_last) & tk->tkr_mono.mask;
+	nes = tk->ntp_error_shift;
+
+	/* Insane deltas from marginal clocksources: skip the extrapolation */
+	if (unlikely(cycle_delta > tk->tkr_mono.clock->max_cycles))
+		return tk->ntp_error >> NTP_SCALE_SHIFT;
+
+	err = tk->ntp_error;
+	err += ((s64)mul_u64_u64_shr(cycle_delta, tk->ntp_err_frac, 32) -
+		(s64)cycle_delta * tk->ntp_err_mult) << nes;
+
+	tmp = (s64)(cycle_delta * tk->tkr_mono.mult + tk->tkr_mono.xtime_nsec);
+	tmp &= (1ULL << tk->tkr_mono.shift) - 1;
+	err += tmp << nes;
+
+	return (err + (1LL << (NTP_SCALE_SHIFT - 1))) >> NTP_SCALE_SHIFT;
+}
 
 /**
  * ktime_get_snapshot_id -  Simultaneously snapshot a given clock ID with
@@ -1264,6 +1314,7 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
 {
 	ktime_t base_raw, base_sys, offs_sys, *offs, offs_zero = 0;
 	u64 nsec_raw, nsec_sys, now;
+	s64 ntp_error;
 	struct timekeeper *tk;
 	struct tk_data *tkd;
 	unsigned int seq;
@@ -1326,10 +1377,12 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
 
 		nsec_sys = timekeeping_cycles_to_ns(&tk->tkr_mono, now);
 		nsec_raw = timekeeping_cycles_to_ns(&tk->tkr_raw, now);
+
+		ntp_error = snapshot_ntp_error(tk, clock_id, now);
 	} while (read_seqcount_retry(&tkd->seq, seq));
 
 	systime_snapshot->cycles = now;
-	systime_snapshot->systime = ktime_add_ns(base_sys, offs_sys + nsec_sys);
+	systime_snapshot->systime = ktime_add_ns(base_sys, offs_sys + nsec_sys) + ntp_error;
 	systime_snapshot->monoraw = ktime_add_ns(base_raw, nsec_raw);
 
 	/*
@@ -1581,6 +1634,7 @@ int get_device_system_crosststamp(int (*get_time_fn)
 	ktime_t base_sys, base_raw, *offs;
 	u32 clock_was_set_seq = 0;
 	u64 nsec_sys, nsec_raw;
+	s64 ntp_error;
 	u8 cs_was_changed_seq;
 	unsigned int seq;
 	bool do_interp;
@@ -1647,9 +1701,10 @@ int get_device_system_crosststamp(int (*get_time_fn)
 
 		nsec_sys = timekeeping_cycles_to_ns(&tk->tkr_mono, cycles);
 		nsec_raw = timekeeping_cycles_to_ns(&tk->tkr_raw, cycles);
+		ntp_error = snapshot_ntp_error(tk, xtstamp->clock_id, cycles);
 	} while (read_seqcount_retry(&tkd->seq, seq));
 
-	xtstamp->sys_systime = ktime_add_ns(base_sys, nsec_sys);
+	xtstamp->sys_systime = ktime_add_ns(base_sys, nsec_sys) + ntp_error;
 	xtstamp->sys_monoraw = ktime_add_ns(base_raw, nsec_raw);
 
 	/*
@@ -2460,6 +2515,7 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 {
 	u64 ntp_tl = ntp_tick_length(tk->id);
 	s64 skew = ntp_get_skew_delta(tk->id);
+	u64 dividend;
 	u32 mult;
 
 	/*
@@ -2480,8 +2536,15 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		 * scale it back up to the full per-tick rate for the mult bias.
 		 */
 		skew *= NTP_INTERVAL_FREQ;
-		mult = div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
-				 tk->cycle_interval);
+		dividend = (tk->ntp_tick + skew) >> tk->ntp_error_shift;
+		mult = div64_u64(dividend, tk->cycle_interval);
+		/*
+		 * Stash the fractional part of the per-cycle ideal mult that
+		 * the integer @mult discards, scaled by 2^32, in clock-shifted
+		 * ns per cycle.
+		 */
+		dividend -= (u64)mult * tk->cycle_interval;
+		tk->ntp_err_frac = div64_u64(dividend << 32, tk->cycle_interval);
 
 		/*
 		 * Rate adjustments are conceptually applied mid-tick in order
-- 
2.43.0

