Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894F4D37A9;
	Fri,  2 Oct 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953179; cv=none; b=Fq1EZh5NAc7bPFBjSacYLz7Nt6Z6csylZHuiJgmQPdjSijZdLuLNg98m/QO4ucUBMRUWCU7yeXxAAhaLVqbY5h5bzIbkY6k1Rub7Zzfz2GoEOzo6XQQ/G9wwEfUYGJuJWs2F5WbHGW5FYvbdqLlrsu7mgpZ45CrsId1NqihKz4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953179; c=relaxed/simple;
	bh=EjJiyWEVzIv+EYVjRWKfSHuh6pXYQN9zKQWzSK4N740=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ok0ADI9xNJ5qKAwj7cFHJ+VLtxm0RSDx/CCzKJBHWmm5+JSPUoRAHawwDXmWuVXuNfQrsSpRbb5SXckwbhMl43L5NTCT36aCkhoyOHMsJX+iaih/+mzef3EQposppKvQJD+PAKEDhufHdC5i/RpNTk8grWndG5UDC/K+KZ8o3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WjkkhHrq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WjkkhHrq"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:25c2:6a77:c271:6ec1:599])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA48177;
	Fri,  2 Oct 2026 16:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790953056;
	bh=EjJiyWEVzIv+EYVjRWKfSHuh6pXYQN9zKQWzSK4N740=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WjkkhHrqJ58yhAoIqmu+sJY8+voBQSXxp0ofSqdKg/Eo6PvisGcPOBZ1fOcnri/xk
	 4vdmPubuMjIFkj9wanci8s7iru2wAphmr7fAoTQphZUPptj8cmN2qHVR3tMhwRmO3X
	 O3TeRjIlnOO96iTiWNyz8lwf2gBN2YM3Dd7XJnh4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>
References: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>
Subject: Re: [PATCH v1] media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 02 Oct 2026 20:29:23 +0530
Message-ID: <179095316356.241161.8061915232187490938@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925

Hi Barnab=C3=A1s,

Quoting Barnab=C3=A1s P=C5=91cze (2026-10-02 17:46:43)
> Firstly, the size values are 10-bit unsigned integers, and there doesn't
> appear to be an upper limit in the hardware documentation, and testing al=
so
> seems to confirm that 1023 works as expected, so the correct mask to use =
is
> 0x3ff (1023), not 0x1ff (511).
>=20
> Secondly, actually use `LSC_SIZE_VALUE()` when populating the size regist=
ers
> instead of using the `LSC_GRAD_VALUE()` macro.
>=20
> Fixes: b39656efb71a ("media: rppx1: lsc: Add support for lens shade corre=
ction")
> Signed-off-by: Barnab=C3=A1s P=C5=91cze <barnabas.pocze+renesas@ideasonbo=
ard.com>

Good catch, thanks for the quick fix.

Reviewed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

Thanks,
Jai

> ---
>  .../platform/dreamchip/rppx1/rppx1_lsc.c      | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers=
/media/platform/dreamchip/rppx1/rppx1_lsc.c
> index 8badeca23e249..ffc52ca23dd99 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> @@ -57,7 +57,7 @@
> =20
>  #define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff)=
 << 12))
>  #define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
> -#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
> +#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x3ff) | (((v2) & 0x3ff) << 16))
> =20
>  static int rppx1_lsc_probe(struct rpp_module *mod)
>  {
> @@ -157,24 +157,24 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
>  	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]=
));
> =20
>  	v =3D cfg->x_sect_size;
> -	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> -	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> -	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> -	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> -	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> -	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]=
));
> -	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]=
));
> -	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]=
));
> +	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]=
));
> +	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]=
));
> +	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]=
));
> =20
>  	v =3D cfg->y_sect_size;
> -	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> -	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> -	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> -	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> -	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> -	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]=
));
> -	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]=
));
> -	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]=
));
> +	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]=
));
> +	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]=
));
> +	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]=
));
> =20
>  	/* Enable module. */
>  	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
> --=20
> 2.56.0
>
