Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4C2EEE84;
	Thu,  3 Sep 2026 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409257; cv=none; b=MPyO3+mMnzBujCAMcKipKePkZ1bI1RNstk2Qhedw2E9yoS5sFKbZHAKzISGpcD+RpwHCwso1k/J9RUw1KgOO0d2Zh7ir8aonxdivhH/4zYgerpeq1Yet8muKxcKyeTqaVb256AEzIknXVoPQeVuE37Qp/6ooNVT8FXiXo+47QgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409257; c=relaxed/simple;
	bh=/+wkP9zKixQROnTHNdDgFC3KT4/BqYKEnxcltLAnChY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ejSjT6Y9KafliIn/8lZ8ItHSWHCge8KTbgtkP08He8lUu+pilxCx+O6paB+uZ1eWY5pGOUw2ywnvesXMaQUJxhJgS6z9W4jvNoumawPpnrFGs1cw8BffTFZceeVsaLo6Kerd1Uho+6cV1Vuy7oVpDjin7R70g/iWxNifZZESmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bGX+7tqi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bGX+7tqi"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A98C5874;
	Thu,  3 Sep 2026 06:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788409160;
	bh=/+wkP9zKixQROnTHNdDgFC3KT4/BqYKEnxcltLAnChY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bGX+7tqiRSxUvxZc9DQPDLtUbOomTTLOMiqhZqF/w2OLImZntO0wdO5LNb83nLLqW
	 QhFz3FHgjKVX1di2tnCRweLme1ZJTy+fCflLgdfMGhPAGpLQR57vC+WQ0aMlCCwR50
	 cHq8ihpQSBM4RQB1JJIIzeu9B3NTIRnc4OawgqrA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260805-media-starvis2-v1-3-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <20260805-media-starvis2-v1-3-91e8e4eae44f@raspberrypi.com>
Subject: Re: [PATCH RFC 3/4] media: i2c: imx678: Add imx662 support to the driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 03 Sep 2026 09:50:46 +0530
Message-ID: <178840924662.11722.12680340547715469059@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,

Quoting Dave Stevenson (2026-08-05 21:39:18)
> IMX662 is a 1080p Starvis 2 sensor that follows the same programming
> pattern as IMX678, so add it to the newly parameterised driver.
>=20
> FIXME: Update the common registers based on the Sony spreadsheet.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx678.c | 64 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> index 40ba6661b366..9083f2744510 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/imx678.c
> @@ -673,6 +673,47 @@ const struct imx678_variant imx678_variant_def =3D {
>         .hmax_min =3D imx678_min_hmax_4lane,
>  };
> =20
> +static const struct cci_reg_sequence imx662_common_regs[] =3D {
> +       { IMX678_REG_WDMODE, 0x00 },
> +       { IMX678_REG_MDBIT, 0x01 },
> +       { IMX678_REG_XXS_DRV, 0x00 },
> +};
> +
> +static const u16 imx662_min_hmax_4lane[] =3D {
> +       [IMX678_LINK_FREQ_297MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_360MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_445MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_594MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_720MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_891MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_1039MHZ] =3D 990,
> +       [IMX678_LINK_FREQ_1188MHZ] =3D 990,
> +};
> +
> +const struct imx678_variant imx662_variant_def =3D {
> +       .name =3D "imx662",
> +       .id_reg =3D IMX678_REG_MODULE_ID,
> +       .id_value =3D 0x296,
> +       .native_area =3D {
> +               .top =3D 0,
> +               .left =3D 0,
> +               .width =3D 1937,
> +               .height =3D 1101,
> +       },
> +       .active_area =3D {
> +               .top =3D 0,
> +               .left =3D 0,
> +               .width =3D 1936,
> +               .height =3D 1096,
> +       },
> +       .pixel_rate =3D 222750000,
> +       .pix_per_clk =3D 3,
> +       .common_regs =3D imx662_common_regs,
> +       .num_common_regs =3D ARRAY_SIZE(imx662_common_regs),
> +       .vmax_default =3D 1096 + 40,

From the IMX662 SRM I see the following constraints for minimum:

    VTTL >=3D PIX_VWIDTH + 70
    VTTL >=3D 820

And the table giving round FPS numbers like 30/60/90 assumes VMAX =3D 1250.

Did you manually verify that setting blanking to 40 also works?

Thanks,
    Jai
> +       .hmax_min =3D imx662_min_hmax_4lane,
> +};
> +
>  struct imx678_model_info {
>         enum imx678_type type;
>         const u32 *codes;
> @@ -703,6 +744,26 @@ static const struct imx678_model_info imx678_autodet=
ect_info =3D {
>         .auto_detect_mono =3D &imx678_aamr_info,
>  };
> =20
> +static const struct imx678_model_info imx662_aaqr_info =3D {
> +       .type =3D IMX678_COLOR,
> +       .codes =3D codes_bayer,
> +       .num_codes =3D ARRAY_SIZE(codes_bayer),
> +       .variant =3D &imx662_variant_def,
> +};
> +
> +static const struct imx678_model_info imx662_aamr_info =3D {
> +       .type =3D IMX678_MONOCHROME,
> +       .codes =3D codes_monochrome,
> +       .num_codes =3D ARRAY_SIZE(codes_monochrome),
> +       .variant =3D &imx662_variant_def,
> +};
> +
> +static const struct imx678_model_info imx662_autodetect_info =3D {
> +       .variant =3D &imx662_variant_def,
> +       .auto_detect_colour =3D &imx662_aaqr_info,
> +       .auto_detect_mono =3D &imx662_aamr_info,
> +};
> +
>  static const char * const imx678_supply_name[] =3D {
>         "avdd",  /* Analog (3.3V) supply */
>         "dvdd",  /* Digital Core (1.1V) supply */
> @@ -1470,8 +1531,11 @@ static const struct dev_pm_ops imx678_pm_ops =3D {
>  static const struct of_device_id imx678_of_match[] =3D {
>         { .compatible =3D "sony,imx678-aamr", .data =3D &imx678_aamr_info=
 },
>         { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_info=
 },
> +       { .compatible =3D "sony,imx662-aamr", .data =3D &imx662_aamr_info=
 },
> +       { .compatible =3D "sony,imx662-aaqr", .data =3D &imx662_aaqr_info=
 },
>         /* for non-conforming DTs that rely on runtime check */
>         { .compatible =3D "sony,imx678", .data =3D &imx678_autodetect_inf=
o },
> +       { .compatible =3D "sony,imx662", .data =3D &imx662_autodetect_inf=
o },
>         { /* sentinel */ }
>  };
> =20
>=20
> --=20
> 2.34.1
>
