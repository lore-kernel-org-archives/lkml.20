Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711846C4D3;
	Wed,  7 Oct 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368113; cv=none; b=PyW7zCU9cgUQgQ3tmzkoWpCa5mNrhZWFOEeYz6Ap78PDqAC5dI1jKaxX0nEjC5vbO/7vhGkiHJeOHdv6/0EwbIDRliqLB6oa+LRj0pw2F81m75Up1fEf+Rr2XQH5N363187upJAnLMgiRkOsZ8LJ4oTd/jPjt8ISdzb60wTX0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368113; c=relaxed/simple;
	bh=HuZIZieH+JysRgQB6wSjmgHKHsItWKq0YeKBpYIq8tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaW8D4XfSHvMg1+DmmY3OK3CLPDVeaUVlLPLjwhjCktCHRxbvAti1CFkgSPCAXhQRG6CBnwp23gggN0/cwTYSe95dfRz4crZK2qB/iLe7Jy63JTo040xxlSsWXjoHc3xIposWlo6TG2PxZJPjfse3pcNpI7EJzi25esKL2Oc3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7BK6S4E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7BK6S4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49471F0089C;
	Wed,  7 Oct 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368104;
	bh=ono3XC2jWzCtdtxm1AZV27fSUgyNe3YWPdofYixm2yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7BK6S4EsPsLhtNocgRwYmx0oYvG28EVSlh+twpgHi2L3srMuxRgHtU9HQN7ijvnn
	 0RR1zAxlBmg9bhTEbyJTtWcXMLFeuIXVB75NPh4VN787WIG6RquVkX7iCk96XHUjTA
	 i/Eyv9GxL/C+yNdcs0dDN43pOJAQufRdNFvDSyvNOnzU9sqxQW7gOQ9jbiga5GwItO
	 /PJS3OpTZfHAc09l7/r9brOj+ehkt/X7LMs5hdxHBuCoWSlyYes4Ys1htM7+coZb+4
	 lZ5Qih8rmI9EYhriH5tBhhALcs8HRlr5cqQfq2i3fR7GFlnS3ntQSxSn0Td6wy0epw
	 HhKPoDQ2HbSsw==
Date: Wed, 7 Oct 2026 11:14:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261007-272017d1a64ba304c82482c3@squawk>
References: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
 <20261007-quarkpi-ca2-v7-v7-1-a84c6d5d6ef6@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BNFm96iWEOnTS7pl"
Content-Disposition: inline
In-Reply-To: <20261007-quarkpi-ca2-v7-v7-1-a84c6d5d6ef6@163.com>

--BNFm96iWEOnTS7pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 01:06:26AM +0800, Bob Hui wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
> computer.
>=20
> Assisted-by: Hermes:deepseek-v4-flash
> Signed-off-by: Bob Hui <bg9oxa@163.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index a799bb843f74..a3191bb909b2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -182,6 +182,11 @@ properties:
>            - const: alientek,clrv1126f
>            - const: rockchip,rv1126
> =20
> +      - description: Alientek QuarkPi-CA2 board
> +        items:
> +          - const: alientek,quarkpi-ca2
> +          - const: rockchip,rk3588s
> +
>        - description: Edgeble Neural Compute Module 2(Neu2) SoM based boa=
rds
>          items:
>            - const: edgeble,neural-compute-module-2-io   # Edgeble Neural=
 Compute Module 2 IO Board
>=20
> --=20
> 2.34.1
>=20

--BNFm96iWEOnTS7pl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYbowAKCRB4tDGHoIJi
0poEAP0cDi8AhzthDNrWdJoqYeqtrAtg5LLLMhgZoDbWX/wPpgD+MSKXvvDtM6EM
UqxVzz0cH9Y5SazOBJ02w2vwLh3wRAI=
=kjo2
-----END PGP SIGNATURE-----

--BNFm96iWEOnTS7pl--
