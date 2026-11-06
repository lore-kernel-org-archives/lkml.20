Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934543;
	b=kvWBFtd7hdr0JPo2yS+ibc5bUlIgd/UHaBAZIbF/Zus3jjGVWdINvXhRIoeHsIZTbHNd
	 TkN+GqokXz+DkUumFYMOJcYLA6mJRY+FXQsdqu4s6YR8tkqeuUNx/3BXMhUhkZynIVpgz
	 z4s9rQSum9HLb/f/U2UD117C9HvSEwptdfxS9EjqQX4mYn4OAT5Lt2ZS5q7H9hlJvuf7o
	 64ABsAuSjMb8T7ylzQ4c3D1+3yT0uZr7o08YSURH7bkZyDIJEk45roMMhLgxSjSjSGwpM
	 JjvT5iSqcz41kW5HomGndGqsKfNBHMJBGlgZPp/mRYfRBTcBtuBZp9+Pl8J2/G6bcQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934543;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=aG3qKpkU+Taiq7BxVOSCZg1B0hhudyigcABiRonPdW0=;
	b=RqFodXkRUJWYIYJGIlA3qwJEvLGbv/5lII+aJ+qHufEuNal2lqrZws4UTt6ZccqktZm2
	 xQ5LE+k4BGPfIDqX7Izxp1LeXZtWmcB7lN0qwV5aFydBgd9MUP5mS5tMZH3Y12m/oANb3
	 J9j6mfYfWxM1rfPz48NzHWL9hV3Ak9OXFM3RiQpWphIw0C1xL5elk/Wk5oORm4I5ElnH6
	 O1p8Iz4musGkbLnMx6ozlEbVITaYcOHZGFMQVMhbZE89Wg8VNoCjO3cWRrKyrHs2iiyWQ
	 ASRqTWrjpO6OQweUgwMRB/2HCi8Gc0g8gipv+CQuoP3bS1nosRJmZOJb3mqc7a16jHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DpgWGOyd;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D05606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D05606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DpgWGOyd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aG3qKpkU+Taiq7BxVOSCZg1B0hhudyigcABiRonPdW0=; b=DpgWGOydSfsQZugtXNwQYagFg0
	as3xG4PDAt+p9wBZ2uBOmb8hpI9iIMl1cDc351vLwUCYWhUcSKB/T7+xGmoo7jR6Nb034pVEC7b9h
	bY1VRJRH+Ye+wV4u2e7UL7+Hy1z4nioDZ3kqc5j1h5OOa4NePOW8Wr3QuBiqrR/LMYwt4G7PeBzbp
	AAd5kVZ+zyPVZU96tva+Gy9gqPuH64t5iGnxTl0kCChkeApsb2CNeqc0/2Z2XivhxocbAxB7YIfF9
	LOwiuJVIYTrV7GaqG4hZ8JlLgkBJJBxYympHFxDWWKXvrmtH9aZv5ja1FyZ2J88JbFouKXrIbsWHw
	s5824jBQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK1-0000000FwPE-1FLh;
	Fri, 06 Nov 2026 03:08:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGF-09Jj;
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
Subject: [PATCH v2 0/6] timekeeping: Reduce magnitude of ntp_error
Date: Thu,  5 Nov 2026 19:08:49 -0800
Message-ID: <20261106030856.2538039-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
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

The timekeeper's ntp_error variable tracks the delta between the ideal
time that the kernel *should* be reporting as CLOCK_REALTIME, and the
time that is *actually* being reported.

