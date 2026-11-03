Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672448;
	b=uOC2gC+7zWJyky+ZhLVpkJ8R/nJdcI+tfvP/q8OcoV6KqvWy1ESEkiHy5jqrx+/rcZ4j
	 VD8YflIF7j1P2LKEDvck+MetJnCV3dJCeP5BnG+PUPngeL6jiieQY7WYeZADnMoQo9vIA
	 6UtG0YIerDui7xSF335J+resx2Qk0sfBkEytgrt/r1aSaEipf1X/cn71aQNMDtvmmAYi/
	 59LI2eiQ+6mPWujRMHOgShF1vlNXmmLM3hE20lu7l4GPHl1r2pWPxxPTXOKJ6zMJIZLsM
	 zfcLgkTXlIhyl/puiwsPLo7QLgMDUthmqg8eDEgBNY1h+Jakjb13mwTiNdp3npg7ckA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ldt0KL+wtpsquI4PRxn4/W+ECIAnCbas2MNt0CrXyVc=;
	b=xZlIKgVvfrEwSQZxf1lPxdoDFgs8oIQl6zWa6tiGfRt6/aqpU+qFSKRsScySyFs0ps6T
	 tMnfBf6HY1rkumR6xAHSY6tcrZKFwGaHHD2TJJ+VYSi65eZwyorrrnRA4sh2DAsOIuK23
	 v6xVH/ZsmOLxIA6Oc7wzSPPx12HHAkVV+AqkraJuTBddqXJ3n1iIAueu98ZtkpGLSC572
	 24kTPKshsOeeU4Dl6rTU3msNs0mNddhAxNsnRQO5Z2lvqZea19RvXVzIw8bwSEmsxPmEH
	 6COgve2N7uxbyDT+62Cx/Epi90WRVLDnBxDHmRPRmHcwp8QghmZcypXlIUCmpxYyP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91197606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91197606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so7246900c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672445; x=1794277245;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ldt0KL+wtpsquI4PRxn4/W+ECIAnCbas2MNt0CrXyVc=;
        b=swE4BZKw6fOF9BG3z72xa2tPGmpOKnwSdMWeEqmPCSPj7uhfitVWeh/Rf/3JPKs42+
         98LfubK9VZh+Dj4JCTiW2nPuWg4UClQNNV98JC7ZW/IHMuchKcFA30A9EjreBBf0RQK9
         QeWybwTSV/yEWPlMm/dk16XGg+46u4cdfvIB1H73PPxu23DMWqlLaHcNRHjHcdjPYVy4
         WcKKbc7DkXem5sPkofpgAhy+0j8dD0XbWaZczlTOmBRTUdCLb6eu9T+CRtvsTVBT7rJ2
         chtCRBiH818Up2SG6XSodiPrQCBWKkm/5YrRr3XJ68ZhnggEf9jIm1Qcp+jKGf96pCuw
         j1UA==
X-Forwarded-Encrypted: i=1; AKwUvBwbL1hy515plFNlc7OfKDobeDE3XGWDUBAfwobrKS5CuyBVVzt9usFFu9dQlIgV25sMPVXI8gu2Ulmf+YU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYgpjqf967qlj84K1O1Hly/tg1jAqPsjBkTfFuV93fyTZdH8UO
	7In1GXUWMc8m6E7ti5bAfst0fMBwalkPuzO2Rdt9K+jVKojuK1xUBz0h
X-Gm-Gg: AYBFou0tiH9empA8jc1ltf0rnxn7LJUAdtLF5ds8A8rsMIlFXxdOZWjCH5kvhWh60k1
	XBnzxGxrscqtiBlBD3yEqvneNdZZCE3Ghs5DySb+Z262AW1lYQWciLd7R4TX4Yle6A8ZS2UxzsL
	X66yN7eo/O4tdbWh7c7sYElZIbjXBwyt8XU0SegG7yIWLbAOeDo4RL4Ncz9lJ3xWu/Axff+CeSc
	eR0pY8Sb5GqJ3zyi+Ma7Q/UxN3xiVSBh1s4rLz+PSMy6mwPbzKvBPK+JFDXeaxARuWsvPFmoKyi
	68RmYTk38kCwaK+7PoeIrMTVCvn1JdXC0p6n4pq68W7BnKsUrSR8bnm/uijtwTxyG46n0U0PymR
	XUKDl7tMWbhoZX7WSaSwWhTmL0pnh/1NGjkK97ofLf9fiBzKeCGpOfgxy82SBrS+Akfn88DNP1A
	CTNynaIiJ3EAZVTZtI4BfxfI7hg/SOQq9M7i18koZffC0h0BNILoUOKVg7+UtNh3BsMPtt/HTt7
	qmj92Y3b9RcXgriRbDt8liL52520Eivyq/+kR5YkjT4Feoeyz/AECd+afp0kkI037lsDm0zEEmz
	4ms3yR6uQxbl8+zz53Art61qQtW5mNd0ZW29P5hGMdCHC2b0VE2NqY/R8O7uY5qmpjL2Y49v6sN
	10x28Fszzg+I2+R0=
