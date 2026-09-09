Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1056539CCF9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988509; cv=none; b=fWm6vEgvA6cTZgNbHW2IaoMztuv70lcglxGqSeD6bLGzvpMwUoTePRpNrx+Jd5R7LZaF70HXC8ENIn7o86N5QKS9vNCF2TEHnRY/23kmGNy64vJRYrbkiKyYMJ3msRQUJnNnOE+ZIwkQxfaO/gZO4BRa17vxQ1Zq0mRxVuNIY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988509; c=relaxed/simple;
	bh=6BHYSZ/vSpVXfN+krSmJXI5sAt4MP3aQfrInqS7RuSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjzaGnBGSYk9IyYLGWzc1a/MbaLzQ/pkAFdacop3Nrm9KGAP+GtPKZnzi4JRKv7ms+3csYt+PpKlryqWQOEMObLyM2ROUpt+nTuZm0Wqc6cY84BN1cd834QEnepAf5IxskQTXrXtclP2Z1t7v/1Zb/SrSjalSea/Te0FfiCuMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ogWRGucZ; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ogWRGucZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788988499; x=1789247699;
	bh=XWZHtj2cy+oO0ZWudyDjpaOu1/ir6iW8TXuarFLcsnU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ogWRGucZr6Csig/5pEjcQOOHsPPYLlJp4gQBnV4jAuwptGa4mrFfaKUEvAFc7WxpR
	 meF4K4Utidi92j0cZtYQMp4+FDyU9wO3Lq5jUfRoSkIS5+jxqbHTICL75Afq6fX6Si
	 ePqvJMYEUvE3nwrkTx0pGLz0lrZD2h9jP8pQpsjptPgIFh72uHm0pBrrWehM4lhaFY
	 vu/jpF91OU4qYQ8K7ij4tVdXJ1XyryE9x7yPn7efh8J/1/97H3FuY+kdrLUUeHHidM
	 c+lgzbXbfpqpV5JCDeFA88PHJxMviJ6DY8NtfyKecvGBkNfiuFcov2mStqcx6NqVIE
	 kaL+RbNTL+w6Q==
Date: Wed, 09 Sep 2026 21:14:56 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260909211450.92744-1-lsa.uz@pm.me>
In-Reply-To: <20260909203717.90605-3-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me> <20260909203717.90605-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 28b136d96057b524737ed2165d3774b8bb1c5b4d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

What this is answering, since most of you cannot see it
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

These replies answer sashiko-bot, an automated reviewer at sashiko.dev. Whe=
re
its mail goes is worth stating, because it is not here: devicetree, robh,
conor+dt and media-ci, and not linux-media at all. So the findings I am
quoting have not reached most people reading this, and the review of the
btintel series that Luiz pointed me at earlier tonight reached no list at a=
ll
and exists only on the site. I am quoting rather than linking for that reas=
on.

Credit before I start disagreeing with it, because it has earned some. This
series is at v3 because of that reviewer. Its pass on v1 raised five things
and four were real: devm_regulator_bulk_get() ignored, which on a partial
failure leaves freed regulators in supplies[] rather than NULLs; a
pm_runtime_get_if_active() tested so that -EINVAL read as success and a
reference never taken was put; ANALOGUE_GAIN and DIGITAL_GAIN fighting over
one register, which I then measured at 0x020E and which is real; and a miss=
ing
pm_runtime_put_noidle(). All four are fixed. Its pass on v2 caught a
regression I introduced while fixing the second of those, and that is the
whole reason a v3 exists. None of those would have been found by the testin=
g I
had listed in the v1 cover letter.

The three things below are where I cannot follow it, or where I can and it =
is
not this series' to change. Set out at length so the reasoning can be check=
ed
rather than taken on trust. If I have any of it wrong I would rather hear i=
t.

Correcting myself on ipu-bridge
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

In my answer to the v2 review I wrote that the dangling secondary fwnodes a=
re
reached on "the ordinary unbind path rather than an error path". That is
wrong. ipu_bridge_unregister_sensors() has exactly two callers and both are
inside ipu_bridge_init()'s error unwind; there is no module_exit, no remove
callback and no devm_add_action in the file, and on success struct ipu_brid=
ge
is deliberately left alive, as its own comment says. I described the reach
without grepping for the callers.

So both halves of that finding are error-path only, and the one I called
narrow and the one I called wider are the same width. The pointers are stil=
l
real - nothing clears primary->secondary or the csi_dev's secondary anywher=
e,
and software_node_unregister_node_group() frees what they point at - but
reaching them needs ipu_bridge_init() to fail after sensors are connected.
Smaller than what I claimed, and the correct claim.

The VBLANK/exposure finding: I do not think it holds
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The review asks whether clamping the exposure range on a VBLANK change leav=
es
the hardware register out of sync, because the two controls are not cluster=
ed.

__v4l2_ctrl_modify_range() writes it itself. From v4l2-ctrls-api.c:

    cur_to_new(ctrl);
    if (validate_new(ctrl, ctrl->p_new)) { ... =3D def; }
    ...
    value_changed =3D *ctrl->p_new.p_s32 !=3D *ctrl->p_cur.p_s32;
    if (value_changed)
            ret =3D set_ctrl(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);

validate_new() reaches std_validate, which clamps an integer control with
ROUND_TO_RANGE - clamp_t(val, minimum, maximum) - rather than rejecting it.=
 So
a clamped exposure is a changed value, set_ctrl() runs the driver's own
s_ctrl for V4L2_CID_EXPOSURE, and the register is written. It also happens =
in
the right order: exposure shrinks before the frame length that forced it to=
.

If I have misread the core I would rather be told than leave it, but as far=
 as
I can follow it there is nothing to fix here.

The group hold finding: fair, and not a bug
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Correct as an observation. Each control's handler opens and closes group ho=
ld
around its own write, so setting exposure, gain and VBLANK together through
VIDIOC_S_EXT_CTRLS gives three separate groups that the sensor may apply on
different frames.

Two reasons it is not in this version. V4L2 calls s_ctrl once per control
unless they are clustered, so nothing is being lost that the current shape
could have kept - clustering is what would add the guarantee, not what woul=
d
restore it. And ov5675, the nearest driver in-tree that uses a group-hold
register at all, uses it the other way: to make one logical value spread ov=
er
several registers atomic, not to group controls.

It is a real improvement and it is the author's design to change. Andre is
back on 28 September; I would rather put it to him than reshape his control
handling on his behalf for a second time in one night. If a maintainer want=
s
it sooner, say so and it goes in the next version.

One last thing about the reviewer, since it will reach your patches too
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It has now reviewed this series' 3/3 twice, on v2 and on v3, and that patch=
 is
byte-identical between the two - I diffed the files. The v2 run raised an A=
CPI
reference leak and the fwnode pointers; the v3 run raised only the fwnode
pointers. Same input, so that is run-to-run variance rather than anything
having changed. Read the other way round, two independent runs agreeing on =
the
fwnode half is the stronger signal in it.

Sergey