A previous patch series in v7.3, up to commit 794ddd6e15cf ("ntp:
Remove tick_length_base, use tick_length directly"), fixed *errors* in
the accounting of ntp_error — cases where the reported time would
diverge from the ideal time *without* the divergence being correctly
tracked in ntp_error for subsequent compensation.

This series is the next step: it reduces the magnitude of the
excursions which are (now) *correctly* tracked in ntp_error.

The ntp_error mechanism works fine when it remains close to zero. The
actual clock is steered back towards the ideal by dithering between
mult and mult+1 for each cycle, changing between the two each time
ntp_error crosses zero.

This doesn't work as well when the value of ntp_error gets higher. In
some cases, 83µs of ntp_error was seen. Draining that through the mult
dithering, at typically less than 1ns/s, could take days. And while it
does, the precision of the frequency that can be effected by the
kernel's timekeeping is limited by the integer quantisation, because
it's permanently biased to either mult or mult+1 according to the
direction of the persistent ntp_error, and frequencies between the two
values cannot be achieved by the normal dithering. On top of which,
chrony was attempting to discipline the *reported* clock, even as the
kernel was attempting to steer it as hard as it could (albeit not very
hard) back to the kernel's ideal.

There are two cases where during frequency/phase adjustment, the
change was effectively applied to the 'ideal' vs. 'actual' rate at
different moments in time. The accounting for this in ntp_error was
self-consistent, but the better answer is for them to be conceptually
applied at the same moment, without contributing anything to ntp_error
at all. That also removes the step which repaying that ntp_error would
have caused; the rate simply pivots at the moment of the change.

This turns out not to be theoretical: Jie Wang reports¹ that since the
v7.3 accounting fixes, phc2sys takes minutes instead of seconds to
settle CLOCK_REALTIME after a step of the PHC it follows, because its
large frequency corrections are charged to ntp_error and repaid only
through the dithering. Patch 1 of this series is the fix for that:
Yuan Wang has measured it restoring their gPTP settling times (back to
32s from 200-400s or more) and withdrawn the RFC posted in that thread
in its favour.

While the timekeeping code is applying a phase correction, that
applies an additional bias to the per-cycle 'mult' values. If a
tickless kernel goes idle while this skew is being applied, it can
continue to apply that bias *long* after it was intended to finish,
overshooting the intended phase correction (by 500µs/s in the case of
adjtime). Fix this in timekeeping_max_deferment() by requesting a
wakeup at the top of the next second while phase skew is being
applied. (NB: only for the core timekeeper, not aux clocks which
remain as they were.)

Finally, if ntp_error ever does get excessive, we can deliberately
apply a phase skew to return it to zero faster than the normal
dithering would permit. An equivalent mechanism was removed in commit
dc491596f639 ("timekeeping: Rework frequency adjustments to work
better w/ nohz") but especially with the timekeeping_max_deferment()
change mentioned above, this now works effectively even with (and in
fact especially with) tickless idle. But again only for the core
timekeeper... unless we want to wake for aux clocks too?

Tests running at https://david.woodhou.se/ntptest-virt/ on baseline
vs. patched kernels, both tickless and periodic. The effect is seen
most clearly on the tickless kernel, where the baseline experiences
much higher jitter around corrections that should be smooth.

The final patch, correcting the output of ktime_get_snapshot_id() for
ntp_error at the moment of the snapshot, was marked DO NOT MERGE in v1.
It trades monotonicity (of the snapshot output, across read methods)
for accuracy, and Rodolfo wanted an explicit OK from the consumers of
the PPS_FETCH timestamps it changes; Miroslav has given chrony's². The
in-kernel snapshot users do want *accurate* time rather than a time we
*know* is microseconds wrong because the kernel happened to be idle
accumulating ntp_error right before they asked. So the tag is dropped
and the patch is now intended for merging with the rest.

v2:
 • Rebase to v7.4-rc1.
 • Pull the dividend/mult restructure up from the final patch into patch 1 so
   the old and new mult calculations match visually, and rewrite the
   comment explaining the mid-tick compensation (John).
 • Fix the ADJ_OFFSET_READONLY test in patch 3: that flag aliases
   ADJ_NANO and only has its read-only meaning in the ADJ_ADJTIME
   form. Also trigger the immediate update for ADJ_TIMECONST and
   ADJ_STATUS, mirroring process_adjtimex_modes(). (Found by Sashiko.)
 • Claim the do_timer duty when a slew starts (patch 3) or a drain
   engages (patch 4), so the per-second wakeup is honoured even if
   every other CPU is already sleeping on a timer programmed before
   the slew began.
 • Clamp the proportional drain in patch 4 at 50ppm instead of
   maxadj/4, and document the bounded frequency excursion (Miroslav).
   The clamp also bounds the extrapolation arithmetic in patch 6
   against overflow (found by Sashiko).
 • Smaller cleanups: an explicit negative-drain test, rounding on the
   insane-delta path, and honesty in the comments about the drain
   bias.
 • Pull the pps_get_ts() conversion to ktime_get_snapshot_id() into
   this series, ahead of the snapshot correction, so that the change
   to the PPS_FETCH timestamps is explicit and covers all PPS
   consumers (Rodolfo).
 • Drop DO NOT MERGE from the final patch.

¹ https://lore.kernel.org/all/20261105032150.1763572-1-yuan1.wang@intel.com/
² https://lore.kernel.org/all/atoVLqWfyJtCfci2@localhost/

David Woodhouse (6):
      timekeeping: Allow tick_length changes to apply mid-tick
      ntp: Recalculate skew_delta when the phase offset changes
      timekeeping: Bound idle sleep while a phase slew is in flight
      timekeeping: Reinstate proportional correction of ntp_error
      pps: Always use ktime_get_snapshot_id() for pps_get_ts()
      timekeeping: Apply extrapolated ntp_error to clock snapshots

 include/linux/pps_kernel.h          |   4 +-
 include/linux/timekeeper_internal.h |  11 +-
 kernel/time/ntp.c                   | 144 ++++++++++++++----------
 kernel/time/tick-internal.h         |  18 +++
 kernel/time/timekeeping.c           | 211 ++++++++++++++++++++++++++++++++++--
 5 files changed, 318 insertions(+), 70 deletions(-)

base-commit: 6628e7d4c6b2f582557a3437606eac34b1067b40
--
2.43.0
