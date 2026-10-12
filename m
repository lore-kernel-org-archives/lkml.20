Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA63393DF3;
	Mon, 12 Oct 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831156; cv=none; b=RrrPZAhLkuCxuIh4mEsV3b6NL1TE9WZZ3xAxVaVd2hhidJBJvajF5N3GCpJhADeSl1mDtSzOtoIs26ijWSzeDr9DiPhsyUeoHT/wxHYsYxLheIoQVyFvf/5L+BFSnB/OxYinYcLI8flk1RShsewb6Gr6KbNc5cN/xWfs3RdibEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831156; c=relaxed/simple;
	bh=gt3uJ3YuXn28QZjxt2Sqm4hSyGZLxXJ4bQEbkqgUWGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggtICI+8PMhmG6UgZpVBlD2sYn/MHT8sEQi9hvRHn9Jr9KJncRc8JQL1pQbp2kZdth1RbWYxya5pZQ+43+TGNgDtAgRZgm4zxooK8Dh6Nku0I2dUYUiRbB0KCrQ4Egu08azCV+Sb/oT+aVZ+CybqilMEySqlJ3KAUiTzk+CV20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyUvcpjh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyUvcpjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E521F008A1;
	Mon, 12 Oct 2026 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831155;
	bh=tLvlPgvOhsRVVO/DOcJ3Uqcc8XTeKhlR+W1CLquVN+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MyUvcpjhII6yXZy6U+JEa1eJXWzFaPl8KMVZ8RxkNdMnLMVF9kWyt8SMQSXvqRS8d
	 nd+gQSvDU7wRRsICe+SfuQpHcVrNA/sA9zw0VB/7S7t1sbx7e0YPS9rDigVDhHMM78
	 xGrYmHzilkKeq4GGqyEw2sd4mbJWhkZz62R8hVAXEgPeVYK91xBDNm/jCrSrBVjPet
	 SpSQmp6bX1Ik6u5wglIVb7eKCVg/mHeyMy4iIk13iTVJBSKc9k5c1M0l1fitKme9G6
	 oi236mqzhmKFabr69baRpSwIjnNBorUCNrRRRI7cWUMKuNkNc3Cz3Qf5l3J8j8Jgof
	 Nl0l5jnFIGDoQ==
Date: Mon, 12 Oct 2026 19:52:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingxuan Guo <gmx472@qq.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9768: add
 Giantec GT9764
Message-ID: <20261012-carton-balancing-37436ad99656@spud>
References: <tencent_7C5DF9D5552EB31E8CFE415048CE592A9A06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pP3j3AkvI9Av4hLY"
Content-Disposition: inline
In-Reply-To: <tencent_7C5DF9D5552EB31E8CFE415048CE592A9A06@qq.com>

--pP3j3AkvI9Av4hLY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:36:49PM +0800, Mingxuan Guo wrote:
> The GT9764 is one of Giantec's VCM driver parts: the vendor's VCM driver
> application note (AN971) covers GT9764, GT9767, GT9768, GT9769, GT9772 and
> GT9778, describing the same 10-bit DAC with the AAC actuator-control
> extensions.  The existing driver drives it through the same register set,
> so it is documented as one more compatible of this binding.

Sounds like a fallback comptible to gt9769 should be doable here?

pw-bot: changes-requested

Thanks,
Conor

>=20
> Signed-off-by: Mingxuan Guo <gmx472@qq.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.=
yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - dongwoon,dw9768 # for DW9768 VCM
> +      - giantec,gt9764  # for GT9764 VCM
>        - giantec,gt9769  # for GT9769 VCM
> =20
>    reg:
>=20

--pP3j3AkvI9Av4hLY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0sbwAKCRB4tDGHoIJi
0vD3AQCAGNwsI3Np6Irk8nPj9fq4Z7h2xJbL0F470VFfde2bvwD+PiB984+n2mvx
T8CQekEFQUvlqTHr+Dw5m8HruC1x6QU=
=ojjB
-----END PGP SIGNATURE-----

--pP3j3AkvI9Av4hLY--
