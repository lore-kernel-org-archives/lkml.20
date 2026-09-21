Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA445C704;
	Mon, 21 Sep 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981128; cv=none; b=Hbk84G1HkNf1f8YYx8N+6kg4hHwn/lAdWWz9Cnd/DXVLQExsfrBtrMSfeWVI1RLlmEfSz17QU9IyxgjUqAC3/WRJy/uPLwtTKn/aYkzsrXMOVLLTOrc4kWjsGm8iPjNftV2Nu6+VKFLZSG5N3aNtAeCfuM59KyTQoq1wrbUi550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981128; c=relaxed/simple;
	bh=WpOr3csztkRtov9yqk6fRyk6eDyoY72F8Ujbrz8dTBk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XRK2ffKQKlV1pfTFptmx3KPgXsaAC3Eb9BAJqCeBzAcT+uO+9lPx4nbKxOWY5lw8TFDp67IpZbDOIrZqRnXTeSwzQnlBjAwDwHUeDJgDM7zorPMAvGN2JZmT8Szo6s8DLKXwTxV77FDKbje895qIfQ718JfJ4NY4q3cU10vyDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qk1puQMH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qk1puQMH"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 522F114C7;
	Mon, 21 Sep 2026 10:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789981019;
	bh=WpOr3csztkRtov9yqk6fRyk6eDyoY72F8Ujbrz8dTBk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qk1puQMH+MADQWQVwVoS5w5Iy0NqugdnVf5+U1Ys3Piuy3UTKB/lfolE3Whse8who
	 8DOG+VMHNKuj4Wjohpb/1qE02Tb/WUJSTj3TE+P+RbzCCjznG8ZoFXPpmiH0xJIZrR
	 9YA2aaIUy/FAvLSTXonyOeZVZXhDB6d0UGGVqb2w=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260921082609.30830-1-lsa.uz@pm.me>
