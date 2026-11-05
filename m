Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848931;
	b=fom1vmdj67JnTKRuc1DtlL6PoVbaUU0LSKnrvq156+EbywZJ/eDNFhHWD9xhdh8MD6aR
	 D9AGodpgtbgztyV9JhQmN37UK032ImbVKReAObPNA4HUslzgrFsKRO0To9oX98GuWlKaV
	 0EmihIN7xXEqJldg0bheUlTZJj8CaTOlDL8I09ZNmnkrg5RmtO0cIY219HBFVx3YW22WW
	 2M3cyPaiI4rTtvevkfIV+UWTrsYNyrAb+K8KPvmuXOU3dUohOF8ss/P2ClURPySJhJxwc
	 lRD0ME8rQPmfuNz/BN0NeyV+eUHxdHSBLTzEa6t7nXZREdt94zJj3Mgygy+uMBYqdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TdBB0yyGtLQuKUsXcnXpRiF+tQ3UdqzUxr2nl7pIT7k=;
	b=wj1PHvlkRhD8UJATnwplV5QDWYP0z/vs/TzMSEb4s7y228HfddCX7mNAjToRT5MleE3p
	 CalcY8QliZk6MQ5Ed9DPnXYvIXbwdYZTRkSUOAo+RbTQVOmoVlXNh5eYrtvtXQ5qWZTGo
	 z85Hia7hfHv/G/pX8WhJMJabmN81IrRMA7X0Qbbbo02B20Mp0jCPIqIjFKJSN2ZNMm3G2
	 lrOsz0JFj3yJFe+OIFeZWWsAyL13C/5GHDweNqO0YvsNUIAXmkoxbWP8RRm5QIrUVEdHB
	 Gd1fL8FtRHac6nsrt5IvuclvIlEjnfaanN6oFX6WO1jgg3PThtNSeQzeznx8EcK7LxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWchmvKl;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E5A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWchmvKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848931; x=1825384931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aOGkfTh97wfJXiuMhDtr5g0NNpoV5HA+TJaGFscjVRA=;
  b=mWchmvKltuBvKBLqS5fDe9avOckTchTouJBPe8n1r1f/lmdeG7Zv0/QX
   WxdDESWVWhzj9U6wSm25BlD786q1OfrjusI99EJe75V2AHw36T/pWK5fI
   KOpofwzOLrwzpfrPj5nqIwIpOB+kjtOdYP2GG3xRVKKVR0qIDhxzxkSkP
   y9d335+ZPL5O1DX12levZk6tCyGe9vilpgEQB07fKJtbo/y5gw7A8FALo
   81oz3TXumOlAPJBbsLNxhuSqmGtO4CWeZYazdGDVniwMgmGfdN5um0OPd
   kzJHseUlu3g5tgv9l4FKf2fCUrwQYB0la1Psr6HGkhioyPhP0EoV19fUv
   A==;
X-CSE-ConnectionGUID: fpsx5o99SZua2WytA38Z7g==
X-CSE-MsgGUID: XOksv3QzQ5qLeGUKtQuOBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2500657"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2500657"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:22:10 -0800
X-CSE-ConnectionGUID: 7oUCEEBvTeC764QD7n8BBQ==
X-CSE-MsgGUID: V+/VC5FhSp+T8dLg7/OtTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8665357"
Received: from qat-wangyuan-17e.sh.intel.com ([10.239.92.81])
  by fmviesa011.fm.intel.com with ESMTP; 04 Nov 2026 19:22:08 -0800
From: Yuan Wang <yuan1.wang@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: jie.wang@intel.com,
	yifan2.li@intel.com,
	junxiao.chang@intel.com,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] timekeeping: Don't charge NTP frequency changes to ntp_error
Date: Thu,  5 Nov 2026 11:21:50 +0800
Message-Id: <20261105032150.1763572-2-yuan1.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105032150.1763572-1-yuan1.wang@intel.com>
References: <20261105032150.1763572-1-yuan1.wang@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jie Wang <jie.wang@intel.com>

