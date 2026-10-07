Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A748D869;
	Wed,  7 Oct 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369380; cv=none; b=Z199RNmxfxBaZrilshSxQX4nzt4wIDXSUE5qeH2NmWThkNpuPm1yeE0N6ttkXjtG0ftRIzjYLVpoO1ececOsHaPuoQ2QBrcTolktLJPPLpoN3vZxawshUZoE4VoH10XxgCotplA5Sojw0kjm1lvlJpWSBWaS8wffbSjFXjMH684=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369380; c=relaxed/simple;
	bh=pLKlun81g6kb4wrCHzN6I6o12HqjijWaEfNsGDeteWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAk8CH+6L85jC24Luriq16qPbu87MzNTLawWvWj77drDMfYoKqAezia9b0WKs3MhO1Jjtpwe9rNzT0KClS2YfUekxemxUnVRFhdz+hOkh4IYmsDblbI/nKs2PhBbu8CH3wRGAzIYc+QPEEls87S8hfkmOWz+/kCRpCagkSB0Ao8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bupQdlyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bupQdlyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D4A1F0089E;
	Wed,  7 Oct 2026 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369353;
	bh=j0Hch7OiXKFVL9PJtBagkKejRb0RaDNA40bNxA65fj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bupQdlyWlpwR7HfvzVeWU744sdawNFdMx+a2KcAKbXoVZODSlCraPTHY38+VS95DH
	 rc9h5ECSxzpMUBQa0Vk435DIw3KSXD//OwUNHhXEY65HK0McTqgMsf/bCawCIIm8tz
	 fxF6Cggz9Xd+Rh7CMidpqd+WQd3NS7uc6RZ4ZwJSCzVSyY46YzaivpfYzC+hLYjEfD
	 jDjLLzbnnGWskKnU9Kgjr7oC8hYbvphQ/GfR7ZkFBSSgRPjMz5GxBTSya7MZt9Lov4
	 DN0W1sZ2XWo+rvbwNUp9uhuEdHLwYfzgnzFvXuHUyI97i0tsEUdald5fLlUO/fvhmc
	 3mpedvjDlesWQ==
Date: Wed, 7 Oct 2026 11:35:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
Message-ID: <20261007-92e855de534df44fbf665e4f@squawk>
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QUTSUWkAe13RUNYF"
Content-Disposition: inline
In-Reply-To: <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>

--QUTSUWkAe13RUNYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 01:33:06AM +0800, Pufan Jin wrote:
> Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
> Co., Ltd.).

Where does this ALINX come from? Website url?

>=20
> Signed-off-by: Pufan Jin <2254650260@qq.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..97e7ef340 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -90,6 +90,8 @@ patternProperties:
>      description: AlgolTek, Inc.
>    "^alientek,.*":
>      description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
> +  "^alinx,.*":
> +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>    "^allegro,.*":
>      description: Allegro DVT
>    "^allegromicro,.*":
> --=20
> 2.55.0
>=20

--QUTSUWkAe13RUNYF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYghAAKCRB4tDGHoIJi
0r3uAQDX2D3jt0hLUbjRyv+0v3F/Qa1cIP5/vxVU5mzQR2palwEA35o0Z9cu6onr
/jo2K0I9EASfEsj3+5x3Ql838iQ9TQU=
=QWdH
-----END PGP SIGNATURE-----

--QUTSUWkAe13RUNYF--
