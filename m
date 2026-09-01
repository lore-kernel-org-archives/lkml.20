Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285348A2CC;
	Tue,  1 Sep 2026 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284502; cv=none; b=mpiuTjP2Q03KXK/ksr85rSwXIULPrBK05TxR6wWcQQPqmL7xoIMColvRi7i8pzJQfF8tHK0LgzxFpEfsZW9xTmNGWUrtHWkkqZaK0WIhRF7WgIjUyNWzEX8AEpdG26DoRKPfGbIswRVBNELA5ebhYExpwyDdLZ0rYW/iqG/LMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284502; c=relaxed/simple;
	bh=QdbhJrSOKE0Vy3jn0YIDd9iAVHenFAm9KpqRynCSryc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZVt6QSD7P4TNPg1nX/4vSrIP7Bh4cHADcre0THi3WUT6naOQUZBb3xi2toLmk6D4ymOne7qOYPXVbw2L1nmTdS5yVW/WcnJpqf/hHDQ7ract+dV5cIRaDmB/q9P8RubAwNB0UNAPQoxIPxqx+BafnWxKjXqdklThDBomczW05c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQ/rpKo6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQ/rpKo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB1F1F000E9;
	Tue,  1 Sep 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284500;
	bh=z6WIo0le5aCjppNEWyLWRZs3BwOlvsDBl4hM2DulWIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQ/rpKo61z4uWgcE2dxBn1uB9Qz4RJzXzkFiyAN+YmFZ80FMWZnj0Z+tSgQgZQCbU
	 n9IYEavZvt/+Vt7JeVF/vl1KG/jzNiKqfe8wtJP64yBZm6lS/eFrKE0IbPduyD84Jj
	 E6S08167Y+ip85lt3GtLQBP7DFerBQ/awcwTd08tlLkhoUIveiaZx2xjXSl86jOL9o
	 5mMF1LyJ7E3NPWnxI9FK8j8kg56cAYD7as0d8W4ZGcZvxkPw9PZyx8ABJSh5Ap0a7o
	 fkCgXNrKmKzcJl8njX9P86tBIodoof6g72OQoTvV22dgGIIeRMx2mj9mpVHwOpsKkV
	 qLDuFU/8FHwCw==
Date: Tue, 1 Sep 2026 18:41:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260901-clapped-fled-2ae6126df5cc@spud>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hg5NX2NBXwQM0W36"
Content-Disposition: inline
In-Reply-To: <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>

--hg5NX2NBXwQM0W36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 12:29:00PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
>=20
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 29 ++++++++++++=
+++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..4e73083ecec3 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,10 +37,36 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - apple,t8122-spmi
> +          - apple,t6030-spmi
> +          - apple,t6031-spmi
> +then:
> +  required:
> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts

else: false?
Or do the existing devices also support these?

> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.55.0
>=20

--hg5NX2NBXwQM0W36
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcOUAAKCRB4tDGHoIJi
0t6oAQDdgxxRZq1b3END8pXTYQu7T4+mLdGrboIhqtjJLukvMAD9GVqu+LOfBqEZ
iS/zJektpRLtyh9L3LReuKM1rmeDbwg=
=+C9d
-----END PGP SIGNATURE-----

--hg5NX2NBXwQM0W36--
