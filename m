Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128737F305;
	Thu,  3 Sep 2026 04:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408955; cv=none; b=gYT5TMpiSVK8EAumsEa9+2ogZuiWSwamzbRvxynu0jkyVJApUPBq6bdcjRZc8nymmP75sed9ERkLF1wGdb3gNPuyZZU2QVnmQA/FiQFURlY6IgtY0PgcnNx44UODi0S6Mb3iEkxZtBdjU4v6NfRHmRx9DdYpQSfsTCAuLFzNKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408955; c=relaxed/simple;
	bh=yh3NuS6enqFa8OlPnMhE/7uKF6ShgM4rx83iOmkm4ss=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=maYSlLpCOSb3OB2rPkuu7Ih7lYG69gitkXPwpNPzy2aRXaJC51fzY14ep3iTpEzWF4teFlOA+F+6PYD5PyvbibIdo2dWN4GicvgwRpOPSRmLZfBeAmW6jAYt6S+10juGDpFApxth9aNcEoJBPbYjcv7RwQ4ztJxYtD0JrK/TiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v71WRO38; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v71WRO38"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F6F8874;
	Thu,  3 Sep 2026 06:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788408859;
	bh=yh3NuS6enqFa8OlPnMhE/7uKF6ShgM4rx83iOmkm4ss=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=v71WRO38loz6IbDRMMLRdB0Q4yxDU2L6knAxjklUJ8ss6XPAxoXYYNHP3qn+EEHQ+
	 /ROWzTSD17xAzxO+PyWra8ttxsrZrtY2OPU6QzlDZr9MzjIMTApUz1ZCZPgHOAw8Yp
	 ztcgdbliiXLK/Rzla13og5J7M9jMmecuEIEmZCmY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260805-media-starvis2-v1-2-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <20260805-media-starvis2-v1-2-91e8e4eae44f@raspberrypi.com>
Subject: Re: [PATCH RFC 2/4] media: i2c: imx678: Parameterise the configuration to allow for other models
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 03 Sep 2026 09:45:46 +0530
Message-ID: <178840894612.11722.991560430853331683@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Dave Stevenson (2026-08-05 21:39:17)
> Several of the Sony Starvis 2 sensors are identical in the
> majority of their programming, but differ largely only in the
> size of pixel array and some timing parameters.
>=20
> Parameterise those parameters in preparation for supporting other
> variants.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx678.c | 161 +++++++++++++++++++++++++++++----------=
------
>  1 file changed, 106 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> index f7b988dca2ac..40ba6661b366 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/imx678.c
> @@ -148,32 +148,11 @@
>  /* Subdev pads */
>  #define IMX678_SOURCE_PAD              0
> =20
> -/* IMX678 native and active pixel array size. */
> -static const struct v4l2_rect imx678_native_area =3D {
> -       .top =3D 0,
> -       .left =3D 0,
> -       .width =3D 3857,
> -       .height =3D 2201,
> -};
> -
> -static const struct v4l2_rect imx678_active_area =3D {
> -       .top =3D 20,
> -       .left =3D 0,
> -       .width =3D 3856,
> -       .height =3D 2180,
> -};
> -
>  enum imx678_type {
>         IMX678_COLOR =3D 0,
>         IMX678_MONOCHROME =3D 1,
>  };
> =20
> -struct imx678_model_info {
> -       enum imx678_type type;
> -       const u32 *codes;
> -       unsigned int num_codes;
> -};
> -
>  enum imx678_lanemode {
>         IMX678_LANEMODE_2L =3D 1,
>         IMX678_LANEMODE_4L =3D 3,
> @@ -213,7 +192,7 @@ static const u64 link_freqs[] =3D {
>         [IMX678_LINK_FREQ_1188MHZ] =3D 1188000000,
>  };
> =20
> -static const u16 min_hmax_4lane[] =3D {
> +static const u16 imx678_min_hmax_4lane[] =3D {
>         [IMX678_LINK_FREQ_297MHZ] =3D 1584,
>         [IMX678_LINK_FREQ_360MHZ] =3D 1320,
>         [IMX678_LINK_FREQ_445MHZ] =3D 1100,
> @@ -273,7 +252,7 @@ static const int imx678_tpg_val[] =3D {
>  };
> =20
>  /* Common configuration */
> -static const struct cci_reg_sequence common_regs[] =3D {
> +static const struct cci_reg_sequence imx678_common_regs[] =3D {
>         { IMX678_REG_THIN_V_EN, 0x00 },
>         { IMX678_REG_VCMODE, 0x01 },
>         { CCI_REG8(0x306b), 0x00 },
> @@ -656,16 +635,72 @@ static const u32 codes_monochrome[] =3D {
>         MEDIA_BUS_FMT_Y12_1X12,
>  };
> =20
> +struct imx678_variant {
> +       const char *name;
> +       u32 id_reg;
> +       u32 id_value;
> +       struct v4l2_rect native_area;
> +       struct v4l2_rect active_area;
> +       u64 pixel_rate;
> +       unsigned int pix_per_clk;
> +       const struct cci_reg_sequence *common_regs;
> +       unsigned int num_common_regs;
> +       unsigned int vmax_default;
> +       const u16 *hmax_min;
> +};
> +
> +const struct imx678_variant imx678_variant_def =3D {
> +       .name =3D "imx678",
> +       .id_reg =3D IMX678_REG_MODULE_ID,
> +       .id_value =3D IMX678_ID,
> +       .native_area =3D {
> +               .top =3D 0,
> +               .left =3D 0,
> +               .width =3D 3857,
> +               .height =3D 2201,
> +       },
> +       .active_area =3D {
> +               .top =3D 20,
> +               .left =3D 0,
> +               .width =3D 3856,
> +               .height =3D 2180,
> +       },
> +       .pixel_rate =3D IMX678_PIXEL_RATE,
> +       .pix_per_clk =3D IMX678_PIX_PER_CLK,
> +       .common_regs =3D imx678_common_regs,
> +       .num_common_regs =3D ARRAY_SIZE(imx678_common_regs),
> +       .vmax_default =3D IMX678_VMAX_DEFAULT,

There are a couple of places where IMX678_PIX_PER_CLK and
IMX678_VMAX_DEFAULT were still being used. I've fixed those in my branch:
https://github.com/jailuthra/linux/commit/3c656e370e06ceb41e69ba0406f685d45=
56133d0

Thanks,
Jai

[...]
