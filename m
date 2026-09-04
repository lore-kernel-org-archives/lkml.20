Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE95388890;
	Fri,  4 Sep 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505397; cv=none; b=jp9wFy3M6uHAz4W4OaAkUgKGverqMNb8C+0hELQdP9hsA2NR4J3l8RHEV3ZzdiN+b6/60Bt5lU9rjOdCbZV4HQ8plmPb1i+C7n9kxO8YiNGk05QU7X3df1m6Kgmj7tvmYvawEd6e+MmwjtnawMJfXh0AwXuNux+lA0FUPjajcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505397; c=relaxed/simple;
	bh=WnbcQGUNfwtq+T+rmeWFHV8UiRTKjFm83y3dbtvXXDs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bgS6li0d5cWVqisKjmnvgAJV9Rl2KhWG8JP02b4X+W/WHQFLkrglvE+ImsrOkihlzxxVcnz0EKAAxWCMdmKgFQ+fdah12IIE5nLTvSZ5alPME4jLTbkh2Y0eH5tORdgMgR+vLdoAwkqENx2yW/Ws6XXpgyvGVvv81oZk/UNUaUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=STonagj7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="STonagj7"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F08D2023;
	Fri,  4 Sep 2026 09:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788505298;
	bh=WnbcQGUNfwtq+T+rmeWFHV8UiRTKjFm83y3dbtvXXDs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=STonagj76i/VLjRln67rBLB/ZhTFcWEkct8PTZVBDywBoi0FYYuxJdOmIZJCzHxg+
	 S8nndjoVz+/d5+EkEoy1d+uDVVd+199UygHixJMWefO4NY1dlULIxx/LVcm68JN30T
	 lwT0Da3Iuue+rOq4ntSvPgUNAUWeusjGmURhmScY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz> <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, david@ixit.cz
Date: Fri, 04 Sep 2026 12:33:05 +0530
Message-ID: <178850538534.11722.13162391406704193341@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Kieran,

Quoting Kieran Bingham (2026-09-04 04:00:35)
> Quoting David Heidelberg via B4 Relay (2026-08-27 10:26:53)
> > From: David Heidelberg <david@ixit.cz>
> >=20
> > The driver may not be MIPI CCS compliant, but does use same address and
> > often set same values as compliant drivers. Do not redefine registers we
> > already know and are standard.
> >=20
> > No functional changes.
>=20
> I kind of like the idea of this. I suspect it would help show which
> sensors have overlap and where helpers could be built up.
>=20
> I worry if it makes it harder to see what registers are being modified
> though, but I think the common definitions are parseable by tools and
> add an improvement to human readability because now we see they are from
> the common set, and not some arbitrary possibly similarly named register
> ?
>=20
> >=20
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > Changes in v2:
> > - Replaced all occurences with CCS ones.
> > - Link to v1: https://patch.msgid.link/20260819-imx355-ccsify-v1-1-0b6c=
ef77e340@ixit.cz
> > ---
> >  drivers/media/i2c/imx355.c | 84 ++++++++++++++------------------------=
--------
> >  1 file changed, 25 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 8eb8588cb71bb..2c845b7b3df4f 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -14,89 +14,55 @@
> >  #include <linux/unaligned.h>
> > =20
> >  #include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> > =20
> > -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
> > -#define IMX355_MODE_STANDBY            0x00
> > -#define IMX355_MODE_STREAMING          0x01
> > +#include "ccs/ccs-regs.h"
> > =20
> > -/* Chip ID */
> > -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
> >  #define IMX355_CHIP_ID                 0x0355
> > =20
> > -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
> > -
> >  /* PLL registers that depend on the external clock frequency */
> > -#define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
> >  #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
> > -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)
>=20
> I'm surprised that two registers have equivalents, but the other
> adjacent registers do not ? I haven't checked the spec through yet
> though. Is the gap because ccs-regs.h doesn't have the definition, or
> because this sensor has a different function / purpose for say 0x030d ?
>=20

David mentioned in the previous version that the other registers are
defined as CCI_REG16 by CCS, but the sensor datasheet offsets that by a
byte and only programs a single byte.

From other similar Sony sensors I've seen it's usually safe to just use the
full 16-bit register, as those addresses are left unused and Sony
implements non-CCS things in the 0x3xxx range. But I udnerstand that David
wanted to stick to the documented things in this series.

