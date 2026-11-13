Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578357;
	b=SI4I2M6/LsUly/C7BS6oxrAj4zvqcLBFdUFRdDTGOLXPIshbCX54epf8xSEzvmD0O9QZ
	 y0bbC/ezLc82Qlo9E9Xm0tBMnbbgppwM38A3jN5JkP2Vvkjn9QsDZZY7n2OdDEP/CbBKk
	 JQbejBMk5nnUeh9BCjbLyg8Nn58GYrUGRXcR82sUIUigFy+eilHnqKpR3YYmb7OSp/EIe
	 Pc5DkUXgIYJiAtYZJFrqyWTR56jUrtqHPTzsPsS7N2RmcGlkTx1SKrgebbqqPtfYaq3CR
	 dqTqdYoc4Bmqdu0JlJKGaFLOQnFp+vow4VcWSShsN7B4ha9oCxQyfjvM0uYLCv4OLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578357;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SLapHPY+ZKGZOWH+JW2R8xpjxB46dnr0RISc4rUkHUc=;
	b=3smilexAJ+5qFStrqCVKE0Oue22agGQ40ircFYbcw+EwrLwPE9RLx7PSKWHCCl8bYvz8
	 2QtCthl7gbNdddiV85g/xSUr+kKLz3eH8Ei4ylzZKqFmApm+XoArqEbkjprSQGLhee8wU
	 KKo/hTLSoZZ4hQOoTZZuGZQWtaktH+oW4O1aVi9OH6lcGjFa1Fah2IOgyYc24b4qO4xRM
	 PFtEvF2IJfnwDHvISlTMIt2jxlC4qhXa0WsRPGl8ulJSYOVXU3d+VdKedyxYBWMm509sc
	 PnqYkqn8Q0ThPDmJs9eOzeeDjOkbRPnxrB+aUMtOm7NKTixHfSjfZvRTgMrLbPQB9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcUyBfO6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D896606A32E;
	Fri, 13 Nov 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcUyBfO6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8C1F000C4;
	Fri, 13 Nov 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578357;
	bh=SLapHPY+ZKGZOWH+JW2R8xpjxB46dnr0RISc4rUkHUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcUyBfO6RLcShSnPkDpLgFJr1jVWLgK/zsG5lOFBKpb4s4WSAOdpsY41rPe7uYiym
	 YlGzfMN9AbiP1gLH5cgTMiImbIYfheFqMahTjdFzG6a3PxdJX84WRGPMB6GSA3S7AW
	 27zvFLQ8TvI91nxWU54T8mM2RaIfpLx2IjzRs4f9hFFhhen9lm8LoWVhu9xPwQerVb
	 krgHxUCVS90wAJK51jtGruljulheIEPBZSMEeJOuFjcSEmK42CC15KgImAhj59mdHk
	 ijy6m82XUeWZyPCColnJGffBzV+wIBACksLEv3QuXlhhTOniV6xehrjsm7+jGiD5av
	 F37GxWewIFfkw==
Date: Fri, 13 Nov 2026 13:59:11 +0000
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
Subject: Re: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata
 for Andes cores
Message-ID: <20261113-voice-pledge-d0b4e1420676@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-18-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="NYom5XXD5Tcu9bMR"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-18-minachou@andestech.com>

