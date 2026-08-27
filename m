Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B746AA66;
	Thu, 27 Aug 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837140; cv=none; b=gCffrcw3XxBQv1wUWQAwukpJcQq8RcoDp5mfnAGw5wzMhC4XjxRDCK3rc18g+3cjQ8OkDCfA1tHYpt96vw7TZhUAWP87l4R2W5864oyHVTTrgsaQkz8Or4S5Dk4oAKkck+xcVFI4zXMu2EWNo3vjbkpy2Lf9s4m8YduGP5z6S/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837140; c=relaxed/simple;
	bh=quCsKdcmR5TZphL8Mi/sKHR2lyl8HswLvh/JRH7KYW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyokuY7zIERSeLYS9dy/C2IpBAz5Z3d0bql9QwN+eNyYaNOztPqhIVSRD6ASCo/9eOG6Ma6aQzu5pjs2ohHHaK8Jxuwmdj5CGDB4BGJifyGWhz+EiLXw+G6KCydbiyUoCnAr/1bKej1yjF5n2ZX9wbQvgWTHKZ384xccV37fBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=a8U/6YqB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="a8U/6YqB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=USInVpt9Ng5yFt/QF3hDQ+uXdNq7DFvqcDl6JkdXsLw=; b=a8U/6YqBgfMZDVtk2DGVZgGIxx
	qz0ezVLpB1Hy064h27NZtGFanDcGy26KvecsRzawGY1iJDZ7n2q1e21ZsUX+AVltWshLDX+94/e0N
	N6h2i9HLz65jDCnpjHlGfQ4UewLZFh0jwRoMbdxhtsW2cvPmbj3S1KGjjwWKp/hshnZaGj9sBKhsX
	pz8EXeHnLr5QCR5BGGPnWpG4IJ+aErXNMzmue/6jW6Lga4vt3Mo7U2wTlJalhiGeQnM0tZeyyZnIa
	eELfBsc+JIk6Isp8PWL39OPXEHoCuwFjT+7r3bmWmdyPyN7TPNgxmdz+1j2Eg6OiCd9E6YkebP056
	G7OBIvSQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rudi Heitbaum <rudi@heitbaum.com>
Cc: linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rudi@heitbaum.com
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Date: Thu, 27 Aug 2026 15:25:23 +0200
Message-ID: <5096877.GXAFRqVoOG@phil>
In-Reply-To: <aouw7rH6FZxscUTO@0d3a7a881997>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Rudi,

Am Montag, 24. August 2026, 04:52:02 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rudi Heitbaum:
> The rk1808 is the npu die in an rk3399pro package. It is wired to one
> of the usb3 controllers rather than to an external port, and it needs
> its reference clock running before it will boot, which is exactly what
> this driver exists to do for onboard devices.
>=20
> It takes no supply from the driver: the rails are sequenced elsewhere.
> Only the clock matters here, and that is already optional and handled
> generically.

the "elsewhere" might need a bit more explanation to verify it's the right
implementation. Even if the regulators are always-on or something, we
still want the supplies defined - for future uses.


Thanks
Heiko


> Two ids, because the die changes identity as it boots: 180a while it is
> in maskrom and then in the rockusb loader, 1808 once it is running.
>=20
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboar=
d_usb_dev.h
> index 3523f8f8a149..e07f509ac751 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -134,6 +134,12 @@ static const struct onboard_dev_pdata xmos_xvf3500_d=
ata =3D {
>  	.is_hub =3D false,
>  };
> =20
> +static const struct onboard_dev_pdata rockchip_rk1808_data =3D {
> +	.reset_us =3D 0,
> +	.num_supplies =3D 0,
> +	.is_hub =3D false,
> +};
> +
>  static const struct of_device_id onboard_dev_match[] =3D {
>  	{ .compatible =3D "usb-a-connector", .data =3D &usb_a_conn_data, },
>  	{ .compatible =3D "usb424,2412", .data =3D &microchip_usb424_data, },
> @@ -167,6 +173,8 @@ static const struct of_device_id onboard_dev_match[] =
=3D {
>  	{ .compatible =3D "usb2109,817", .data =3D &vialab_vl817_data, },
>  	{ .compatible =3D "usb2109,2817", .data =3D &vialab_vl817_data, },
>  	{ .compatible =3D "usb20b1,0013", .data =3D &xmos_xvf3500_data, },
> +	{ .compatible =3D "usb2207,1808", .data =3D &rockchip_rk1808_data, },
> +	{ .compatible =3D "usb2207,180a", .data =3D &rockchip_rk1808_data, },
>  	{ .compatible =3D "usb3431,6241", .data =3D &corechips_sl6341_data, },
>  	{ .compatible =3D "usb3431,6341", .data =3D &corechips_sl6341_data, },
>  	{ .compatible =3D "usb5986,1198", .data =3D &bison_intcamera_data, },
>=20




