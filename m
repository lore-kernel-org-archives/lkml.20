Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602811;
	b=aAhSDkVAlK4fJ3ToDzbEI2EefnvLDBIZ1zkmCgQSI0jCKQOVmN2C8OP9x9mUYt+6OG1h
	 w1o5I16HQOcu96Y8vR3xtE75DGj2h/1szVgYgHdP+64+rkZVWgEoV32g+marTJaYBtNfR
	 mSDCpkPy+rfl8uk6MsG4UsGDzT9jI9/itonEEkfyAm2IAzHJZ707XIivHrIOQd1bzelgB
	 6i9c/2AgJhswFdzSSM2xOIGQGHq5XdJ58TI8u70X0h19nXlvAW560o8WRZjvutedQ4W8v
	 tX9zPC3TzT/q+NbLQTDC0BqYIiPAxB6YH1ODdYX+bAv+88TQPlW+3eMX5xfFBtEj0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602811;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9wwSfEnRlvirTT8NfoK/jEoyhBc9DNr8DgJsy59lbvQ=;
	b=xYr+IRk9qcW/T1Q6UjgDvnGeDIK+JrI4wNej1VhuNK+7OwzYLWhSFTRJzUqKu2QhjHKy
	 0tFVntynhLF6DmC8+3uFDFI3wHEWh9tau7U94KQmIuPYGr80Fgg8Z7p2MjEcPLNbkMiPk
	 PVTRN1thsbRuuEX7Q2V1S5Pp6RjhBgjnDUr7nrnaT+vLoY9IVuKzilr5Vpm+qrxXjdtLR
	 SUZvE1aeqsELwldUtriLjrAods3smMhfzxtaXfFF39rySt0YZkMLMeYYRR5nB+Ke3mQnD
	 S2X90snXWbWsbMx2lAMuvLJQWBgrpRiMMFBiVc5eY+/8s2/SKuhZdgR14RUHqplU08w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eS7BoYnK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A745860A260D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eS7BoYnK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825B11F000C4;
	Wed, 21 Oct 2026 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792602810;
	bh=9wwSfEnRlvirTT8NfoK/jEoyhBc9DNr8DgJsy59lbvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eS7BoYnKTK4fKVGt9OFJ4DszXZVKVCXm9Zi9nQrKsZsM9bsO7sJgpQMP7H5vPuSue
	 6prIPGbDK8PcaZPNaAeCREJwiYmguMSEaTX/HVcISfVgq25n/f1VXfzM+9CZwKM6Ks
	 26cRu+wuRrWhnixjxc90k95nTxh55hCIGfsOnBTBKG2am2ZpQUmJkOtlNDx7ulGCnY
	 dmJAXhr6YmjAtIvnM13eYNLpMAflDteXgTI0vTHmQwEdXCUfzLWc3e0+3kFYbalBJ2
	 slh+agrwEY8apMfOzK6KFVYaD+zbEfVlndjdje8Mi708jn54ntGe7OK2w/+tQN98+W
	 7varzW57ngjaA==
Date: Wed, 21 Oct 2026 18:13:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Message-ID: <20261021-negation-carol-e42b4ecf3726@spud>
References: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZToIJWlRJsLcJejp"
Content-Disposition: inline
In-Reply-To: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>

--ZToIJWlRJsLcJejp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 06:39:06PM +0530, Pinkesh Vaghela wrote:
> The composable cache resets with only way 0 enabled, while the remaining
> ways are available as Loosely Integrated Memory (LIM). Systems that do
> not reserve LIM therefore use only one cache way unless software
> increases WayEnable.

This is not true in the general case, firmware may intercede to set the
ways as it pleases.

> When no memory-region property is present, DT describes no LIM
> reservation for the cache controller. Validate the reported way count,
> then enable all cache ways so Linux can use the full cache capacity.
>=20
> When memory-region is present, leave WayEnable unchanged because enabled
> ways cannot be returned to LIM until reset. This may leave more ways
> assigned to LIM than required, but avoids consuming reserved LIM.
>=20
> Apply this policy to all compatibles handled by the driver. Firmware or

I know this is going to cause problems for all the microchip boards,
which maybe should have reserved LIM but never did because the LIM was
never put in the devicetree as memory in the first place.
They also don't suffer from the problem you mention because firmware
sets the ways up.

> DT configurations that require LIM must provide memory-region;
> otherwise, Linux will convert all disabled ways to cache.

I don't like this behavioural change, it's never been mandatory to have
a reserved memory region for the LIM. I'm only in favour of doing this
on devices where we know it is actually required to be done. The eic7700
I assume is one such device.

Cheers,
Conor.

> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  drivers/cache/sifive_ccache.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d5..17b6ba8ab984 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -117,6 +117,22 @@ static void ccache_config_read(void)
>  	pr_info("Index of the largest way enabled: %u\n", cfg);
>  }
> =20
> +static int ccache_enable_all_ways(void)
> +{
> +	u32 config, ways;
> +
> +	config =3D readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> +	ways =3D FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
> +	if (!ways) {
> +		pr_err("Invalid cache configuration: zero ways\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id sifive_ccache_ids[] =3D {
>  	{ .compatible =3D "eswin,eic7700-l3-cache",
>  	  .data =3D (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
> @@ -319,6 +335,12 @@ static int __init sifive_ccache_init(void)
>  		goto err_unmap;
>  	}
> =20
> +	if (!of_property_present(np, "memory-region")) {
> +		rc =3D ccache_enable_all_ways();
> +		if (rc)
> +			goto err_unmap;
> +	}
> +
>  #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
>  	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
>  		riscv_cbom_block_size =3D SIFIVE_CCACHE_LINE_SIZE;
> --=20
> 2.34.1
>=20

--ZToIJWlRJsLcJejp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatjytgAKCRB4tDGHoIJi
0hNmAQCa1KbxNjXTR8FsqH9aExrhAw2xM78b1aMere9VygXI/wD/YYeGkYy8Tv+o
WandSYWPHQjgl0vBB1PwfhROPffs7go=
=0F8P
-----END PGP SIGNATURE-----

--ZToIJWlRJsLcJejp--