> >  #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
> >  #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)
> >  #define IMX355_PLL_OP_PREDIV           2
> >  #define IMX355_PLL_IVT_PCK_DIV         5
> > =20
> >  /* V_TIMING internal */
> > -#define IMX355_REG_FLL                 CCI_REG16(0x0340)
> >  #define IMX355_FLL_MAX                 0xffff
> >  #define IMX355_VBLANK_MIN              20
>=20
> Where there are limits, I believe CCS has registers to read the limits.
> That's where I wonder if there could be ccs helpers, to support parsing
> of blanking. But I also am weary that breaking parts into lots of small
> helpers could just become unreadable, so I wouldn't push for that at the
> moment. I'd be curious to know 'how common' this is to CCS though.
>=20
>=20

In IMX708 I saw that CCS limit registers gave different values compared to
the datasheet's recommendations at more than one occasion.

Do note that IMX708 and I assume this one too is not *actually*
CCS-compliant, just similar enough. The CCS_R_MIPI_CCS_VERSION register
reads 0x0. So we should take other limit registers with a grain of salt.

> > =20
> > -#define IMX355_REG_LLP                 CCI_REG16(0x0342)
> >  #define IMX355_LLP_MAX                 0xffff
> > =20
> > -#define IMX355_REG_X_ADD_START         CCI_REG16(0x0344)
> > -#define IMX355_REG_Y_ADD_START         CCI_REG16(0x0346)
> > -#define IMX355_REG_X_ADD_END           CCI_REG16(0x0348)
> > -#define IMX355_REG_Y_ADD_END           CCI_REG16(0x034a)
> > -#define IMX355_REG_X_OUT_SIZE          CCI_REG16(0x034c)
> > -#define IMX355_REG_Y_OUT_SIZE          CCI_REG16(0x034e)
> > -
>=20
> But when a whole block comes out like this - that makes me think perhaps
> the crop control or fmts might just be a common function ?
>=20

Indeed common helpers should be possible for typical ops for crop, formats,
bit depth etc. I've already started working on something like this for the
common raw sensor framework, but it should be possible to also handle the
register writes for a whole "class" of sensors like CCS, Sony-CCS-similar
(like this one, IMX708, IMX576, IMX519, IMX219?) and Starvis series etc.

Thanks,
    Jai