References: <20260921082609.30830-1-lsa.uz@pm.me>
Subject: Re: [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
To: Sergey Lebedev <lsa.uz@pm.me>, linux-media@vger.kernel.org
Date: Mon, 21 Sep 2026 09:58:42 +0100
Message-ID: <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Sergey Lebedev (2026-09-21 09:26:14)
> The driver programs OV13858_REG_FORMAT1 (0x3820) from its mode tables and
> never exposes the readout direction, so a module mounted rotated cannot be
> corrected.
>=20
> The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor upsi=
de
> down, and ipu-bridge now says so - b238116ccd4b ("media: ipu-bridge: Add
> upside-down quirk for Surface Pro 11"). libcamera reads that rotation and
> tries to compensate with sensor flips, finds neither control, and falls
> back to Rot0, so the quirk on its own names a rotation nothing can undo.
>=20
> ov13b10 has the same two controls, but it is a different part and its bit
> assignments do not carry over. There is no public datasheet for this one,
> so these were found by experiment on a single sample: single bits written
> over i2c mid-stream, each captured frame correlated against the flipped
> baseline. Of every bit in 0x3820 through 0x3823 exactly two move the
> image: 0x3820 BIT(4) set flips vertically, and BIT(3) cleared mirrors
> horizontally. 0x3821, where the mirror sits on several other OmniVision
> parts, has no effect here.
>=20
> Verified through the controls against a static scene, as correlation with
> the flipped reference and, as a control, with the unflipped one:
>=20
>   vflip  +0.994 / +0.629    hflip  +0.973 / -0.141    both  +0.975 / -0.1=
78

What do these numbers mean ?

Flips are 100% flips. They're not 90% flipped... or 90% correlated to
something which might be flipped.

=20
> The mirror bit is active low and every mode table already sets it, so the
> defaults write back what the mode list just wrote.
> __v4l2_ctrl_handler_setup() runs after that list and before MODE_SELECT,
> so the read-modify-write here sees the value the mode just programmed.
>=20
> The Bayer order at the output does not change with either flip: per-chann=
el
> means over the four states agree to 0.2 counts in 70, and all four frames

What does this mean ? (what's 0.2?)

> demosaic correctly against one fixed pattern. Unlike imx219 and imx258,
> whose flips select a different media bus code, these controls therefore do
> not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.


It sounds like ... you've found the right bits to handle flips. That's
great.

But please just use a human to verify, and skip the almost maybe
probablys.

A flip is either flipped or it isn't. A 95% correlation that something
might be flipped, probably, maybe ... isn't quite the same as "Oh look  I
can see it's mirrored and I'm 100% certain of this because I'm a real
person and I can tell when I look at something from left to right or
right to left."

If we know this flips correctly - lets say so clearly.

> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
>  drivers/media/i2c/ov13858.c | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> index de2b79a9a0..1bf21ffbc7 100644
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -76,6 +76,15 @@
>  #define OV13858_DGTL_GAIN_DEFAULT      1024    /* Default gain =3D 1 X */
>  #define OV13858_DGTL_GAIN_STEP         1       /* Each step =3D 1/1024 */
> =20
> +/*
> + * Readout direction. Neither flip changes the Bayer order at the output=
, so
> + * no window offset compensation is needed. The mirror bit is active low=
: the
> + * value the mode tables program already has it set.
> + */
> +#define OV13858_REG_FORMAT1            0x3820
> +#define OV13858_FORMAT1_VFLIP          BIT(4)
> +#define OV13858_FORMAT1_HFLIP_N                BIT(3)
> +
>  /* Test Pattern Control */
>  #define OV13858_REG_TEST_PATTERN       0x4503
>  #define OV13858_TEST_PATTERN_ENABLE    BIT(7)
> @@ -1042,6 +1051,8 @@ struct ov13858 {
>         struct v4l2_ctrl *vblank;
>         struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vflip;
> =20
>         /* Current mode */
>         const struct ov13858_mode *cur_mode;
> @@ -1208,6 +1219,30 @@ static int ov13858_enable_test_pattern(struct ov13=
858 *ov13858, u32 pattern)
>                                  OV13858_REG_VALUE_08BIT, val);
>  }
> =20
> +static int ov13858_update_flips(struct ov13858 *ov13858)
> +{
> +       u32 val;
> +       int ret;
> +
> +       ret =3D ov13858_read_reg(ov13858, OV13858_REG_FORMAT1,
> +                              OV13858_REG_VALUE_08BIT, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (ov13858->vflip->val)
> +               val |=3D OV13858_FORMAT1_VFLIP;
> +       else
> +               val &=3D ~OV13858_FORMAT1_VFLIP;
> +
> +       if (ov13858->hflip->val)
> +               val &=3D ~OV13858_FORMAT1_HFLIP_N;
> +       else
> +               val |=3D OV13858_FORMAT1_HFLIP_N;

Why is VFLIP set to flip, and HFLIP set to not flip. This sounds very
odd to me.



> +
> +       return ov13858_write_reg(ov13858, OV13858_REG_FORMAT1,
> +                                OV13858_REG_VALUE_08BIT, val);
> +}
> +
>  static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct ov13858 *ov13858 =3D container_of(ctrl->handler,
> @@ -1254,6 +1289,10 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
>                                         ov13858->cur_mode->height
>                                           + ctrl->val);
>                 break;
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:
> +               ret =3D ov13858_update_flips(ov13858);
> +               break;
>         case V4L2_CID_TEST_PATTERN:
>                 ret =3D ov13858_enable_test_pattern(ov13858, ctrl->val);
>                 break;
> @@ -1619,6 +1658,11 @@ static int ov13858_init_controls(struct ov13858 *o=
v13858)
>                           OV13858_DGTL_GAIN_MIN, OV13858_DGTL_GAIN_MAX,
>                           OV13858_DGTL_GAIN_STEP, OV13858_DGTL_GAIN_DEFAU=
LT);
> =20
> +       ov13858->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> +                                          V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       ov13858->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> +                                          V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
>         v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13858_ctrl_ops,
>                                      V4L2_CID_TEST_PATTERN,
>                                      ARRAY_SIZE(ov13858_test_pattern_menu=
) - 1,
> --=20
> 2.54.0 (Apple Git-157)
>=20
>
