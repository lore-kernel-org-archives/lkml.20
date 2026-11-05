Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848918;
	b=IZGVNGpCbwpjFNnYwUXii8zohRixjGxGM5yqu5jscL2pGZ4tHtacjd5pFOgj6LvfTqz0
	 gJXAUFKW6AZo76qTOIwPcStp57W2HUmGBBiv5JhQdZbUByPuf56rI3UhTT2ADvBzR0gDG
	 BgMdlsXy66F4CMng7VuS+RxJWoE+kmR5AXhI8ikfeiKrHB3mfN7QM7N++ZjVTtvfkDSX0
	 X+lftlQ27bQRx4SaQbjlBKJfX0RNk6F1Zv2Rh7QEymX/prkbHYfU3iMhlHtb6dhQsYlpw
	 rN4GrvK2w30OTV3LWKLprocike4EhzfvcWyQf02zwb7JcglnDREY78mqS0rO/lyzEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EFArIF6sOjpNy7cN2bW/BFVhudXgl9Cn4VSv2QrRuvE=;
	b=BKTZgUXAaZrDA0o/FvWgswDxWQrz5TNynYAn3dFjU/unvrqUewt8rIrJkNdwnnhiO0zC
	 yswQSjrNo+bA/UvPoym6P0Ok+tx002hRQNF9hbTKXXQMxPG7TBzd4upZMfdJ2im0euXIM
	 kbtuUy4Yyj2Clr6s9LYo/PWQvNS+aT/EVaVY1pdHLDak8KTQpZ5zoLfh0lmREF7ownnID
	 d7AYjIoXocD0AcSczazLpA1P7sgWBwhDwPNot+/O/jVDYkdSrUQSRq4H2AUVAkUHzv7xj
	 NBo6SHauu6T86gwEzk+KacMj6B05jwN6QztvETOzDoRhs50SvbO7YY01ktc3o7f+Aqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSjzgPyG;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0E606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B0E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSjzgPyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848918; x=1825384918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=emOWA2NJtx5fDm/eRbfu5nOZjN4XGGdhv3NSP4jKZdU=;
  b=kSjzgPyG0J9mD7p5Rnjr6jr4pfRE45BkfEhLdnieLJjOiVhYk6CXTjaG
   aPs18YB0hWJ2PkgnP14Lht80hOjbPCk1gZiT0qb/6MYHDv7k0DCAL0g6e
   SN3l88SF/qvhv4oaQkEVWELriQqhXYDATbi91bsOJ9q2wKF9HPmrNNFUD
   pHBKPR6qp59uKcr+hw9hqA/ykuJeYcuBg9zV7iYjpwOY0mBa4q27TebMZ
   CeQIDXuJBpLHHvkrOWzH4fnhjgdYmN8hNZhlsp5/QqaxSCj0vM0breCpc
   eR3R8gy2btW1SCJc6rMfXDrJZBEo45EKRhAJJkrVOSmbS2xWkDEdWIOj3
   A==;
X-CSE-ConnectionGUID: w2R7lLMxSW2KgmrE5q4Huw==
X-CSE-MsgGUID: 2CHZI7PRROK5MUiJXlWUAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2500641"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2500641"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:21:58 -0800
X-CSE-ConnectionGUID: a+Gnl4mZQzKEs150+CJCCw==
X-CSE-MsgGUID: Z4yC7B7xQ4C+uSB2rngcAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8665336"
Received: from qat-wangyuan-17e.sh.intel.com ([10.239.92.81])
  by fmviesa011.fm.intel.com with ESMTP; 04 Nov 2026 19:21:55 -0800
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
Subject: [RFC PATCH 0/1] timekeeping: Don't charge NTP frequency changes to ntp_error
Date: Thu,  5 Nov 2026 11:21:49 +0800
Message-Id: <20261105032150.1763572-1-yuan1.wang@intel.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

