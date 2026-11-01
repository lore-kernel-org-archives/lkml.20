Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491245;
	b=gvutPwJoCKbaCMru0b1Uxu+aM/l29m3x08YjjN6SBBEGR0RZoH3qhGbtnSecs2f6qgfv
	 dfKHsyeXp4zaapqodGIgQqo+gP+XRa26snQYbRb2iKFmzJkP/kvMpzBCZmEnn/uFkZtAJ
	 VT1q+D9wG7OInQmPHVxsaXPK7grCq81nRgmwztYRHUkuuAJ2Pslcx8xp6raV7y+wxhf/z
	 A/fwdQGpOah4ohUMKmiiEba6ZrzMwenqLX/S6NhQy16R2JVpeFxS3H3Y+NZQqp5gC6qU0
	 Z8XxeylgoEL2FsbiNyoCJuy6QinV4qGWUXZMY/ThRaRCkvGmjJe+jsROTpGKhYsBOyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491245;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=DrvzZxSNnVXfjio/UllZB8KLNYJteZZWIj8cIcFI4RY=;
	b=2aQ9OcKR843tzL1cCmqPcw9rViCA5hR6w0jjwFR87BhnbM30Yc1jq5Z6zKXTSAV05mAN
	 l8cuZzRy2Q4gHshJJlVOK8Fvzj3ZCKGmEx5DWc1bTafaowlwj2SzaOgrNNRcDeyaAcu8P
	 qokdl6SaFBqKbnGQ+Ha5RIBXC+uHVLWAAV556DgtVCQZRpykNL9JAiS4OgeU8xAkTr5hk
	 ctBybHdaoN8GRgVEMMUUiW4TP9OgCkmMMSoWz1mxy6nE5GxcRAlWTb6lR5uo0TWZOgJmG
	 vX6qozJFeLnmwTBkDZ9qgHphwvkEjWAVlLpIcFapUYs7AAcfShAtt9vVnJofFHV75gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=tiAS1bvX;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2D606A31A;
	Sun,  1 Nov 2026 00:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE2D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=tiAS1bvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491240; x=1794096040; i=arc@gmx.li;
	bh=DrvzZxSNnVXfjio/UllZB8KLNYJteZZWIj8cIcFI4RY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tiAS1bvXNS2quuWhZ23+txjPrnowczAGBRivfXlKkqT0oB9J59J73K64y02LBk0r
	 fr+lmkKbLIu0omqCj1krldJ/lSBeuDjnIPXGT3jfdZK9yVSxod4zh32kWwqXZMDkq
	 2LxnmvFxGMcWMBCfz1VmjVqdaJhnX5DRpC0M6Sr+heYeh1PnqVVrIrkpMihvHesT3
	 ZN9bYXVC43ohhOQiUKZHfxzzNKiEpzNnZHSvOR8CQ/kK2T4dW76hZ62X7AUknDZEr
	 kJY1ztuRwO1GXbRDjpNgaBTUUA89ayfhsvNXfu4jdhzcq6fEVoD+v7jQAsF443Yg0
	 q0IztusGD/OpFmoi1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1xUClC3U2z-001m4X; Sun, 01
 Nov 2026 01:00:39 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 00/11] Re: ALSA: usb-audio: Audient iD14 MkI vendor controls
Date: Sun,  1 Nov 2026 01:00:02 +0100
Message-ID: <20261101000013.11880-1-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
References: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
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
X-Provags-ID: V03:K1:UQh5fD9QbHfeOJ4Rwhh/unizQWuVnjMVqVSlyMUjCD44LazVqba
 dyp+IZ61XMCj716x9RXoMMLC7tabTOzGVvcVvK1yRYzvX8qctVj4ApGdNrN/UhD/FQPDv9O
 alPDtb0mXnyuYvTk5gCnD6L/u+WuEzVF2FJVJ4688yZbG9d4y5h0HzXX9bxJsrwOOu2+6AK
 ArE6o3flaxdtayOdZQFVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GzmRa/+JNro=;3tkn+sLA1P8Z+mBO5IzA5jG0hkK
 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

Hi Will,

As discussed here an RFC to prepare iD14 support. It goes on top of the
previous patch set (minor fixes and tlv addition) which I hope can still
make it into 7.4.

The driver was restructured as agreed, with one (short) patch per item to
make the changes as understandable as possible. Up to you to squash them
into fewer ones before submitting everything in order to keep the final
patch series short.

