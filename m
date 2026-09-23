Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E83AD513;
	Wed, 23 Sep 2026 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181979; cv=none; b=ekC0WanpwU4mLmB/5emDzLNt+BOwB7T9vYlpzNOBi5c9yfGmC9GMnZp/JPkumxRPJiTITNpzgSvuiGI1C/Dq+EfaiJu8TphZbllSxTcRvJOimcZK/ouOyHGuuNdj7JzhA71U/MbG5EByWh5AFiXVEfEy6luyNJU2SJS+EX5pAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181979; c=relaxed/simple;
	bh=jjayZ5X9hALSu4fboBecBrWsXtXk94sEnDHPrQAiv9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A33QA9WT3y2aTjEz5I+2kChnGWtbTqRbN6I+LCSGaj6qOTpzWcThGI9wtkvcZu3+ofgO3IRrPDx9K88vHa+7Ewwbd0EoUr9suFDm7nmsrGqzt3J0qYZdJkgZlvJdrU9E+X+y+Eoqjc/DtTIJST5ZZ3BYN6bLnradTYXaNowkK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWlpU8Q/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWlpU8Q/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7AD1F000FF;
	Wed, 23 Sep 2026 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181969;
	bh=bS71iSbs7zRoKj7+VdRnqZnE1kF7AjXyNeF8iLTadKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gWlpU8Q/OgUefrTNL4pGK8sH9nYKHJ7cpHtCAOESEc7X8MQCJoyYxNQe5ZXZa2Vap
	 p4zAIp2HNOT6lFiP4Qqc7ktDcvxXKP3Q15LSPpexjhBYbG11qiLzSIC7Ibi0X8MTdq
	 4trT3noV/l7qoXsuiFiKmfXw51LrXjGkdyaXoD6OAiIjz1e3x33WP55/rck0Jx83OO
	 GOeGjt0mPF+maVK87znbTmQzAOIE3j6f+Pf1GKdMHSQ4Oe3HpAsCzDQQAudZge7E1u
	 C9oTX9WOl3zgHCyxSd+Bs60zxZqrV7abBUmnG0W+a/zXzW1itAZG/uJRlgWaUTXo9O
	 JZXChkPp2oKgA==
Date: Wed, 23 Sep 2026 17:46:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: media: snps,dw-hdmi-rx: make hpd-gpios
 optional
Message-ID: <20260923-unwilling-bucktooth-8b28f745a5a0@spud>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
 <20260923-hdmirx-media-v1-6-ea3d77d4a5f3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fq/WlJ5lG3qLf6O"
Content-Disposition: inline
In-Reply-To: <20260923-hdmirx-media-v1-6-ea3d77d4a5f3@pengutronix.de>

--2fq/WlJ5lG3qLf6O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 03:44:45PM +0200, Sascha Hauer wrote:
> hpd-gpios is the +5V line of the HDMI connector, which the source drives
> to announce itself. On a board whose HDMI connector belongs to a bridge
> placed in front of this receiver, that line goes to the bridge and there
> is nothing for the receiver to sense, so the property cannot be
> provided.
>=20
> Drop it from the required list and describe what it actually carries.
> The name is unfortunate: the hot plug detect line the receiver drives
> back at the source is a controller register, not this GPIO.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index 7e66dcbdfe2cb..9c6c377417c0b 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -63,7 +63,12 @@ properties:
>      maxItems: 1
> =20
>    hpd-gpios:
> -    description: GPIO specifier for HPD.
> +    description:
> +      The +5V line of the HDMI connector, which the source drives to ann=
ounce
> +      itself. Despite the name this is an input to the receiver; the hot=
 plug
> +      detect line the receiver drives back at the source is handled insi=
de the
> +      controller. Absent when the connector belongs to a bridge in front=
 of
> +      this receiver rather than to the receiver itself.
>      maxItems: 1
> =20
>    port:
> @@ -96,7 +101,6 @@ required:
>    - power-domains
>    - resets
>    - pinctrl-0
> -  - hpd-gpios

Would it be a good idea to require either this or ports, rather than
remove it? Just to keep the coverage up since I assume the feature is
required without the bridge. Perhaps that's not the case and this is
genuinely not needed.

> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.47.3
>=20

--2fq/WlJ5lG3qLf6O
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarQCTAAKCRB4tDGHoIJi
0qNvAP9Lnelu6Rqotkyc/4oBSJm5BUmvj497g+XFguhFQp9PvgEA8GoBLcGSiGUe
9l5yOMWjyiMpwesSHm5r7T7r5hhtcgg=
=qV4I
-----END PGP SIGNATURE-----

--2fq/WlJ5lG3qLf6O--
