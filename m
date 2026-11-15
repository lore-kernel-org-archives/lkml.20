Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779034;
	b=APgu+cm6SJqwnBGu2XepWadWrVSzg6BFaTeD2TIwaURxczvzdge7A/y5Sxle1MZnCTtr
	 EtGkIqBy8p1+ubPy7AuSA72BaI03bs7in0oN6XxwB0oTBhGc1vmmawY7ZbU1ZLCNtfTwd
	 i5QFGqi7K+FOwiLBZtyqxaLh+Ou+D7FkEuZUBeChovTZ7lAXXP4h3tCLwaPPou4oqaJv2
	 zVWLsoe4TIS3UhViimKWgmMVESvHiHj4851+9Y7OsmiYPyLYS1CtSRooKi896oa8r2ogj
	 ccUaHvuz6LpKDIGg2YpAIZwvyvLLu0KyLWKLE0WO4aTpzEUwCCoG2q+1wOhIt4ZoHkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779034;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=dRiOYP9EoDt7fhAWLGSJ+bnVf+MoNOIz//ddzyuZw5c=;
	b=4VVsABN5oLqnDhLtCQ71UGks48mGyY78HKIDIv1Ys8kWmch5Dln6oNYim5y7tfQJ/RMR
	 eiRXwd4lhZlEC0nQjSsYwXR9TX83sbRgg4bbAvZTENQon0mB1mrLmMWlhxkl1erzOq+A+
	 66h4RCVHUvrbTT3CWUf+hj7Ztyak1YvwgBfbrJ2xhys9iXCvO6X/aWzmzjaluaCeTOPcZ
	 /jzif2l2oQNJJyaCNIWDrenSBVDUp08L+wgOlzOGogkspdhS+Ka26DDTWpb7hoofrQCNe
	 WVYdQ38TR6cNaRbhdqItRwk0hRKF+snV1B/+VoypkNRx6ho0O6UJjByKcvv0AR/NOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=nPgQ2Ctf;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85B60A2614
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D85B60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=nPgQ2Ctf
DKIM2-Signature:  i=1; m=1; t=1794779031;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:WRd/6ANXVUMpGbj/VeeY2FfUIp1c
   nwJTrbWCgFs4zat+fG9LSNmCWTuAIeaGwhvg3A19iSwvRFreOWPELJngdJzmGbDOaddqQqn3q5x
   GAsE7pTohpthg/CN5kQKg4bMxpiecFNwDZ4FjzS2hZyCtF6+xJ+HOPiijhL1UxD7nN2OJpYsnqC
   KORj/P6+5PfIwgKByCb48jhv1KWYxlH1bujkFGYY8eJG9c4478u4lKajBDFZbXYC2iJ1CWnXwNb
   DYxl4tfCcVFLAQjMZHyr2RyVad6keZFXKMcw66OmP3Pv1DH/eHRUcA55fS8QdYSJKMQdJZg0epg
   1/XenVdKbdo3Lw==;
Message-Instance:  m=1;
 h=sha256:
   HNBiHKtzgKTFFlECZqAhPnTqJB2x5D2fhmX/dhqfGHg=:
   naskoHyFOpipxV+4Aa0RrCYO5rwx9DQboYZY3QMWxik=,
  sha512:
   H4tdJLfy7mCPUr8plLiEfPQrleN+GMf4rr8xhJ+VuOQUL/d7WXuEgl9/RwLgpPBk+5pTLq+goOHPCgHfbhcFIA==:
   /s6MWSxCsowiZVZ0xa65c2gDZ+nM0778hxnYXh+Qq+PCAXkQW6trvgOHtcKGAk24pyOBz7KXRxPeR2k5hiheqw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779020; x=1795383820; i=arc@gmx.li;
	bh=dRiOYP9EoDt7fhAWLGSJ+bnVf+MoNOIz//ddzyuZw5c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nPgQ2CtfmYypSfP/izDOSMaVpS+xVHp/+WvlCyL0t0iygwdtFs+OBegckQv9rga5
	 06YD7fFeueHA6KlR+a/dimU97GBWCaYMs5JFwnsp+rC5pEKW8G3wJ/5UZhYkFfj7u
	 dWqlYSzB40tZekak/uJ3PIgVLcLN/1KWdlr6y1rcjNJuhMAVws49VqyKVhufqpZvZ
	 q4P5b22F1wDshwPbjflal1vPj659HJT/Uo4cfyyAQptYi/dGem2k4c9d8Je0N1vNT
	 fIr7DPCmTF+6vkmQD8BoLTjBGyccLoyg6qTDiTq3ySRoQ4MFnOCXLmkh+LuCXhjEa
	 X2Qx0C5GTJ+ctsOhAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1xFDMO3AH5-003yMy; Sun, 15
 Nov 2026 22:43:39 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 00/19] Re: ALSA: mixer_audient: Cache rework and simplifications
