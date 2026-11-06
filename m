Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934554;
	b=0iL2UIyCHpEwx5WLSf6xbByVnOOEut6mpdshSTMnCb5KMpZ54qtupjTG9c305zPt0kln
	 +KYwq7QLoS1dEOuUn8vNGufp5LOFPiWlitelx/rDKmyLQWNcCvE3bqhAEWnZU1nnDXeRF
	 seNZ7YjoIsEQy1pkCu70wgGKsWqhvSnOg31kxUy/sgm2lPooTepofPn5CSCVSt8TRGQ4z
	 d01kuAFUlVmHlR3uL2hVfqpqcw3r6+oIvXFIcs22qQQZnQ7KOeka9/ESUtkN5f8+7chw0
	 mN3BgKHoFxzXgDrAhRwjPOHZKU44PQi23F2JnlQi6fQVsfwHJfLQ/9fWtI7nxAneJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934554;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=aiGMh1j0u+PPtk2VdEIVP/q6FzywHxKvtOJtvRlEfO8=;
	b=Fz/YFryJXuL1BGUqYdZWNNkuyNfd4X3Q4XhIyqNyVs2HTzWa+6qWn5spcHgiA+U3Ud44
	 3lRS/2wt7s0MT5mPYy4n5UOJBXv3aUCPfp71Wr8s98swdpOFGoHd4Ta5/rAsOT9suHWb2
	 UwqVJz3ILfOLI72Wka430MdBzQXFTxeAAxoo0P06TcAWd6ZczG1iLK+gNohxAz3MYZNuD
	 nbD6WrU1OOifES0dJ0AspjW88NjkFMBpnuceB0rci0WHX0JsoWJRdQ5qUTExZRuiJZm0O
	 1SIFSd0OEdwGLMKQXP4sfJSJG1+tfhdMC3sZzakIJuhfJVb28XbzBNF7olJeeon043Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=desiato.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y5lu4Gqp;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC740606D83F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC740606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y5lu4Gqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=aiGMh1j0u+PPtk2VdEIVP/q6FzywHxKvtOJtvRlEfO8=; b=Y5lu4GqpGbraHIpAHSBqSS+kOT
	vt2QVT6IfPtYk7lXSHmf0Lc2sJqMIvARHQ9OSq/V0Pks5MpFjodt3efYW8hutY52jvNx5JX71haIl
	GFBTmHqhJey4bE7Tzlj6uXqjX/Qslhdbq9GZqKV1Tl4vwhR02+1w0RO3tuVjEWukbkbR02Ren3biH
	fKqnOZvB/gE/PVLBp7z9quslH9kA1efsfS6k7xcatF+biCbuLT+Ip4lvtzOLlMJ2054rVToB6gYDI
	GY4bVSeSjvBNY7KXU6439ZGD4mH4EOGSsru0dfxKnHcoxRgkmowC5gkY1h+qahpOTjxivod0h/DLd
	FGIHA1Yw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK4-00000003mcl-13gC;
	Fri, 06 Nov 2026 03:09:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGI-0L8l;
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
Subject: [PATCH v2 1/6] timekeeping: Allow tick_length changes to apply mid-tick
Date: Thu,  5 Nov 2026 19:08:50 -0800
Message-ID: <20261106030856.2538039-2-dwmw2@infradead.org>
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

When the NTP tick length changes, timekeeping_apply_adjustment() applies
the accounting for the new rate to ntp_error retrospectively for the
partial tick which is currently in progress. So the ideal line of the
clock conceptually changes from the moment of cycle_last (which can be
almost a full tick ago), and ntp_error grows to show the difference
between that and what userspace actually saw already.

