Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465754EE863;
	Wed, 14 Oct 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985819; cv=none; b=LHoVugJ/YiPBCJvj1r8y+dIOcIC4ygTR+deimwk0/3r4JtwD66Qzy+IR8nH8AE+G2z3yH79boU9QORXScvcktsevX5FPmzWCCUJ741gxnVUSnEisUsnkWiqXWnRSD78+B72uIZTijHwPc7td2SImp4thmpJHI3CptomACKi1r3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985819; c=relaxed/simple;
	bh=7LpSi1Y4OLvT4MZ5GLQD6sXnyElX/lIpU3Y2dOUY15s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=q+imZf6CHVDDnOA+NxOxm2KjePMKR7fnVT6ACLeWGT7iuzNyYm3eNS+WixAlquGRmSk41Zto5Pe1XHtwD77zvgBIPwQLAYqO+Yi2mlBTr7Gy/RQXm27gxCy8H01iJVEJ/6LvnI1xwHk7MQF7ZwqNVdxtPD4Q2o6oDe0rfZbdmI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uy3Jf7qU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uy3Jf7qU"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:46f5:32b8:ff94:7599:1aae])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41E9CBC;
	Wed, 14 Oct 2026 15:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791985691;
	bh=7LpSi1Y4OLvT4MZ5GLQD6sXnyElX/lIpU3Y2dOUY15s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Uy3Jf7qUYJoeBtbZ9HG8q/Svhg/VHU7L+2E+3uAXkFPzCXpoLGSPTpDnH5csnCRV4
	 BBTYtRz2rMRZLBD3OkqqEe97QC/Bgrwf7ZcqL0h4vfELoXpZTyTks8nmmYCJEg4lZT
	 qEmOx6L+tGFSZGKwnO0bEtqJjdMe8mvHilECxRO4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com> <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com>
Subject: Re: [PATCH v2 13/13] media: sony-starvis2: Add support for IMX585
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 14 Oct 2026 19:20:08 +0530
Message-ID: <179198580881.2512054.3955199510169892039@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925

Hi Dave,

Thank you for the series.

Quoting Dave Stevenson (2026-10-13 20:47:12)
> IMX585 is an 8MPix Starvis 2 sensor, so add support for it.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/sony-starvis2.c | 302 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 302 insertions(+)
>=20
> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 1ce2b86c57ac..c9a3dd4fe529 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
[...]
> +const struct starvis2_variant imx585_variant_def =3D {
> +	.name =3D "imx585",
> +	.id_reg =3D CCI_REG16_LE(0x5a1d),
> +	.id_mask =3D 0x3ff,
> +	.id_value =3D 0x259,
> +	.active_area =3D {
> +		.top =3D 0,
> +		.left =3D 0,
> +		.width =3D 3857,
> +		.height =3D 2201,
> +	},

s/.active_area/.native_area

Apologies for the drive-by comment, I just spotted this and thought it
might result in a painful debug session.

I'll do a proper review for the series, hopefully within this week :-)

Thanks,
Jai

> +	.active_area =3D {
> +		.top =3D 20,
> +		.left =3D 0,
> +		.width =3D 3856,
> +		.height =3D 2180,
> +	},
> +	.pixel_rate =3D 594000000,
> +	.pix_per_clk =3D 8,
> +	.common_regs =3D imx585_common_regs,
> +	.num_common_regs =3D ARRAY_SIZE(imx585_common_regs),
> +	.vmax_default =3D 2250,
> +	.hmax_min_link_freq =3D imx585_min_hmax_2lane,
> +	.hmax_min_pixel_array =3D 550,
> +};
> +

[...]