Since b7befd6d9120 ("timekeeping: Account for monotonicity adjustment in
ntp_error") we see phc2sys take minutes, instead of seconds, to settle
CLOCK_REALTIME back to a few tens of ns after the PHC it follows is
stepped. The PHC itself (ptp4l) recovers as fast as before; only the
PHC -> CLOCK_REALTIME loop is affected.

Setup: two Intel i226 NICs back to back, gPTP (802.1AS profile, L2 P2P),
ptp4l + "phc2sys -O 0 -c CLOCK_REALTIME -s <if>" on both ends, PREEMPT_RT,
HZ=1000, TSC clocksource. The grandmaster's PHC is stepped by +1s with
"testptp -t 1". Time until |phc2sys offset| stays below 100ns:

                                 GM phc2sys      slave phc2sys  slave ptp4l
  v7.0 (before the series)         51-56s (test team, slave side)
  v7.2.7    (b7befd6d9120 only)    257-386s        79-333s        33-34s
  v7.2.7 + revert of b7befd6d9120  32s             40-42s         34-35s
  v7.3      (whole series)         207/>361/>413s  79-293s        34-35s
  v7.3 + revert of the series      32s             40-41s         34-35s
  v7.3 + this patch                32s             40-41s         34-35s

  (">" = not settled before the next step 400s later)

What happens: after the step phc2sys slews CLOCK_REALTIME at up to 10%
(ADJ_TICK + ADJ_FREQUENCY) and then backs off by several percent per
second. Since b7befd6d9120 every one of these base-rate changes adds
offset * mult_adj to ntp_error - up to a tick's worth of cycles times the
frequency change, i.e. tens of microseconds per update. ntp_error is only
repaid by the +1 mult dither (a few hundred ppb here), so CLOCK_REALTIME
keeps moving on its own for minutes after phc2sys has converged, and the
servo keeps chasing it.

That correction is the one c2cda2a5bda9 ("timekeeping/ntp: Don't align
NTP frequency adjustments to ticks") removed in 2018: it makes the clock
behave as if a new frequency had been applied at the start of the tick
rather than when adjtimex() was called. As far as I can tell the v7 series
discussion didn't revisit that trade-off.

I think both views are right for different callers:

 - A new base rate set from user space (ADJ_FREQUENCY/ADJ_TICK) belongs to
   an external servo (chrony, ptp4l, phc2sys) that measures the clock
   directly. Any phase effect is seen and corrected by that servo; booking
   it in ntp_error as well makes the kernel pay it back a second time,
   slowly.

 - The kernel's own adjustments - the mult/mult+1 dither and the
   skew_delta bias that delivers time_offset/time_adjust - have a phase
   target inside the kernel, and there the compensation from b7befd6d9120
   is what keeps the delivered phase exact.

So the patch keeps the compensation for the dither and skew changes, but
applies a new NTP base rate without charging ntp_error, as before
b7befd6d9120.

Open question, mainly for David: if timekeeping_set_reference() (ffclock
branch) changes tick_length, it would now also be applied "at the time of
the update". If that path needs the as-if-at-tick semantics, I'd suggest
it delivers the phase through time_offset (which the series now makes
exact) or passes an explicit flag down to timekeeping_adjust(); happy to
rework the patch either way.

The patch doesn't change the kernel-internal slews. An adjtime()
(ADJ_OFFSET_SINGLESHOT) of +5000us with no servo running, measured as
CLOCK_REALTIME - CLOCK_MONOTONIC_RAW, settles 10-12s later at:
  v7.3:              5009255ns (+9.3us)
  v7.3 + this patch: 5001024ns (+1.0us)
(one run each, so I'd read that as "not worse" rather than "better"; the
residual error in both cases looks worth a separate look). Steady-state
phc2sys lock before the step is the same on all three 7.3 kernels
(7-10ns rms on the GM).

phc2sys -S (step instead of slew) avoids the problem on an unpatched
kernel - a step clears ntp_error - but steps are usually not acceptable
on TSN systems once the schedule is running, so that is only a
workaround.

This fixes a 7.2 regression, so it probably wants
Cc stable list once the approach is agreed.

Jie Wang (1):
  timekeeping: Don't charge NTP frequency changes to ntp_error

 kernel/time/timekeeping.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

