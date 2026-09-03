Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53301A6815;
	Thu,  3 Sep 2026 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474645; cv=none; b=kiGNhBeBKzKLp/PA55cFS5GxyOauAa4mY+oZU0ncnGMRA7AWcCAzy7Yh5/kjtp4wIopHnKle3ENWXwMpsA66GK8bgi/F1vDkCmiNuA2woZ6JYlPXx9TTiCsGJ807o7s2bfkAAxACv37m7uXP6Q1tnkopuNCETuSobDLOV6k0cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474645; c=relaxed/simple;
	bh=yP6sO5UBUVEcubzeW0poxyj8ELEe5rE+PBceM13ImLs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uQyjpx4yJGoYiIwUOxwT9THYNuNTvt70a8PAo/vXQ5FmPT6Wvk6XVGAOlE04cBcVg6GXN3yZ0O4N975+hjybpXnK5OxGQgWWrbkF5GYIrGiZl+KSUfN/H3gEVwb3ICtB2A7ii8wfuKWVM325zs3B2KgIruQKdLwSHE/8PpSzc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZZWPySWx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZZWPySWx"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D38013BA;
	Fri,  4 Sep 2026 00:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788474547;
	bh=yP6sO5UBUVEcubzeW0poxyj8ELEe5rE+PBceM13ImLs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZZWPySWxiWlD8D1YO7kpfo+Lqsb5GiTs9m0al9OKNumL5OJvsa0UNyKA7IwGqSFON
	 1RzgYoxJLymkDpVjwHun49zXMur2yIlzb138BmKsMIL6oq9GhIXIhUhbxYL5zfXGUy
	 1FUoGudVZwIBxCuCmGi2IskokZPPKF8G64Ko9444=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, david@ixit.cz
Date: Thu, 03 Sep 2026 23:30:35 +0100
Message-ID: <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting David Heidelberg via B4 Relay (2026-08-27 10:26:53)
> From: David Heidelberg <david@ixit.cz>
>=20
> The driver may not be MIPI CCS compliant, but does use same address and
> often set same values as compliant drivers. Do not redefine registers we
> already know and are standard.
>=20
> No functional changes.

I kind of like the idea of this. I suspect it would help show which
sensors have overlap and where helpers could be built up.

I worry if it makes it harder to see what registers are being modified
though, but I think the common definitions are parseable by tools and
add an improvement to human readability because now we see they are from
the common set, and not some arbitrary possibly similarly named register
?

>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v2:
> - Replaced all occurences with CCS ones.
> - Link to v1: https://patch.msgid.link/20260819-imx355-ccsify-v1-1-0b6cef=
77e340@ixit.cz
> ---
>  drivers/media/i2c/imx355.c | 84 ++++++++++++++--------------------------=
------
>  1 file changed, 25 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 8eb8588cb71bb..2c845b7b3df4f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -14,89 +14,55 @@
>  #include <linux/unaligned.h>
> =20
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> =20
> -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
> -#define IMX355_MODE_STANDBY            0x00
> -#define IMX355_MODE_STREAMING          0x01
> +#include "ccs/ccs-regs.h"
> =20
> -/* Chip ID */
> -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
>  #define IMX355_CHIP_ID                 0x0355
> =20
> -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
> -
>  /* PLL registers that depend on the external clock frequency */
> -#define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
>  #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
> -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)

I'm surprised that two registers have equivalents, but the other
adjacent registers do not ? I haven't checked the spec through yet
though. Is the gap because ccs-regs.h doesn't have the definition, or
because this sensor has a different function / purpose for say 0x030d ?

>  #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
>  #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)
>  #define IMX355_PLL_OP_PREDIV           2
>  #define IMX355_PLL_IVT_PCK_DIV         5
> =20
>  /* V_TIMING internal */
> -#define IMX355_REG_FLL                 CCI_REG16(0x0340)
>  #define IMX355_FLL_MAX                 0xffff
>  #define IMX355_VBLANK_MIN              20

Where there are limits, I believe CCS has registers to read the limits.
That's where I wonder if there could be ccs helpers, to support parsing
of blanking. But I also am weary that breaking parts into lots of small
helpers could just become unreadable, so I wouldn't push for that at the
moment. I'd be curious to know 'how common' this is to CCS though.


> =20
> -#define IMX355_REG_LLP                 CCI_REG16(0x0342)
>  #define IMX355_LLP_MAX                 0xffff
> =20
> -#define IMX355_REG_X_ADD_START         CCI_REG16(0x0344)
> -#define IMX355_REG_Y_ADD_START         CCI_REG16(0x0346)
> -#define IMX355_REG_X_ADD_END           CCI_REG16(0x0348)
> -#define IMX355_REG_Y_ADD_END           CCI_REG16(0x034a)
> -#define IMX355_REG_X_OUT_SIZE          CCI_REG16(0x034c)
> -#define IMX355_REG_Y_OUT_SIZE          CCI_REG16(0x034e)
> -

