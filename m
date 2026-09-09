Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A6A3BE15E;
	Wed,  9 Sep 2026 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982602; cv=none; b=PUNmpQJolxv9tlWVsu+UulcgbAJ6VHn0ZJXXHEe2FqNyyXpvSeMV6GSnTTUE6gkvVxTFnY5sSDGt8/0gdpRhyokjvHUNCBDLfBbde6LSH5Nt1/UG/QqxMLfnAwk0WtwY7NZRy+xGO3Jvy+KVknlyomYCbLSZREQllVj/vr93IRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982602; c=relaxed/simple;
	bh=Brn9UsmeZcOHEg7IPxw+OE2/r0wiwiPueNOPtHUccWo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rCk3/MhXyA2HOwlET1i4US4b7JY7DSI9DM8BUKd0iae7633doaq9SpyncOR7tHZwTNMKTAgHVmxyQaZg/aAwOKQmHWz2B1o3xtuhDuz6x6+kmSDSDZ1l9nYVfp1BvwVfFak2RM4v+MmbFrk9qu7OHcjrF9fF03Qj7RnlfKnjQxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Yv94Yltm; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Yv94Yltm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788982597; x=1789241797;
	bh=1VB/5fBF+6fCvzEcKosRW4Y6zhDsxzDvm5nqAnirrtU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yv94YltmvNAGlugQmtMsZLVipY7gUKqwK7JsumYCAx7LZxdQ2rnHFX9BBvvM/LwcZ
	 E7HlYI2tFW8KBTSkXz+k9MFQfCF5rk+ijaZmfH1wVrMuUZV60fHLqswRpkr7t0K8GM
	 Iy1LIfH00sZVkpBzOwdSV8I8nt0DH5C5UfbQucLqkNQn2eHT0XfJgx/5rUMh9AGubg
	 AU05ndZodXqFyGS4h8n+XmNfus3rh5WY9VQvYvRqTaTmt9r571+pErSI2ewPFCmz28
	 tLep9ysv7mCuJRzX1l9LKcpRh9ubPGaIC5pk5h1raCaUgBA9s5RTNXlRCXwX5swA+z
	 SXb/7AWWCWG3A==
Date: Wed, 09 Sep 2026 19:36:34 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260909193627.85987-1-lsa.uz@pm.me>
In-Reply-To: <20260909174240.80023-3-lsa.uz@pm.me>
References: <20260909174240.80023-1-lsa.uz@pm.me> <20260909174240.80023-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5d20dc286984e4fc5602d598cdbc58419d0d6cf9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you - four of the five are real, and I have checked each against the
patch rather than agreeing on sight. All four are fixed in v2, which follow=
s
this message. The author is away until 28 September, so v2 comes from me; w=
here
a fix reverses something he wrote deliberately I have said so and given the
reasoning rather than leaving the question hanging for three weeks.

Confirmed
=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. devm_regulator_bulk_get() ignored. probe() logs a dev_dbg and continues,=
 and
   imx681_power_on() then calls regulator_bulk_enable() on an array nothing
   filled in. Your use-after-free reading is the sharper one and it holds:
   _regulator_bulk_get() unwinds with "while (--i >=3D 0)
   regulator_put(consumers[i].consumer)" and leaves the pointers where they
   are, so a get that fails partway puts freed regulators into supplies[]
   rather than NULLs. The likely failure is -EPROBE_DEFER, which is ordinar=
y.
   On this machine INT3472 hands out dummies so the get succeeds, which is
   exactly why testing did not find it. v2 makes it fatal, via dev_err_prob=
e(),
   which is also the right handling for the -EPROBE_DEFER case.

2. pm_runtime_get_if_active(). It returns 1, 0, or a negative errno, and
   "if (!...)" only catches the 0. An error therefore falls through to issu=
e
   I2C to a possibly-suspended sensor and then pm_runtime_put()s a referenc=
e it
   never took. v2 tests it as "if (pm_runtime_get_if_active(dev) <=3D 0)". =
The
   kerneldoc is explicit that on -EINVAL "the usage_count will remain
   unmodified", so the put is unbalanced and not merely redundant.

3. Missing pm_runtime_put_noidle() on the probe error path. The reference
   taken by pm_runtime_get_noresume() is never released, and
   pm_runtime_set_suspended() is called while it is still held. v2 adds it =
