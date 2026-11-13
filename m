Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578490;
	b=Zb4PeU0bez8FWKW5YMrOUZLFsd5/D8tzMUQ6tKMJtpbN79368aFxt8ItsUQ+SKY0cgtA
	 tJTxtC0m4yJaVKm4R7Vy/ACXVp0hkF2PeTx5K+0CB7d/Bp4zSld6ADJ/wqqGfAgPTwqUS
	 Xa0oiBKqWU+Qauro5KIaXcs4e84Y3qV2yeCY5ajZM4HI9CXWqU4UKFzhx6xlyCtAkrojE
	 70RPSIUJKRwZ3y2hw2sCwSvqpytxSrzYXjFOkxnmmfT3Lrly4EO9QHZ7sHhZGGLIFl+18
	 LfW32UaH5Jv9NJbSs6kXXBVMKEiorOGpMloqswGuYV5RTdBk1zCDH8wxj9+qC+9Rxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578490;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ie+nbm9Jsxef1EvK7rBLzcV6Szu01z+wcddOuAojf4I=;
	b=MKEtBIJc7EaGXoERPBGfiJIV7foXVZmVq++VrmqFzMpR6kdNmahoVlR4x1VBoRYuCbcG
	 xSpsuaIm/W1IKWH+Cg5sCpxhpthD0jte+fFuuWMLGizcSdUQxwtotU3sEae1uXiVumAdO
	 AcHLz+VdCrN6Gu2ljPKiJlEafYQ0rxNipssuaU6HRzhetf23Ms/ctD0FhGCFit7dQrAHs
	 DIaJwkrNi7fRjf4/QNPVO0KHWeljSy/9LmSLPy8TupJ47/HP7Vld2v9grZJSCyNrFE2Kv
	 I3wNbFCN/HhH7LZO7oNRBIStQCDxjMq0Cd36k+DgJT9oxXQKT33tjMZ46fpveDY/xUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPAeudQF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C911606A334;
	Fri, 13 Nov 2026 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPAeudQF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2299B1F000C5;
	Fri, 13 Nov 2026 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578489;
	bh=Ie+nbm9Jsxef1EvK7rBLzcV6Szu01z+wcddOuAojf4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QPAeudQFxH4QAX2HQej9QKa1y/FEWB6fTpug0QdZuH8b7/q6Cjz0cqGr5lVutTTZ7
	 B7HJzb1/VG59UBBUyXXyFDvJeSZDnAvLSa5+PmbnnzW3pym8RVfvYOArEb6A/KgiOc
	 2lvSq4SGH4z9NpV1KjQlg6t0AMSTIccjGirAPHV04cxVI+Xfnoimve1SeLyxSBlD4p
	 Q3bqGYD3uJde65FB8X+5O0nRP2kLwOv8Nirf78rg5zlelsaxoUU1/ZBcVKdioGnerb
	 xJYmMqCzLSzOm4Br56NTHH2qWoGfZRy7VlCPpnqc9FQg7XIasK5D481Lgb5sAKpgqM
	 APVKuUWW6NMGg==
Date: Fri, 13 Nov 2026 14:01:24 +0000
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
Subject: Re: [PATCH v2 13/19] dt-bindings: cache: rename
 andestech,ax45mp-cache to andestech,llcache
Message-ID: <20261113-domestic-pull-f0a931907df5@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-14-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="uqgblaYPlAZjqv10"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-14-minachou@andestech.com>

--uqgblaYPlAZjqv10
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:37PM +0800, Mina Hui-Min Chou wrote:
> The binding now covers Andes last level caches beyond AX45MP and uses
> andestech,llcache as the generic compatible. Rename the file to match
> it.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>

Squash this with the other binding patch please.

> ---
>  .../{andestech,ax45mp-cache.yaml =3D> andestech,llcache.yaml}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.y=
aml =3D> andestech,llcache.yaml} (97%)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> similarity index 97%
> rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> rename to Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> index da9688cc95f7..f97038d39b0e 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> @@ -2,7 +2,7 @@
>  # Copyright (C) 2023 Renesas Electronics Corp.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: Andestech Last Level Cache Controller
> --=20
> 2.34.1
>=20

--uqgblaYPlAZjqv10
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcYNAAKCRB4tDGHoIJi
0jA5AQDk53IltjGYyWywsW2UsQmTBs0rjNnTg1RB2LCM8JdZRgD/XKBVI/Zxi6rd
ondOB2YJU33P9yniwrvay6A7J2ZrVgY=
=8pfH
-----END PGP SIGNATURE-----

--uqgblaYPlAZjqv10--
