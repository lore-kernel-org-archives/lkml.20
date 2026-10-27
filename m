Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143326;
	b=TLGeEByKtiM1RtmWtFMPQZigXXnOJ1nCFvkZ2lreYIt7Lvhr7GkVNF54gNvoZZQU04Oq
	 v4Tj2qaKZwxfrA49CbMDlIad2eh4JhQKcAGjntFOxNVHUEpJOI+bDl+MvxC5Ma9wk0GzV
	 8XIPXmwkWJcXNJbTMniPx32UkKs+WQiN1inKyDPWeFpMCWAmOplqpfTvahCZrslyU4KtT
	 haNjPm9EQF5F0/cUUmaaxJG6JwnfDUqxyjUGtPQLlmii+V5xDDp6TFRPq8V6ABz2Rl3hf
	 GlMfOJlvQAzZTcq7vbA9McpuoyTeE252lyudiKY+HiR/QolUHGTGZn6fM7HuzP0KoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143326;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport:Content-Transfer-Encoding;
	bh=P0LSFg1o1ZmVNtAhrNTjE10Rjgh6BV2vtrm+JZgwf0g=;
	b=PIUk0ydzQ2KxMwVqBHWGnMfrdumQFmI8kQHwBGwkPO5h/TS1HJvxiqWoBzc/FeQle3mZ
	 V+IqndXvs0sD75evYWq+1Fm6uSEHKRfxJB9AcS5TsuAfT3zr2VFwwOJJP/Zy9ajXi5rbZ
	 +C7YSmC8nbYT5arHsrXBva9sx9ZVHfJj1Lgu+rJ6VlGAUMUN01ROwETUrF/ILpzgrP4Q3
	 /FxPIIEfMFHJS0PPtItXp+Oau1XTSaClD9kabx1X2+idnUob3oK9BGjfkKvnB9ZxQjdwn
	 cX/IUHEsWtSmV+ovOkfesmBmHZlERkijDfoYMq4Od8kqhgbrS/pe5A2BIwZ8f++BfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Az+7ru1C;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18A606A31A;
	Tue, 27 Oct 2026 23:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F18A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Az+7ru1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793143310; x=1793748110; i=arc@gmx.li;
	bh=P0LSFg1o1ZmVNtAhrNTjE10Rjgh6BV2vtrm+JZgwf0g=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Az+7ru1CKexfoqQZhwKJM4iwY7mtXjtNXtvrl0qeXGYLgNziGQKm77FcUQz1ttP1
	 6T1qEjzTaA5DnInHGva+lfkYwXARoo0nPobCkcDoHDdho1dfSNO75LT+ABwkLXv6I
	 2SBARK974I24ClEHShGCKTucTxvMz8NB+YinNodpCOtZFyTlxEvUQ3Kk0C9dEy5jm
	 GtsljjqQDdVYpYhbnPfNzvP8oNUTdnwDvnjWFOQR4wTSNyEKIDz6Ty54l0uwFeInU
	 i0MJMVyNo87DteGr/tBbSlaiXxVjgOt2LBXPOEFZ/gn6YNjF7ZhFUIo9DIfOArOge
	 VaGOban3WcTHVwisDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKhm-1xBSFA2UnK-00J1sC; Wed, 28
 Oct 2026 00:21:50 +0100
Date: Wed, 28 Oct 2026 00:21:51 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
Message-ID: <auEyD23PT_kpJsrJ@khmer.arcnet>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
 <at-dpPOGs2zD2fuL@khmer.arcnet>
 <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
