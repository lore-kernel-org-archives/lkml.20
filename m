Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2FE4BA1D3;
	Tue, 15 Sep 2026 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496485; cv=none; b=I/neRJkC7Ykna54ytJLuV21bn+WJs5WRdQ1pEj4vWD1AjUHfTUVC7ZB8Bm/3/4wZ4srq4HkhpT76OVMhAeuMZJ/UyobpC/PNQIjaz/IhxSA098JRMDIesUtO6GFeN+K6+sbgrP+Kl0NuLr+LdvDrzj2sddMs/VQHwz0ZuGiMWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496485; c=relaxed/simple;
	bh=MSEBe353yddrun0sk2dfUzDn2ONeQxR9Qa4YEDZodWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAe5hWEgAjdhPJlLRUEKEyeDOzYTjSG2/P+o4C7OGWFgDsj36oVzoDHabcRz8lyTExwcU7NfVlVFlDokpAKbP7mAjzjv2RFd83VqrQH7QY+C1tW0Qc2Y47y8n72Bp+pvGhTj5f9acndii4MSDyywCfeylvTgmQ4Hzh2N+6F07TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRUM0upy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRUM0upy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6731F00898;
	Tue, 15 Sep 2026 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496483;
	bh=5il9R4JOsn7FaDJyBMY4GcTMOrQeZX8j32v8URz75co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRUM0upyVeTDLrIxIfb+zSspTsacf7tMtXta7MXM71z1Lz5coPIx3hHLwYmKRiGpO
	 tFgBQTS9tRulkQCqpbGRdOiYWdeqQOP9neuzDc4QvzBlR0tFptm5wZf3pTTyvr1toL
	 6ayUdRR4fS52WCfPv5J0iq5jdOmsRozAg91/kqT/hZTiMTrfNWXcPV9BSItlbwJfI8
	 wQFrJ3LZfq76w7x8S4UsI6KQrEGMuc3PhGEo4J4xeNoVPk2aQxEtoVu4kSYQhacb6M
	 M76+EaVlYwqNajlxQ6NUTX3Fj2+PR7QAoiXhgUaPou+WjG2xmhhryvGrkUX5elgLvn
	 tXw9/h8rqfeQQ==
Date: Tue, 15 Sep 2026 19:21:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: tidy up error handling in probe()
Message-ID: <20260915-grouped-raffle-16b1fea4ad5f@spud>
References: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eq25msHQ+7NivrH0"
Content-Disposition: inline
In-Reply-To: <20260915-mpfs-1-v1-1-a12c2fd7e0d9@gmail.com>

--eq25msHQ+7NivrH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 01:14:08AM +0800, Felix Gu wrote:
> Restructure the probe error labels so each failure only tears down
> what was already acquired, and stop calling
> usb_phy_generic_unregister() with NULL or an ERR_PTR() on paths
> where the phy was never registered.
>=20
> The old error paths only worked because platform_device_del() and
> platform_device_put() ignore NULL and ERR_PTR() arguments.
>=20
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/usb/musb/mpfs.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 587127abd30a..59625ed95656 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -276,13 +276,13 @@ static int mpfs_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "failed to get clock\n");

Could go a step further if you want, and use devm_clk_get_enabled().

This is clearly the wrong order, so this patch is fine as-is.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  		ret =3D PTR_ERR(clk);
> -		goto err_phy_release;
> +		goto err_pdev_put;
>  	}
> =20
>  	ret =3D clk_prepare_enable(clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to enable clock\n");
> -		goto err_phy_release;
> +		goto err_pdev_put;
>  	}
> =20
>  	musb_pdev->dev.parent =3D dev;
> @@ -324,29 +324,29 @@ static int mpfs_probe(struct platform_device *pdev)
>  	ret =3D platform_device_add_resources(musb_pdev, pdev->resource, pdev->=
num_resources);
>  	if (ret) {
>  		dev_err(dev, "failed to add resources\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	ret =3D platform_device_add_data(musb_pdev, pdata, sizeof(*pdata));
>  	if (ret) {
>  		dev_err(dev, "failed to add platform_data\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	ret =3D platform_device_add(musb_pdev);
>  	if (ret) {
>  		dev_err(dev, "failed to register musb device\n");
> -		goto err_clk_disable;
> +		goto err_phy_release;
>  	}
> =20
>  	dev_info(&pdev->dev, "Registered MPFS MUSB driver\n");
>  	return 0;
> =20
> -err_clk_disable:
> -	clk_disable_unprepare(clk);
> -
>  err_phy_release:
>  	usb_phy_generic_unregister(glue->phy);
> +err_clk_disable:
> +	clk_disable_unprepare(clk);
> +err_pdev_put:
>  	platform_device_put(musb_pdev);
>  	return ret;
>  }
>=20
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-mpfs-1-2e062f29128e
>=20
> Best regards,
> -- =20
> Felix Gu <ustc.gu@gmail.com>
>=20

--eq25msHQ+7NivrH0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmMnwAKCRB4tDGHoIJi
0hFLAQDsHxRSrMWqsLKY7Yw4lxGvSpGV0B6wTWolwZ0oSNcc+gEApRCuuj3hbymQ
p3OwJNqvrDupTGRG2Z6eG1EPVuKq6A0=
=lte0
-----END PGP SIGNATURE-----

--eq25msHQ+7NivrH0--