X-Received: by 2002:a05:7022:120b:b0:151:5d01:9316 with SMTP id a92af1059eb24-1ac5ac4f406mr16475815c88.23.1793672444485;
        Mon, 02 Nov 2026 18:20:44 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm38657160c88.0.2026.11.02.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:20:43 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] usb: core: fix three use-after-free windows in the USB
 anchor protocol
Date: Tue, 03 Nov 2026 10:20:40 +0800
Message-ID: <179367244039.76534.2082245841677015355@kylinos.cn>
In-Reply-To: <179264120148.17277.68253767316647311@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Anchors are usually embedded in driver-private structures, and
several anchor API returns -- a non-zero
usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
usb_poison_anchored_urbs() and usb_scuttle_anchored_urbs() --
license the caller to free that memory.  The wakeup protocol backing
this license has three windows in which a URB giveback or unanchor
still touches the anchor after the caller has been told it is
unused:

 1. The waiter's condition check and the giveback's
    suspend_wakeups decrement plus wake_up() were not serialized,
    so the waiter could return while a giveback was still in
    flight.  Reported by syzbot repeatedly since 2019; patch 1
    references the two reports this analysis is built on.

 2. __usb_hcd_giveback_urb() captured urb->anchor at the top of
    the function but incremented suspend_wakeups only after DMA
    unmapping and the usbmon hooks.  A concurrent unanchor could
    empty the anchor with suspend_wakeups still zero, so the waiter
    returned and freed the anchor underneath the pending increment.
    No syzbot report is attributed to this interleaving; it was
    found by extending the analysis of patch 1.

 3. usb_unanchor_urb() and the giveback read urb->anchor and only
    then acquire anchor->lock; between the two the anchor can
    already have been freed.  The gap is as old as
    usb_unanchor_urb() itself and cannot be closed with a
    reference count: the first dereference of the freshly read
    pointer would have to be the increment itself.

Patch 1 completes the locking protocol for the waiter/wakeup side.
Patch 2 folds the giveback's pointer capture, the increment and the
unanchor into a single anchor->lock critical section.  Patch 3
turns the wakeup protocol into a lifetime protocol: the lockless
anchor reads run in RCU read-side critical sections, urb->anchor is
published with rcu_assign_pointer(), and every return that lets the
caller free the anchor first waits one synchronize_rcu() and
touches nothing on the anchor after it.

Patch 3 changes contracts, stated up front:

 - usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() may now sleep even on an empty
   anchor: the empty-anchor retry blocks on the anchor's wait queue
   instead of busy-waiting.  usb_scuttle_anchored_urbs() is the
   only contract change among the three (the others already slept
   transitively through usb_kill_urb()/usb_poison_urb()), and all
   three carry a might_sleep() so an atomic-context caller is
   caught at the call site with debugging configurations enabled.
   All in-tree callers already sleep.

 - usb_wait_anchor_empty_timeout() returns 1 on success instead of
   the remaining jiffies, and a successful wait -- including one
   with a zero timeout -- pays one RCU grace period.  The condition
   itself is unchanged from the wakeup-protocol fix.

 - The safe-to-free license is per caller: a caller that frees on
   its own successful return must first wait for any other
   in-flight teardown calls to return.  The kerneldoc of all four
   teardown returns states this proviso alongside the no-new-URBs
   one.

 - The cost is one grace period per successful teardown exit.  On
   x86-64 real hardware, 100 consecutive successful waits on an
   empty anchor cost 3.8 us per call on the base kernel and 3.9 us
   with this series (+4.3%); per call site, a usbtmc synchronous
   read converges on a kill and a scuttle and pays two grace
   periods, btusb pays one per anchor it stops, and zd1211rw one
   per command batch.  It is small next to the URB I/O these paths
   bracket, but it is the price of the free-after-return guarantee.

Why the retry loop must not busy-wait: on !PREEMPT_RCU kernels
whose scheduler tick reports no quiescent state for a spinning
process context (the v6.6 stable tree, for one; the 7.3 base of
this series adds process context only with CONFIG_PREEMPT_COUNT),
a busy retry stalls every grace period that still awaits that
CPU's quiescent state for as long as it spins, and under real-time
scheduling it can starve the very completion path it is waiting
for.  On PREEMPT_RCU builds the tick reports from process context
and the window self-heals, which is why the v1 test kernels never
showed it.  Current mainline x86 can no longer build a !PREEMPT_RCU
kernel at all (since 7dadeaa6e851); the exposure is the stable
backports of this series and older kernels.

The sleeping retry keeps the re-drain behavior of the busy loop it
replaces: usb_anchor_urb() wakes the anchor's wait queue (gated by
waitqueue_active(), so the per-submission hot path stays off the
wakeup machinery when no drain is sleeping; both the wakeup and the
sleepers' condition evaluation run under anchor->lock, so the gate
cannot lose a wakeup), and the wait also ends -- without declaring
the anchor unused -- when a URB is anchored after the drain, so the
drain restarts and tears the late arrival down too.  A
late-anchored URB cannot strand the teardown.

