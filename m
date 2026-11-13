Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578734;
	b=lFDpUzAzhw4dqHtYdkhGIhu24Pd2Ztt7v4AkL7rFPp2oio5mEJWGSQI9Kc8VpONtH/l6
	 uuNZW1Pc1ifwKRils0/lGhXRgUSXkccuhg46LLUAWiye9DJHQwIji8n2WNRcHaEP0/Ulk
	 /9uYpHQHLK2ZbpsT5yhhBffmvPAhGvBYp15EPTdIWKCXC3biTLSf21T8AgNG99yrfYmhf
	 G5bFpAEb48Ourb1A1lLZKmrhrXFhrnjA/SzYrB1RkGfqasWukd9JI0Lke0tHkUGGP+urJ
	 AwnMKBxkDaXrlu+tOLm3tR/vq0REJs+aubTxITKTq8WeSE6IW6sfqFtIpO7dBWUj54Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LOjx6oEGbB7XtY97QD54yKBprd/VH9r8uevA8iC/xWA=;
	b=De7evixVmzsW7iKX4++pK5+YFsUX5Z0iLzZTxcYtGLAOV6krBeCsAM7DErK8z6+436U/
	 MrkqfMFxbFKcUY0kJv5/9vPsq6haARrmJr6Cj3yhXFVEgtEKrtxm1bnIOEzRAHWclzJV/
	 1UOVaftTjKTSAE3ZDlhrKJScLVDAgKHsGTwFjCujfjYh4B7KU0bu05i1G9z0PUTXUUAcS
	 9icLdDJEZnjP+ZQFKI+AEmfEsj0D4FvUnlM3L8oR82gbZa5ahYwMFLLgljlTpj1cbmm0/
	 ZUUkJuOz/Uk630TJh8I5o0xlh10shtFv1DX4KCDPQbWavJGNVr914UeEFCL58qGH7XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUvzRnQn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB4606A323;
	Fri, 13 Nov 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUvzRnQn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A181F000C6;
	Fri, 13 Nov 2026 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578734;
	bh=LOjx6oEGbB7XtY97QD54yKBprd/VH9r8uevA8iC/xWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUvzRnQn/HOD9r9OOWVR0Msf0kSylQoriehP8qdRnawC0KsgaXAoAg2wK7GVMGkV7
	 jp/+iFifwM9ctnH2BD/hcfAa2gXIOgmVnMckMonosOtHMxOOByJUZEYs4IeTIuD7gk
	 yE6y/A0YqFg/5HsZ8dZH94Pno8of9OCfEe5ZrLk/6lTI8lt4LjtNQtY4pn6cUsvcfv
	 ZFI+g8ZhjLL0U9I6Xu8o9lgWthhCBGKPfnVqJ2tkrDw56ner98piDTkgayIC2Vkkn4
	 1BxRF2EVL2AJCObith+tOg9hvUeAS2kOhYInxCYdBQnnrwKMOkFIdN/HI/Nwy5mVRm
	 oBsvzXzK9vR8w==
Date: Fri, 13 Nov 2026 14:05:29 +0000
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
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <20261113-emporium-provolone-0e7b0e39c97a@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="NvIhCNPRm1ByCO8d"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-13-minachou@andestech.com>

--NvIhCNPRm1ByCO8d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:36PM +0800, Mina Hui-Min Chou wrote:
> The last level cache controller of Andes cores is not specific to
> AX45MP. Other Andes cores, such as the A27L2, use the same controller
> with the same register interface, but the binding only accepts
> andestech,ax45mp-cache. Add andestech,llcache for them, and describe
> the binding as an Andes last level cache rather than an AX45MP L2
> cache.
>=20
> The cache-level, cache-sets and cache-size constraints describe the
> AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
> of other Andes cores can be level 3 and have other geometries, so
> allow cache-level 3 and require cache-sets only for AX45MP. Match
> renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
> branch, which would otherwise also apply to andestech,llcache.
>=20
> Also add an example for andestech,llcache, and add myself as a
> maintainer of the binding.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++-----
>  1 file changed, 54 insertions(+), 17 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> index b135ffa4ab6b..da9688cc95f7 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -5,14 +5,15 @@
>  $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Andestech AX45MP L2 Cache Controller
> +title: Andestech Last Level Cache Controller
> =20
>  maintainers:
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Mina Hui-Min Chou <minachou@andestech.com>
> =20
>  description:
> -  A level-2 cache (L2C) is used to improve the system performance by pro=
viding
> -  a large amount of cache line entries and reasonable access delays. The=
 L2C
