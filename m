Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919377;
	b=C1TKw26JO63eZiQ7H2j+A9Io4AF6lrCkaWNdIHpNFZXMkBRWTkBNZnzbjuZwhSU7IxOM
	 vk3lQQ3oG24TeNbBnDDOeBJUB9+42W9LOjqzZiniroifHK9jY4sIxkB+ZEPshCp5shhQW
	 9ztfzxvMHv6TYnd9GWZsjyTxmXMbXoQufGiHUCew/C+gmYzDYsa0QxhAvN4d4onsmEnEr
	 Tg6itpESBVEDWG6RlikvfRi3lCJWnPAkIqEX9Sg7ZuyPnPtkQ403BlbAeM1sqDfvVXrxc
	 EQiMOZXVQsfIe1ReN4ZZYuH8JvGVH/ACej2qKQ67KSkVbs10mbp0xjfNtKKLZiyB3EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919377;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3Xn0aA/RpC+ypf1cljQYN6dDo9thg17XrvRwTIpGeN8=;
	b=i32/4qCnj44RUbNZRxMrZRciXELObAotxVYX39LCGilXCceATn3hLIl+Ei8Jx2B3T6cX
	 3dCMFD0M75STF7vjflceMngxaVj4OLwBV064ykNion86MoSEdSt8Z9/SUWiy5gbbJ21Dy
	 QofGhyeNatqA/JYkbY/IspDfNsbEGIz0UKNAkRYVwhR/+PdUIH5ZM7MBzqZrQ4oe/Z7zy
	 OIRUklAjAdAo49fLAh+Z0a3W3R5ZCZVewP+KAjMqx3YbarRAUYxB71kxxBFDBYYgxzuqF
	 ZYe9Bews5h4fpkZaWkEgaBVy0N7gm0KXsaRZVjwSAn9BMwWU13ZIvygb6AhOZzRpxjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=r2C7YPAd;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59721606A331;
	Tue, 17 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59721606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=r2C7YPAd
Received: from p-745-g5.pavel.bz (unknown [130.94.27.201])
	by mail.pavel.bz (Postfix) with ESMTPSA id 709D2616B5;
	Tue, 17 Nov 2026 12:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 709D2616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794919373; bh=3Xn0aA/RpC+ypf1cljQYN6dDo9thg17XrvRwTIpGeN8=;
	h=From:To:Cc:Subject:Date:From;
	b=r2C7YPAdve0XRNdT4Onz25jk7SwMPAdeTjoSiNqWQ4QUhqDNzDO3O1mLeQdSl8fQe
	 ptHW6PfIHrf0Rp3lPAXdzgQMMs2jWSZDivUZWeoDPqttOI7a5JzLhOHHo26Z7136Hu
	 4LPp9RRqNL3zwedRNL/SL4hkGdEp3jSgWZtFHxWblSg1kU58ectj2Z1BjdpdqeUlBt
	 3rKIum2Lc2txvqogv2eKf1kZUaymE2UN/4pLncJupPjV1YayQRMDXdfWq98MkJKw7H
	 eakufLDw04U9mkNsWF6zd5TdfsaZ0wV0lhU1/lczWzMB7kFD2pmXMcp3T9LC9rv91e
	 X/+RVCodmR0EQ==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Tue, 17 Nov 2026 19:42:40 +0700
Message-ID: <20261117124242.12237-1-a@pavel.bz>
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

Changes in v4
=============

Thanks again to the sashiko AI review for a pass over the v3 PM
integration; all seven findings are addressed:

  - restore_mixer_value() no longer writes the deferred controls
    under QUIRK_FLAG_MIXER_STATE_REPUSH (its finding that an unlocked
    restore could clobber values a deferred put just recorded, and
    re-sent a derived master from a cache lagging its channels).  A
    resume now re-pushes them through the flush mechanism, which also
    re-asserts cached mute switches - nothing is playing yet at that
    point, so this cannot chop a stream.
  - The re-push request is no longer a trylock-or-drop bool in the
    resume callback.  Requests are atomic bits; the worker re-checks
    them after every run, so a request raised while it runs (for
    example by the resume callback running on the very thread of a
    flush whose write triggered it, which holds the mixer lock) is
    no longer lost.  No PM callback blocks on the mixer lock anymore.
  - Suspend marks the mixer suspended before cancelling the flush
    timer; a flush already running stops before its next unit
    instead of issuing control transfers into an ongoing port
    suspend.  A write that fails mid-suspend keeps its value pending
    and is retried by the resume re-push - previously a failed mute
    write was dropped for good, because only volumes were re-asserted.
  - The explicit master is no longer sticky forever: writing any
    channel of the unit re-claims master derivation, so a master
    saved and restored by alsactl cannot pin the hardware volume
    permanently (an audio server driving only the per-channel
    control would never undo it otherwise).
  - Disconnect marks the mixer under the mixer lock before
    synchronizing on the flush worker, and every arming site either
    holds that lock and re-checks, or runs from a PM callback (which
    the USB core completes before calling the driver's disconnect),
    or is the worker itself before returning - no flush can be armed
    after the cancel returns, closing the use-after-free window.
  - The cache-invalidation suppression on device status
    notifications is restricted to the deferred volume/mute controls;
    other controls on the mixer invalidate as usual again.

The v3 design (non-blocking suspend cancel, derived-master
discipline, mixer-unit and read-only exclusion, dbg-level re-push
log) is unchanged.


Pavel Artemev (2):
  ALSA: usb-audio: drive XiiSound playback volume instead of skipping it
  ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

 Documentation/sound/alsa-configuration.rst |   9 +
 sound/usb/mixer.c                          | 523 ++++++++++++++++++++-
 sound/usb/mixer.h                          |  19 +
 sound/usb/mixer_maps.c                     |  19 -
 sound/usb/mixer_quirks.c                   |  59 ---
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   7 +
 sound/usb/usbaudio.h                       |  29 ++
 8 files changed, 575 insertions(+), 94 deletions(-)


base-commit: f930156051f6a3dcd454ff723ca36b14d49650d2
-- 
2.56.1