> >  /* Exposure control */
> > -#define IMX355_REG_EXPOSURE            CCI_REG16(0x0202)
> >  #define IMX355_EXPOSURE_MIN            1
> >  #define IMX355_EXPOSURE_STEP           1
> >  #define IMX355_EXPOSURE_DEFAULT                0x0282
> >  #define IMX355_EXPOSURE_OFFSET         10
> > =20
> >  /* Analog gain control */
> > -#define IMX355_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> >  #define IMX355_ANA_GAIN_MIN            0
> >  #define IMX355_ANA_GAIN_MAX            960
> >  #define IMX355_ANA_GAIN_STEP           1
> >  #define IMX355_ANA_GAIN_DEFAULT                0
> > =20
> >  /* Digital gain control */
> >  #define IMX355_REG_DPGA_USE_GLOBAL_GAIN        CCI_REG8(0x3070)
> > -#define IMX355_REG_DIG_GAIN_GLOBAL     CCI_REG16(0x020e)
> >  #define IMX355_DGTL_GAIN_MIN           256
> >  #define IMX355_DGTL_GAIN_MAX           4095
> >  #define IMX355_DGTL_GAIN_STEP          1
> >  #define IMX355_DGTL_GAIN_DEFAULT       256
>=20
> I'd be curious if all of those limits could be read from registers, in
> case future helpers might do that instead .... But hardcoding known
> values in this specific driver is probably better than adding the
> complexity of trying to read them at runtime just to obtain the values
> above.
>=20
> I'm not sure I've gone through this enough to warrant a tag of some
> form, but I found the patch concept interesting enough to want to jump
> in to the conversation ;-)
>=20
> Interested to see what happens anyway!
>=20
> --
> Kieran
>=20
>=20
> > =20
> > -/* Test Pattern Control */
> > -#define IMX355_REG_TEST_PATTERN                CCI_REG16(0x0600)
> > -#define IMX355_TEST_PATTERN_DISABLED           0
> > -#define IMX355_TEST_PATTERN_SOLID_COLOR                1
> > -#define IMX355_TEST_PATTERN_COLOR_BARS         2
> > -#define IMX355_TEST_PATTERN_GRAY_COLOR_BARS    3
> > -#define IMX355_TEST_PATTERN_PN9                        4
> > -
> > +/* Link rate register: 16-bit wide, unlike the CCS 32-bit one */
> >  #define IMX355_REG_REQ_LINK_BIT_RATE   CCI_REG16(0x0820)
> > =20
> > -#define IMX355_REG_BINNING_MODE                CCI_REG8(0x0900)
> > -#define IMX355_REG_BINNING_TYPE                CCI_REG8(0x0901)
> > -#define IMX355_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
> > -
> > -/* Flip Control */
> > -#define IMX355_REG_ORIENTATION         CCI_REG8(0x0101)
> > -
> >  #define IMX355_PIXEL_ARRAY_TOP         0
> >  #define IMX355_PIXEL_ARRAY_LEFT                0
> >  #define IMX355_PIXEL_ARRAY_WIDTH       3280
> >  #define IMX355_PIXEL_ARRAY_HEIGHT      2464
> > =20
> >  struct imx355_reg_list {
> >         u32 num_of_regs;
> >         const struct cci_reg_sequence *regs;
> > @@ -616,39 +582,39 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
> >          * when power is up for streaming
> >          */
> >         if (!pm_runtime_get_if_in_use(imx355->dev))
> >                 return 0;
> > =20
> >         switch (ctrl->id) {
> >         case V4L2_CID_ANALOGUE_GAIN:
> >                 /* Analog gain =3D 1024/(1024 - ctrl->val) times */
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_ANALOG_GAI=
N,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_ANALOG_GAIN_COD=
E_GLOBAL,
> >                                 ctrl->val, NULL);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_G=
LOBAL,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_DIGITAL_GAIN_GL=
OBAL,
> >                                 ctrl->val, NULL);
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_COARSE_INTEGRAT=
ION_TIME,
> >                                 ctrl->val, NULL);
> >                 break;
> >         case V4L2_CID_VBLANK:
> >                 /* Update FLL that meets expected vertical blanking */
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_FLL,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_FRAME_LENGTH_LI=
NES,
> >                                 format->height + ctrl->val, NULL);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN:
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_TEST_PATTE=
RN,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_TEST_PATTERN_MO=
DE,
> >                                 ctrl->val, NULL);
> >                 break;
> >         case V4L2_CID_HFLIP:
> >         case V4L2_CID_VFLIP:
> > -               ret =3D cci_write(imx355->regmap, IMX355_REG_ORIENTATIO=
N,
> > +               ret =3D cci_write(imx355->regmap, CCS_R_IMAGE_ORIENTATI=
ON,
> >                                 imx355->hflip->val | imx355->vflip->val=
 << 1,
> >                                 NULL);
> >                 break;
> >         default:
> >                 ret =3D -EINVAL;
> >                 dev_info(imx355->dev, "ctrl(id:0x%x,val:0x%x) is not ha=
ndled",
> >                          ctrl->id, ctrl->val);
> >                 break;
> > @@ -823,75 +789,75 @@ static int imx355_start_streaming(struct imx355 *=
imx355)
> >         crop =3D v4l2_subdev_state_get_crop(state, 0);
> >         mode =3D v4l2_find_nearest_size(supported_modes,
> >                                       ARRAY_SIZE(supported_modes),
> >                                       width, height, fmt->width, fmt->h=
eight);
> >         cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
> >                             mode->reg_list.num_of_regs, &ret);
> > =20
> >         /* Set readout crop and size registers  */
> > -       cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
> > +       cci_write(imx355->regmap, CCS_R_X_ADDR_START, crop->left,
> >                   &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &r=
et);
> > -       cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
> > +       cci_write(imx355->regmap, CCS_R_Y_ADDR_START, crop->top, &ret);
> > +       cci_write(imx355->regmap, CCS_R_X_ADDR_END,
> >                   crop->width + crop->left - 1, &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
> > +       cci_write(imx355->regmap, CCS_R_Y_ADDR_END,
> >                   crop->height + crop->top - 1, &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &r=
et);
> > -       cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &=
ret);
> > +       cci_write(imx355->regmap, CCS_R_X_OUTPUT_SIZE, fmt->width, &ret=
);
> > +       cci_write(imx355->regmap, CCS_R_Y_OUTPUT_SIZE, fmt->height, &re=
t);
> > =20
> >         binning_mode =3D ((crop->width / fmt->width) << 4) |
> >                         (crop->height / fmt->height);
> > -       cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
> > +       cci_write(imx355->regmap, CCS_R_BINNING_MODE,
> >                   binning_mode =3D=3D 0x11 ? 0x00 : 0x01, &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode=
, &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &=
ret);
> > +       cci_write(imx355->regmap, CCS_R_BINNING_TYPE, binning_mode, &re=
t);
> > +       cci_write(imx355->regmap, CCS_R_BINNING_WEIGHTING, 0x00, &ret);
> > =20
> >         /* Set PLL registers for the external clock frequency */
> > -       cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
> > +       cci_write(imx355->regmap, CCS_R_EXTCLK_FREQUENCY_MHZ,
> >                   imx355->clk_params->extclk_freq, &ret);
> > -       cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
> > +       cci_write(imx355->regmap, CCS_R_OP_PLL_MULTIPLIER,
> >                   imx355->clk_params->pll_op_mpy[lane_idx], &ret);
> >         cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
> >                   imx355->clk_params->pll_op_prediv[lane_idx], &ret);
> >         cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
> >                   lane_idx ? 2 : 1, &ret);
> > =20
> >         /* Set MIPI configuration */
> > -       cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
> > +       cci_write(imx355->regmap, CCS_R_CSI_LANE_MODE,
> >                   imx355->hwcfg->num_lanes - 1, &ret);
> > =20
> >         link_bitrate =3D imx355->link_freq->qmenu_int[imx355->link_freq=
->val] *
> >                        imx355->hwcfg->num_lanes * 2;
> >         do_div(link_bitrate, 1000000);
> >         cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bi=
trate,
> >                   &ret);
> > =20
> >         /* set digital gain control to all color mode */
> >         cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &=
ret);
> > =20
> >         /* set line length */
> > -       cci_write(imx355->regmap, IMX355_REG_LLP,
> > +       cci_write(imx355->regmap, CCS_R_LINE_LENGTH_PCK,
> >                   imx355->hblank->val + fmt->width, &ret);
> > =20
> >         /* Apply customized values from user */
> >         if (!ret)
> >                 ret =3D __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handl=
er);
> > =20
> > -       cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_S=
TREAMING,
> > +       cci_write(imx355->regmap, CCS_R_MODE_SELECT, CCS_MODE_SELECT_ST=
REAMING,
> >                   &ret);
> > =20
> >         return ret;
> >  }
> > =20
> >  /* Stop streaming */
> >  static int imx355_stop_streaming(struct imx355 *imx355)
> >  {
> > -       return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
> > -                        IMX355_MODE_STANDBY, NULL);
> > +       return cci_write(imx355->regmap, CCS_R_MODE_SELECT,
> > +                        CCS_MODE_SELECT_SOFTWARE_STANDBY, NULL);
> >  }
> > =20
> >  static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >         struct imx355 *imx355 =3D to_imx355(sd);
> >         struct v4l2_subdev_state *state;
> >         int ret =3D 0;
> > =20
> > @@ -931,17 +897,17 @@ static int imx355_set_stream(struct v4l2_subdev *=
sd, int enable)
> >  }
> > =20
> >  /* Verify chip ID */
> >  static int imx355_identify_module(struct imx355 *imx355)
> >  {
> >         int ret;
> >         u64 val;
> > =20
> > -       ret =3D cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL=
);
> > +       ret =3D cci_read(imx355->regmap, CCS_R_SENSOR_MODEL_ID, &val, N=
ULL);
> >         if (ret)
> >                 return ret;
> > =20
> >         if (val !=3D IMX355_CHIP_ID) {
> >                 dev_err(imx355->dev, "chip id mismatch: %x!=3D%llx",
> >                         IMX355_CHIP_ID, val);
> >                 return -EIO;
> >         }
> >=20
> > ---
> > base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
> > change-id: 20260819-imx355-ccsify-856c850575f1
> >=20
> > Best regards,
> > -- =20
> > David Heidelberg <david@ixit.cz>
> >=20
> >
>