Commit c2cda2a5bda9 ("timekeeping/ntp: Don't align NTP frequency
adjustments to ticks") removed the equivalent alignment term from the
old accounting in 2018, precisely so that a new frequency took effect
at the time of the update. Commit b7befd6d9120 ("timekeeping: Account
for monotonicity adjustment in ntp_error") effectively reinstated the
alignment, because *some* accounting is needed at that point — the
same retrospective mult change also carries the dither and skew
components, whose divergence genuinely does belong in ntp_error.

This can lead to a significant value (10s of microseconds) landing in
ntp_error which can take *days* to drain through the natural mult ±1
dithering.

The slow-draining ntp_error then applies a consistent bias to that ±1
dithering, meaning that the precision of the effective frequency
requested by userspace is limited to integer 'mult' values, since the
dithering is no longer effective to achieve the fractional parts.

Jie Wang reports that this makes phc2sys take minutes instead of
seconds to settle CLOCK_REALTIME after a step of the PHC it follows:
the servo slews at up to 10% and then backs off by several percent per
second, charging tens of microseconds to ntp_error on every update. On
a gPTP setup (ptp4l + phc2sys on back-to-back i226 NICs, PREEMPT_RT),
the time for the phc2sys offset to settle below 100ns after a 1s step
of the grandmaster's PHC rose from ~32s to 200-400s or more. Yuan Wang
measured this patch alone restoring it to 32s across three consecutive
steps, with the steady-state lock (~8ns rms) unchanged.

Fix this by allowing the rate change to be conceptually applied at
'offset' into the partial tick, rather than the start of the tick.
This means that the amount of delta which gets accumulated into
ntp_error remains low.

Rather than factoring this into timekeeping_apply_adjustment() which
already makes my eyes bleed, pre-correct it when the rate changes, to
adjust the 'intended' clock position according to the delta between
old and new tick lengths (but leaving skew as it should be).

Fixes: b7befd6d9120 ("timekeeping: Account for monotonicity adjustment in ntp_error")
Reported-by: Jie Wang <jie.wang@intel.com>
Closes: https://lore.kernel.org/all/20261105032150.1763572-1-yuan1.wang@intel.com/
Cc: stable@vger.kernel.org
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
v2: Pull the dividend/mult restructure up from patch 6 so the old and
    new calculations match visually, and rewrite the comment explaining
    the mid-tick compensation (John). Add the commit archaeology, the
    gPTP symptom and measurements from Jie Wang's report, with
    Fixes/Cc: stable.

 kernel/time/timekeeping.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..118612c4a82e 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2436,6 +2436,7 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 {
 	u64 ntp_tl = ntp_tick_length(tk->id);
 	s64 skew = ntp_get_skew_delta(tk->id);
+	u64 dividend;
 	u32 mult;
 
 	/*
@@ -2447,6 +2448,8 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		/* Revert to the base mult rate. */
 		mult = tk->tkr_mono.mult - tk->ntp_err_mult;
 	} else {
+		u64 old_ntp_tick = tk->ntp_tick;
+
 		tk->ntp_tick = ntp_tl;
 		tk->skew_delta = skew;
 		/*
@@ -2454,8 +2457,35 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		 * scale it back up to the full per-tick rate for the mult bias.
 		 */
 		skew *= NTP_INTERVAL_FREQ;
-		mult = div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
-				 tk->cycle_interval);
+		dividend = (tk->ntp_tick + skew) >> tk->ntp_error_shift;
+		mult = div64_u64(dividend, tk->cycle_interval);
+
+		/*
+		 * In timekeeping_apply_adjustment(), the mult_adj value is
+		 * retrospectively applied as if it had come into effect at
+		 * the *start* of the current tick.  Any discrepancy due to
+		 * the fact that time has *actually* been counted at the old
+		 * mult rate between the start of the tick and now ('offset'
+		 * cycles into that tick) is dumped into ntp_error.
+		 *
+		 * When tick_length is changed by a large amount, that can
+		 * lead to tens of microseconds of ntp_error being accrued.
+		 *
+		 * Fix this by conceptually applying the tick_length change
+		 * now (at 'offset'), rather than the start of the tick.
+		 *
+		 * That means calculating what 'mult' would have been with
+		 * the old ntp_tick length (but the *current* value of skew),
+		 * and pre-adjusting ntp_error to compensate.
+		 */
+		if (tk->ntp_tick != old_ntp_tick) {
+			u64 old_dividend = (old_ntp_tick + skew) >> tk->ntp_error_shift;
+			s64 old_base_mult = div64_u64(old_dividend, tk->cycle_interval);
+			s64 mult_delta = (s64)mult - old_base_mult;
+
+			tk->ntp_error -= ((s64)offset * mult_delta)
+					 << tk->ntp_error_shift;
+		}
 	}
 
 	/*
-- 
2.43.0

