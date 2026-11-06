Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954704;
	b=M0qspLSbGSfLei4AcgtwP0okYITjPGp4sGCXbbKlWD8cAnrHK9j5sKC0wTfMHX+31qDo
	 iKkG4hUvICA0Yq8avW5CT2OwdU/mo4UF2k33xLcvP82P3z5SWlRE1gm6sZA7qKcXL0AOq
	 ZnILX/ni688WUCaiw2m/JvEhP1ByGnHx3kqLrTmMOUJUN5VCvcX7TG4fXPaWY55zlXFXL
	 pjd9euxSke0LIUIAef3bV5+dIYpINAq3lYlt99u8TfqOsm+jSPDTzURZRYbccjEeb8Tse
	 t13Y3UTevq3fgTpuC6TDzHtefhwGC7IvmU/pgOQvQpNRcGQ8qLvGmlivksCur1tDhPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954704;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=G9VpMhyQRSsrD433zXAOIiWB1j9NxspahGla54YYpDk=;
	b=BjXlxCc5cW8DX/uVC9LsvS/l4BWHr03gmUu7Iq15txpSwGgZBOHYTM6W0/ycf6ZmEMyf
	 c0kkEIn8TwZcSRQZSLDXE/M4WFPK7aVB4xY5VEXb2M0M/JBr8ag4dECOKM4HlEAbBZhaF
	 W7jP3z/F6Ep1usMtBkm/DvcB0tTnIh5up3mDh/9EQtECgCKfnGI2VlBkxHQqGh9tjk2ou
	 xzlVcyH5uHmpa/uRLo6Nw5Uus43Jt77LDoUfq6zZzxGZAykvgdgJkzkMSWnOsTGiSlXzc
	 b8lS8Ian/4+dzT9DsJXWofHVtf8R/fOQn0ZuhX7Y7VQOus0WokpFUFLEaruZwPCXZOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UrsVWYzO;
	arc=none smtp.remote-ip=62.149.156.132
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7733606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7733606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UrsVWYzO
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id PFZ4xiX0VV5J9PFZ9xlBph; Fri, 06 Nov 2026 09:44:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1793954695; bh=3sxcoDO6RugANTJxf7HWSpm560rsaw3R5jXIfIZuO3I=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=UrsVWYzODP6awJ3TrbTrJA5yfYptKnffyqyroj0/EkB5fzzI1QMJW7O6smyKmKKCj
	 5Hb901uKyoBSLU9sRvH1+eeOHQRtctWkVY0UhMny/vNpWxgK7Np7cfrrEH5WQSkF8C
	 DhoXId/nihgRtuk49wPj610/GkbfJZC7zsWbe1WdqFYRq9jr9vmSqDmuvdNcNv5j0O
	 EFjdE4rgMiLq298NzO/UlIowlHTjlCRDaHGO7t+DAZLbR0SN1TQr+qUApAJWf5AgZE
	 vwG8pEJwVIRyRdTd0pkq7pN8Ce/zdq4yViKeDYLUsN+mI7x00KkWmzHC/665Xjjbnx
	 +rnV0RKwm/Y9A==
Message-ID: <80a541db-9814-4e22-9247-2602bc141867@enneenne.com>
Date: Fri, 6 Nov 2026 09:44:55 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] timekeeping: Apply extrapolated ntp_error to clock
 snapshots
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>,
 Yuan Wang <yuan1.wang@intel.com>, Ryan Luu <rluu@amazon.com>,
 Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com
References: <20261106030856.2538039-1-dwmw2@infradead.org>
 <20261106030856.2538039-7-dwmw2@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20261106030856.2538039-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfECDErZDJEERtOybXqKPmgxxhIfZoP7nD/UV/yp8d6EPskWdMOT3MLcmP3D8go/vMGoqxNLoE5k4/2+17urjOaAfydwiY/Ny2sXkhqieRm1q+3OmW2wV
 qSZDpq1eGkhLBWspqBx0JGvKMqFs4cVBhaNarOo4nd7J0iUA553eOxTHdo3zfTghRBURcTx/F2fNicptwCEADwydNnXzhF9055on6bEaTF7MTLxozDtDzmYw
 nV073JiYqoG/8rz1s4zEDg+aNCLfTvaYmeZ3XK0B+REo8Kr8xZlYgqdN5dTEIP5+rjekpbWCQIZkUah2k9qK9Cfw+KaaYE+5okRFptij2bwUUkXm0+107xwM
 X9i9DHXyevomywmCbCxkp0YauObXwxlwLvYvYLvVLjaTNy20PtOEA/k+Qb3xIjbtwDjva8kbenMIii6sp7WXPhKllvkMCvSKJi+mzS/k4p4XxVDfUIbFhMnP
 9KDzis0cTxhOEpK0gorF1Fan2FDs/FIH+9jMA8kJanR39YyI+iCqoL+g8VoveihaD6K8bq1vjDdObDmE

