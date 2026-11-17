Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907546;
	b=GHyCtcvvNnKz1neUyTVPyPe/SdAPGsuPrajYK28jKdgBroaVKzwdc+Y2WR4CtFw122uS
	 EofIAIo6mmBj2iCiRQiEcTorAmuttkgyYml1CUJCbIFNjvgX5gdaRtuedIVUARBx1wyog
	 6eNg8UToFrKxZnbRLPHWs8K09MXsZy5F33Ngb4WBeY75FaPDXWOL7/rzk9sVtKkR4TYBL
	 CMlVnkTRGwZa6xiQncJZa4IOJ7LvsifionNYRp4qVagOXF7ntl1QRyVG2V21AYQ4KwM/w
	 zK8z836e680pmVzzcZ0lpNXmcrWqcFvED5iRW/sez2He0ObojCDXdv4Au/VYmBcFWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907546;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=y0cgpHk6NQQUYZUOf4A88ICxDivUi0KT/iRnj6b84d8=;
	b=mMm4Ez7xchUy1bNB2+Lw+nC7kO3M8YgA6vbMEGXarDe2N+Wy5tV+/NEUaNcUVW9OHZRc
	 VEntqUfXb4a267JNHaftw9I+841dsM7Rj/6wVxdlF9H8Y5BCD0kYrcDZQv7Z/UajEY86u
	 4+0oSucI8KNvfkmM9FPK3heFSieHd7mJiPcdN8C5SprQjiH3A69b5teURAwApxTNH4j5X
	 lItctKgtD7T6jJ6o87FcFx+G60nU9svSY/I/5EtiRrqJaC/9sZ9xiHP6O5RU5C6MXiQBC
	 z9ifKfJufyZxNAH2z5unZJGe0n8r9BB7Wevd/8HVvSxEHk6nCc9sF0ak2fZB6GQEcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=u0JbN2hu;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E8606A31C;
	Tue, 17 Nov 2026 09:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=u0JbN2hu
Received: from p-745-g5.lan (unknown [182.52.139.49])
	by mail.pavel.bz (Postfix) with ESMTPSA id ECAE0616B5;
	Tue, 17 Nov 2026 09:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz ECAE0616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794907542; bh=y0cgpHk6NQQUYZUOf4A88ICxDivUi0KT/iRnj6b84d8=;
	h=From:To:Cc:Subject:Date:From;
	b=u0JbN2huQfQvSAhf6X/lJ8We8FN6ENpoVGkYQS+f/EWxwh4T6zJ+sn24EucumBsZf
	 BeyIlm8Fu1gXtMsvrOoDSvl/YusY03ItsOgdJX0xcVhJRonNlcaghcasZwgejmk88L
	 39N/M1VJuPd7gqFYI4C2oyq2j99YucJ7zSDqFGlt372gvrwehR3cX0K2qXaG6M/mFL
	 do9LKZ+VVdHBbKyxSu8QKEZtKEa7RTxjACbPiMfUKWlOEbzKSFwTFqxXCWClZyqtFX
	 Sx8uFCm126lxiFTmlhpA6a6oZF2Mv8IGTL/T1X3t36myHCHbVMUl1aS2iUcyh+Cm6S
	 3nU0In8r3xMkw==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Tue, 17 Nov 2026 16:25:30 +0700
Message-ID: <20261117092532.408981-1-a@pavel.bz>
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
the loudest channel), and every PCM stream open re-pushes the full
cached state - the every-open repair the Windows stack relies on.
This is new mechanism territory (I found no prior proposal for write
batching or re-push in the archives), hence RFC.

Both ran as locally built DKMS modules - first against a 7.2 tree over
the wire-verified campaign, then this exact tree against 7.3.4 - and
in daily use; details in the commit messages.

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

Changes in v3
=============

Thanks again to the sashiko AI review; everything it raised on this
patch is addressed:

  - Suspend no longer waits for an in-flight flush worker.  Its
    control writes can be blocked in runtime-PM resume, waiting for
    the suspend callback to finish, so cancel_delayed_work_sync()
    there could deadlock the PM worker against the flush worker when
    the device suspends while a flush is pending.  The cancel is now
    non-blocking; values recorded but not flushed stay in the cache
    and resume requests a full re-push that re-derives and re-asserts
    them (the resume path only trylocks the mixer lock, so a flush
    whose write triggered the resume itself never blocks it).
  - An explicit master put is sticky: derivation stops for that unit
    once user space has set the master - the previous revision only
    protected the value until the next full flush - and a full
    re-push now re-asserts the value the user chose.
  - Mixer unit controls are excluded from deferral: they share the
    feature put callback but store a 1-based input channel number in
    the selector field, which collides with the volume and mute
    selector values (num_outputs is only ever set for mixer units).
  - Read-only channels are neither written nor cached on the deferred
    path, matching the direct write path (a shared helper keeps the
    two from drifting).
  - The stream-open flush log moved from info to debug level.

Not adopted: taking a runtime-PM reference for the whole flush and
pre-updating the master cache, as suggested for the stale-restore
finding.  The reference does not close the underlying race (the flush
can still start while the device is suspending), and pre-setting the
master cache value would make the skip-equal guard suppress the master
write on the device-already-awake path, leaving a stale master
indefinitely.

Pavel Artemev (2):
  ALSA: usb-audio: drive XiiSound playback volume instead of skipping it
  ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

 Documentation/sound/alsa-configuration.rst |   9 +
 sound/usb/mixer.c                          | 410 ++++++++++++++++++++-
 sound/usb/mixer.h                          |  14 +
 sound/usb/mixer_maps.c                     |  19 -
 sound/usb/mixer_quirks.c                   |  59 ---
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   7 +
 sound/usb/usbaudio.h                       |  29 ++
 8 files changed, 458 insertions(+), 93 deletions(-)


base-commit: f930156051f6a3dcd454ff723ca36b14d49650d2
-- 
2.56.1

