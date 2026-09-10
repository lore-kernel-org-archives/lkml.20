Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DC472531
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039358; cv=none; b=jpPkcaNNzGYy2mmnnZhsyyrDo6a6IqBcsLF5Ufg1pionJfU0RxDKRXuenOL9jjTWi4XYAg1YcnifwQokGjQRuuaFEC7IgSBgKbj4Ze3evfYZESxy/Q+Q0Z3K3S1rojpwMK69mdUSHRDEhAuHwrkCcdHRXDmepDvyY/Odlhq0ZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039358; c=relaxed/simple;
	bh=/fo+Wd06qlM0ZRL7ejhTQPHu760TTFRfH9wAUDB7IA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jBRSIjJbeA7whTWoglJ8c8W++uS229ppVVMnSSk0Vf07pPKp6Sc6oEJxEgBGCow4sAwQUyxNR2rw4oRuEGCNICHg6UbveNDZVZgnZ82LkOoA9MQa0BIw52BN4nl6Cm3NszOZkjaSZveS4WxIN+hQdFWpTl4BPMBU9jb3bst+kPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oKr1ObZp; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oKr1ObZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789039346; x=1789298546;
	bh=elyyujR8NU4dubtSqN09N9ikRtSIoMKtmYEF8nT4AyY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oKr1ObZpuxpsjpxmryPu/oNxn1EUpn/NQLwuyJP2xJOseJ9sxuLNu5AyEiDrFO55Z
	 QM02S14ac8hDwIzpRc1ga4wMWjdJ67oqTxhI+yp1O0hhkqpOYtIkO9lbbsr3D3T6Fp
	 xqQLxrnQ+kPY/UYjXPIsIn5TDvS1NTDwEQBeIc2w272bXv2PQwwSe4875E8BvQmW3O
	 w5DATN4lOrpJtAhbjBHPNlnu1IhXGg9RaDnep1+p/81PhN2yGlRc0xgZH7jo3hjjq9
	 5CUAquaRRWGfQLXZMYgdSFIsYA8xKPnG2oi4+f2gVoqdVwakrKpA26l7++AjBzgrp2
	 CXD9954++G+/w==
Date: Thu, 10 Sep 2026 11:22:21 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: Add support for the Sony IMX681
Message-ID: <20260910112210.44432-1-lsa.uz@pm.me>
In-Reply-To: <20260910103602.19228-1-germanpapulindez@gmail.com>
References: <20260909203717.90605-1-lsa.uz@pm.me> <20260910103602.19228-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 7f384f455bd00032599f61360a1dcaaf3abdb9ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

German,

Thank you - a second machine, which the v3 cover letter named as the
limitation it most wanted lifted. Your report also found something real.

Your inverted image is the driver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Prompted by it I held a sheet of printed text in front of the camera and
captured one raw frame: /dev/video16, SGRBG10, a crude 2x2 debayer, nothing
clever. The text came out reversed, and flipping the frame horizontally mak=
es
it read correctly. So the sensor output is horizontally mirrored, always -
not rotated, not flipped vertically.

The other half of that result is worth saying: apart from the mirror the fr=
ame
is an ordinary photograph. No tearing, no skew, no diagonals, no wrong
geometry.

The cause is in the init sequence, with the author's comment:

    /* Image orientation: H-flip to match Windows AIQB (RGGB native -> GRBG=
) */
    { CCI_REG8(0x0101),  0x01 },

The flip makes the Bayer order GRBG, which is what the driver advertises an=
d
what Intel's tuning expects, so the format declaration is honest. The geome=
try
is not declared at all: there is no V4L2_CID_HFLIP, and camera_orientation
says only that the camera faces front, not that frames arrive mirrored.

Which is why one of your applications is right and the other is not. A fron=
t
camera is conventionally mirrored by the application. An app that does that
applies a second flip and gets the true scene - qcam, Firefox. An app that
does not shows our output backwards - Snapshot. Both are behaving sensibly;
the driver put them in that position by transforming the image invisibly.

It is fixable above the driver, so nobody is stuck - but only if userspace
knows, and today it cannot find out.

Bug, or acceptable? I would like the list's view
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There is a case for acceptable: the flip is part of the mode, the advertise=
d
Bayer code matches what is really on the bus, and a front camera ends up
mirrored anyway. I lean the other way: your two applications are what it lo=
oks
like when a consumer cannot learn about the transform. But that is one mach=
ine
and one opinion, and the code is Andre's, who is back on 28 September.

If it is a bug, two shapes:

  1. RECOMMENDED. Keep the flip, expose V4L2_CID_HFLIP defaulting to 1, and
     swap the advertised code with it - SGRBG when set, SRGGB when clear.
     Nothing changes for anyone who does nothing, and the transform becomes
     visible and controllable. imx415 exposes both flips but does not vary =
its
     code, so the tree is not a clean precedent.

  2. Drop the flip and advertise SRGGB10, leaving mirroring to userspace.
     Cleaner as a driver, but it changes the advertised format - the very
     thing the flip exists to control - and would likely break the setup yo=
u
     have working.

1 costs no existing user anything, which is why I recommend it; 2 is the
better driver if the AIQB turns out not to require GRBG, and that is Andre'=
s
to say. Sakari, Dan, Hans - a view either way settles it and I will do the
work.

Two notes alongside that. Nothing here blocks anyone - the camera is usable=
 as
it stands, as your own report shows. This is about making the driver honest=
,
not about making it work.

And I have an open thread on libcamera-devel about this sensor's delays, st=
ill
waiting on a reply:

  https://lists.libcamera.org/pipermail/libcamera-devel/2026-September/0619=
28.html

libcamera consumes precisely what is in question here - sensor orientation =
and
the flip controls - so a view from that side bears directly on which option=
 is
right. I have not cross-posted this, because it is a kernel-side decision
first, but I will carry the answer across once there is one.

Your other notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The colour cast with light level, the brightness drift and the snow all loo=
k
like AE, AWB and tuning, none of which this driver has: it exposes exposure=
,
blanking, two gains, link frequency, pixel rate and a test pattern, and tha=
t
is all.

Two guesses of mine were wrong, so skip them: the capture node's padded lin=
e
(7744 bytes for a 3844-pixel row) would draw about nineteen diagonals, not
your one; and imx681_MSHW0520, MSHW0580 and MSHW0580Second are byte-identic=
al
.aiqb files here, so the variant cannot change colour.

One question that is ours
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v3 changed the gain ABI and you tested v3. Up to v2, V4L2_CID_ANALOGUE_GAIN
advertised 0..1020 and quietly drove the digital gain register above code 9=
60,
so one control could reach 256x; in v3 it stops at 960, the 16x the analogu=
e
stage actually does. If your HAL drives only ANALOGUE_GAIN it now has sixte=
en
times less range - so did brightness behave differently on v1 or v2? If you
only ran v3, saying so is just as useful.

If you are comfortable with it, a

  Tested-by: German <germanpapulindez@gmail.com>

would carry weight: a second machine and a second userspace stack. It would
not be claiming Snapshot works or that the tuning is right.

Thanks again.

Sergey

