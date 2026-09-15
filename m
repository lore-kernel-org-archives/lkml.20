Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491026C385;
	Tue, 15 Sep 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496296; cv=none; b=gbKJsMDR40E2NZNiS5NRnPq5umCD3mkHgmA+HiucYvqY3MDrsmikOAfaD29FN8r3SiA7J0y2rsKTEp7IiZlXWdSGfQllvwm4r3DSCH/3gbNnQXOCDzVH+Dz7xtdmmUZ93WFoDIhrDceIT9mB7t1DEAEYJXYQjwWIR9pXg0+CXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496296; c=relaxed/simple;
	bh=2qBotJ+rMzzqNdrNTauHANJF0WwFpla8lcd8TzjB/7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLhPBNMV5mtCBmGf4lOuM+B3tqVK3ZMDn9HVwvbt+igH8hkG5GbH0uEPleGgRmETnQsy9rQ0tPy4LPTLsLPpRBpdRgqwst4gAr6Sc58p0foPPQF8EkxB1K0s8lV1Kbxgg+C71GjFi/Uz/o7WzIbf1lPI+WVIl5xP96A21cH61Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6QGL+fx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6QGL+fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4471F000FF;
	Tue, 15 Sep 2026 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496294;
	bh=BpClQT0zCeCXtjisazYcuc12ibPIv46iStzvnhCCz7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6QGL+fxIBdSLfi18x9otVp2GlzWnoj34tAVhQ5OHS6udBG+ash4zn8gW5a9T2y9c
	 NXoXQ6rkAdp0t5AeVfylCNja2r9poCjwdPsRQJMAbTfS3Ftc8yh8gLnGt3zzfpCIwC
	 WUwmRMml4frM2vQMukd0oqD/ftVwwrlOo61AtTwUhqavtsf6zdQjTGQbxfioZT0H0U
	 pgu0AfFwblooaBqCuxOb30iz1PrDv5NHWaKqLtlM1t0lriJzrFm6AtVtoogDdg3jhN
	 AtokW5Dlt/+tI8AktDCea7jz0yljDw6jM0oFKOvelikMc1DgPfK3/ibD03Res7m2W7
	 v8W1fzLozIE3g==
Date: Tue, 15 Sep 2026 19:18:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: fix phy unregister in remove()
Message-ID: <20260915-dragonfly-turret-edc08c3d9244@spud>
References: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omVCae4kjxR9wWO+"
Content-Disposition: inline
In-Reply-To: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>

--omVCae4kjxR9wWO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 07:09:13PM +0800, Felix Gu wrote:
> mpfs_remove() passed the glue platform device instead of the
> registered generic PHY to usb_phy_generic_unregister(). This
> unregistered the glue device from within its own remove
> callback and leaked glue->phy.
>=20
> Pass glue->phy instead.
>=20
> Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb con=
troller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/usb/musb/mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 587127abd30a..6cc2909b8ae3 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
> =20
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
> -	usb_phy_generic_unregister(pdev);
> +	usb_phy_generic_unregister(glue->phy);
>  }
> =20
>  #ifdef CONFIG_OF
>=20
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-mpfs-086b7d22f8e5
>=20
> Best regards,
> -- =20
> Felix Gu <ustc.gu@gmail.com>
>=20

--omVCae4kjxR9wWO+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmL4gAKCRB4tDGHoIJi
0uV9AP96ayAyrTG/Lj+N9KOKFiwtwjRumNI9HBvLYBmXJRfa/AEAttLq9LKtHoE2
xrvnORw6kw9TqE6ShAhLMwXnjUhpWQw=
=EbnR
-----END PGP SIGNATURE-----

--omVCae4kjxR9wWO+--