But when a whole block comes out like this - that makes me think perhaps
the crop control or fmts might just be a common function ?

>  /* Exposure control */
> -#define IMX355_REG_EXPOSURE            CCI_REG16(0x0202)
>  #define IMX355_EXPOSURE_MIN            1
>  #define IMX355_EXPOSURE_STEP           1
>  #define IMX355_EXPOSURE_DEFAULT                0x0282
>  #define IMX355_EXPOSURE_OFFSET         10
> =20
>  /* Analog gain control */
> -#define IMX355_REG_ANALOG_GAIN         CCI_REG16(0x0204)
>  #define IMX355_ANA_GAIN_MIN            0
>  #define IMX355_ANA_GAIN_MAX            960
>  #define IMX355_ANA_GAIN_STEP           1
>  #define IMX355_ANA_GAIN_DEFAULT                0
> =20
>  /* Digital gain control */
>  #define IMX355_REG_DPGA_USE_GLOBAL_GAIN        CCI_REG8(0x3070)
> -#define IMX355_REG_DIG_GAIN_GLOBAL     CCI_REG16(0x020e)
>  #define IMX355_DGTL_GAIN_MIN           256
>  #define IMX355_DGTL_GAIN_MAX           4095
>  #define IMX355_DGTL_GAIN_STEP          1
>  #define IMX355_DGTL_GAIN_DEFAULT       256

I'd be curious if all of those limits could be read from registers, in
case future helpers might do that instead .... But hardcoding known
values in this specific driver is probably better than adding the
complexity of trying to read them at runtime just to obtain the values
above.

I'm not sure I've gone through this enough to warrant a tag of some
form, but I found the patch concept interesting enough to want to jump
in to the conversation ;-)

Interested to see what happens anyway!

--
Kieran


