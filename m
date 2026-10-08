Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2B30F927
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465287; cv=none; b=dV9JLtuasuAbkBNo/eSYP6v+9fl7VeKjMGA46WmlrUwZmMMp3WOxKLDdKi95fIEPtr343HJ+fuev10kubXVxBDQ+kXKZuscRdSIEGFXZaXzxDk8K3fJ2sntNvR9XuMjuQKBiitJPz+p+U1gaZsm0gPk8XOjldI6RFZ1i+QwSyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465287; c=relaxed/simple;
	bh=UcDM/7mEbCX0CZ6Wsp3V2npZB89NTnwI/IqneE0GPPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTdcwxRL/06m+9La6eK3klZS8+rEkrySiOiGy7nnW8jg6xDGmVuuj5fFM2Ew5wcAM3w9zfieDgpLDdN/vlTjT7N/eoWbfDnSVRGUp3LVhOmzg/GhbuhWeVGkG9ciTS4kUQ4SL0/CWbkjjaeCqPutaE/2uyBkS4ZtypuZw+7QOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G83LgMta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G83LgMta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A167D1F000FF;
	Thu,  8 Oct 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465286;
	bh=N2acWtY1ipUiffzzGDX0s1gIQ1N+3h0sjovbkkO1ybc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G83LgMta8QKBoXDi2N2Qw1Zi4vSf9wF2eZmRkJ2KXgf5Dujm2M147rBcetHcNjKAI
	 LFmnxvDAUHlx2lGQRpzYdf0XMD4/aBlkZIf/1QR3dq/hKyKWrz/8sSievLYusidGN3
	 a88fUTV6TCtf6XHhv1d+dVkAJllQajhpvIr85X6W4hl+CkFJtRtfaEidDbGQ70ycUT
	 zlEiz4ucI4FpNHtP6MoPbzIk9/0YHIy7IFbeHZIy+uD5WEgm+5lIN9DNEq6uGpto+F
	 /qTUfEmMFaIDFzgLoIgwNz3ovYaiiYx8aCYE4pXBjwZlJeqEeNU0htXsrm5LIGPzdq
	 tMVDbmDzu6iwQ==
Date: Thu, 8 Oct 2026 14:14:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
Message-ID: <20261008-590aec0ad34ba6c65b269ed3@squawk>
References: <20261007121743.192486-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="25uemib8zQO6l1ld"
Content-Disposition: inline
In-Reply-To: <20261007121743.192486-1-lgs201920130244@gmail.com>

--25uemib8zQO6l1ld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 08:17:43PM +0800, Guangshuo Li wrote:
> After kref_init(), the device_get_match_data() failure path frees the
> mailbox channel and sys_controller directly, bypassing the matching
> kref_put() for the initial reference.
>=20
> Use mpfs_sys_controller_put() on this path so that the initial
> reference established by kref_init() is released through the existing
> kref release callback.
>=20
> Rename the error label to reflect that cleanup is now performed
> through the kref helper.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource l=
eak on probe error")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Add the missing Signed-off-by tag.
>   - Rename out_free_channel to out_put as suggested by Felix.

Applied, thanks.

Cheers,
Conor.

>=20
>  drivers/soc/microchip/mpfs-sys-controller.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 0400a01b2338..ef27e1083f0f 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -159,7 +159,7 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
>  	of_data =3D (struct mpfs_syscon_config *) device_get_match_data(dev);
>  	if (!of_data) {
>  		ret =3D dev_err_probe(dev, -EINVAL, "Error getting match data\n");
> -		goto out_free_channel;
> +		goto out_put;
>  	}
> =20
>  	for (i =3D 0; i < of_data->nb_subdevs; i++) {
> @@ -173,8 +173,9 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
> =20
>  	return 0;
> =20
> -out_free_channel:
> -	mbox_free_channel(sys_controller->chan);
> +out_put:
> +	mpfs_sys_controller_put(sys_controller);
> +	return ret;
>  out_free:
>  	kfree(sys_controller);
>  	return ret;
> --=20
> 2.43.0
>=20

--25uemib8zQO6l1ld
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaseXOAAKCRB4tDGHoIJi
0mglAP9LFL+rx75JJZVcGF22GeaKs1JrUq0n7zmtswOTmVuBzQD/QJxwNqQuFgfU
G5Sf9nL2WAzwJajDzPZdbPQJ6p0nSgE=
=oelW
-----END PGP SIGNATURE-----

--25uemib8zQO6l1ld--