Date: Sun, 15 Nov 2026 22:43:17 +0100
Message-ID: <20261115214336.17917-1-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PjT+memYb4AhKzVa5vX3Phs2dgm2TX4qqiGIro3GuUFHbFu6Tdc
 EeK9/PyQy/LwsERQVXCjyTSqYt1HAVjmgZgyXXzw32SX0/mMSV42Wj7fm93y1x5FLtFp8cI
 pzoE2Jhu7rL6FFI/rzBVPcHueDdSja+ob8UH8nbRtaeJfE38ihx+cpQ8h6PRg3D+lnPslP1
 ncKhkU8MLjN3gyr8dtonA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oTVcsTqoqwA=;D7Tr2vChBh86WMTEgW01WHHvJqz
 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
 1cBj9

Hi Will,

On Wed, Nov 11, 2026 at 08:37:14PM -0600, Will Porter wrote:
> On Tue, Nov 10, 2026 at 09:57:40PM +0100, Christian Ruppert wrote:
> > I realized that usb_mixer_elem_info already contains an integer array =
for
> > caching we could use instead of our manually allocated cache. I suspec=
t we
> > should rework patch 10 accordingly.
>=20
> I like the idea. When I read the code for it, I saw a few more places
> where the driver could be simpler. It seemed easier to show them as
> patches than to describe them, so here they are for you to try on the
> EVO4. Please take what you like and drop the rest.

OK, so here's RFC V4 with the cache changes and a few other
improvements inspired by your suggestions. Also contains your follow-up
patch weaved into 13 and 15. See below for details.

Compiles on Alsa master and compiled and tested on 7.3.4.

> > I'll prepare a new patch 10 but won't be able to test before the week-=
end.
>=20
> Patches 3 to 6 need the cache change as a base, so patch 2 is my
> version of it, only so that the rest can be tested. Please replace it
> with yours. Two questions came up when I wrote it:
>=20
> - The notify paths clear info->cached unless get_cur_broken is set. A
>   write-only control could not read its value back after that. Patch 2
>   sets get_cur_broken for the write-only controls. Is that a correct
>   use of the field?

I was wondering about the same but originally didn't plan to set it as
it doesn't make much sense without the control and head.id fields. To
settle the question once and for all, I decided to add all three to
patch 10 after all.

> - The interrupt path clears the bit of the channel number in the
>   message, and channel 0 clears all bits. Patch 2 uses the channel
>   index in the element as the bit. Would the channel number of the
>   request fit your EVO4 events better?

I tried to stick to the hardware channel numbers as they are the ones
used in mixer.c as well. Please see patch 10.

> > Do you think it makes sense to refactor FU12 caching as well?
>=20
> Yes, I think so: the driver then has one cache. Patch 6 does it.
>=20
> The patches:
>=20
> 1. Not for merging. It has the changes from your review as one diff,
>    so that patches 2 to 6 apply to the RFC with the enum fix.

OK, didn't touch those in the RFC, please squash them into the
respective patches.

> 2. Use cached and cache_val[] of usb_mixer_elem_info.

This is almost identical to what I had prepared, except for a few
parameter names and indices. Please double-check the new patch 10 to
make sure I didn't miss anything, I can't fully test it on the EVO.
There is also a subtle behavioural change when initializing write-only
cache values. Shouldn't have an impact as it only affects integer and
boolean types but let me know if something comes up in your tests.

