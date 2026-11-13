Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578015;
	b=JMhRqIQk6uuVR9uvGgQnvAQiM73PudJcSBaWTRHoyS3l9J5pzMeOQpdQ7YTWMTIX2jRI
	 iBL+MJPJuPnDIw19uMwI5uVu/TkWIrWRKRUJxQR+yFor7PbYc9qWXT4jsPdnxK51ZVLW8
	 Ysi+vl3/WgsQdJNSh2qWLQSYti8BaPc4neEbiR0obiNpMYQ3GrEFwpUuwho/b3+1VnvLR
	 jWVRPEGeVqZchPpod85kwKfb/jai8zLiDlnUjzmGu0r4Crq+4eX1DOO0e8ixyoz+30/f/
	 9sGbSOalMGp1Urcd0ETaPq3FERGntQu7yxn6/6pItGdxtNgLzeqW6ypijG/7qkHfdQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578015;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=F+S1OY2DdV1BNoaCvOeQiRudx9V3jy52LLaoOUct0hw=;
	b=PKLjiFyHdPfa3Q8rT6WOXbBpJCa5V9wW3cKTre0vuN13vLkNfAFtYgGQdb1DqlQRP4hP
	 zgUgY71pcUZo5nw5/ICCPCQxGmJAqSyPEJVhRGE7s6z/OyhCZdQlhIvFBXbli7NbcDrgP
	 RWq6Imw1ZqOOjUrsxwm9nyfGl16upGJ4PrI/F9vPewxM6aI26y8OJICdM9FS5WNiNqyIv
	 1ceX/H6gHOMT3kYLs9zm4NZZDJFt5b6sKf6Za/jbZQxf/6WAASqJgj3DZbHwO7BLtWtBt
	 VuuqnoMGd4tKWeyqsgMAiTJeI9+DMK7QbPuoqbS8arHGbMHQBtyWFHda+VE5yUMpd3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ2BZ3MG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91530606A336;
	Fri, 13 Nov 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ2BZ3MG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96DE1F000C4;
	Fri, 13 Nov 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578015;
	bh=F+S1OY2DdV1BNoaCvOeQiRudx9V3jy52LLaoOUct0hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJ2BZ3MGUjHrpJK2WU7o4+s+G1Vt2Y3ele2N7f2wYl9cj2J5BiJa4dMJkE7R9m2+i
	 5fP4GK1XegErUtYmoejk1Z2beYCrpbFjIZ3EtUVilM//iFmgMf6c432nHQkfoOjGbl
	 kGW1rlQv8mNOiNqDBoJ7lotLP+4/AheWVE3ARwYeegbVxUP721CMGTMNMHmlaTsObT
	 sZdKSXNfJWPZ6e8FtjOz2zOqbirBpUBmH4BvyygHEcGQxXgK+QMb+QZDADgdDR9N9C
	 hsTa8ePQNvbfRNPfRYSivlL/IFI7ChHHEU68sPRHiBlu9mp7ESvWaMGTxHx2t1ykOI
	 mqEt74VWGywBw==
Date: Fri, 13 Nov 2026 13:53:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="IzdCK0dvvo63ja0a"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-19-minachou@andestech.com>

--IzdCK0dvvo63ja0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:42PM +0800, Mina Hui-Min Chou wrote:
> The SBI-based IOCP check was added for Renesas RZ/Five (R9A07G043F),
> the only upstream-supported SoC whose AX45MP has no IOCP. It matches
> the AX45MP marchid and the mimpid of the RZ/Five core, but it is built
> into every kernel with ERRATA_ANDES_CMO, so the SBI call is issued even
> when the kernel does not support RZ/Five.
>=20
> Move the match into soc_is_r9a07g043f() and make it also require
> ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> and take the generic Andes cache errata path. No other upstream-
> supported SoC uses this AX45MP mimpid, so their behavior does not
> change.

But a device using this soc that doesn't have a dts in mainline won't
function properly, so this is fragile. Why not just do it properly and
check for RZ/Five specifically?
Can check for of_machine_is_compatible() probably?

>=20
> While at it, rename ax45mp_iocp_sw_workaround() to
> r9a07g043f_iocp_sw_workaround(), as the check is only used for RZ/Five.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/errata/andes/errata.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index 530d2df216e0..f2535a81b1e2 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -25,7 +25,7 @@
> =20
>  #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
> =20
> -static long ax45mp_iocp_sw_workaround(void)
> +static long r9a07g043f_iocp_sw_workaround(void)
>  {
>  	struct sbiret ret;
> =20
> @@ -39,6 +39,13 @@ static long ax45mp_iocp_sw_workaround(void)
>  	return ret.error ? 0 : ret.value;
>  }
> =20
> +static bool soc_is_r9a07g043f(unsigned long arch_id, unsigned long impid)
> +{
> +	return IS_ENABLED(CONFIG_ARCH_R9A07G043) &&
> +	       arch_id =3D=3D ANDES_AX45MP_MARCHID &&
> +	       impid =3D=3D ANDES_AX45MP_MIMPID;
> +}
> +
>  static void errata_probe_andes_cache(unsigned int stage, unsigned long a=
rch_id, unsigned long impid)
>  {
>  	static bool done;
> @@ -51,8 +58,8 @@ static void errata_probe_andes_cache(unsigned int stage=
, unsigned long arch_id,
> =20
>  	done =3D true;
> =20
> -	if (arch_id =3D=3D ANDES_AX45MP_MARCHID && impid =3D=3D ANDES_AX45MP_MI=
MPID) {
> -		if (!ax45mp_iocp_sw_workaround())
> +	if (soc_is_r9a07g043f(arch_id, impid)) {
> +		if (!r9a07g043f_iocp_sw_workaround())
>  			return;
>  	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
>  		return;
> --=20
> 2.34.1
>=20

--IzdCK0dvvo63ja0a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcWWQAKCRB4tDGHoIJi
0qzAAQC7B7sPqS4BTa1bnyUteSZr78QNByD/8OtF59kGw57czQD8CYG7GE3WQIFL
BKxtBdTljwnjq94bH8XP/9L5YptDHwU=
=+VjA
-----END PGP SIGNATURE-----

--IzdCK0dvvo63ja0a--