The patches were generated for sound/master commit 603a4df9e6ae60a26adb335=
f
and tested with linux-7.3.1. In both cases, the "minor fixes and tlv
addition" patch series was applied first. Note that I could not fully test
everything using the EVO4 hardware, some of the newly possible
configurations are only usable with the iD14.

See below for a few more comments about the technical details.

  Christian

On Tue, Oct 27, 2026 at 09:36:23PM -0500, Will Porter wrote:
> On Wed, Oct 28, 2026 at 12:21:51AM +0100, Christian Ruppert wrote:
> > BTW: the mixer matrix seems to be identical also for the EVO8 so
> > chances are it's the same for most audient devices and we could
> > simply use a width and height parameter to generate it in a loop.
>=20
> That sounds good to me. On the iD14 it would be 14 inputs by 4
> outputs.

OK, defined as a list of names, see patch 11.

> > My view of the WO implementation would be to add three flags: cache,
> > init and force_write:
>=20
> These look right to me. As per-control flags, you could set init on the
> EVO matrix, and for the iD14 entries, could we set it only on the
> write-only controls? The matrix, routing and readable monitor controls
> keep their values across a replug on mains power, so I'd leave those
> untouched at probe. Would each entry also carry its init value? On the
> iD14 most start at off or the first item, but optical mode starts at
> S/PDIF.

Actually, the matrix settings also seem to survive a reboot on the EVO (as
long as the device remains powered) so finally I decided not to initialize
at enumeration either to make the behaviour consistent with the iD14.

Init values are defined in the control type and apply to both the hardware
(if the INIT_HW flag is set) and the cache (e.g. if the FORCE_SET flag is
set without INIT_HW).

> I'd keep force_write on the cached write-only controls, as a precaution
> against a reset that leaves the card registered. I haven't seen that
> on the iD14: the resets I've seen re-enumerate it and run probe again.
> For the readable controls, skipping an unchanged write seems fine to me.

OK, the flags should be rather orthogonal. I couldn't test all combination=
s
with the EVO, though, so don't hesitate to fix potential issues you might
discover.

> > - The intent of the control types was to associate unit/selector
> >   pairs with data types. I would add a new ctype for each
> >   unit/selector pair [...]
> > - I don't have a preference between explicit control names and the
> >   basename/suffix system the EVO driver currently uses. If you prefer
> >   we can simply replace the basename with a full name and remove the
> >   flags field in the controls.
>=20
> Yes, full names would make the iD14 table easier to check. And
> one ctype per unit/selector pair is fine with me.

ok, see patch 2 for the names and patch 3 to make the unit/selector pairs
more explicit.

> > - The boost switch writing 0x0 for 0dB gain and 0x0a00 for 10dB gain
> >   looks suspiciously like a volume control between 0dB and 10dB *
> >   256steps/dB. Does this control only accept these two values or can
> >   we simply implement it as a standard volume type controlling a mic
> >   pre-amp?
>=20
> Your guess was correct! The device answers no RANGE request for it, so
> I tried intermediate values with a loopback cable: 0x0100, 0x0280 and
> 0x0500 gave +1, +2.5 and +5 dB on both mic inputs, each tested
> successfully within 0.01 dB of nominal. I didn't test outside 0..+10 dB
> though.
>=20
> Even so, I'd like to keep it as a switch in this series, because the
> iD14's documentation describes a fixed +10 dB boost. Your max-for-true,
> min-for-false boolean would fit that, with 0 and 0x0a00. A 0..10 dB
> volume could follow as its own patch if people want it later. Does that
> sound reasonable?

OK, with the current implementation both should be possible with a simple
table change.

> [...]
> I haven't tested whether the iD14 rejects them. Could the generic put
> handlers reject values outside each control's writable ALSA range with
> -EINVAL, before converting them to device values? That would cover
> both devices.

OK, see patch 7.

> [...]

Christian Ruppert (11):
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

 MAINTAINERS               |   7 +-
 sound/usb/Makefile        |   2 +-
 sound/usb/mixer_audient.c | 633 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |  12 +
 sound/usb/mixer_evo.c     | 526 -------------------------------
 sound/usb/mixer_evo.h     |  12 -
 sound/usb/mixer_quirks.c  |   4 +-
 7 files changed, 652 insertions(+), 544 deletions(-)
 create mode 100644 sound/usb/mixer_audient.c
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.c
 delete mode 100644 sound/usb/mixer_evo.h

=2D-=20
2.56.0