at
   error_pm.

Not a bug, and I think demonstrably so
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The NULL-state dereference in imx681_set_pad_format(). The subdev core reac=
hes
.set_fmt through v4l2_subdev_call_state_active(), which always supplies a
state, and the drivers around it agree: imx415, imx355, ov02c10 and ov08x40
all call v4l2_subdev_state_get_format(state, ...) with no NULL check betwee=
n
them. If the core can hand a NULL state to .set_fmt then this is a
subsystem-wide problem rather than one driver's, and I would rather hear th=
at
from a maintainer than paper over it here.

The gain clash, which is the interesting one
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Correct, and worse than it looks. The analogue handler writes
IMX681_REG_DIGITAL_GAIN on *every* call, not only above code 960: above 960=
 it
writes the spillover it computed, and at or below 960 it writes the 1.0x it
initialised the local to. V4L2_CID_DIGITAL_GAIN writes the same register
directly. So setting digital gain to 4x and then moving analogue gain anywh=
ere
at all puts 1x back into 0x020E - no error returned, and the DIGITAL_GAIN
control still reporting 4x.

The v1 cover asked whether the range should be split honestly between the t=
wo
controls. I have stopped asking and done it, because the two turn out to be=
 one
question: clustering would stop the controls overwriting each other, but it
would then need an invented rule for what analogue 1020 together with digit=
al
2x means, and there is no honest answer - they are two names for one regist=
er.
So v2 advertises ANALOGUE_GAIN as 0..960, the 1x..16x the analogue stage
actually does, and DIGITAL_GAIN owns 0x020E alone.

Measured rather than argued, by reading 0x020E over i2c while the sensor
streams. It has to be while streaming: at stream start
__v4l2_ctrl_handler_setup() applies the controls in creation order, analogu=
e
before digital, so digital wins and the clash is invisible. It bites a live=
 AE
loop, which is the case that matters.

                                     v1 module     v2 module
  start                              0x0100        0x0100
  after digital_gain =3D 4x            0x0400        0x0400
  after analogue_gain 500 -> 700     0x0100  <--   0x0400
  DIGITAL_GAIN control reads         1024          1024

Both modules were built from the same tree and swapped with rmmod/insmod, s=
o
nothing but the driver differs between the columns. The last row is the poi=
nt:
the control reports 4x in both, and in v1 the register disagrees with it
silently.

For Andre, on your return
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Two of these touch choices that look deliberate in your code, so they are y=
ours
to overrule.

The regulator handling. Your comment says "Continue without regulators -
INT3472 may handle power", and v2 makes that failure fatal instead. My read=
ing
is that the get does not fail for supplies the firmware leaves undescribed =
- it
hands out dummies, which is where this machine's "supply dvdd not found, us=
ing
dummy regulator" comes from, and the camera still probes with the change in
place. If you wrote the comment because you had actually seen the get fail =
on
some machine, then I have removed a workaround you needed: say so and it go=
es
back in v3.

The gain range. I have split it rather than holding v2 for three weeks:
ANALOGUE_GAIN stops at 960 and no longer touches the digital register. Your=
 own
define carried the comment "combined analog+digital", and V4L2 has no contr=
ol
meaning combined gain, so I believe this is what the ABI asks for - but it =
is
your design and you can have it back in v3.

And one you did not ask for: the series lists you as M: for SONY IMX681 in
MAINTAINERS. That is the convention for a driver's author, but it is also a
standing obligation to everyone who reports a bug against it later, so it
should be your choice and not mine. It is already in v2 because leaving a n=
ew
driver with no maintainer entry is worse; say the word and it becomes me, o=
r
both of us.

I ran an independent review of the same file before writing this, and it fo=
und
the same four and nothing else.

One thing worth saying plainly, since v1's cover letter listed its testing =
at
some length. That list - applies to media/next, correct authorship under gi=
t
am, checkpatch, dt_binding_check, a W=3D1 build, booted on the hardware wit=
h the
camera streaming - would not have found a single one of these four. They li=
ve
on error paths this board never takes and in a control interaction that nee=
ds
both controls driven while streaming. Testing that the happy path works is =
not
review, and I should not have been as satisfied with that list as I was.

Sergey

