Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688348CD78
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886113; cv=none; b=Apupp4hNVGyXdIuOIjkbnGjyMOfwYORvXOlwdmRmW8e28uocRhUk8Ygd1mxjeL2k/49iTuewJCoxwWtMZOsABPSKC0DLzfzHDunJEo8+O+kHCWpQRsrBUJy24sAHTHt/ZpPCvSEHr23W28YYHORmZ276rX8hVdCLNF1JKU2MT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886113; c=relaxed/simple;
	bh=00KU3QkGXWB/AV4uHczaJ2GWOFZUor1faovx0yazO9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFU4FrpWvhZ7oXmLd84ZdvC79uYTqlNixXytYEHUvCFwpxPvbT/X+UQHnhF1ghIh6svMmRF6T4E/yfhhfql6+nHM5VJxdrKdU8RDydzcoDZG/iJmLZ2pP1pMWVBNocJ/QuwSqPdh5t5Sty36Q/P8Hcmtlnt23GXFV2sGKE6PvTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OWpaCP+n; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OWpaCP+n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=iV47/jCfOJdee9IbTO6qrMbd84ipVG5YhmQ/dOmG0F8=; b=OWpaCP+nOgArS6Ud5lKpRPHRX4
	IURV+9pra2x7vpb75fBDqena5UwNi0IxmNZE6pea1SSsLTjYEQhiKbHMEBepVGCGCy72NzyapTx7J
	70XwuHIvhfGGM5VTaHqaIjaPlxBUZ8iHK/Z7IGClVh3IbhtFgoKGW5KrSiz5btqk9mbYkPrjWsB1n
	H+yj5579B9zbAWL7YZqlAF/f5iNVSQNIqqCwOAe7lEnL97N7WrYEZxJ9gp/kdTc4I12FBzeRuqzoG
	FiBOaQgenAfs9swUdarS8SvGykUMB2vKjMUr2z3LZP12NwyoHEcD8HwHAsuhpTt4RsAWNyk8/aSXr
	AK4GZh9g==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCNHg-00000005MQ5-1xP0;
	Thu, 01 Oct 2026 20:21:42 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pU-3N8h;
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
Subject: [PATCH 2/5] ntp: Recalculate skew_delta when the phase offset changes
Date: Thu,  1 Oct 2026 21:21:31 +0100
Message-ID: <20261001202134.33929-3-dwmw2@infradead.org>
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

The skew rate is recomputed only by second_overflow(), so when
time_offset or time_adjust changes mid-second (hardpps on each pulse,
adjtimex, adjtime()) the stale rate keeps delivering until the end of
the second, and the misdelivery lands in ntp_error. Pull the
computation out into ntp_update_skew_delta() and call it from the
writers. Settling of an opposing time_offset/time_adjust overlap stays
paced at one chunk per second, via the settle argument.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 kernel/time/ntp.c | 144 +++++++++++++++++++++++++++-------------------
 1 file changed, 85 insertions(+), 59 deletions(-)

diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index d22b532ec536..b8b0bf1d94e7 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -593,6 +593,82 @@ ktime_t ntp_get_next_leap(unsigned int tkid)
 	return KTIME_MAX;
 }
 
+/*
+ * ntp_update_skew_delta - Recompute the per-tick skew rate for the
+ * current second from the pending time_offset / time_adjust phase.
+ *
+ * The rate is in the same units as time_offset: (ns << NTP_SCALE_SHIFT)
+ * / HZ. If the result is so low that the skew imparted would round to
+ * zero, pass the bare minimum +-1 to ensure that it *does* actually
+ * drain completely to zero. It won't overshoot because
+ * logarithmic_accumulation() only drains what it can from time_offset
+ * or time_adjust, and the rest ends up in ntp_error which drives the
+ * selection of 'mult' immediately each tick.
+ *
+ * Called from second_overflow() at each second boundary (@settle =
+ * true), and directly by the writers of time_offset / time_adjust so a
+ * change takes effect at the next timekeeping advance rather than
+ * persisting a stale rate until the end of the second. @settle gates
+ * ntp_transfer_offset_adjust(): settling the opposing overlap is paced
+ * at one chunk per second by design and is the only mutation here, so
+ * with @settle false the call is a pure recompute, safe at any rate.
+ *
+ * The timekeeper lock is held on all paths, serializing ntp_data.
+ */
+static void ntp_update_skew_delta(struct ntp_data *ntpdata, bool settle)
+{
+	if (ntpdata->time_offset || ntpdata->time_adjust ||
+	    ntpdata->time_adjust_frac) {
+		s64 off_chunk = ntp_offset_chunk(ntpdata, ntpdata->time_offset);
+		s64 adj_chunk = 0, net;
+
+		/*
+		 * Once the exponential chunk rounds to zero, deliver the last
+		 * remaining offset this second so it converges to zero instead
+		 * of stalling just above it.
+		 */
+		if (!off_chunk)
+			off_chunk = ntpdata->time_offset;
+
+		if (ntpdata->time_adjust || ntpdata->time_adjust_frac) {
+			s64 adj;
+
+			if (ntpdata->time_adjust >= MAX_TICKADJ)
+				adj = MAX_TICKADJ * ONE_US_NS;
+			else if (ntpdata->time_adjust <= -MAX_TICKADJ)
+				adj = -MAX_TICKADJ * ONE_US_NS;
+			else
+				adj = ntpdata->time_adjust * ONE_US_NS +
+					ntpdata->time_adjust_frac;
+
+			adj_chunk = div_s64(adj, NTP_INTERVAL_FREQ);
+			if (!adj_chunk)
+				adj_chunk = signof(ntpdata->time_adjust_frac);
+		}
+
+		/*
+		 * If the two slews oppose, only their net would drive the
+		 * per-tick drain, so the cancelling part would never drain from
+		 * either tracker and an exact cancellation would stall both.
+		 * Settle that overlap directly between them (no clock motion).
+		 */
+		if (settle && off_chunk && adj_chunk &&
+		    signof(off_chunk) != signof(adj_chunk)) {
+			s64 conflict = min(abs(off_chunk), abs(adj_chunk));
+
+			ntp_transfer_offset_adjust(ntpdata, signof(off_chunk) * conflict);
+		}
+
+		/* Net is what the clock delivers; reduce to per-tick, then floor. */
+		net = off_chunk + adj_chunk;
+		ntpdata->skew_delta = div_s64(net, NTP_INTERVAL_FREQ);
+		if (!ntpdata->skew_delta && net)
+			ntpdata->skew_delta = signof(net);
+	} else {
+		ntpdata->skew_delta = 0;
+	}
+}
+
 /*
  * This routine handles the overflow of the microsecond field
  *
@@ -669,65 +745,8 @@ int second_overflow(unsigned int tkid, time64_t secs)
 	/* Check PPS signal */
 	pps_dec_valid(ntpdata);
 
