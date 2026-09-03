Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB936212F;
	Thu,  3 Sep 2026 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408980; cv=none; b=cYkWy9oTB722Cz1Uw7zt6GGy7hQQ9bteGulti/h3q8tIfPU8Q97AhyAxRws6LZmhFr83y078UpzgEbxVVrSlsPkrDcUul35yxPHM3jLJ1bI36Kiy2CkDt1WhgeCs+qHZKv0y/Ab2nwCLxKxHUBLXOPwKwjnOfTHHW+S+D1bqhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408980; c=relaxed/simple;
	bh=AWiFyqLG1pCeDcfyAAXRbaNHVvyoo9xJL/fV5CCR8tQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k9yoNtLlJ/90SXeO23O7Ny8KBNwUdrUeZLEZx5g8MoxioV+h9GTmpu+61+KXvs3OSK0DsI6pLzON/GlKqiGqaikBEq/QqPO/T9DgvsEKQFfpcuxIHTU/dR9wNxroS/kW7fzUy1EPatvQtfcdTOOO6tGjubfdVN3MR2YU9+2OtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iowYt4bv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iowYt4bv"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0302874;
	Thu,  3 Sep 2026 06:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788408885;
	bh=AWiFyqLG1pCeDcfyAAXRbaNHVvyoo9xJL/fV5CCR8tQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iowYt4bvT2nnTad3SK3LjNuVQXtAw7qAdkKBeqwwPrB0lBSolYpp9HW9LAN+pE7zW
	 x4vYJi4b31zqMMf4FToqCQhmF7Jw9YFV+CPvJrkkwsonf7tNbnY8OCtuw/x0Gz7QuM
	 JPYqFKuoIzl4rbcqMpUd79VMA59pQzML5a85ux/Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260805-media-starvis2-v1-1-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <20260805-media-starvis2-v1-1-91e8e4eae44f@raspberrypi.com>
Subject: Re: [PATCH RFC 1/4] media: i2c: imx678: Always program the sensor in window mode
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 03 Sep 2026 09:46:11 +0530
Message-ID: <178840897161.11722.9464020009331256098@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Dave Stevenson (2026-08-05 21:39:16)
> If the requested region matched the defined active area then
> the driver switched to all-pixel mode. This left the possibilty
> that the activeare was incorrect and not reading out the area
> expected.
>=20
> Switch to always requesting window mode.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx678.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> index 0efbf43d2fe6..f7b988dca2ac 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/imx678.c
> @@ -917,9 +917,7 @@ static int imx678_program_window(struct imx678 *imx67=
8,
>         int ret =3D 0;
> =20
>         cci_write(imx678->cci, IMX678_REG_ADDMODE, 0x00, &ret);
> -       cci_write(imx678->cci, IMX678_REG_WINMODE,
> -                 v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x0=
4,
> -                 &ret);
> +       cci_write(imx678->cci, IMX678_REG_WINMODE, 0x04, &ret);
>         cci_write(imx678->cci, IMX678_REG_PIX_HST,
>                   crop->left - imx678_active_area.left, &ret);
>         cci_write(imx678->cci, IMX678_REG_PIX_HWIDTH, crop->width, &ret);
>=20
> --=20
> 2.34.1
>
