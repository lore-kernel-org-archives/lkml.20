Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287337BE9E;
	Fri, 28 Aug 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934624; cv=none; b=mhDltaZehy9elMkfWKQCMJ3QwptOJCRUkhJX52HoixcCsPYxq3wqWu+12UkfANrtykKPGT+K2XtxzzrTPwHhlcNdI2lM3TmRvTaoIC6S7Ylkt3FVZWh2AHucJ0xbhwjejCiUCEplQEkXV31zuuVtdZ6TPvQi4TW11Ch0Ybvo8TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934624; c=relaxed/simple;
	bh=9AczKV9fr7mHCvrrXvP/w5fRYMZr5vsSP92/Adanj/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XldhLindIOUam70s8gduYpaqYyohCK4Je9geawMwyq6b9ywk8RJqtDVfE4mOaDYGx2fP4jCNS4cZFHU5t/KWhEoMcj3v9Kih9p2exLHjU+eV/pUgcNF1BSHjvE3H7Fm4Z5gN67OKudV87cqlB10TMCJpx0N3whFGPG7n3MxHanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQKq5xOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQKq5xOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A031F000E9;
	Fri, 28 Aug 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934622;
	bh=rlOkBHzBvasYYnkUVjzKqrztOu7qV8bIX60v6CRdSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQKq5xOoOY5/B5Z4Vh2n01MowTbjOl8QdmjxZZswLx+1H1N0vFGl5cIjnsMfxJODM
	 rNYP8TYCDJnjQuprO1UHyigYqD5O3bKnlg5r6v6gYzPRaNg9rzyBHllpmOlcBpERMz
	 A5fqjaA+HpgyVHLiP7p0wLPvQqTb1n96g9Ah3TYx14DrI5FGxb/Mk0ImGh+OYJsP5w
	 aqYlYGS1p30URzwWnSabeypeQq163aSYX2YRFkYFTnifNIeQgN55kdT9qvopkWDOVS
	 3PC/KjZAVnfkMCDvzyENC4hnBI6Oie2wp9o7y6npdrpnrXO+jOaWM14i23RM7qP+5P
	 lROvk/HXmu+sg==
Date: Fri, 28 Aug 2026 17:30:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260828-stiffness-activator-d294624667ae@spud>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
 <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kr68XvzKP7bsDbmd"
Content-Disposition: inline
In-Reply-To: <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>

--kr68XvzKP7bsDbmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 10:58:57AM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
>=20
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 31 ++++++++++++=
+++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..09d383bb4fec 100644
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
> @@ -34,10 +37,38 @@ properties:
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
> +    - compatible
> +    - reg

This duplicates the unconditional required bit, I would drop it so that
you can add an else condition and rule out the interrupt related stuff
on the devices where it may not apply?
Even if the itnerrupt stuff is possible elsewhere, please drop the
duplicated part.

Thanks,
Conor.
pw-bot: changes-requested

> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts
> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.55.0
>=20

--kr68XvzKP7bsDbmd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG3mQAKCRB4tDGHoIJi
0hBLAPdO6fCWIe7lCGuZKPTY7tTNQreiZQ7KMfF54OHN9jIPAP9UkSq+u+UDSm9B
NwDr89Jrz4qy63kCjhxx8iIj5bWTCA==
=ayCU
-----END PGP SIGNATURE-----

--kr68XvzKP7bsDbmd--
