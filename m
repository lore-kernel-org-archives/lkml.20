Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344272;
	b=YIgr1NjdQu8IsJgdWeSFtTwSuPnalUgWj+XYRblx30kUkID/fRWbVFoKftg9sVjZckb6
	 tvi6P/LFP17LltgRBapmFzbGOwthv8NhDJPpeHLZHfB0JD7s1pnLEkIyjhhbLaRwyN5do
	 dKxcMZb9Qhl75+09mk+nqw4BX8VBSjQ+a5Lu2AhEMCEkXywG30H29IfrSn5x1H1ue5r0r
	 GYteXskaG8Z41Ouwdqb1StRjUVzl2ace6/p4ikZxoEJvQ/XH16Wc1f6AEaijqYWjodgt+
	 +FfJt2cpBqEGO9bfBRFaWCkt+J6laLFty/dUKM8R8S+AQl6O0c/TTImM4/r+Bd9RWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344272;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=sFieDbfR1RHHjL+MJDwSmb3F8dVj3KJJFZ1lRtNd45w=;
	b=3tGe9oXdoggvEB/jxXoFFS2Id4g35RXkj7B8qk3T9NjKoilj6MrTbH6CISERCHJeY+My
	 FCzerrucLtTcYn81sjbGXKvxpn0yDZZ3w1MkdKHscIoUEY+l9FFd9Xd7nV/DSKKt02gRf
	 +NoSfQq7yLAaU+2YOQaGirg2UFaT2OLFA5zU9LiEXCIaJBMeiBtjfriAtH46vM7Wl4gye
	 Bxapw6ovH8/WlLkF+SHVJi5D4bbz4/GQGeofR4Mbq/LkqXQSJXVPGIwygt6LzodJuiF7i
	 6S09Qwmo09CUPeoBDs2PGQ8rKv+vopXtfzmvbZExJnee4hBgsO2yu8iIe9YS38Lr0EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Im2LDE5w;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E34606A31C;
	Tue, 10 Nov 2026 20:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Im2LDE5w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794344260; x=1794949060; i=arc@gmx.li;
	bh=sFieDbfR1RHHjL+MJDwSmb3F8dVj3KJJFZ1lRtNd45w=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Im2LDE5wbqcgJPBBgYa+yZRHdG2hxYflGW8Or3qYEUbERG6KLW6WfIX2eJVyLddz
	 pEBAg+Um5UrpvZD49tchkc99dluIxvj1qeIjSGR8i8U11OlIRDQ36bCLljepCulBC
	 XbO1FzEwnqX2DWRpREC4QT6eEokEy51K7qDyokAyIon1R//aPkMbyGKhNJV9+hwD9
	 xXUyMTPdW3IyR4dixuIxvikR5DVhV8u9CPUeMYPUgA+sYGW/mFRuejIpthUnW/0FO
	 BLV/kw+ED9M6J5IlSUz4SiGt9MLlGZ2+RJhNriEy2t0droEfrtVspn7uosdUTSRKN
	 6TFcFkvltnSAAQO1XA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1wg3yw2dg2-00bGP5; Tue, 10
 Nov 2026 21:57:40 +0100
Date: Tue, 10 Nov 2026 21:57:40 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Message-ID: <avOFQAGTVkCXgs2l@khmer.arcnet>
References: <avJJgGbAVnVrUlPM@khmer.arcnet>
 <20261110021302.1077745-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ak5+jUCIXsrNjz9p"
Content-Disposition: inline
In-Reply-To: <20261110021302.1077745-1-mrwillporter@gmail.com>
X-Provags-ID: V03:K1:h8fPdAnfeegXZQMXzgMiOWczZbYaT+wXI3pJblSCnF15SsSGGzi
 EkxcT2J987pJFOu/bpZrGfB6v1+yQtM/WPTCg6ztWMDL5wQUni3wpNVXtn+2eLMvyz++3hB
 QSA+0aPDYYQbgTkxM5cRnUjyYBPJjkhWVgyGuloD/06bTZunGGTaatwqJmOz29Am2rem4Uz
 XynC8jmrcyiRm9PtF3hCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UIlEfEUoiak=;q5XIRH6Fw7ZwudfQ8Sv9XsDDXKw
 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