> 3. Replace INIT_HW, FORCE_SET and CACHE with an access mode:
>    read-back, cached or write-only. The tables use only these three
>    combinations of the flags. Do you plan to use another combination
>    on the EVO4, for example INIT_HW on a control that can be read? If
>    so, I will drop this patch.

I don't like this, it violates the separation of mechanism from politics
which I hold dear. Also, see the newly added patch 19 for an example why
the flags are useful as they are (turns out ID12 is just such an INIT_HW
control that can be read).

> 4. Fill the cache on the first get or put, not at probe. The probe
>    then sends 12 fewer GET requests on the EVO4 and 56 fewer on the
>    iD14. Is there a reason for the EVO4 to read at probe?

This is a good idea, now (no longer) part of patch 10.

> 5. Use one get and one put for booleans, integers and enums. This
>    changes the code path of the EVO4 controls, which I cannot test.

This is also a good idea, I added patch 18 for this.

> 6. Use the same cache for the FU 12 control.

I added patch 19 with another proposal I came up with when working on
patch 18. Removes all iD14/FU12 specific functions and shortens the code
by another 60ish lines. Please double-check if this makes any sense as I
might have badly misunderstood something. We could even get rid of the
FU12 specific value type if the iD14 accepts -127 * 256 as a volume
setting (the one which is currently skipped and replaced with MUTE). In
this case FU12 would become a normal integer control with a step size of
256.

We might also make some more code more generic if we replace the current
hwchannels with a mask of don't-touch channels. This is not yet included
in the patches because I first wanted to discuss it with you and we
don't have to submit this as part of the current patch set, can be
submitted as a follow-up simplification for a future kernel version.

With above two items, all FU12 specific branches should be gone.

> [...]

I suggest we now proceed as follows:
- Re-check patches 1 through 12, I don't believe they need to be changed
  anymore unless if we discover a bug.
- Weave patch 17 into patches 13 through 16.
- Review patch 18 (I suggest to keep it separate as it is).
- Decide what you would like to do with patch 19 and the two related
  comments after your point 6, either drop or modify patch 16
  accordingly, possibly after rebasing it on top of patch 18.
- Submit the series for final review and testing and subsequent merging.

Do you think this would work?
  Christian

Christian Ruppert (13):
  ALSA: rename mixer_evo to mixer_audient
  ALSA: mixer_audient: explicitly define full control names
  ALSA: mixer_audient: clarify USB control message definition
  ALSA: mixer_audient: Add length check to USB transfer
  ALSA: mixer_audient: make USB control transfer size configurable
  ALSA: mixer_audient: Allow arbitrary boolean control values
  ALSA: mixer_audient: Add integer range checks
  ALSA: mixer_audient: Add control initialization at probe
  ALSA: mixer_audient: Add readback-free parameter set
  ALSA: mixer_audient: add control value caching
  ALSA: mixer_audient: Create matrix programmatically
  ALSA: mixer_audient: Unify snd_audient_*_set/get functions for
    different types
  ALSA: mixer_audient: Refactor FU12 special cases into generic set/get
    functions

Will Porter (6):
  ALSA: mixer_audient: Add a step size to integer controls
  ALSA: mixer_audient: Add enumerated controls
  ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
  ALSA: mixer_audient: Add Audient iD14 MkI controls
  ALSA: mixer_audient: Replace the Audient iD14 MkI FU 12 control
  ALSA: mixer_audient: Fold in the review changes to patches 12-16

 MAINTAINERS               |    7 +-
 sound/usb/Makefile        |    2 +-
 sound/usb/mixer_audient.c | 1118 +++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |   13 +
 sound/usb/mixer_evo.c     |  526 -----------------
 sound/usb/mixer_evo.h     |   12 -
 sound/usb/mixer_maps.c    |   10 +-
 sound/usb/mixer_quirks.c  |    5 +-
 8 files changed, 1148 insertions(+), 545 deletions(-)
 create mode 100644 sound/usb/mixer_audient.c
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.c
 delete mode 100644 sound/usb/mixer_evo.h

=2D-=20
2.56.1