Commit b7befd6d9120 ("timekeeping: Account for monotonicity adjustment
in ntp_error") adds the xtime_nsec monotonicity fixup to ntp_error for
every mult change, including the change of the base rate when user space
sets a new frequency via adjtimex(). That makes the clock behave as if
the new frequency had been applied at the start of the tick, which is
exactly the correction removed by commit c2cda2a5bda9 ("timekeeping/ntp:
Don't align NTP frequency adjustments to ticks").

The amount is offset * mult_adj, i.e. up to one tick worth of cycles
times the frequency change. After a clock step, phc2sys and ptp4l slew
CLOCK_REALTIME at up to 10% and then back off by several percent per
second, which charges tens of microseconds to ntp_error each second.
ntp_error is only repaid by the +1 mult dithering (tens to hundreds of
ppb), so the clock keeps drifting on its own for minutes and fights the
external servo.

On two Intel i226 NICs running gPTP (ptp4l + phc2sys on each end,
PREEMPT_RT, HZ=1000, TSC), after a 1s step of the grandmaster's PHC,
the time until the phc2sys offset stays below 100ns is:

                         GM phc2sys     slave phc2sys  slave ptp4l
  v7.3                   207/>361/>413s 79-293s        34-35s
  v7.3, series reverted  32s            40-41s         34-35s
  v7.3 + this patch      32s            40-41s         34-35s

">" means it had not settled before the next step, 400s later.

Keep the ntp_error compensation for the ntp_err_mult dithering and the
skew bias, but apply a new base rate without charging ntp_error, so a
frequency change takes effect at the time of the update again.

Fixes: b7befd6d9120 ("timekeeping: Account for monotonicity adjustment in ntp_error")

Signed-off-by: Jie Wang <jie.wang@intel.com>
---
 kernel/time/timekeeping.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..8f6ab6c077f0 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2347,7 +2347,8 @@ device_initcall(timekeeping_init_ops);
  */
 static __always_inline void timekeeping_apply_adjustment(struct timekeeper *tk,
 							 s64 offset,
-							 s32 mult_adj)
+							 s32 mult_adj,
+							 bool track_error)
 {
 	s64 interval = tk->cycle_interval;
 
@@ -2412,6 +2413,10 @@ static __always_inline void timekeeping_apply_adjustment(struct timekeeper *tk,
 	 * (in appropriate units) has to be added to ntp_error, in
 	 * order to correctly track the delta between the time
 	 * reported in xtime_nsec, and the intended time.
+	 *
+	 * The exception is a new NTP frequency (@track_error == false):
+	 * it takes effect at the time of this update, not at the start
+	 * of the tick, so there is no delta to track.
 	 */
 	if ((mult_adj > 0) && (tk->tkr_mono.mult + mult_adj < mult_adj)) {
 		/* NTP adjustment caused clocksource mult overflow */
@@ -2422,7 +2427,8 @@ static __always_inline void timekeeping_apply_adjustment(struct timekeeper *tk,
 	tk->tkr_mono.mult += mult_adj;
 	tk->xtime_interval += interval;
 	tk->tkr_mono.xtime_nsec -= offset;
-	tk->ntp_error += offset << tk->ntp_error_shift;
+	if (track_error)
+		tk->ntp_error += offset << tk->ntp_error_shift;
 }
 
 /*
@@ -2433,6 +2439,7 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 {
 	u64 ntp_tl = ntp_tick_length(tk->id);
 	s64 skew = ntp_get_skew_delta(tk->id);
+	bool freq_changed = tk->ntp_tick != ntp_tl;
 	u32 mult;
 
 	/*
@@ -2453,6 +2460,19 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 		skew *= NTP_INTERVAL_FREQ;
 		mult = div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
 				 tk->cycle_interval);
+
+		/*
+		 * Switch to the new base rate first. A new NTP frequency takes
+		 * effect at the time of this update rather than at the start of
+		 * the tick, so don't charge the realignment to ntp_error.
+		 * ntp_error is only repaid by the +1 mult dithering below, so
+		 * after a large frequency change (e.g. phc2sys/ptp4l slewing
+		 * after a clock step) it would otherwise drag the clock for
+		 * minutes against the external servo.
+		 */
+		timekeeping_apply_adjustment(tk, offset,
+					     mult + tk->ntp_err_mult - tk->tkr_mono.mult,
+					     !freq_changed);
 	}
 
 	/*
@@ -2464,7 +2484,7 @@ static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
 	tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
 	mult += tk->ntp_err_mult;
 
-	timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
+	timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult, true);
 
 	if (unlikely(tk->tkr_mono.clock->maxadj &&
 		(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
-- 
2.43.0

