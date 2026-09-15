Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C73C8C46;
	Tue, 15 Sep 2026 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489774; cv=none; b=tBbIjZpSamg0fiOAqHb63+0TSSe50diWG1gFS5Vte7KdTPFjKjgsAk/W573N5w4BZxHR8LEADiuTQpwlU4geuta/B8BuoyXPqZO85Gp/xWp5U7Cz+o8p/iD82lYVk4QkdwkTambwVUcCL/oFL4kgoPixRE/v4UKyPeaGLfbWHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489774; c=relaxed/simple;
	bh=fV6EbM4R46NGH+mgvkgXExQ8boycmWpFFqVo2IMYM8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USyzCll+FqjCAZ9h6FigBlrzB/Xx1Tr8s3qQBlYp7iEc+Ck/UVeaACeh2VQo9IQjpw+OKm4ANjYDZNbFr5u/TpMcAQ01YpPRRoE7bqs+3codC1oIUQHB3qutJMHmWUOUe9tChREp4g6zyTvgs7UpwsrlZNASc4c3Z+Oy+W3n0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFvrAXAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFvrAXAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9964A1F000FF;
	Tue, 15 Sep 2026 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489773;
	bh=Y/Qp1ryZTXfh1hqdSxsbjeC2+su4+5O8TD7yMYnY1+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LFvrAXAynlzxOIxLDvAnmxVO/XjaSLdyofC+rLMSZOFnZihoGMdAijnvPu2EYf/g9
	 Jfiah52sz8MxlZAQHfXwfsSZb5T32JsQODVeH+ZOFQ5zTCUuDtx2NYIr4ohw0fhKf4
	 Tjg3P6ZVF1fbjyODj+jeLDZ/2qpZfjuyXNjJNgvEP/Xrq/8cxQA+iPo30g+p4fIzRA
	 HsGFwLUv4WVviJajzKmRzJ/Tr3mORfScXFxgHAmeWuTpqnW63EKANzkKt2aNpAC9Nr
	 U9odW1jByYygBMNHXk1wCLE42Ajs3SWIePDPzFge5YBxr6yEGGpt7EDJEl5ONJMc+h
	 zZv8anvrebTzg==
Date: Tue, 15 Sep 2026 17:29:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Message-ID: <20260915-swore-armadillo-12f821bb00fc@spud>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
 <20260915133805.3249587-2-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6EUn0c1MQ/yGfsF"
Content-Disposition: inline
In-Reply-To: <20260915133805.3249587-2-petko.manolov@konsulko.com>

--w6EUn0c1MQ/yGfsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 04:38:02PM +0300, Petko Manolov wrote:
> Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
>=20
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

A Link: to their website would be nice.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969373..276d62b848d5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -467,6 +467,8 @@ patternProperties:
>      description: DPTechnics
>    "^dptel,.*":
>      description: Guangdong Dapu Telecom Co., Ltd.
> +  "^draeger,.*":
> +    description: Draegerwerk AG & Co. KGaA
>    "^dragino,.*":
>      description: Dragino Technology Co., Limited
>    "^dream,.*":
> --=20
> 2.47.3
>=20

--w6EUn0c1MQ/yGfsF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlyaQAKCRB4tDGHoIJi
0vBcAP4ovxFvuAXEjXOmJ2Mu8LkJGXk475zJW+6cAiuRshVZkQD9HYFsVNeRCaxW
VPwtIzDpMEW4C+15kE2Pqj8Ww+b7bw8=
=lwEJ
-----END PGP SIGNATURE-----

--w6EUn0c1MQ/yGfsF--
