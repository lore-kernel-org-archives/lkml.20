Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDD38333C;
	Thu,  3 Sep 2026 04:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409365; cv=none; b=gdMIQCw6ir9HNrAJayI7jyVrkdNzQWUotbtR4PvkI2FO+mtMHcj4no7WwcJIScCSQL+rFuCkjf7TsAhkKJZlrVJMNoFYsS0zzoNOatLhFzPoHd/5I9RAgJQNovI9ZGR9MzeEeX5UPLgeQr0BwlCoVqeLzVu43det4tqmmX3Bjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409365; c=relaxed/simple;
	bh=7pPHRzU9AlAEEdF31xKg2MmbZLVSjyad4hEzZ2v4opA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rrsm1hBIxRtJiPV7QXIKRmfdgrQpzELiXfQIGrFpaGhQle7U+hadeReSuwTTrtq5CKP4vLdpwzJ995f05WiIXmVFi25Snm4+mj58x8jDKZjzBU8ZeKndbcwCoaUK20wplLBqlMD3YxvXiRoLhKLKv/+UUnQvXVtMW+Ov3aUQkEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WT8vsQBc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WT8vsQBc"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BF52874;
	Thu,  3 Sep 2026 06:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788409267;
	bh=7pPHRzU9AlAEEdF31xKg2MmbZLVSjyad4hEzZ2v4opA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WT8vsQBcjj8lGsiu+cO2Vmqe1sUMkET+B0TeOs09cNv8KJuEe2+5kafzPAhExfd2l
	 zNIgXRAKDjFrkafjca3SGQYGgyuKlkSzafHobwUEZyYzdFKoBQnzee8J32wWHu7fEz
	 3iijZKrM0M4ydXMKbJACDa8SP7Vt2aByuGRiHib0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260805-media-starvis2-v1-4-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <20260805-media-starvis2-v1-4-91e8e4eae44f@raspberrypi.com>
Subject: Re: [PATCH RFC 4/4] media: i2c: imx678: Add imx675 support to the driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 03 Sep 2026 09:52:34 +0530
Message-ID: <178840935437.11722.581815298725172345@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,