--Ak5+jUCIXsrNjz9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Mon, Nov 09, 2026 at 08:13:02PM -0600, Will Porter wrote:
> [...]
> > - Not sure if this is relevant for the iD14 but we might want to
> >   apply something like DIFF 2 to make update events work on the
> >   replaced controls 11 and possibly 60 [...]
>=20
> I left DIFF 2 out of my patches. I have no objection to it, but I
> cannot test it. The audio control interface of the iD14 MkI has no
> interrupt endpoint (bNumEndpoints is 0), so
> snd_usb_mixer_status_create() returns before it creates the URB. The
> device sends no status interrupts, and a knob change shows only by a
> read. On the iD14 the diff only moves the table-created controls from
> id 0 to their unit in id_elems and in the usbmixer proc file.
>=20
> Two things in sound/usb/mixer.c may matter for your EVO4 events:
>=20
> - snd_usb_mixer_interrupt_v2() skips an element when the unit has more
>   than one element and info->control differs from the control selector
>   in the message. Our elements leave control at 0. Would the event
>   reach them?
> - The notify paths clear info->cached of the generic mixer, not the
>   mixer_audient cache. Would a cached control report its old value
>   after the event?
>=20
> Could you carry DIFF 2 with your EVO4 event change?

OK, thanks for the hints, I'll keep them in mind when I start working on
this. I haven't tested the diff either, for the moment it was only a
sketch so it's most probably incomplete. This is actually only required
for the EVO if I decide to replace generic controls - which I might
eventually to keep the philosophy of the driver consistent:
Until now I tried not to touch what was working, even if it's quirky but
as you cleaned up comparable controls for the iD I might just as well do
so for the EVO, too. A higher priority will be to figure out if and how I
can get events for controls not supported by the generic driver, though,
but that will require a few hours on a rainy day...

> [...]
> With these changes each of the five patches builds with W=3D1 without
> warnings, and checkpatch --strict reports nothing new.
> On the iD14 (stable 7.2.15) the read and write checks of the controls
> pass with the new version.
>=20
> For the next version: unless you would like another RFC round, I
> would send it as a normal series, on top of your four mixer_evo fixes
> as before. Does that work for you?

Actually... I was just about to propose the same but when looking at the
code in mixer.c you refer to above (interrupts and cache invalidation) I
realized that usb_mixer_elem_info already contains an integer array for
caching we could use instead of our manually allocated cache. I suspect we
should rework patch 10 accordingly. The positive side-effect of this would
be that info->cached management in the standard notify path would work
should we decide to use it one day.

I'll prepare a new patch 10 but won't be able to test before the week-end.
I'll send a new RFC after that. Do you think it makes sense to refactor
FU12 caching as well?

Cheers,
  Christian

--Ak5+jUCIXsrNjz9p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAEBCAA5FiEERJIhlnXw6qCYHrZhFHbxepdfWHsFAmrzhUAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEBR28XqXX1h7cusQAMQop6vpYonseKQV2jBf
Ozg33+FtszvlC8Uyt+zvyntEec4rJfNcrd3pAcLaMws7untR//J1OIrSWgLYSHPs
jfaAaWR8p6nNjuspc/+rOv89M3G6IH5VKAjS4Sx1540rANUopZ7pstXssp79vIAM
/1V9Hnuiieh2sGRDGo+D19e+gUUNZp6a8PTWgh+e2F7rqwWv7KEPDaSEQ6w43Jx4
ThffmoPHxJXZfiN0B/30S/scRRN5MlPDUlsSaS8HctcmCUQ9J0t5gD1BReu/UrIZ
hnRyqPIA84dVVE4D7zzAJPjJAdCjfQqNbDuOVkk0pwmlOh/N7T4wMlWcb7vAP3DZ
kI9fZC4t4LdcCCNWYvLK9VbIe4nOMJ66MGsN6w5upyTU8dr3fh2U30Ng4cjTL0Ar
IsoTZ8y5CDJXH8R65OW4JWmt6czKErr0RM+jMbH2YTtt7rikNjGHuBvGBBwbhsgS
/MOrZyYcWiXeYJwmzeMqo4qGMGYErTY50DiE4AJx+OmxcXQ4hoLg3L+RdPs12QHR
Bft0xlRCkp60++uG61Lo5oXbURwDjzExGb3JPt60drND0fyysAHn3G5ls28ovvHD
c4/UGuJWIvtLP8oiLf1oXzFezPKnNjPZ5eZ8VWUv7LjvI50nlW98tYfacI11rqhX
nD9+ph3jnPf9ybFOV6Mra8Xw
=B4N8
-----END PGP SIGNATURE-----

--Ak5+jUCIXsrNjz9p--
