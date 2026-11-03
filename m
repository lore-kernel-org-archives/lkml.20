Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742424;
	b=Uy+M8HCsUCIxZjOcVcPDjCxkbT1CKXAf9ki3QJxlGg73QzKee3iTniBp2/tPM2YVcpCj
	 PaBTQEce1vCS8ODWCl2KEfz3FBSNJMXbmciMCL4a2YvsbAGEVnkkqZGj2DkS6l0MPeS8y
	 9nUAlhfGf4x6j/Dud42p24+BaFZHG8G76X2EQG+FQsdUL9PB96Ua3Cf8EJrzr2NYsv8pB
	 Jg2XWu1trpnnyknn67SsW4hXVzU6/g4USKrTE1SrVpR4LqlIRkL7WxvZm+wuZjb9hXdG0
	 mh/pTGpxUqNDzkCThlC01W48NjleXQq8INvFXIEzeJZQHSVOk/xCc/Hv4NB6hID8K3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0qIMVRakx8MFE3+X6O+uiOk2xUDzs4Y5tphV+i06Ud4=;
	b=pVASN6c7mPi2ZcMiUa1B8UyXsKS8HKUvwo9eFmHVvv/R3qEq9oaw0LnDrOeMwZ8DCpbE
	 clYcJjdtN1BAn6ImlHq5o9HiSGd6esR2jgQZXhX9X57cYwJo0lRQXB8TsbPxz0Cy4KaQV
	 3y36eXybKBt6TNGZUuFBYVn6rZZqEJRlgJxPGGDxRJgu7ILpc5elwEDg7meIQNl0SvHFQ
	 QY+JpQDUw2/GZBVwBIqkiuJTmpbI1X5oGDX1VXHoRYaDOvFtSWmwM2Lya33uC3vd7LuXr
	 xXqE/LI36esZMT3xYyEfNCpmEDRomPT2JhWxLnIlOKzMe5m0r55S6yclhTc32Q6Xl2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrP6fJQb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A05606A31B;
	Tue,  3 Nov 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrP6fJQb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F11F000C1;
	Tue,  3 Nov 2026 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742423;
	bh=0qIMVRakx8MFE3+X6O+uiOk2xUDzs4Y5tphV+i06Ud4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XrP6fJQbEMevUrTsydlsPVLlGv7HAoO5QaCj+GegM3+0hNUUNIvkkgdh9OZKQQ09y
	 OO1k2l2GiX67dVfoedyKZyy9szczuqj4MY3shuEtW5aet2pHS9lmQ5d2C7jyor97OV
	 aW2WEyv7Ikv6cjwXNLJIRowhq9j0Z/o+zDu04dy95467Oxc2bxUBOpW72mvR3jI/iy
	 ysYWG1U1WD6bgirOIg9FO4C8jT8wd3r3hdvjx8wtdrfCZAc/Iph+jEjFKf6OpznsYy
	 xQZuCCcJ3CuSU4dS5nfnMbJ4vPWa3ZXerB6XO7DuLo/DqZqnGlLZqOGyhAxYA5TAKV
	 sd3Vh7apqLXCg==
Date: Tue, 3 Nov 2026 21:46:57 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: riscv: cpus: add gf,mips-p8700
Message-ID: <20261103-synapse-posing-06a06f09a9cc@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="MZmL+98OJ3neLu75"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>

--MZmL+98OJ3neLu75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:26PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 compatible.

Same comment here.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769767a9b7f41f179a3559ae7160d69..c7f1cf1db6eef5b25403d53bc=
a7cffd9bc1f2240 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,7 @@ properties:
>                - amd,mbv64
>                - andestech,ax45mp
>                - canaan,k210
> +              - gf,mips-p8700
>                - nuclei,ux900
>                - sifive,bullet0
>                - sifive,e5
>=20
> --=20
> 2.43.0
>=20
>=20

--MZmL+98OJ3neLu75
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWUQAKCRB4tDGHoIJi
0jzdAP0QRFUSXCqY5Bx3PwIkHe8G4jQ4n++qQHiyt4ZrvklGjwEAq/J4pFCTTSSY
OkWYe1RQ1q9IRpH+0wlrFRb7J/wsbQQ=
=iO2t
-----END PGP SIGNATURE-----

--MZmL+98OJ3neLu75--
