Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DA49893F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886114; cv=none; b=I46Fjg1xAzPS1+IyazwkfvL1jRxSiz+vtr1xb9x4opX4OqMmmOJv+3J4jPQgrJJwXAgB7hs4AccH2N8Hkw6dOoD3kcW4dzE0SkY/nJvoaKIVjRc7q4+SwoQKIudYkI5JR1tUg+vKRfcLTu6PQUegibHVMv59SyqDt6ybDNpLUlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886114; c=relaxed/simple;
	bh=d/F6O+juZK+aXAPF8HPSwAROKfZCMx4RLvp5Mdk+zf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEejo4FXhyAyM48wz07G5cUrsCo8LXx10Z8pw3mIKW15aVirb7df4uR7aohSZ3047Pab2AYOAypIktpBa74375sfVvfUdSNS4Ukk9xP+xFs//96fWgKnehs8cTutTZ2n3OYvvUF5Dcn/uAKq+Sjs/ieIid6EQ22IfT34k0FuyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fjm9I7hd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fjm9I7hd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KzO2lLjZrrm2iOPVI+z6Qz75CXBuYIcPxLn5cp2iniY=; b=Fjm9I7hdpDajTKg4SbVtCArCue
	61tgAt7AwTPevvrLPiQN8VZyCwAGNDgR0vX4qEHGfw0jzVCgWvK/hCrVbMugOD8Wy37kWlGDNpPaX
	WSMzrxVhjBxaqgUbIFU1mu7xMdH7R+faVHfE/8N1wBaER56NVY4sbbtzarVmciAsGwG9ZFIBzdwG0
	52d5WDNBXEss9K+ngjv9nrO1I67MNKWTD/VuaSPwy8HoaAGQsHcWegInPB0uRehCloSew0aTgY2id
	Ai3Fz0vkRSteUcy5ndCBeuBhH41Y5CIWjoE+LZNY34+TU57bM7HjsDKlWQMYQjXjscB3LtjNY2ZDP
	dOdcT2CA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCNHg-00000005MQ4-1xTs;
	Thu, 01 Oct 2026 20:21:42 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCNHd-000000008pN-2uqE;
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
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/5] timekeeping: Reduce magnitude of ntp_error
Date: Thu,  1 Oct 2026 21:21:29 +0100
Message-ID: <20261001202134.33929-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
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
actual clock is steered back towards the ideal by a single ±1
dithering of the per-cycle 'mult' period, changing between high and
low each time ntp_error crosses zero.

This doesn't work as well when the value of ntp_error gets higher. In
some cases, 83µs of ntp_error was seen. Draining that through the mult
±1 dithering, at typically less than 1ns/s, could take days. And while
it does, the precision of the frequency that can be effected by the
kernel's timekeeping is limited by the integer quantisation, because
it's permanently biased to either mult or mult+1 according to the
direction of the persistent ntp_error, and frequencies between the two
values cannot be achieved by the normal dithering. On top of which,
chrony was attempting to discipline the *reported* clock, even as
the kernel was attempting to steer it as hard as it could (albeit
not very hard) back to the kernel's ideal.

There are two cases where during frequency/phase adjustment, the
change was effectively applied to the 'ideal' vs 'actual' rate at
different moments in time. This accounting for this in ntp_error was
self-consistent, but the better answer is for them to be conceptually
applied at the same moment, without contributing anything to ntp_error
at all.

While the timekeeping code is applying a phase correction, that
applies an additional bias to the per-cycle 'mult' values. If a
tickless kernel goes idle while this skew is being applied, it can
continue to apply that bias *long* after it was intended to finish,
overshooting the intended phase correction (by 500µs/s in the case of
adjtime). Fix this in timekeeping_max_deferment() by requesting a
wakeup at the top of the next second while phase skew is being
applied. (NB: Only for the core timekeeper, not aux clocks which
remain as they were).

Finally, if ntp_error ever does get excessive, we can deliberately
apply a phase skew to return it to zero faster than the normal
dithering would permit. An equivalent mechanism was removed in commit
dc491596f639 ("timekeeping: Rework frequency adjustments to work
better w/ nohz") but especially with the timekeeping_max_deferment()
change mentioned above, this now works effectively even with (and
in fact especially with) tickless idle. But again only for the core
timekeeper... unless we want to wake for aux clocks too?

Tests running at https://david.woodhou.se/ntptest-virt/ on baseline
vs. patched kernels, both tickless and periodic. The effect is seen
most clearly on the tickless kernel, where the baseline experiences
much higher jitter around corrections that should be smooth.

Phase 1 was *correcting* the accounting of ntp_error. Phase 2 is
*reducing* the amount of ntp_error. Tacked on at the end, marked
DO NOT MERGE for now, is phase 3: *correcting* the output of
ktime_get_snapshot_id() for ntp_error at the moment of the snapshot.

This warrants further discussion, which is why it's being held back
for now. The logic is that snapshot users want *accurate* time, and
they don't want to be given a time that we *know* is microseconds
wrong just because we happened to be in a tickless kernel, running
idle for a large period accumulating divergence in ntp_error right
before they asked for their snapshot.

I vacillated about putting the correction as a separate field in the
snapshot for callers to apply only if they want it, but I think it
makes more sense just to return the corrected time in *all* cases,
unconditionally. Nobody *wants* inaccurate time. Except userspace,
where considerations about smoothness and monotonicity override.

David Woodhouse (5):
  timekeeping: Allow tick_length changes to apply mid-tick
  ntp: Recalculate skew_delta when the phase offset changes
  timekeeping: Bound idle sleep while a phase slew is in flight
  timekeeping: Reinstate proportional correction of ntp_error
  timekeeping: Apply extrapolated ntp_error to clock snapshots

 include/linux/timekeeper_internal.h |  10 +-
 kernel/time/ntp.c                   | 144 +++++++++++++++----------
 kernel/time/timekeeping.c           | 162 ++++++++++++++++++++++++++--
 3 files changed, 249 insertions(+), 67 deletions(-)

-- 
2.43.0

