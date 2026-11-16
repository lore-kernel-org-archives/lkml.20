Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843345;
	b=USl01U4DA8KfAaBT/X8pRgrDaPWkO3wonfGAKA2rQF9/8fSe53/u77pAZTdpr5DsLz5o
	 gz98ahABgNUcfVbnGxdtaqIg869GJAq9CFb8W2243HFhTtRi28UcLvgPdxbd0KHEZ7dVs
	 6lFjDmb5toassXrmkq3/FNuA20TWIq0CL+eCO6C9VauWX/gGz6KpqNVGTK/23dc7vGBX/
	 Cd8kAEc6B4nELUkH5pg1Cv95u6iwIvKHDdC8+FVX+r20tnfHzFVZnVsXlKzcK52M+fTb+
	 J4L1oVyyp709t7tIeynafY+QRR5gLji9OD645i5ww3sQtEYVQLeFtHEvJsezOu7FKeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843345;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ocTX1eLGCcY0UnxIPxYh0q5pPPMjLNIQ71WhlX+5BuI=;
	b=LCYEU71lgnOIO+wWZdre1YL2ayYiln4E/wMSmA5b8aK4CZRc+KQe3vszlVWr1KjdWhHj
	 5XpMsu/f3p1AZSrWT0CZXUNpf3TeuxqmZngV0QBYSaOYIG0jG76ibcAHBz50pnIlPQJ3O
	 HlOoeJJ2uxPW1JoRpmoPhAg1x/2YsQvRk50fZywbLm+PcE1eKpw7vvEVOVik1yDnRcV7M
	 vKWtEFmZo13QxwBvTqrccQeOMSTLtxG+a4OkwHCAD3HTvdYlHyTwYscM29tYzz1sV5TNN
	 xJnFH8eXggoYZy+w+Bx7BM5+kuSXa0VibQ5ixh2EUQmNxOZgbMnp9hJboG/i9Ou7hYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b="Y1Ms/lar";
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8AB606A31C;
	Mon, 16 Nov 2026 15:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=Y1Ms/lar
Received: from p-745-g5.lan (unknown [182.53.106.11])
	by mail.pavel.bz (Postfix) with ESMTPSA id 3C9BF6169C;
	Mon, 16 Nov 2026 15:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 3C9BF6169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794843336; bh=ocTX1eLGCcY0UnxIPxYh0q5pPPMjLNIQ71WhlX+5BuI=;
	h=From:To:Cc:Subject:Date:From;
	b=Y1Ms/larYct8Hpj1DAWT2k8758/Kms9673VoEXCsF2W1eD6DFRoWYpzFZNcn+v1ZJ
	 tOGYoJ7toRRa1EGz/bsOCjafi4z9PBaDbujcYpUHxk/uv/JQiY1WCLn14bMhaJmCZy
	 mnqbveelXQaMa16r6bePFtSfEWgpFfH/8320i/ik5P1uObP2ySP0LT0xPsvHNjwgOX
	 JTqNZmwkV54pksgaPTc5xjDWgdjiUJX2Ntqg03p4z3MZDCl6C8VQVSWeyOevzlKQCa
	 aCCc1wXLsXKkYqx0lHNKjo8HA+CwvYTpgRfLuhQAfoHpQFtbXrTZWy5qUENXFsE35r
	 uC3jVyBkPCIfQ==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Mon, 16 Nov 2026 22:35:19 +0700
Message-ID: <20261116153521.188570-1-a@pavel.bz>
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
040b:0897: the new QUIRK_FLAG_MIXER_INIT_VOLUME_MAX (initialize all
channels of every volume control to the maximum at mixer creation,
superseding the probe-time minimum writes) plus the existing
PLAYBACK/CAPTURE LINEAR_VOL flags (linear scale instead of the bogus
dB range).  Hardware volume then behaves like on Windows.

Patch 2 adds QUIRK_FLAG_MIXER_STATE_REPUSH, which replicates the
vendor's write discipline for write-lossy devices: puts only record
values, one deferred flush writes each touched feature unit in a
single canonical burst (master first, derived from the loudest
channel), and every PCM stream open re-pushes the full cached state -
the every-open repair the Windows stack relies on.  This is new
mechanism territory (I found no prior proposal for write batching or
re-push in the archives), hence RFC.

Both ran as locally built DKMS modules (7.2 tree, the port here is to
current sound.git master) through wire-verified end-to-end rounds -
replug, suspend/resume, balance, mute, rapid gestures during playback
- and in daily use; details in the commit messages.

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

Pavel Artemev (2):
  ALSA: usb-audio: drive XiiSound playback volume instead of skipping it
  ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag

 Documentation/sound/alsa-configuration.rst |   9 +
 sound/usb/mixer.c                          | 286 +++++++++++++++++++-
 sound/usb/mixer.h                          |  10 +
 sound/usb/mixer_maps.c                     |  19 -
 sound/usb/mixer_quirks.c                   |  99 ++++------
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   7 +
 sound/usb/usbaudio.h                       |  27 ++
 8 files changed, 376 insertions(+), 85 deletions(-)

base-commit: f930156051f6a3dcd454ff723ca36b14d49650d2
-- 
2.56.1

