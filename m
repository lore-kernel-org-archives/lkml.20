Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934543;
	b=z9nSlKByE+Sm7HTEp/4i6neY/yCIbv/4omH21rFB4BEGT++VPI+Dj3YJploU8I5UV6tj
	 Rsc2tZvs3n42DU7nBEXGfP4Lpq0DpfbKHZY7XSSULerULKjIXimioQuE1piyUNOza0nWs
	 P3oMzhdau2I+QqllJYrRlju8JruMCcdqA7LzUO0xvuMdyw6m3L6XxcgSFdoDCZMAwSB0I
	 0y37DKWaiLAO/Ha1HNviVUEFbC2TAlYp6XgCdGVVPNbC6oeu0UNbKGjRQ3fzwvm36ciyB
	 Xc3fgkmksCAOktyRx1f/RM4sfVOlTYuOjMfE8sT5M5CHph4tDg37JIFrvfEa5XeYEUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934543;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=/NJygmiRV/53CJZPOV8/PsuJgRTZqH5CPzz2gkXirJ8=;
	b=Dnghc1R106y9MPMrGzF1LdlUasprXrXjmwXoh015PIkMPdIU+Ksv9hkumTXuHDglsXli
	 emMr4+sbwBTdFFJGpj5X2H6p/wPsvDBYZ9J9Qmw/H9PQSnCktxgjus9RnwXZGbgCPEG3v
	 4jrUAzq0ls7ji4HFPr6Hc5q/gRaZwaS7MNZyGt4ZYsHBVIxrAx7yt6nidrcvgoW0CgBXX
	 HMBnbbrFWhWKKDIH0G0nmqjroaK39kY5aSm3vuya2KcWWM1Lnz7R71apKAAY59ESXy34s
	 CN9/HkxM+p9xsRa6sb8usteVDE82Bj7bCQl3TuD+ctfShffuqe7fGxmP+vdbMSy3zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SeexSk3z;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E81606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E81606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SeexSk3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=/NJygmiRV/53CJZPOV8/PsuJgRTZqH5CPzz2gkXirJ8=; b=SeexSk3z2qG63NDwDVhs+oXj3n
	2WvqPjCz0ZNmhUiiB7Ricw1zH387exeVobjr4em0I19qP7N4TrscRG8f8UoUuNBCHv+kES+GbllLL
	F9QiMkBSLc7Dbh8SjVKRQtKdm6wl7Pa06dqboMOIRHuA2OdkW/JhFAxpdUF5iMlbjOOzKKAUI6fyU
	aNtX4imtmnI478UuvqSvb/+GQURTL9tfX6gmSN5Woo2uSUQBy5V+sj05AALD76EryuR8si71TPNsM
	YMnGgfna45SAOJBPLnOEHMU5BheLLQ6jgFKNJjlMLAR0nf7fE8Z3+Rv3U5KGHfpnt5b+nbh7Wq0hp
	LUq15MUw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK1-0000000FwPa-1anS;
	Fri, 06 Nov 2026 03:08:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGQ-0lsX;
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
Subject: [PATCH v2 3/6] timekeeping: Bound idle sleep while a phase slew is in flight
Date: Thu,  5 Nov 2026 19:08:52 -0800
Message-ID: <20261106030856.2538039-4-dwmw2@infradead.org>
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

Phase offset for adjtime() can be delivered at a rate of 500µs/s, and
for STA_PPSTIME potentially even more. The skew is recalculated in
second_overflow() each second, and if that's missed in a tickless
kernel, the skew continues to be applied for the whole of the idle
period. While skew is active, clamp timekeeping_max_deferment() to the
top of the current second to avoid the overshoot.

The bound is only evaluated when a CPU stops its tick, so it helps only
if some CPU does that after the slew starts. If the do_timer duty is
vacant and its last holder is already sleeping on a timer programmed
before the slew began, nothing enforces the wakeup until an unrelated
interrupt arrives. Claim the vacant duty for the CPU performing the
adjtimex() call, exactly as if its tick had fired: when it next stops
its tick it becomes the duty-last CPU and applies the bound.

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
v2: Fix the ADJ_OFFSET_READONLY test: that flag aliases ADJ_NANO and
    only has its read-only meaning in the ADJ_ADJTIME form, so the v1
    check skipped the immediate update for the standard
    ADJ_OFFSET|ADJ_NANO call. Also trigger it for ADJ_TIMECONST and
    ADJ_STATUS, which likewise invalidate the skew rate, mirroring the
    condition in process_adjtimex_modes(). (Found by Sashiko.)

    Claim the do_timer duty when starting a slew, so the deferment
    bound is honoured even when every other CPU is already asleep.
    The vacancy is real: in a 4-CPU qemu guest, a slew started from a
    non-timer wakeup found the duty vacant (and claimed it) on 3 out
    of 3 attempts. The overshoot itself is harder to demonstrate
    there, because ambient interrupts advance the timekeeper at
    better than 1Hz anyway.

 kernel/time/tick-internal.h | 18 +++++++++++++++
 kernel/time/timekeeping.c   | 44 +++++++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 65680db95053..9328582b1eb7 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -23,6 +23,23 @@ DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
 extern ktime_t tick_next_period;
 extern int tick_do_timer_cpu __read_mostly;
 
