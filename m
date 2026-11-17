Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926009;
	b=NmiRDOvFug1qqW5fGuLDwCwOAd9omupkJN4Qx1rHSRijVb2hODSpRPy1TpIGnRKLcm1S
	 MfV+mew7xIaule2DbtRDnNSaeKeyZn98D4cs6eMGZSsPYKXU4/qMST4Z58AvkFWlQw24Z
	 iK+LPoxIn6xzH6/n0sS4POd3YNiXQN41XtdCCpr3EM6/UIdP5nOkGNzQxZkzPZhxELW4d
	 W0f9ASRraRGE6YLezvzhndeitbrk0nW4eYNtY82jVovj3vBY8FyFO6SFYMRjd+Bw40ktk
	 VXmHQjSdN/rdA1EPDwhVfBC3C/0wLlFeauhuCYH79CVcJdcV1TuorTZJPtnE2ow6/AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926009;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HPb65h8OBcYG7/F9YC6iLOa1Qw9VFaS80fuO3ofi+QI=;
	b=Yzy4LVuXt3BTkkBQxoi0jpmgbb/O0MXvyDGD/i4auu1fldX8/OwGDnS1PiCz1S3k+tVm
	 jR5jMBXT2XyZERmLTHn/h3Kz0u84QLkZPeQ2+lxnPV6LL+MBA6UdZb2d7VzqA7Yc/dAhS
	 FqWHG3Yl5RxJT30d4rgE+slGG2uRsBXHN8f6VtLl1xa8UPbkqb6rXUyxRAKPSmHRZqCl1
	 YbgI9d64eamihIWEnPHJWLSid+yqdxuLc2NtV1bRo7rBTqbZ4Ae0NJyXWUJqQ+PVs7OWy
	 vNcFXJ80BeJQKaYCjL83YyUE7xXFtcliadhjYT3Ix16RE72QjUtEMDXZz5emDVyGMqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=UUIo9jnp;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36721606A31C;
	Tue, 17 Nov 2026 14:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=UUIo9jnp
Received: from p-745-g5.pavel.bz (unknown [130.94.27.201])
	by mail.pavel.bz (Postfix) with ESMTPSA id 9FA69616B5;
	Tue, 17 Nov 2026 14:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 9FA69616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794926005; bh=HPb65h8OBcYG7/F9YC6iLOa1Qw9VFaS80fuO3ofi+QI=;
	h=From:To:Cc:Subject:Date:From;
	b=UUIo9jnpEPcemFVH0q2vTILp0SOZPT7jorW2k8CUS37qBA6+h5OOM0U9GbJ3lbBi7
	 JeT5EsceaTFm+N+tetnOS75rPWn0Sk764u9ibkYxaUo64HoP/7pG4cWaQAYgs8F4Fg
	 NTzXR1vXHLu1S6JostZXxcdVBbxQAI3nipXx666UMJb6o8d1tWGEInr4/VG6EVV7Nd
	 qPZOOSNPV9cpxd4ojOawml/deK+GiJ0FwcK0vKYz+pukJdH6v675BbyHqIz90ga1F+
	 l0L7DdT6Olk8SIZ8cyII/CNxqZFCagI2G85IzRv2lEYiR91OahGTumnuSuLWH1pT/K
	 CUPkf5s1cMMTw==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v5 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Tue, 17 Nov 2026 21:33:12 +0700
Message-ID: <20261117143314.41853-1-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
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

