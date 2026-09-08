Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917A582B9C;
	Tue,  8 Sep 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886163; cv=none; b=V62IEJAKlu+7OBK14bvqqMKfGaeKuLKi2zNLeI39CH381vihgcJigYs2Z4aAQN3W+OHqipFHSVems8SAD4hwNHfdPl++tzGTtgavO9QZVle5fvLnHnHDgeE6YtWIiTJB59JwjKV8YHyf8x0PwEKyHyWGbVAJj7esks94GJiahiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886163; c=relaxed/simple;
	bh=Sw0EXLGyFgEjs/QlWOHTiW3WtfNHSIEQ+FShKAG6YQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tfiyelj75i9PnDzmt6isqqL+XdM8a12hpUWAHnr6RiHZ6C1gyFy5liPG1OuXWHh+cXsDdKfBog4FgzzPvn5mOz+DMnMvSBKHExPn9MiRh49gPMhUwclp4OxVPJqyAse9+f8OOXOjljAV9+XR/uK+aSrbY+l/hHewNMZbPtyT8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPwxPVk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPwxPVk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963E41F00A3A;
	Tue,  8 Sep 2026 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886161;
	bh=y6T1PYQqEn6OIeTwH0vHF5OJqwdcrmzAmh0h23/q0Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SPwxPVk8fz9RQjdCG9nvLPDAsXD85yMMzSEOXuCEo7gfKxDVXHXYiF8KjV2YNssYn
	 glrzFWegtcKevREEyWDO+WhXWBQdbomRRpcmlp+OJzaElgAZ9KrIq5BFkhmAwAlP4F
	 +BDAV557/dV5SOnBm/REj2a9720pP9vb7dDWSgomxtCEm3z8sNkACsY/U5/c6HsToL
	 wGxLutYGuwQcffvnlJAISi/NR27hiGP5m9Uou01pKkPiQaL/MMy2qp9bt7Tc4at2yb
	 gHsbbkieoSGR3ei2HRmjMTL0HQ7o/mhC0wTCMAxbjz6/7O9PQpbI0T3Bq8+G/GY6ZJ
	 5yadK4lV92WrQ==
Date: Tue, 8 Sep 2026 17:49:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: timer: sifive,clint: Deprecate
 spacemit,k3-clint
Message-ID: <20260908-veto-shelve-cb17a634b3b3@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IuSQJzEXQvkbH5Mt"
Content-Disposition: inline
In-Reply-To: <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>

--IuSQJzEXQvkbH5Mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 12:28:47AM +0800, Junhui Liu wrote:
> The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
> devices. The existing spacemit,k3-clint compatible incorrectly describes
> the SSWI register space as a legacy CLINT.
>=20
> Deprecate this compatible in favor of the K3-specific ACLINT
> compatibles.

If it is this badly wrong, please just delete it.
Leaving it deprecated implies that it is frowned upon but still works.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 3673836e14de..88b9be2230a1 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -34,7 +34,6 @@ properties:
>                - microchip,pic64gx-clint # Microchip PIC64GX
>                - sifive,fu540-c000-clint # SiFive FU540
>                - spacemit,k1-clint       # SpacemiT K1
> -              - spacemit,k3-clint       # SpacemiT K3
>                - starfive,jh7100-clint   # StarFive JH7100
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
> @@ -62,6 +61,10 @@ properties:
>            - const: riscv,clint0
>          deprecated: true
>          description: For the QEMU virt machine only
> +      - items:
> +          - const: spacemit,k3-clint
> +          - const: sifive,clint0
> +        deprecated: true
> =20
>      description:
>        Should be "<vendor>,<chip>-clint", followed by "sifive,clint<versi=
on>"
>=20
> --=20
> 2.55.0
>=20

--IuSQJzEXQvkbH5Mt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqA8iwAKCRB4tDGHoIJi
0v9CAP4tmH9S8FqWvAmMNur5RwhJXGOKYGFd14MfPoINIao7xwD/WE/k+8/EMQm5
+qKGULH+GknCPb7GvBi+nEKSOiozsQk=
=uhnI
-----END PGP SIGNATURE-----

--IuSQJzEXQvkbH5Mt--
