Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934554;
	b=cN6xa4K5t/ff3iLTCJlUX/z1oJ2yL8tE++FWqFdj93SWO8j1MmjhHcJwVYLfj/cxMTTX
	 +8rXCfoxZG0iuQjkehHmUU9uNemX5Tg5a+p+gdXps2XwLHsFSH24tsDk7w6q1nmT76Laa
	 nCc3yRejX3yq4AhiCHXQaiHcsZm2CBEX14fkb31xNOEyBJuGM763H7+FOEzhcH1ZJ/zNC
	 uYgn4kmSTYSngXTdnK997eNUGunkQdSvSAUV6vHyxU8vgCOg0YprnoraEdjS9ZInBr+cu
	 ahx3fwkfa3fDWWyf/KACQ+zj1GVyg6u8bJ1ad7Yg0oh0zXJqvh+iNeBed5eksMOYUpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934554;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=19wwQDSniobi3Z1csoRNrPM8O3Z8Q6nEjwbEbH4966w=;
	b=E4v4CNoPPzyg0gZT/Opb3nocOC93mIUBb7i4K6tZ8srrrhCDoGG4reo4aNiusfs64l7j
	 9FWNP7fEnrPod3yN6x7G6ginuhPPojklGGnfwJOPKoVH3JS8f14YWjaUSLkPKu1cUnwIT
	 mo3r5VeyURqrLLPU5t0HWUeBFanG/h9JDsz93VPlV7DRa8Qf7pvq0DlO1UIB+nTXQ/XUb
	 onPlypKTDEMZKokgClqi4URq6JE55Cm48kKMARezmSmsIF/Fp/2bWFCM4rYNcMKa86yte
	 6dqMLE5rpDt06L/X6tDvcNRkr+srGZxpw2LDey2e9YlS86qzAzfpV3aFXXbttgH15tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=desiato.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LRk8huu3;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A4606EE80
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4A4606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LRk8huu3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=19wwQDSniobi3Z1csoRNrPM8O3Z8Q6nEjwbEbH4966w=; b=LRk8huu326YuWGm54Ki5Sp4LWc
	5pi2mnd/0H8YCkbfQbdI6/XQG8tCw7nLaCebIR7XOZP9WE7AFWVEQY4mS5GIhZ/cvBDGDhJrqAyKr
	0BLjZfCCzPTmtCUlslRoKSwxHxrVrJXgue/oD8m0Zs+3Td8VKu06TobBB3YtehJ8lQYdtiDRCTOD3
	TEls4B/qY0BqQUWIDJKsNkxPKXeUCpEYwIZecq5k0ODN5B+QTb9GKa9inmFvXMwVvv5GuCjyLomm3
	9sPgeSWfAsR+HXtpB5DrhNtL71r1gt4Q5oKp+y5CJg+4EW5rtPpHHB/8ZVeDFBbgfhATiK3qfN+zx
	u5l5gZvQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK4-00000003mcm-13bk;
	Fri, 06 Nov 2026 03:09:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGL-0YMV;
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
Subject: [PATCH v2 2/6] ntp: Recalculate skew_delta when the phase offset changes
Date: Thu,  5 Nov 2026 19:08:51 -0800
Message-ID: <20261106030856.2538039-3-dwmw2@infradead.org>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The skew rate is recomputed only by second_overflow(), so when
time_offset or time_adjust changes mid-second (hardpps on each pulse,
adjtimex, adjtime()) the stale rate keeps delivering until the end of
the second, and the misdelivery lands in ntp_error. Pull the
computation out into ntp_update_skew_delta() and call it from the
writers. Settling of an opposing time_offset/time_adjust overlap stays
paced at one chunk per second, via the settle argument.

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
v2: No change.

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