X-Provags-ID: V03:K1:Fhd5zmDykTh5YrMAC3TRgKptQuW2NvqEWjorhg7lvOQcsox/oAe
 MKNa7rZNzDGjP2x8cG2RIGd9ydDNAd1BIiW8E+wP3dz3nlM0VFZ9NRcXchceRvP5GUnqFRC
 W5MCg80k+wG7bEnRAmDF9wb7AM9GKT7J052eYxSHjJdoDyEAieBnLY9jZu2yh9HrQRLbCb5
 UpyPw/txw4meOSBodlgNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F0zUQvMNhpc=;SixDtEN7gdUZbOwbA/J5npe7zm9
 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
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Mon, Oct 26, 2026 at 04:44:50PM -0500, Will Porter wrote:
> On Mon, Oct 26, 2026 at 07:36:24PM +0100, Christian Ruppert wrote:
> > I took a look at this question and it seems like we can share the majo=
rity
> > of code in the EVO driver by complementing it with the following featu=
res:
> > - variable width read/write
> > - caching of write-only values
> > - enum data type
>=20
> Thanks for looking into this so closely, and for the fixes. I like
> the idea of one driver, and I'd like to find out whether the iD line fit=
s.
>=20
> Your TLV in patch 4/4 is the same one I use for the iD14 matrix: same
> unit 0x3C, s16 in 1/256 dB, -128 to +6 dB. That made me wonder whether
> the iD14 matrix could use your MIXER type almost as it is.

Agreed. If my understanding is correct, this type could be reused without
any modifications. The others would have to be newly defined due to
different unit IDs/control selectors. BTW: the mixer matrix seems to be
identical also for the EVO8 so chances are it's the same for most audient
devices and we could simply use a width and height parameter to generate
it in a loop.

> Its channel
> number is input * 4 + output, so Main L/R and Cue L/R of each input
> are adjacent, like your stereo pairs. Could we expose it as 28
> controls with two values each, rather than my 56 single-value ones?
> An input's level and pan in a mix set its L and R values together,
> so a pair seems a natural fit. Does that look right to you?

This is exactly what the stereo pairs do for the EVO. For example, mic 1
shows up as one stereo pair which can be either recorded on both channels
(paned between L and R) or exclusively on the left one if it's connected
to a stereo mic. Same for mic 2 (which can be used as the right channel
of a stereo mic or an independently paned mic). The same principle applies
for the L and R outputs of the monitor and USB main out where it seems a
bit more quirky but is coherent with the Mics. That said, the existing
table system would also allow for individual channels or grouping them in
"mini-matrices of four" but neither seemed right when looking at them in
alsamixer and so I stuck with one stereo mixer for each (mono) input
channel, similar to most mixing consoles.

> > The only part which seems more problematic is probably FU12 which look=
s
> > like it requires some custom logic and would still need actual code.
>=20
> Agreed. I'd keep FU 12 as its own code.
>=20
> A few questions about the rest:
>=20
> 1. Read before write. As I understand it, the put handlers in
>    mixer_evo.c read the value first to see if it changed. On the iD14,
>    GET stalls for mic boost, input polarity, optical mode and the iD
>    key function, so a put that reads first would fail there. Talkback
>    source always reads 0, so a read would hide real changes. Could
>    these write-only controls skip GET in both get and put, with get
>    returning the cached value? And could every put still send the
>    value, even when it matches the cache, so that "alsactl restore"
>    reaches a device that was reset?

My view of the WO implementation would be to add three flags: cache, init
and force_write:
- If cache is set, the values will be cached and the channel not marked as
  volatile. No need to read back actual values from USB before a write in
  this case. This could also be used in the EVO for the mixer matrix which
  doesn't have physical controls that can change values while the driver
  doesn't look. Didn't implement it to not complicate the driver with
  unnecessary caching but if we need caching anyway we should use it.
- If init is set, the driver will initialize the control at probe. The EVO
  mixer matrix' initial read returns a wrong value so initialization would
  be great. Also not implemented today because there's no need to complica=
te
  the driver for a control which must be fiddled with anyway before it is
  useful but if we have the feature we should use it.
- If force_write is set, the driver will always write the value, no matter
  if a cached (or previously read) value is identical. IMHO this is mainly
  required for broken or quirky controls but I'm a bit undecided if it
  would really hurt to simply make this behaviour the default for
  everything.

> 2. The cache. My driver writes a known value at probe (off or none,
>    and for optical mode its measured power-on mode, S/PDIF) and
>    updates the cache only after a full-length write. If the probe
>    write fails, an enum reads "Unknown" and a switch reads off. Would
>    that approach work for you?