-	/*
-	 * Set the per-tick skew rate for the next second. This is in
-	 * the same units as time_offset: (ns << NTP_SCALE_SHIFT) / HZ.
-	 * If the result is so low that the skew imparted would round
-	 * to zero, pass the bare minimum ±1 to ensure that it *does*
-	 * actually drain completely to zero. It won't overshoot because
-	 * logarithmic_accumulation() only drains what it can from
-	 * time_offset or time_adjust, and the rest ends up in ntp_error
-	 * which drives the selection of 'mult' immediately each tick.
-	 */
-	if (ntpdata->time_offset || ntpdata->time_adjust ||
-	    ntpdata->time_adjust_frac) {
-		s64 off_chunk = ntp_offset_chunk(ntpdata, ntpdata->time_offset);
-		s64 adj_chunk = 0, net;
-
-		/*
-		 * Once the exponential chunk rounds to zero, deliver the last
-		 * remaining offset this second so it converges to zero instead
-		 * of stalling just above it.
-		 */
-		if (!off_chunk)
-			off_chunk = ntpdata->time_offset;
-
-		if (ntpdata->time_adjust || ntpdata->time_adjust_frac) {
-			s64 adj;
-
-			if (ntpdata->time_adjust >= MAX_TICKADJ)
-				adj = MAX_TICKADJ * ONE_US_NS;
-			else if (ntpdata->time_adjust <= -MAX_TICKADJ)
-				adj = -MAX_TICKADJ * ONE_US_NS;
-			else
-				adj = ntpdata->time_adjust * ONE_US_NS +
-					ntpdata->time_adjust_frac;
-
-			adj_chunk = div_s64(adj, NTP_INTERVAL_FREQ);
-			if (!adj_chunk)
-				adj_chunk = signof(ntpdata->time_adjust_frac);
-		}
-
-		/*
-		 * If the two slews oppose, only their net would drive the
-		 * per-tick drain, so the cancelling part would never drain from
-		 * either tracker and an exact cancellation would stall both.
-		 * Settle that overlap directly between them (no clock motion).
-		 */
-		if (off_chunk && adj_chunk && signof(off_chunk) != signof(adj_chunk)) {
-			s64 conflict = min(abs(off_chunk), abs(adj_chunk));
-
-			ntp_transfer_offset_adjust(ntpdata, signof(off_chunk) * conflict);
-		}
-
-		/* Net is what the clock delivers; reduce to per-tick, then floor. */
-		net = off_chunk + adj_chunk;
-		ntpdata->skew_delta = div_s64(net, NTP_INTERVAL_FREQ);
-		if (!ntpdata->skew_delta && net)
-			ntpdata->skew_delta = signof(net);
-	} else {
-		ntpdata->skew_delta = 0;
-	}
+	/* Set the per-tick skew rate for the next second */
+	ntp_update_skew_delta(ntpdata, true);
 
 	return leap;
 }
@@ -1003,6 +1022,10 @@ static inline void process_adjtimex_modes(struct ntp_data *ntpdata, const struct
 
 	if (txc->modes & (ADJ_TICK|ADJ_FREQUENCY|ADJ_OFFSET))
 		ntp_update_frequency(ntpdata);
+
+	/* A changed phase target invalidates the current skew rate */
+	if (txc->modes & (ADJ_OFFSET | ADJ_TIMECONST | ADJ_STATUS))
+		ntp_update_skew_delta(ntpdata, false);
 }
 
 /*
@@ -1023,6 +1046,7 @@ int ntp_adjtimex(unsigned int tkid, struct __kernel_timex *txc, const struct tim
 			ntpdata->time_adjust = txc->offset;
 			ntpdata->time_adjust_frac = 0;
 			ntp_update_frequency(ntpdata);
+			ntp_update_skew_delta(ntpdata, false);
 
 			audit_ntp_set_old(ad, AUDIT_NTP_ADJUST,	save_adjust);
 			audit_ntp_set_new(ad, AUDIT_NTP_ADJUST,	ntpdata->time_adjust);
@@ -1264,6 +1288,8 @@ static void hardpps_update_phase(struct ntp_data *ntpdata, long error)
 		/* Cancel running adjtime() */
 		ntpdata->time_adjust = 0;
 		ntpdata->time_adjust_frac = 0;
+		/* The previous correction's skew rate is stale; recompute */
+		ntp_update_skew_delta(ntpdata, false);
 	}
 	/* Update jitter */
 	ntpdata->pps_jitter += (jitter - ntpdata->pps_jitter) >> PPS_INTMIN;
-- 
2.43.0

