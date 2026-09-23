Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD55616BB;
	Wed, 23 Sep 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192804; cv=none; b=XOT+7VjXXpTYKG/x+PEh4ZuT9k9czrLrYqOhdHHYG9pZpGLioe/7aV4QpVFX/30RNU1CT8AdCwofzNu6Uq1vmYVzlfW4aLTH0/lAA7/pGIHVmZT55mrm1xUi1ajBKvOYcR3GNWg7I9xAAaU1asZwLGwA3Yx/9OLSzWRP9RenUMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192804; c=relaxed/simple;
	bh=l1gEqX+9pjOkKyPeqJpGEn8NGf4UA4O5d9Z/8HmdnQM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbe5fgiNngaBfZII6nwOx3JRAj/s9pdO3YLbdJS02cfGSLPt4GfduDJbGPUUdHoTggZtmLd27HuL+0qPj0ikMyPk+qmHQTOWP227ufr6vUrHHXCcZQFqzzwXpWFK5vY+W49VF0DYD79RWziN36eP0djLB1yJg25PFkmHPIrXc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cO/4MOeY; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cO/4MOeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790192787; x=1790451987;
	bh=l1gEqX+9pjOkKyPeqJpGEn8NGf4UA4O5d9Z/8HmdnQM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cO/4MOeYBMx9XH7RqmG0Yvy/LyNWVxmHsB2B1TgJBbSt3iArpeLHxcqd26Fc6djkO
	 gYs1m9URDcohpYR4hF3biMzPd4SbYKe3fKGtxg2DSJrmUbqQP79adqdwdtQsfKkcBG
	 kLDiT5361VJp75sjzFGZv0AMtJSHd1TBOYXbYiwTlCjXmkfP3hop+tCD3g6MfwkGnu
	 WAINKjQgO6lbLDHFJvuJZpiqvWrhCH/HP7MCxXFtU39uAuFwyxOGS2pfeG3pgxruON
	 fOAHq4JZBheFXUeKaEww3pV0TpbwfD/L9pE/ccIZ97PlGurN60SnaOBDdGYAk6SVao
	 JhU/MyPqgaMqQ==
Date: Wed, 23 Sep 2026 19:46:23 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260923194617.84480-1-lsa.uz@pm.me>
In-Reply-To: <arJElIQgkq2uqwQT@kekkonen.localdomain>
References: <20260921192450.21811-1-lsa.uz@pm.me> <20260921192450.21811-3-lsa.uz@pm.me> <arJElIQgkq2uqwQT@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ec45274f7d401d650dd3866fd0302dd9fd86defb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you. v6 is on the list with all of this in it bar two points, below.

The dual PLL was the remark that mattered, and the driver contradicted
itself in a way I could have caught without you (sorry): the link frequency
is taken off the output PLL and IMX681_PIXEL_RATE was then taken off the sa=
me
side, giving 387,840,000, which is 16.16 fps against a cover letter claimin=
g
thirty. Rather than pick the arithmetic that lands on thirty, I read the
part. At its operating point the video-timing chain is PRE_PLL_CLK_DIV 2 an=
d
PLL_MULTIPLIER 225, so a 2160 MHz VCO, then VT_SYS_CLK_DIV 2 and
VT_PIX_CLK_DIV 6 - by the CCS formula 180 MHz, which would be 7.5 fps. It
runs at 30. Those registers are at the CCS addresses without carrying the
CCS meaning, so the second derivation is no better than the first, and v6
states the rate as measured: LINE_LENGTH_PCK x FRAME_LENGTH_LINES x 29.95
fps is 720,000,000, with a comment saying why it is not derived.

Naming the CCS registers, which your imx355 pointer prompted, turned up two
you had not flagged: 0x0307 is the low byte of the 16-bit PLL_MULTIPLIER an=
d
0x030d the low byte of OP_PRE_PLL_CLK_DIV. Same partial-write fault as the
crop registers, one block further along. Both are whole in v6.

It also settled the shape of the map, which the driver had never stated:
geometry, both PLLs, the external clock and the signalling mode are at thei=
r
CCS addresses, while exposure and frame length are 24-bit at 0x0229 and
0x033d. 0x0229 falls inside CCS's SHORT_ANALOG_EXPONENTIAL_GAIN_GLOBAL, so =
I
checked it on the part - with the blanking raised, exposure reads 6636 in
both the control and 0x0229, frame length 6640 in both, while 0x0340 reads
zero and 0x0202 does not follow the control.

Two I have not applied.

.set_fmt stays. Dropping it and making the bus code follow the flips cannot
both hold: init_state() runs once, so after a flip the stored format still
names a code the sensor has stopped delivering and the pipeline rejects it
with EPIPE at stream on. I found that by applying both. Every driver in the
tree that picks its Bayer code from the flips keeps set_fmt - fourteen of
them, imx219 and imx355 among them - and thirteen carry MODIFY_LAYOUT on
both flips as this one does. imx219 recomputes the code inside set_fmt,
which is what v6 does too.

The comment above pm_runtime_get_if_active() stays, if you will have it. It
is there because getting that three-valued return wrong cost a regression i=
n
v2 that v3 had to undo - the -EINVAL case, where runtime PM is absent, the
device is powered from probe and the write must still go out with no
reference to drop. gc08a3, gc05a2 and imx283 all comment that call site
too, though about a different thing - when controls reach the part rather
than what the return value means.

One number on the exposure default, which is applied. With it at the minimu=
m,
libcamera's generic AGC needs more than a hundred frames to leave it: a
hundred-frame capture ends at exposure 42 of 3173 and a black frame, three
hundred at 136 and still black, four hundred reaches an image. imx219 and
imx283 default mid-scale; ov08x40, imx415 and gc05a2 default to the maximum=
.
None of them starts at the minimum. Your reasoning holds - userspace does
set it - so v6 has the minimum, and the number is here in case it changes
your mind.

The "Uh-oh." is mine (sorry again): I converted thirteen sites to
dev_err_probe() in v4 and left a `ret =3D` standing above one of them.

Andre Gilerson wrote this driver and is on Cc. And the binding ack Krzyszto=
f
asked for is properly his.

Sergey