On 06/11/2026 04:08, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The time reported in ::systime of a system_time_snapshot is known to be
> slightly inaccurate because of the way that the reported realtime clock
> sawtooths around the *intended* time series, limited by the integer mult
> value used to calculate the inter-tick times, and designed to ensure
> smoothness and monotonicity for its consumers.
>
> It is particularly inaccurate in a tickless kernel, where ntp_err_mult
> is not adjusted on each tick, allowing the reported clock to diverge
> from the intended time for a large number of ticks before re-converging.
>
> It would be better for callers of get_device_system_crosststamp() and
> ktime_get_snapshot_id() to receive the *accurate* time, not the
> sanitized version provided to gettimeofday().
>
> Compute the deviation in snapshot_ntp_error() and add it to the returned
> ::systime so the snapshot lands on the ideal line. It sums four terms in
> ns << NTP_SCALE_SHIFT before converting to signed ns:
>
>   - tk->ntp_error, the deviation as of the last update;
>   - (cycle_delta * ntp_err_frac), the fractional-mult drift accrued
>     since then (cycle_delta is at most a tick on a tickful kernel, but
>     many ticks' worth under NO_HZ);
>   - (cycle_delta * ntp_err_mult), subtracting the applied mult bias (the
>     +1 dither, or the err_drain bias while a drain is in progress) over
>     the same span;
>   - the sub-nanosecond fraction dropped when the read was truncated to
>     whole ns (low shift bits, exact despite the multiply overflowing).
>
> None of these terms can overflow: ntp_err_mult is clamped to 50ppm
> (see "timekeeping: Reinstate proportional correction of ntp_error"),
> and cycle_delta is bounded by the clocksource's max_cycles, so the
> dither/drain term is at most 50ppm of the maximum idle period, in
> ns << 32 — around 2^57 for a 500s TSC deferment. Deltas beyond
> max_cycles (a marginal clocksource left unread too long) skip the
> extrapolation entirely.
>
> The helper uses the timekeeper selected for the requested clock id, so
> all NTP-disciplined clocks are corrected, including the AUX clocks (each
> has its own NTP instance); only CLOCK_MONOTONIC_RAW is undisciplined and
> gets no correction. The residual is then a single clocksource cycle, the
> same bound as a tickful kernel — except on the final tick of a phase
> slew, where ntp_drain_skew() clamps to avoid overshooting zero and the
> extrapolation can briefly overstate the correction by up to one tick's
> worth of skew, repaid at the next update.
>
> Note that this *unconditionally* changes the ::systime returned by all
> snapshot and cross timestamp consumers (PTP SYS_OFFSET_PRECISE/EXTENDED,
> and the timestamps which PPS_FETCH and /sys/class/pps report to
> userspace, since the previous commit made pps_get_ts() use the snapshot
> unconditionally): it is now the ideal NTP-disciplined time rather than
> the raw accumulated clock.
>
> For the PPS consumers that means ts_real no longer exactly matches what
> clock_gettime(CLOCK_REALTIME) would have returned at the same moment,
> but reports the time which the kernel is *intending* to steer
> CLOCK_REALTIME to. The difference is the transient error which the
> kernel is already committed to eliminating — reporting it to a PPS
> consumer only feeds a disturbance into their measurements which will
> have disappeared again by the time they react to it.

As we agreed on v4 3/4, this is the patch the chrony and ntpd
maintainers should ack. Miroslav has given chrony's OK, but I see
nobody from ntpd in Cc: could you add them?

Also from that thread: could you say here that this relies on 1/6
("timekeeping: Allow tick_length changes to apply mid-tick"), and give
the order of magnitude of the difference from clock_gettime() (the
tens of ns you mentioned there)?

>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> v2: Shrunk by the dividend restructure moving to patch 1. Commit
>     message now states the overflow bound on the extrapolation terms,
>     which follows from the 50ppm clamp, and owns the transient
>     over-extrapolation on the final tick of a phase slew. Round the
>     insane-delta early return like the normal path, and mention the
>     err_drain bias in the comments. (Overflow and the rest found by
>     Sashiko.) Drop the speculative CONFIG_NTP_PPS paragraph and name
>     the PPS_FETCH timestamps among the affected consumers (Rodolfo).
>     Drop DO NOT MERGE.
>
>  include/linux/timekeeper_internal.h |  6 +++
>  kernel/time/timekeeping.c           | 68 ++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
> index 85d123bcb270..164672ccbd45 100644
> --- a/include/linux/timekeeper_internal.h
> +++ b/include/linux/timekeeper_internal.h
> @@ -99,6 +99,11 @@ struct tk_read_base {
>   * @ntp_err_mult:		Multiplication factor for scaled math conversion
>   * @err_drain:			Extra mult bias repaying ntp_error beyond the
>   *				dither's reach; sized at second boundaries
> + * @ntp_err_frac:		Fractional part of the per-cycle NTP-ideal mult that the
> + *				integer @mult truncates, as a fraction of 2^32 in
> + *				clock-shifted nanoseconds per cycle. Describes the
> + *				working point of the +0/+1 mult dither (or of the
> + *				@err_drain bias while a drain is in progress).
>   * @cs_tick_adj:		Per-second adjustment handed to NTP via ntp_clear()
>   *				accounting for the difference between the nominal
>   *				NTP interval and the real time taken by the
> @@ -190,6 +195,7 @@ struct timekeeper {
>  	u32			ntp_error_shift;
>  	s32			ntp_err_mult;
>  	s32			err_drain;
> +	u64			ntp_err_frac;
>  	s64			cs_tick_adj;
>  	u32			skip_second_overflow;
>  	s64			skew_delta;
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index 1f3fde0c37b2..1d8c0e7e057e 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -439,6 +439,7 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
>  	tk->tkr_mono.mult = clock->mult;
>  	tk->tkr_raw.mult = clock->mult;
>  	tk->ntp_err_mult = 0;
> +	tk->ntp_err_frac = 0;
>  	tk->err_drain = 0;
>  	tk->skip_second_overflow = 0;
>  	tk->skew_delta = 0;
> @@ -1251,6 +1252,57 @@ static inline u64 tk_clock_read_snapshot(const struct tk_read_base *tkr,
>  	return clock->read(clock);
>  }
>
> +/*
> + * snapshot_ntp_error - record how far a snapshot's ::systime is from the
> + * ideal NTP-disciplined time at @now, in signed nanoseconds, so a caller
> + * can land exactly on the ideal line by adding it to ::systime.
> + *
> + * The value is summed in ns << NTP_SCALE_SHIFT from four parts:
> + *
> + *  - tk->ntp_error, the deviation accumulated as of the last timekeeping
> + *    update (tkr_mono.cycle_last);
> + *  - (cycle_delta * ntp_err_frac), the fractional-mult drift accrued over
> + *    the cycles read since then -- at most a tick on a tickful kernel, but
> + *    potentially many ticks' worth under NO_HZ;
> + *  - (cycle_delta * ntp_err_mult), subtracting the applied mult bias (the
> + *    +1 dither, or the larger signed err_drain bias while a drain is in
> + *    progress) over the same span;
> + *  - the sub-nanosecond fraction that ::systime dropped when the read was
> + *    truncated to whole ns (the low @shift bits, exact even though the
> + *    multiply overflows).
> + *
> + * CLOCK_MONOTONIC_RAW is not NTP-disciplined and carries no error. Every
> + * other clock id uses its own timekeeper @tk -- including the AUX clocks,
> + * which each have their own NTP instance.
> + */
> +static s64 snapshot_ntp_error(const struct timekeeper *tk, clockid_t clock_id,
> +			      u64 now)
> +{
> +	u64 cycle_delta;
> +	u32 nes;
> +	s64 tmp, err;
> +
> +	if (clock_id == CLOCK_MONOTONIC_RAW)
> +		return 0;
> +
> +	cycle_delta = (now - tk->tkr_mono.cycle_last) & tk->tkr_mono.mask;
> +	nes = tk->ntp_error_shift;
> +
> +	/* Insane deltas from marginal clocksources: skip the extrapolation */
> +	if (unlikely(cycle_delta > tk->tkr_mono.clock->max_cycles))
> +		return (tk->ntp_error + (1LL << (NTP_SCALE_SHIFT - 1))) >>
> +			NTP_SCALE_SHIFT;
> +
> +	err = tk->ntp_error;
> +	err += ((s64)mul_u64_u64_shr(cycle_delta, tk->ntp_err_frac, 32) -
> +		(s64)cycle_delta * tk->ntp_err_mult) << nes;
> +
> +	tmp = (s64)(cycle_delta * tk->tkr_mono.mult + tk->tkr_mono.xtime_nsec);
> +	tmp &= (1ULL << tk->tkr_mono.shift) - 1;
> +	err += tmp << nes;
> +
> +	return (err + (1LL << (NTP_SCALE_SHIFT - 1))) >> NTP_SCALE_SHIFT;
> +}
>
>  /**
>   * ktime_get_snapshot_id -  Simultaneously snapshot a given clock ID with
> @@ -1274,6 +1326,7 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
>  {
>  	ktime_t base_raw, base_sys, offs_sys, *offs, offs_zero = 0;
>  	u64 nsec_raw, nsec_sys, now;
> +	s64 ntp_error;
>  	struct timekeeper *tk;
>  	struct tk_data *tkd;
>  	unsigned int seq;
> @@ -1336,10 +1389,12 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
>
>  		nsec_sys = timekeeping_cycles_to_ns(&tk->tkr_mono, now);
>  		nsec_raw = timekeeping_cycles_to_ns(&tk->tkr_raw, now);
> +
> +		ntp_error = snapshot_ntp_error(tk, clock_id, now);
>  	} while (read_seqcount_retry(&tkd->seq, seq));
>
>  	systime_snapshot->cycles = now;
> -	systime_snapshot->systime = ktime_add_ns(base_sys, offs_sys + nsec_sys);
> +	systime_snapshot->systime = ktime_add_ns(base_sys, offs_sys + nsec_sys) + ntp_error;
>  	systime_snapshot->monoraw = ktime_add_ns(base_raw, nsec_raw);
>
>  	/*
> @@ -1591,6 +1646,7 @@ int get_device_system_crosststamp(int (*get_time_fn)
>  	ktime_t base_sys, base_raw, *offs;
>  	u32 clock_was_set_seq = 0;
>  	u64 nsec_sys, nsec_raw;
> +	s64 ntp_error;
>  	u8 cs_was_changed_seq;
>  	unsigned int seq;
>  	bool do_interp;
> @@ -1657,9 +1713,10 @@ int get_device_system_crosststamp(int (*get_time_fn)
>
>  		nsec_sys = timekeeping_cycles_to_ns(&tk->tkr_mono, cycles);
>  		nsec_raw = timekeeping_cycles_to_ns(&tk->tkr_raw, cycles);
> +		ntp_error = snapshot_ntp_error(tk, xtstamp->clock_id, cycles);
>  	} while (read_seqcount_retry(&tkd->seq, seq));
>
> -	xtstamp->sys_systime = ktime_add_ns(base_sys, nsec_sys);
> +	xtstamp->sys_systime = ktime_add_ns(base_sys, nsec_sys) + ntp_error;
>  	xtstamp->sys_monoraw = ktime_add_ns(base_raw, nsec_raw);
>
>  	/*
> @@ -2494,6 +2551,13 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
>  		skew *= NTP_INTERVAL_FREQ;
>  		dividend = (tk->ntp_tick + skew) >> tk->ntp_error_shift;
>  		mult = div64_u64(dividend, tk->cycle_interval);
> +		/*
> +		 * Stash the fractional part of the per-cycle ideal mult that
> +		 * the integer @mult discards, scaled by 2^32, in clock-shifted
> +		 * ns per cycle.
> +		 */
> +		dividend -= (u64)mult * tk->cycle_interval;
> +		tk->ntp_err_frac = div64_u64(dividend << 32, tk->cycle_interval);
>
>  		/*
>  		 * In timekeeping_apply_adjustment(), the mult_adj value is

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