During a two-week campaign to make a Temple (XiiSound/Weltrend
040b:0897) wireless dongle audible I captured the complete control
traffic of the device on both Linux (usbmon) and the vendor's own
Windows 10 stack (USBPcap).  This cover letter summarizes what the
wire says about this chipset, because it differs from the device model
encoded in the recently merged workaround, commit ba9bccdf711a
("ALSA: usb-audio: Skip broken playback feature unit on XiiSound
chips"), which is queued for 7.5.

To be clear up front: that commit fixes the user-visible bug (the
dongle coming up silent or one-eared), nothing here is a regression
report against it, and this RFC is not asking for its immediate
removal.  It proposes the alternative I ended up running locally -
keep the playback feature unit exposed and make its hardware volume
work - and offers the captures as evidence, both for this design
discussion and for whoever debugs these devices next.

What the wire shows
===================

1. The playback feature unit is a working hardware volume.  Per-
   channel SET_CUR writes apply deterministically and independently
   (a fast pair CN1<-50 + CN2<-100 applies exactly; a lone channel
   write does not disturb its sibling), the master gates both ears
   symmetrically, and intermediate values are audible and graded.
   The vendor's Windows driver drives this exact unit on every slider
   and hardware-button step, mapped linearly from its slider percent
   (10% -> raw 9, 50% -> raw 49), and every intermediate value is
   audible there too.

2. The "any volume below the maximum mutes one or both channels"
   behaviour that motivated the skip is host-side, in three stacked
   layers:

   - the unit advertises a bogus 0.00..0.39 dB range, under which
      every user-space volume at or below 0 dB - the whole normal
      PipeWire range, 100% included - resolves to the raw minimum,
      which does silence the channel;
   - the stereo control's GET_CUR returns a constant value, so the
      sticky-GET sanity check classifies it broken and the probe
      writes the minimum to both channels at every mixer build;
   - user space applies one logical volume change as fragmented
      writes (one per channel, the first carrying the stale sibling
      value), and the device silently drops control writes in the
      first seconds after enumeration (measured: the window closes
      6.5-9 s after enumeration, with a ragged tail), so a stale
      channel can survive until some later write happens to refresh
      it.  The per-ear asymmetry users report is exactly this stale
      state, not a channel-mapping property: under wire-verified
      canonical writes the attenuation is symmetric (12/12 steps).

3. The Windows driver never reads back (GET_CUR is broken, so it
   cannot), and does not need to: it keeps the whole channel picture
   at a single source of truth, writes every channel of a control in
   one short burst - master first - and re-pushes the complete state
   at every device open.  That every-open re-push is what repairs
   whatever the enumeration window swallowed.

One consequence worth recording: the create-time pin writes of the
merged quirk sit inside the loss window and are dropped along with
every other early write.  The dongle still comes up audible because
it powers up with every volume channel at the maximum - which is what
the pin intended to enforce anyway - and the resume re-pin added in
its v3 is the part that does real work.  So the merged fix is sound
in effect; only its description of the hardware is not.

The RFC
=======

Patch 1 replaces the skip-and-pin with three quirk flags for
040b:0897: the new QUIRK_FLAG_MIXER_INIT_VOLUME_MAX (initialize the
channels of volume controls to the maximum instead of the minimum,
exactly where the broken-GET minimum writes happen) plus the existing
PLAYBACK/CAPTURE LINEAR_VOL flags (linear scale instead of the bogus
dB range).  Hardware volume then behaves like on Windows.

Patch 2 adds QUIRK_FLAG_MIXER_STATE_REPUSH, which replicates the
vendor's write discipline for write-lossy devices: volume and mute
puts only record values, one deferred flush writes each touched
feature unit in a single canonical burst (master first, derived from
the loudest channel), and every PCM stream open and resume re-push
the full cached state - the every-open repair the Windows stack
relies on.  This is new mechanism territory (I found no prior
proposal for write batching or re-push in the archives), hence RFC.

Both ran as locally built DKMS modules - first against a 7.2 tree over
the wire-verified campaign, then successive revisions against 7.3.4 -
and in daily use; details in the commit messages.

Known limitations, stated for the record:

  - Through the linear scale PipeWire applies its cubic, so the
    mid-slider feel is quieter than on Windows (50% -> raw ~12).
    Users who want the vendor loudness feel can set
    api.alsa.soft-mixer = true - which is effectively what the merged
    skip approach gives everyone.  The value of this RFC is that the
    choice stays with the user and the hardware volume keeps working
    for stacks that do drive it.
  - After a replug the device sits at its power-up state (maximum)
    until the first write lands past the loss window; with patch 2 a
    stream open re-pushes and heals, provided streams actually open
    and close (a wedged PipeWire session that holds the device open
    indefinitely defers the heal to the first user volume gesture).
  - Hardware buttons keep stepping an internal device state that the
    host cannot observe (no readback); neither approach - skip or
    drive - syncs with the buttons.

I am happy to rework or drop either patch; the capture evidence is
offered independently of the design preference.

Changes in v5
=============

Thanks to the sashiko AI review for the v4 pass; all three findings
are addressed:

  - The derived master is re-asserted by the stream-open and resume
    re-pushes again.  The v4 skip-equal guard starved it: once the
    cached master equaled the derived value, a master write dropped
    mid-session or lost across a device reset was never re-sent,
    while the channels were healed.  The skip now survives only at
    the control's raw maximum, where it is quiet and correct at the
    same time: a limit-valued write triggers the device's in-headset
    limit notification even when the value is unchanged, and every
    device reset leaves the master at raw max anyway.  A dropped
    master write below the maximum is healed by the next re-push; at
    the maximum it self-evidences as a missing arrival notification
    and heals at the next gesture.
  - A per-channel volume put that re-claims master derivation now
    also drops a still-unflushed explicit master value (the
    superseded value stayed pending and the flush wrote it over the
    newer channels); and only volume puts re-claim - a mute put no
    longer hands the master back to derivation.
  - The deferred put callback checks the mixer's disconnected flag
    under the mixer lock before arming the flush timer (a put racing
    the disconnect mark could re-arm after the cancels and run on
    freed memory; free() cancels the work before the controls are
    unregistered).

Wire-verified on the device against 7.3.4: an explicit master
superseded by a channel put inside one flush window produces the
derived burst only (the superseded value never reaches the wire); a
stream-open re-push at a non-limit volume re-asserts the master
(v4 skipped it); parked at the raw maximum the re-push keeps the
master absent; the runtime-PM paths are unchanged.

Not adopted: the straightforward reading of the first finding -
always re-assert the master - would fire the limit notification at
every stream open while the user sits at 100%, with no user action
nearby; the limit-aware re-assert keeps the healing without that
regression.  Mute-put ownership and the disconnect guard have no
wire-observable path on this device (it exposes no mute kctls, and
the race window is milliseconds wide) and are verified by
inspection.

Documentation/sound/alsa-configuration.rst |   9 +
sound/usb/mixer.c                          | 552 ++++++++++++++++++++++++++++-
sound/usb/mixer.h                          |  19 +
sound/usb/mixer_maps.c                     |  19 -
sound/usb/mixer_quirks.c                   |  59 ---
sound/usb/pcm.c                            |   4 +
sound/usb/quirks.c                         |   7 +
sound/usb/usbaudio.h                       |  29 ++
8 files changed, 604 insertions(+), 94 deletions(-)

base-commit: f930156051f6a3dcd454ff723ca36b14d49650d2
-- 
2.56.1