--NYom5XXD5Tcu9bMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:41PM +0800, Mina Hui-Min Chou wrote:
> The Andes cache errata probe only runs on AX45MP: it matches
> ANDES_AX45MP_MARCHID/MIMPID and then asks the Andes SBI extension
> whether IOCP is missing. Other Andes cores that need CCTL-based cache
> maintenance, such as the A27L2, which has neither IOCP nor Zicbom, are
> silently skipped.
>=20
> The IOCP_SW_WORKAROUND SBI call cannot simply be used on every Andes
> core: OpenSBI checks the IOCP bit in mmsc_cfg[47], which only exists on
> RV64 cores. RV32 cores such as the A45MP report IOCP in mmsc_cfg2
> instead, and cores such as the A25/A27 do not support IOCP at all.
>=20
> Keep the existing SBI-based check for AX45MP. On other Andes cores, use
> the Andes CCTL operations for cache maintenance when the core does not
> implement Zicbom.
>=20
> As the probe is no longer only about IOCP, rename errata_probe_iocp()
> to errata_probe_andes_cache(), ERRATA_ANDES_NO_IOCP to
> ERRATA_ANDES_CACHE, and the ERRATA_ANDES prompt from "Andes AX45MP
> errata" to "Andes errata".
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/Kconfig.errata                    |  2 +-
>  arch/riscv/errata/andes/errata.c             | 13 +++++++------
>  arch/riscv/include/asm/errata_list_vendors.h |  2 +-
>  3 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c43e065aa01..ca8e52bee497 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -1,7 +1,7 @@
>  menu "CPU errata selection"
> =20
>  config ERRATA_ANDES
> -	bool "Andes AX45MP errata"
> +	bool "Andes errata"
>  	depends on RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index dcc9d1ee5ffd..530d2df216e0 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -39,7 +39,7 @@ static long ax45mp_iocp_sw_workaround(void)
>  	return ret.error ? 0 : ret.value;
>  }
> =20
> -static void errata_probe_iocp(unsigned int stage, unsigned long arch_id,=
 unsigned long impid)
> +static void errata_probe_andes_cache(unsigned int stage, unsigned long a=
rch_id, unsigned long impid)

Just call it probe so that you dont rename it again when the next
erratum shows up?

>  {
>  	static bool done;
> =20
> @@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, uns=
igned long arch_id, unsigne
> =20
>  	done =3D true;
> =20
> -	if (arch_id !=3D ANDES_AX45MP_MARCHID || impid !=3D ANDES_AX45MP_MIMPID)
> -		return;
> -
> -	if (!ax45mp_iocp_sw_workaround())
> +	if (arch_id =3D=3D ANDES_AX45MP_MARCHID && impid =3D=3D ANDES_AX45MP_MI=
MPID) {
> +		if (!ax45mp_iocp_sw_workaround())
> +			return;
> +	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
>  		return;
> +	}

Is this correct? The code goes on to always mark noncoherent stuff
supported, so this means that every andes device must then support
noncoherent. The commit message's wording isn't that strong.

> =20
>  	/* Set this just to make core cbo code happy */

This comment is no longer accurate because you gave this value special
meaning elsewhere in the series.
That patch needs to change this comment.

Cheers,
Conor.

>  	riscv_cbom_block_size =3D 1;
> @@ -69,7 +70,7 @@ void __init_or_module andes_errata_patch_func(struct al=
t_entry *begin, struct al
>  	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BAS=
E);
> =20
>  	if (stage =3D=3D RISCV_ALTERNATIVES_BOOT)
> -		errata_probe_iocp(stage, archid, impid);
> +		errata_probe_andes_cache(stage, archid, impid);
> =20
>  	/* we have nothing to patch here ATM so just return back */
>  }
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/in=
clude/asm/errata_list_vendors.h
> index 02b5ab0d23a8..d2fbef69f421 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -4,7 +4,7 @@
>  #define ASM_ERRATA_LIST_VENDORS_H
> =20
>  #ifdef CONFIG_ERRATA_ANDES
> -#define	ERRATA_ANDES_NO_IOCP 0
> +#define	ERRATA_ANDES_CACHE 0
>  #define	ERRATA_ANDES_NUMBER 1
>  #endif
> =20
> --=20
> 2.34.1
>=20

--NYom5XXD5Tcu9bMR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcXrwAKCRB4tDGHoIJi
0mUyAQC0Njm9VgKtr3oSzGJ04nseC1dvDXZiJ9ezyBZyaunQvAD9EXLfI/VdA9M7
KESl+lZQXuUyTsv1/BGbcZq3daXoqgw=
=dkDf
-----END PGP SIGNATURE-----

--NYom5XXD5Tcu9bMR--