No fields are added to struct usb_anchor or struct urb, and no
driver changes are needed.

Testing:

 - A QEMU/KASAN attack harness reproduced each window separately
   (deterministic arming for the two giveback windows, a forced
   free inside the read-to-lock gap for the third) and verified
   that each patch closes its own window with zero reports under
   identical pressure.  The v2 kernel reruns the full matrix with
   zero reports and keeps the zero-timeout contract (empty anchor,
   timeout 0, returns 1).

 - The livelock boundary is driven directly: a waiter thread bound
   to CPU0 calls usb_wait_anchor_empty_timeout() on a shared anchor
   while a killer thread bound to CPU1 calls
   usb_kill_anchored_urbs(), round after round, on v6.6 (the
   stable-backport representative, where PREEMPT_NONE x86 is still
   selectable) with PREEMPT_NONE and no PREEMPT_DYNAMIC.  The v1
   kernel wedges in the first waiter-first round -- kill rounds
   stop completing and RCU stall warnings follow -- while the v2
   kernel completes every round; both complete every round on
   preemptible configs.

 - The late-anchor liveness of the sleeping retry is probed
   directly: a scuttle thread is parked in the empty-anchor wait
   behind a manual suspend_wakeups pin, a never-submitted URB is
   anchored after it sleeps, and the pin is dropped.  The
   intermediate v2 kernel (before the re-drain fix) never returns,
   while the final v2 kernel wakes, drains the late arrival and
   returns.

 - The full stack also ran on real x86-64 hardware with KASAN
   kernels built from the same base, on two machines.  The base
   kernel hits every probe: both deterministic windows fire within
   100 iterations (hundreds of probe arm hits), and the natural
   free-race variants hit within 2000 iterations with zero window
   widening -- one of them with no arming at all on the second
   machine.  The kernel with all three patches runs the identical
   workload with zero reports (the attack still executes there,
   its probes arm hundreds of times too, only the windows are
   gone), and completes the kill-in-parallel-with-wait rounds
   (10/10) and the loser-path late-anchored-URB drain on real
   hardware as well.

checkpatch: 0 errors, 0 warnings for all three patches.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---

Changes in v2 (patches 2 and 3; patch 1 is unchanged):

 - Patch 2's usb_unanchor_urb_and_suspend_wakeups() race-loser
   path cleared the local anchor variable before the shared
   unlock, so the documented lose-the-race return unlocked
   &NULL->lock -- a near-NULL fault with the real anchor left
   locked.  v2 unlocks, in each branch, the anchor that branch
   locked.  (Found by our own review of the v1 series.)

 - The kill/poison/scuttle empty-anchor retry waits on the
   anchor's wait queue and takes the same grace-period exit as
   usb_wait_anchor_empty_timeout() instead of busy-waiting,
   removing the self-deadlocking busy loop on !PREEMPT_RCU
   kernels (review feedback on v1).

 - The retry keeps the re-drain behavior of the busy loop:
   usb_anchor_urb() wakes the anchor's wait queue and the
   teardown wait ends on a late-anchored URB, so the drain
   restarts for it instead of stranding a teardown that would
   previously have killed it (review feedback on the v2 draft).
   The wake is gated by waitqueue_active() so the per-submission
   hot path stays off the wakeup machinery when no drain is
   sleeping.

 - The teardown functions no longer take suspend_wakeups pins of
   their own: the pins of an earlier v2 draft let a concurrent
   kill/poison/scuttle make a zero- or short-timeout wait on an
   empty anchor spuriously return 0 (review feedback on v1).  The
   wait condition is again the giveback-only check, each teardown
   exit waits its one grace period and touches nothing after it,
   and concurrent teardown calls remain governed by the per-caller
   proviso, as in the baseline.

 - The safe-to-free kerneldoc of the four teardown returns now
   also excludes concurrent in-flight teardown calls on the same
   anchor, states the completion-callback recursion ban, and
   notes that a manually held suspend_wakeups pin holds up a
   teardown until released; kill/poison/scuttle carry
   might_sleep() (for kill and poison it covers the empty-anchor
   entry path); in-code comments spell out that
   usb_anchor_check_wakeup()'s success does not by itself license
   freeing, and why the waitqueue_active() gate is safe under
   anchor->lock.

 - The anchor documentation now matches the new contract: the
   deallocation section of
   Documentation/driver-api/usb/anchors.rst states that freeing
   requires a successful teardown return with no concurrent
   anchoring or in-flight teardown, and the wait section
   describes the 0/1 return values and the one-grace-period
   overrun.

 - Cover letter: per-call-site grace-period cost enumeration, the
   livelock test evidence, and the two-machine real-hardware
   results.

 Documentation/driver-api/usb/anchors.rst |  23 +-
 drivers/usb/core/hcd.c                   |  10 +-
 drivers/usb/core/urb.c                   | 388 ++++++++++++++++++++++++++++-=
--
 drivers/usb/core/usb.h                   |   1 +
 include/linux/usb.h                      |   7 +-
 5 files changed, 382 insertions(+), 47 deletions(-)

--=20
2.39.5 (Apple Git-150)
