Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9123C4F3;
	Tue, 22 Sep 2026 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097334; cv=none; b=eYUWZyrwWAjyz+ZTiXR2qRskGRWgKgU8y60ULEujv7cxAT2SYlJRq38Jqo6+SH64YfhR/L1y0bkZwkE5ESC2+/J3+QMf6xWF46fsr3esNBvaIWYt7JAfDy560dk0T65E/7J/5PtSUKUaw8AguJPoQCPJg89uC7Z1Zcs08Ty8KN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097334; c=relaxed/simple;
	bh=o7XCPms2Bib6bRfira2F3Orb6WqbjrC4QrVJj6MkpzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfQC7Ybt+nE9LHHNp+J9kJEYrrbDNce7MJlIqPkVa6td9/UyA/48nfJ7Hs4PIWST6Bko+1LSXEN30mcK1ZyOghRF+W8E0Rr5cQQDppZ79u4FCk4ns0gCLIk0oA29GCZY2kC6IEXm3gQO7BlKpvOT9BhDXORzDJ7OFIg/huWjrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEpya1Hj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEpya1Hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333831F000FF;
	Tue, 22 Sep 2026 17:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790097332;
	bh=ruPuFqV56/fcI5FeCOr8sioenZxbHL6buJ4gcKubV/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oEpya1Hj4XKvcWRL9lJFg4zKI+YFLQPcbPAfGtQREOU4UW54RaTi6aXCk5E/as3Iy
	 IJhgBCmXlOM2Wq0tfAFzfgep8aHOoU471XmgfPanYQN5X+4ZLOGpgsh/ohLqCKhToV
	 aFsXXxj1ywJNoxsDsGyrmPfqs+BareTc8HGrwA8CWGjboHoqOfM7Wx19criKxyW4Fy
	 nI/sw403O5eOKSBet+uJMW08vMz1Rh3FJPFkNd10VJnNn5ftQXfDIZsKL5lmmrWBp3
	 y47ktNnM97xIipUkSwYZvwYcWwhftvMrOXfUxOsPMERcosLOcnnyumlYDQvR0DnlNd
	 /V2LdXZkgp6aw==
Date: Tue, 22 Sep 2026 18:15:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Message-ID: <20260922-colonize-uncaring-c604b3529275@spud>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-2-minda.chen@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KHIdktmF23MupoFW"
Content-Disposition: inline
In-Reply-To: <20260918071103.24482-2-minda.chen@starfivetech.com>

--KHIdktmF23MupoFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 03:11:01PM +0800, Minda Chen wrote:
> Add dt-binding of JHB100 server host field USB device controller PHY
> adapter register IO region and its regs-name.

I don't understand the rationale here or the other binding patch.
Why is it not always 2 regs? Either the device has 2 or it has 1, there
shouldn't be variability unless there's more than one instance and the
dfferent instances have different numbers?

Cheers,
Conor.

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.y=
aml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> index fbabe99e9d5c..b2fd98c06ba0 100644
> --- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> @@ -20,7 +20,16 @@ properties:
>      const: starfive,jhb100-dwc3
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Core DWC3 region
> +      - description: DWC3 device controller adapter region
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: adapter
> =20
>    interrupts:
>      maxItems: 1
> --=20
> 2.17.1
>=20

--KHIdktmF23MupoFW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarK3sQAKCRB4tDGHoIJi
0szQAQCwh/dFafRZJB+jn62w8Y2QCRUr/K2AbBr0TrPFgM4FhgD9EGSlYvTElJBw
EVOd58UALAYKOueaN3htPnZsmZEmNAU=
=l681
-----END PGP SIGNATURE-----

--KHIdktmF23MupoFW--