> =20
> -/* Test Pattern Control */
> -#define IMX355_REG_TEST_PATTERN                CCI_REG16(0x0600)
> -#define IMX355_TEST_PATTERN_DISABLED           0
> -#define IMX355_TEST_PATTERN_SOLID_COLOR                1
> -#define IMX355_TEST_PATTERN_COLOR_BARS         2
> -#define IMX355_TEST_PATTERN_GRAY_COLOR_BARS    3
> -#define IMX355_TEST_PATTERN_PN9                        4
> -
> +/* Link rate register: 16-bit wide, unlike the CCS 32-bit one */
>  #define IMX355_REG_REQ_LINK_BIT_RATE   CCI_REG16(0x0820)
> =20
> -#define IMX355_REG_BINNING_MODE                CCI_REG8(0x0900)
> -#define IMX355_REG_BINNING_TYPE                CCI_REG8(0x0901)
> -#define IMX355_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
> -
> -/* Flip Control */
> -#define IMX355_REG_ORIENTATION         CCI_REG8(0x0101)
> -
>  #define IMX355_PIXEL_ARRAY_TOP         0
>  #define IMX355_PIXEL_ARRAY_LEFT                0
>  #define IMX355_PIXEL_ARRAY_WIDTH       3280
>  #define IMX355_PIXEL_ARRAY_HEIGHT      2464
> =20
>  struct imx355_reg_list {
>         u32 num_of_regs;
>         const struct cci_reg_sequence *regs;
> @@ -616,39 +582,39 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
>          * when power is up for streaming
>          */
>         if (!pm_runtime_get_if_in_use(imx355->dev))
>                 return 0;
> =20
>         switch (ctrl->id) {
>         case V4L2_CID_ANALOGUE_GAIN:
>                 /* Analog gain =3D 1024/(1024 - ctrl->val) times */
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_ANALOG_GAIN,
> +               ret =3D cci_write(imx355->regmap, CCS_R_ANALOG_GAIN_CODE_=
GLOBAL,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_GLO=
BAL,
> +               ret =3D cci_write(imx355->regmap, CCS_R_DIGITAL_GAIN_GLOB=
AL,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_EXPOSURE:
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
> +               ret =3D cci_write(imx355->regmap, CCS_R_COARSE_INTEGRATIO=
N_TIME,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_VBLANK:
>                 /* Update FLL that meets expected vertical blanking */
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_FLL,
> +               ret =3D cci_write(imx355->regmap, CCS_R_FRAME_LENGTH_LINE=
S,
>                                 format->height + ctrl->val, NULL);
>                 break;
>         case V4L2_CID_TEST_PATTERN:
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
> +               ret =3D cci_write(imx355->regmap, CCS_R_TEST_PATTERN_MODE,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_HFLIP:
>         case V4L2_CID_VFLIP:
> -               ret =3D cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
> +               ret =3D cci_write(imx355->regmap, CCS_R_IMAGE_ORIENTATION,
>                                 imx355->hflip->val | imx355->vflip->val <=
< 1,
>                                 NULL);
>                 break;
>         default:
>                 ret =3D -EINVAL;
>                 dev_info(imx355->dev, "ctrl(id:0x%x,val:0x%x) is not hand=
led",
>                          ctrl->id, ctrl->val);
>                 break;
> @@ -823,75 +789,75 @@ static int imx355_start_streaming(struct imx355 *im=
x355)
>         crop =3D v4l2_subdev_state_get_crop(state, 0);
>         mode =3D v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
>                                       width, height, fmt->width, fmt->hei=
ght);
>         cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
>                             mode->reg_list.num_of_regs, &ret);
> =20
>         /* Set readout crop and size registers  */
> -       cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
> +       cci_write(imx355->regmap, CCS_R_X_ADDR_START, crop->left,
>                   &ret);
> -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &ret=
);
> -       cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
> +       cci_write(imx355->regmap, CCS_R_Y_ADDR_START, crop->top, &ret);
> +       cci_write(imx355->regmap, CCS_R_X_ADDR_END,
>                   crop->width + crop->left - 1, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
> +       cci_write(imx355->regmap, CCS_R_Y_ADDR_END,
>                   crop->height + crop->top - 1, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &ret=
);
> -       cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &re=
t);
> +       cci_write(imx355->regmap, CCS_R_X_OUTPUT_SIZE, fmt->width, &ret);
> +       cci_write(imx355->regmap, CCS_R_Y_OUTPUT_SIZE, fmt->height, &ret);
> =20
>         binning_mode =3D ((crop->width / fmt->width) << 4) |
>                         (crop->height / fmt->height);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
> +       cci_write(imx355->regmap, CCS_R_BINNING_MODE,
>                   binning_mode =3D=3D 0x11 ? 0x00 : 0x01, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, =
&ret);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &re=
t);
> +       cci_write(imx355->regmap, CCS_R_BINNING_TYPE, binning_mode, &ret);
> +       cci_write(imx355->regmap, CCS_R_BINNING_WEIGHTING, 0x00, &ret);
> =20
>         /* Set PLL registers for the external clock frequency */
> -       cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
> +       cci_write(imx355->regmap, CCS_R_EXTCLK_FREQUENCY_MHZ,
>                   imx355->clk_params->extclk_freq, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
> +       cci_write(imx355->regmap, CCS_R_OP_PLL_MULTIPLIER,
>                   imx355->clk_params->pll_op_mpy[lane_idx], &ret);
>         cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
>                   imx355->clk_params->pll_op_prediv[lane_idx], &ret);
>         cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
>                   lane_idx ? 2 : 1, &ret);
> =20
>         /* Set MIPI configuration */
> -       cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
> +       cci_write(imx355->regmap, CCS_R_CSI_LANE_MODE,
>                   imx355->hwcfg->num_lanes - 1, &ret);
> =20
>         link_bitrate =3D imx355->link_freq->qmenu_int[imx355->link_freq->=
val] *
>                        imx355->hwcfg->num_lanes * 2;
>         do_div(link_bitrate, 1000000);
>         cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bitr=
ate,
>                   &ret);
> =20
>         /* set digital gain control to all color mode */
>         cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &re=
t);
> =20
>         /* set line length */
> -       cci_write(imx355->regmap, IMX355_REG_LLP,
> +       cci_write(imx355->regmap, CCS_R_LINE_LENGTH_PCK,
>                   imx355->hblank->val + fmt->width, &ret);
> =20
>         /* Apply customized values from user */
>         if (!ret)
>                 ret =3D __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler=
);
> =20
> -       cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STR=
EAMING,
> +       cci_write(imx355->regmap, CCS_R_MODE_SELECT, CCS_MODE_SELECT_STRE=
AMING,
>                   &ret);
> =20
>         return ret;
>  }
> =20
>  /* Stop streaming */
>  static int imx355_stop_streaming(struct imx355 *imx355)
>  {
> -       return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
> -                        IMX355_MODE_STANDBY, NULL);
> +       return cci_write(imx355->regmap, CCS_R_MODE_SELECT,
> +                        CCS_MODE_SELECT_SOFTWARE_STANDBY, NULL);
>  }
> =20
>  static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx355 *imx355 =3D to_imx355(sd);
>         struct v4l2_subdev_state *state;
>         int ret =3D 0;
> =20
> @@ -931,17 +897,17 @@ static int imx355_set_stream(struct v4l2_subdev *sd=
, int enable)
>  }
> =20
>  /* Verify chip ID */
>  static int imx355_identify_module(struct imx355 *imx355)
>  {
>         int ret;
>         u64 val;
> =20
> -       ret =3D cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
> +       ret =3D cci_read(imx355->regmap, CCS_R_SENSOR_MODEL_ID, &val, NUL=
L);
>         if (ret)
>                 return ret;
> =20
>         if (val !=3D IMX355_CHIP_ID) {
>                 dev_err(imx355->dev, "chip id mismatch: %x!=3D%llx",
>                         IMX355_CHIP_ID, val);
>                 return -EIO;
>         }
>=20
> ---
> base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
> change-id: 20260819-imx355-ccsify-856c850575f1
>=20
> Best regards,
> -- =20
> David Heidelberg <david@ixit.cz>
>=20
>