Quoting Dave Stevenson (2026-08-05 21:39:19)
> The IMX675 is a 5MPix Starvis2 sensor that follows the same
> programming pattern as IMX678 and IMX662, so add it into the
> driver.
>=20
> FIXME: Validate common_regs against Sony documentation.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx678.c | 222 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 222 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> index 9083f2744510..4b82823c260e 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/imx678.c
> @@ -714,6 +714,205 @@ const struct imx678_variant imx662_variant_def =3D {
>         .hmax_min =3D imx662_min_hmax_4lane,
>  };
> =20
> +static const struct cci_reg_sequence imx675_common_regs[] =3D {
> +       { CCI_REG8(0x301B), 0x00 },

nit: Maybe run a quick grep to turn the hex values to lower case like rest
     of the driver?

> +       { CCI_REG8(0x301C), 0x00 },
> +       { CCI_REG8(0x301E), 0x01 },
> +
> +       { CCI_REG8(0x3060), 0x95 },
> +       { CCI_REG8(0x3061), 0x00 },
> +       { CCI_REG8(0x3062), 0x00 },
> +       { CCI_REG8(0x3064), 0x56 },
> +       { CCI_REG8(0x3065), 0x00 },
> +       { CCI_REG8(0x3066), 0x00 },
> +
> +       { CCI_REG8(0x3072), 0x00 },
> +       { CCI_REG8(0x3073), 0x00 },
> +       { CCI_REG8(0x3074), 0x00 },
> +       { CCI_REG8(0x3075), 0x00 },
> +       { CCI_REG8(0x3081), 0x00 },
> +       { CCI_REG8(0x30A4), 0xAA },
> +       { CCI_REG8(0x30A6), 0x0F },
> +       { CCI_REG8(0x30CC), 0x00 },
> +       { CCI_REG8(0x30CD), 0x00 },
> +       { CCI_REG8(0x30CE), 0x02 },
> +       { CCI_REG8(0x3400), 0x01 },
> +
> +       { CCI_REG8(0x3400), 0x01 },
> +       { CCI_REG8(0x3460), 0x22 },
> +       { CCI_REG8(0x3492), 0x08 },
> +       { CCI_REG8(0x3B1D), 0x17 },
> +       { CCI_REG8(0x3B44), 0x3F },
> +       { CCI_REG8(0x3B60), 0x03 },
> +       { CCI_REG8(0x3C03), 0x04 },
> +       { CCI_REG8(0x3C04), 0x04 },
> +       { CCI_REG8(0x3C0A), 0x00 },
> +       { CCI_REG8(0x3C0B), 0x00 },
> +       { CCI_REG8(0x3C0C), 0x00 },
> +       { CCI_REG8(0x3C0D), 0x00 },
> +       { CCI_REG8(0x3C0E), 0x00 },
> +       { CCI_REG8(0x3C0F), 0x00 },
> +       { CCI_REG8(0x3C30), 0x73 },
> +       { CCI_REG8(0x3C3C), 0x20 },
> +       { CCI_REG8(0x3C7C), 0xB9 },
> +       { CCI_REG8(0x3C7D), 0x01 },
> +       { CCI_REG8(0x3C7E), 0xB7 },
> +       { CCI_REG8(0x3C7F), 0x01 },
> +       { CCI_REG8(0x3CB0), 0x00 },
> +       { CCI_REG8(0x3CB2), 0xFF },
> +       { CCI_REG8(0x3CB3), 0x03 },
> +       { CCI_REG8(0x3CB4), 0xFF },
> +       { CCI_REG8(0x3CB5), 0x03 },
> +       { CCI_REG8(0x3CBA), 0xFF },
> +       { CCI_REG8(0x3CBB), 0x03 },
> +       { CCI_REG8(0x3CC0), 0xFF },
> +       { CCI_REG8(0x3CC1), 0x03 },
> +       { CCI_REG8(0x3CC2), 0x00 },
> +       { CCI_REG8(0x3CC6), 0xFF },
> +       { CCI_REG8(0x3CC7), 0x03 },
> +       { CCI_REG8(0x3CC8), 0xFF },
> +       { CCI_REG8(0x3CC9), 0x03 },
> +       { CCI_REG8(0x3E00), 0x1E },
> +       { CCI_REG8(0x3E02), 0x04 },
> +       { CCI_REG8(0x3E03), 0x00 },
> +       { CCI_REG8(0x3E20), 0x04 },
> +       { CCI_REG8(0x3E21), 0x00 },
> +       { CCI_REG8(0x3E22), 0x1E },
> +       { CCI_REG8(0x3E24), 0xBA },
> +       { CCI_REG8(0x3E72), 0x85 },
> +       { CCI_REG8(0x3E76), 0x0C },
> +
> +       { CCI_REG8(0x3E77), 0x01 },
> +       { CCI_REG8(0x3E7A), 0x85 },
> +       { CCI_REG8(0x3E7E), 0x1F },
> +       { CCI_REG8(0x3E82), 0xA6 },
> +       { CCI_REG8(0x3E86), 0x2D },
> +       { CCI_REG8(0x3EE2), 0x33 },
> +       { CCI_REG8(0x3EE3), 0x03 },
> +       { CCI_REG8(0x4490), 0x07 },
> +       { CCI_REG8(0x4494), 0x19 },
> +       { CCI_REG8(0x4495), 0x00 },
> +       { CCI_REG8(0x4496), 0xBB },
> +       { CCI_REG8(0x4497), 0x00 },
> +       { CCI_REG8(0x4498), 0x55 },
> +       { CCI_REG8(0x449A), 0x50 },
> +       { CCI_REG8(0x449C), 0x50 },
> +       { CCI_REG8(0x449E), 0x50 },
> +       { CCI_REG8(0x44A0), 0x3C },
> +       { CCI_REG8(0x44A2), 0x19 },
> +       { CCI_REG8(0x44A4), 0x19 },
> +       { CCI_REG8(0x44A6), 0x19 },
> +       { CCI_REG8(0x44A8), 0x4B },
> +       { CCI_REG8(0x44AA), 0x4B },
> +       { CCI_REG8(0x44AC), 0x4B },
> +       { CCI_REG8(0x44AE), 0x4B },
> +       { CCI_REG8(0x44B0), 0x3C },
> +       { CCI_REG8(0x44B2), 0x19 },
> +       { CCI_REG8(0x44B4), 0x19 },
> +       { CCI_REG8(0x44B6), 0x19 },
> +       { CCI_REG8(0x44B8), 0x4B },
> +       { CCI_REG8(0x44BA), 0x4B },
> +       { CCI_REG8(0x44BC), 0x4B },
> +       { CCI_REG8(0x44BE), 0x4B },
> +       { CCI_REG8(0x44C0), 0x3C },
> +       { CCI_REG8(0x44C2), 0x19 },
> +       { CCI_REG8(0x44C4), 0x19 },
> +       { CCI_REG8(0x44C6), 0x19 },
> +       { CCI_REG8(0x44C8), 0xF0 },
> +       { CCI_REG8(0x44CA), 0xEB },
> +       { CCI_REG8(0x44CC), 0xEB },
> +       { CCI_REG8(0x44CE), 0xE6 },
> +       { CCI_REG8(0x44D0), 0xE6 },
> +       { CCI_REG8(0x44D2), 0xBB },
> +
> +       { CCI_REG8(0x44D4), 0xBB },
> +       { CCI_REG8(0x44D6), 0xBB },
> +       { CCI_REG8(0x44D8), 0xE6 },
> +       { CCI_REG8(0x44DA), 0xE6 },
> +       { CCI_REG8(0x44DC), 0xE6 },
> +       { CCI_REG8(0x44DE), 0xE6 },
> +       { CCI_REG8(0x44E0), 0xE6 },
> +       { CCI_REG8(0x44E2), 0xBB },
> +       { CCI_REG8(0x44E4), 0xBB },
> +       { CCI_REG8(0x44E6), 0xBB },
> +       { CCI_REG8(0x44E8), 0xE6 },
> +       { CCI_REG8(0x44EA), 0xE6 },
> +       { CCI_REG8(0x44EC), 0xE6 },
> +       { CCI_REG8(0x44EE), 0xE6 },
> +       { CCI_REG8(0x44F0), 0xE6 },
> +       { CCI_REG8(0x44F2), 0xBB },
> +       { CCI_REG8(0x44F4), 0xBB },
> +       { CCI_REG8(0x44F6), 0xBB },
> +       { CCI_REG8(0x4538), 0x15 },
> +       { CCI_REG8(0x4539), 0x15 },
> +       { CCI_REG8(0x453A), 0x15 },
> +       { CCI_REG8(0x4544), 0x15 },
> +       { CCI_REG8(0x4545), 0x15 },
> +       { CCI_REG8(0x4546), 0x15 },
> +       { CCI_REG8(0x4550), 0x11 },
> +       { CCI_REG8(0x4551), 0x11 },
> +       { CCI_REG8(0x4552), 0x11 },
> +       { CCI_REG8(0x4553), 0x11 },
> +       { CCI_REG8(0x4554), 0x11 },
> +       { CCI_REG8(0x4555), 0x11 },
> +       { CCI_REG8(0x4556), 0x11 },
> +       { CCI_REG8(0x4557), 0x11 },
> +       { CCI_REG8(0x4558), 0x11 },
> +       { CCI_REG8(0x455C), 0x11 },
> +       { CCI_REG8(0x455D), 0x11 },
> +       { CCI_REG8(0x455E), 0x11 },
> +       { CCI_REG8(0x455F), 0x11 },
> +       { CCI_REG8(0x4560), 0x11 },
> +       { CCI_REG8(0x4561), 0x11 },
> +       { CCI_REG8(0x4562), 0x11 },
> +       { CCI_REG8(0x4563), 0x11 },
> +       { CCI_REG8(0x4564), 0x11 },
> +
> +       { CCI_REG8(0x4569), 0x01 },
> +       { CCI_REG8(0x456A), 0x01 },
> +       { CCI_REG8(0x456B), 0x06 },
> +       { CCI_REG8(0x456C), 0x06 },
> +       { CCI_REG8(0x456D), 0x06 },
> +       { CCI_REG8(0x456E), 0x06 },
> +       { CCI_REG8(0x456F), 0x06 },
> +       { CCI_REG8(0x4570), 0x06 },
> +};
> +
> +static const u16 imx675_min_hmax_4lane[] =3D {
> +       [IMX678_LINK_FREQ_297MHZ] =3D 1125,
> +       [IMX678_LINK_FREQ_360MHZ] =3D 1125,
> +       [IMX678_LINK_FREQ_445MHZ] =3D 1125,
> +       [IMX678_LINK_FREQ_594MHZ] =3D 1125 / 2,
> +       [IMX678_LINK_FREQ_720MHZ] =3D 1125 / 2,
> +       [IMX678_LINK_FREQ_891MHZ] =3D 1125 / 2,
> +       [IMX678_LINK_FREQ_1039MHZ] =3D 1125 / 2,
> +       [IMX678_LINK_FREQ_1188MHZ] =3D 1125 / 2,
> +};
> +
> +const struct imx678_variant imx675_variant_def =3D {
> +       .name =3D "imx675",
> +       .id_reg =3D IMX678_REG_MODULE_ID,
> +       .id_value =3D 0x296,
> +       .native_area =3D {
> +               .top =3D 0,
> +               .left =3D 0,
> +               .width =3D 2609,
> +               .height =3D 1984,
> +       },
> +       .active_area =3D {
> +               .top =3D 0,
> +               .left =3D 0,
> +               .width =3D 2608,
> +               .height =3D 1984,
> +       },
> +       .pixel_rate =3D 594000000,
> +       .pix_per_clk =3D 8,
> +       .common_regs =3D imx675_common_regs,
> +       .num_common_regs =3D ARRAY_SIZE(imx675_common_regs),
> +       .vmax_default =3D 1984 + 40,

Same doubt for the VBLANK =3D 40 here as IMX662, although I don't have a
datasheet for IMX675.

Thanks,
    Jai

> +       .hmax_min =3D imx675_min_hmax_4lane,
> +};
> +
>  struct imx678_model_info {
>         enum imx678_type type;
>         const u32 *codes;
> @@ -764,6 +963,26 @@ static const struct imx678_model_info imx662_autodet=
ect_info =3D {
>         .auto_detect_mono =3D &imx662_aamr_info,
>  };
> =20
> +static const struct imx678_model_info imx675_aaqr_info =3D {
> +       .type =3D IMX678_COLOR,
> +       .codes =3D codes_bayer,
> +       .num_codes =3D ARRAY_SIZE(codes_bayer),
> +       .variant =3D &imx675_variant_def,
> +};
> +
> +static const struct imx678_model_info imx675_aamr_info =3D {
> +       .type =3D IMX678_MONOCHROME,
> +       .codes =3D codes_monochrome,
> +       .num_codes =3D ARRAY_SIZE(codes_monochrome),
> +       .variant =3D &imx675_variant_def,
> +};
> +
> +static const struct imx678_model_info imx675_autodetect_info =3D {
> +       .variant =3D &imx675_variant_def,
> +       .auto_detect_colour =3D &imx675_aaqr_info,
> +       .auto_detect_mono =3D &imx675_aamr_info,
> +};
> +
>  static const char * const imx678_supply_name[] =3D {
>         "avdd",  /* Analog (3.3V) supply */
>         "dvdd",  /* Digital Core (1.1V) supply */
> @@ -1533,9 +1752,12 @@ static const struct of_device_id imx678_of_match[]=
 =3D {
>         { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_info=
 },
>         { .compatible =3D "sony,imx662-aamr", .data =3D &imx662_aamr_info=
 },
>         { .compatible =3D "sony,imx662-aaqr", .data =3D &imx662_aaqr_info=
 },
> +       { .compatible =3D "sony,imx675-aamr", .data =3D &imx675_aamr_info=
 },
> +       { .compatible =3D "sony,imx675-aaqr", .data =3D &imx675_aaqr_info=
 },
>         /* for non-conforming DTs that rely on runtime check */
>         { .compatible =3D "sony,imx678", .data =3D &imx678_autodetect_inf=
o },
>         { .compatible =3D "sony,imx662", .data =3D &imx662_autodetect_inf=
o },
> +       { .compatible =3D "sony,imx675", .data =3D &imx675_autodetect_inf=
o },
>         { /* sentinel */ }
>  };
> =20
>=20
> --=20
> 2.34.1
>
