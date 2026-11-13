Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578452;
	b=cJ4qM09cXF7aTN7dnJI75o0X9lAQg9keFUOjjh8abuzlcXAFoNLfWaSz4isfSwmeW858
	 hgpyOO2ZdjCL/7mgPEnb6gW8OvtoMgHafQ6EaxewH5AuLPdw4wEjoITqcP+piSh2Yek8q
	 tmDu2AQcN8iRN8tMJEp1VXLqrHKGE1g5DhGsk8qYLCqqphk3FJbvkPHJ29esebGCx5ugX
	 dGhENte2P6wY6bCrCw5QFd9hqdxALBm32W6PVERrE5MwVOtG8fObbur2NmaQsg/9K7lL1
	 S46M9FLY/Nf9EGYKZrBE8OVymRIJmBIUyCpPDRQ9b9uUqhrtcq093dgPEdon6FUIJfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578452;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jj7SfMOqG1H+ogyADDrtNoTirjpAkUc8zvWrzzyfhgw=;
	b=he23CcQCY33Fchho28ixLiU6dG9TNkdcYDGa9TBRcGhxyFlc+0n0Zd4oyZVchwmGTUUF
	 Ve22IKO3ITdmzIvE1s4FLpx60yfPLLXdDBGy9Sc+xQ52iyDRFrBWU2PuyX0P0g9n/Xdne
	 hE6LkjhnQotg5C5G3DqruimLM4Pm0d9J13mB9RS8v8gAiZL+ErlaA5d+ReG7Efz4JPERL
	 x7wZRvPFDx70RzqoXYE3/npdKeb/xJs+RgpR9hmfUwcNvBdmCiWfTx04gCBXTHgxCjjaB
	 i5BO+VLwgiR2kFSXPzneKxcTVpX9jS8S2o3vdkzyjcBQr4cFwpPBnSNKnB8hIAEigIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IANDX1kn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879E606A332;
	Fri, 13 Nov 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IANDX1kn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1218E1F000C4;
	Fri, 13 Nov 2026 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578451;
	bh=Jj7SfMOqG1H+ogyADDrtNoTirjpAkUc8zvWrzzyfhgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IANDX1kn5ZOsf9Y5Dv1t4r+c0WLcH825+FnElSyKTBsfAD9NswVuPCu7Muw+HrdpB
	 Hveo0E8jpqrgkwRuWQawwueOgEsXNHwNMpf2RJpYPfyEC0O1S99CoSVJl/cJOyfZVO
	 3vbfzevo2IAa9o4rw20eEMkXr8i+vX10tQdZLsMPPkjQTq8eVC0LDsNBR1/39jCmJS
	 UwYiwKY+36yiXyDfRmIPX5tcCKcOqb20eWxO+GcILnmFxJOBIfcJqzjSzO337U11iF
	 BhOGfioe0xGyQQHzGW+SdQgtKvL7Hu6gJOlgaJATb+BYfCuSjb4JK6nUxRnSbJ4zsZ
	 UgBmKe98Zyang==
Date: Fri, 13 Nov 2026 14:00:46 +0000
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
Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on
 all Andes SoCs
Message-ID: <20261113-upon-unmarked-8f4a186bb656@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-17-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="SS/UlVVSOk0nbyTx"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-17-minachou@andestech.com>

--SS/UlVVSOk0nbyTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:40PM +0800, Mina Hui-Min Chou wrote:
> ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
> for the Renesas RZ/Five, although other Andes SoCs such as those built
> on the A27L2 need it too. Drop the dependency, and select
> ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
> with its cache driver, which ARCH_R9A07G043 used to guarantee.
>=20
> As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
> riscv defconfig. The errata only acts on Andes cores at boot, so other
> platforms are not affected.
>=20
> RZ/Five still gets uncached memory for coherent DMA allocations from the
> DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
> cache maintenance for streaming DMA; how other platforms provide uncached
> memory stays platform specific.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/Kconfig.errata | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 4f77b3c6d7fd..3c43e065aa01 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -12,7 +12,9 @@ config ERRATA_ANDES
> =20
>  config ERRATA_ANDES_CMO
>  	bool "Apply Andes cache management errata"
> -	depends on ERRATA_ANDES && ARCH_R9A07G043
> +	depends on ERRATA_ANDES
> +	select ANDES_LLCACHE
> +	select CACHEMAINT_FOR_DMA

If you're selecting it here, can you not drop it from the renesas soc
Kconfig file?

>  	select RISCV_DMA_NONCOHERENT
>  	default y
>  	help
> --=20
> 2.34.1
>=20

--SS/UlVVSOk0nbyTx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcYDQAKCRB4tDGHoIJi
0nTQAPwJJbhObuthsWBsbU3JKpU3lAGYHUwv+uqR8AWCx9/dowD+IBY6yXOGckxO
I/CaHUE13VhWYdtWTaYgdwgtyO4XwAQ=
=9Rwl
-----END PGP SIGNATURE-----

--SS/UlVVSOk0nbyTx--