+/*
+ * The bound on idle sleep imposed by timekeeping_max_deferment() is only
+ * evaluated by the do_timer duty CPU (or its last holder) when it stops
+ * its tick. If the duty is vacant and its last holder is already asleep
+ * on a timer programmed before the bound became necessary, nothing will
+ * honour it. Claim the vacant duty for the current CPU, exactly as if
+ * its tick had fired: when it next stops its tick, it becomes the
+ * duty-last CPU and applies the bound. Racing with a real tick taking
+ * the duty is benign, as in tick_sched_do_timer().
+ */
+static inline void tick_nohz_claim_do_timer(void)
+{
+	if (IS_ENABLED(CONFIG_NO_HZ_COMMON) && !tick_nohz_full_enabled() &&
+	    READ_ONCE(tick_do_timer_cpu) == TICK_DO_TIMER_NONE)
+		WRITE_ONCE(tick_do_timer_cpu, smp_processor_id());
+}
+
 extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
 extern void tick_handle_periodic(struct clock_event_device *dev);
 extern void tick_check_new_device(struct clock_event_device *dev);
@@ -101,6 +118,7 @@ static inline void tick_set_periodic_handler(struct clock_event_device *dev, int
 #else /* !GENERIC_CLOCKEVENTS: */
 static inline void tick_suspend(void) { }
 static inline void tick_resume(void) { }
+static inline void tick_nohz_claim_do_timer(void) { }
 #endif /* !GENERIC_CLOCKEVENTS */
 
 /* Oneshot related functions */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 118612c4a82e..667b4c2817b5 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1978,6 +1978,21 @@ u64 timekeeping_max_deferment(void)
 
 		ret = tk->tkr_mono.clock->max_idle_ns;
 
+		/*
+		 * Skew introduced for phase offset is intended to be
+		 * recalculated each second. Ensure a tickless kernel
+		 * wakes up for that and does not overshoot, while skew
+		 * is being applied.
+		 */
+		if (abs(tk->skew_delta) > 1) {
+			u64 nsec_in_sec = tk->tkr_mono.xtime_nsec >>
+					  tk->tkr_mono.shift;
+			u64 remaining = NSEC_PER_SEC - min_t(u64, nsec_in_sec,
+							     NSEC_PER_SEC);
+
+			ret = min_t(u64, ret, max_t(u64, remaining, TICK_NSEC));
+		}
+
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 
 	return ret;
@@ -3062,9 +3077,34 @@ static int __do_adjtimex(struct tk_data *tkd, struct __kernel_timex *txc,
 		tk_update_leap_state_all(tkd);
 	}
 
-	/* Update the multiplier immediately if frequency was set directly */
-	if (txc->modes & (ADJ_FREQUENCY | ADJ_TICK))
+	/*
+	 * Update the multiplier immediately if the frequency was set
+	 * directly, and refresh the cached skew_delta for anything
+	 * which may have changed the skew rate — mirroring the
+	 * condition in process_adjtimex_modes() — so that it bounds
+	 * idle sleep while the slew is in flight.
+	 *
+	 * In the old-style ADJ_ADJTIME form the mode bits mean
+	 * different things (ADJ_OFFSET_READONLY aliases ADJ_NANO);
+	 * only the write form of adjtime() starts a slew.
+	 *
+	 * Also claim the do_timer duty if it is vacant, so that the
+	 * deferment bound is honoured even if every other CPU is
+	 * already sleeping on a timer programmed before the slew
+	 * began (not for the aux clocks, which are not bounded).
+	 */
+	if (txc->modes & ADJ_ADJTIME) {
+		if (!(txc->modes & ADJ_OFFSET_READONLY)) {
+			if (!aux_clock)
+				tick_nohz_claim_do_timer();
+			result->clock_set |= __timekeeping_advance(tkd, TK_ADV_FREQ);
+		}
+	} else if (txc->modes & (ADJ_FREQUENCY | ADJ_TICK | ADJ_OFFSET |
+				 ADJ_TIMECONST | ADJ_STATUS)) {
+		if (!aux_clock)
+			tick_nohz_claim_do_timer();
 		result->clock_set |= __timekeeping_advance(tkd, TK_ADV_FREQ);
+	}
 
 	return ret;
 }
-- 
2.43.0