This is very much in line with what I was thinking, see above.

> 3. Control entries. The iD14 table uses 16 unit/selector pairs and
>    explicit control names, such as "Main Out L Source Playback Enum".
>    It also needs volumes in 1 dB steps (0..128, stored as s16
>    1/256 dB), a boost switch that writes 0x0a00 for on, and enums
>    that map items to device values, plus an "Other" item that only
>    get reports, for values outside the list. Would it make sense to
>    move the unit, selector and an optional full name into each control
>    entry, and add the new value formats (1 dB volumes, boost, enum)
>    as ctypes? Or would you structure it differently?

This is several questions in one, let me try not to forget an answer ;)
- The intent of the control types was to associate unit/selector pairs
  with data types. I would add a new ctype for each unit/selector pair
  but am open to move unit/selector to the controls and only leave the
  data type definition in ctype (which will then become rather a dtype)
  if it significantly reduces repetition. I'm afraid it might just shift
  repetition to the controls table, though. Btw: I like the unit/selector
  macros, will introduce this also for the EVO.
- I don't have a preference between explicit control names and the
  basename/suffix system the EVO driver currently uses. If you prefer we
  can simply replace the basename with a full name and remove the flags
  field in the controls.
- The boost switch writing 0x0 for 0dB gain and 0x0a00 for 10dB gain looks
  suspiciously like a volume control between 0dB and 10dB * 256steps/dB.
  Does this control only accept these two values or can we simply
  implement it as a standard volume type controlling a mic pre-amp? If
  it's only 0xa00 or 0x0 I would suggest to slightly redefine the boolean
  type to use the max value for true and the min value for false which
  would also be an elegant way to remove the inversion flag.
- We definitely need a new snd_evo_type entry and get/set functions for
  enums, up to you to define those in the most suitable manner for the
  id14.

> 4. Checks. My helper returns -EIO on a short read or write, before
>    it decodes a value or updates the cache. My matrix put also rejects
>    values outside -128..+6 dB, and get clamps what it reads back.
>    Could the shared code keep these checks?

Sure, error management is always good to have. I never encountered any
short reads/writes or out of range reads with the EVO so I didn't add any
logic for this until now. Also, for the controls I checked, the EVO
cleanly rejects out-of-range writes but if the id14 doesn't we should add
those checks as well.

> I don't have a firm view yet on which way is better. If the iD14
> fits the table without many special cases, one driver seems clearly
> worth it. If it needs a lot of per-device branches, two smaller files
> might be easier to read and review. What do you think, now that you
> have seen what the iD14 needs?

I think we can put everything except for FU12 into the tables and the EVO
driver would even benefit from the added features (see above).

> If we do combine them, the order I imagined is: your four fixes first,
> then the rename to Audient, then the generic changes, then the iD14
> tables on top as v2 of my series.

Agreed. Renaming the file first might turn out to be annoying because it's
the one thing which might create rebase conflicts we'll have to deal with
while we work on this but it's probably preferable to keep as much of the
commit history as possible after the rename.

> In that case, would you prefer to do the rename and the generic part
> yourself?

I suppose we can cut one testing loop if I do the part of the generic part
that touches the EVO myself so I can do that, no problem.

> The rename would also touch MAINTAINERS; how would you like
> to handle review of the iD14 parts?

I would definitely prefer to list both of us as maintainers. Practically
all code will be shared and I can't speak for the id14 in any way.

> I can write the iD14 parts and
> test them on my MkI. I don't have an EVO 4, so would you be able to
> test that side? And which base should I work against, sound for-next
> once your fixes are in?

It shouldn't make a huge difference because we're rather independent on
this file. I'll probably prepare everything on 7.3 and then rebase it onto
sound/master to test it there and submit (that's what I did until now, but
for-next is also fine). I suggest I submit an RFC with the generic part
that you can apply locally to work against (and potentially adjust) before
you submit everything in a final series which, if everything goes well, I
only need to retest and tag.

> I'm also not sure how a combined change
> should reach Takashi: as one series, or as two with a stated
> dependency.