> +  A last level cache (LLC) is used to improve the system performance by =
providing
> +  a large amount of cache line entries and reasonable access delays. The=
 LLC
>    is shared between cores, and a non-inclusive non-exclusive policy is u=
sed.
> =20
>  select:
> @@ -21,18 +22,23 @@ select:
>        contains:
>          enum:
>            - andestech,ax45mp-cache
> +          - andestech,llcache
> =20
>    required:
>      - compatible
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - andestech,qilai-ax45mp-cache
> -          - renesas,r9a07g043f-ax45mp-cache
> -      - const: andestech,ax45mp-cache
> -      - const: cache
> +    oneOf:
> +      - items:
> +          - enum:
> +              - andestech,qilai-ax45mp-cache
> +              - renesas,r9a07g043f-ax45mp-cache
> +          - const: andestech,ax45mp-cache
> +          - const: cache
> +      - items:
> +          - const: andestech,llcache
> +          - const: cache

Device specific compatibles are mandatory. I would accept this patch
with a
          - not: {}
            description: Need a SoC specific compatible
like the safexcel eip binding.

pw-bot: changes-requested

Thanks,
Conor.


> =20
>    reg:
>      maxItems: 1
> @@ -44,13 +50,11 @@ properties:
>      const: 64
> =20
>    cache-level:
> -    const: 2
> +    enum: [2, 3]
> =20
> -  cache-sets:
> -    enum: [1024, 2048]
> +  cache-sets: true
> =20
> -  cache-size:
> -    enum: [131072, 262144, 524288, 1048576, 2097152]
> +  cache-size: true
> =20
>    cache-unified: true
> =20
> @@ -64,7 +68,6 @@ required:
>    - interrupts
>    - cache-line-size
>    - cache-level
> -  - cache-sets
>    - cache-size
>    - cache-unified
> =20
> @@ -73,15 +76,36 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: andestech,qilai-ax45mp-cache
> +            const: andestech,ax45mp-cache
> +    then:
> +      properties:
> +        cache-level:
> +          const: 2
> +        cache-sets:
> +          enum: [1024, 2048]
> +        cache-size:
> +          enum: [131072, 262144, 524288, 1048576, 2097152]
> +      required:
> +        - cache-sets
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: andestech,qilai-ax45mp-cache
>      then:
>        properties:
>          cache-sets:
>            const: 2048
>          cache-size:
>            const: 2097152
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043f-ax45mp-cache
> +    then:
>        properties:
>          cache-sets:
>            const: 1024
> @@ -101,3 +125,16 @@ examples:
>          cache-size =3D <262144>;
>          cache-unified;
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cache-controller@e0500000 {
> +        compatible =3D "andestech,llcache", "cache";
> +        reg =3D <0xe0500000 0x10000>;
> +        interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
> +        cache-line-size =3D <64>;
> +        cache-level =3D <2>;
> +        cache-size =3D <262144>;
> +        cache-unified;
> +    };
> --=20
> 2.34.1
>=20

--NvIhCNPRm1ByCO8d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcZKQAKCRB4tDGHoIJi
0uHvAQCrXjifTuDDgyGXIkJkqbdHt3X2TEOcQaFieQczO/ZIHAD9HhXAgmRlKGIs
/KTS4wXNHI6k4xKnBkLYE/RaOg7J3A8=
=vUL2
-----END PGP SIGNATURE-----

--NvIhCNPRm1ByCO8d--
