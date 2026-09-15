Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABE407563;
	Tue, 15 Sep 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489804; cv=none; b=UnOjNIptjKNE9vGjnpuCBzXS+/npP4vfITXU0hH14QH85l2WKaLzcgHxtpIYvaRoF07LWjjeV/XksvCleOdoi6ODE4DTT9j7O+dNu7rqCgvAVoULVuw0QbCa/xANk2qYlwz5+XuTev5rg+yP4eljOPcY558mezAP1o/QgFwCsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489804; c=relaxed/simple;
	bh=867YyShyzXmyxtMRUvQ8+L0yQaBBw8Xj3gQWMEJDII8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2DZKhKId0Oeu/JB5aQO5t4LVHuf0reMwyZopCtZ4TOqIna8jrzzuzvm/4tnOc0v2PYj4/0SdCHXUBUNcBVbxL8FuNFLIHixUDIbLxRyukI2CQXVKsoY3IjpO7kqWE8kX23zhK7wQLgxEOXC1GaIaV75gFGVFMPPAbhDd8MMWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAxtrusb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAxtrusb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E471F000FF;
	Tue, 15 Sep 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489802;
	bh=W63rmflA8tdQLi2JjzoiULIf4ebSBOxsG1cnKcpwNTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAxtrusbMaFxELaAeOEaSDbavKiLoyC1tKVM3QN++HNzkIwfPZxfpzKMCWpTggkV9
	 8O90sdujqNfHsymccnYyFRzfK695Hn1M3KOBEZfUSxXn7Bg8QQryjToBMPe4CUiAW2
	 S4V28JvqH+XcKKnECcfGYEPrabtI/cfj08br0UMkmCHudHlGdnJz1i9ILcCpVVU9VO
	 fFhC2tclmxyCKesBJC2+bNpQC905QM2o+xcH6Kyr7AyXyicHBNp1Ny0hWeU4R/DcHV
	 uUjB+3zAvPKfgmEliVd+vHHXY8HADQ/WFyENpGO5Mv4fZuLP9OAPHu2jQFFUqVe1HY
	 wv5cAhC9RtQ1A==
Date: Tue, 15 Sep 2026 17:29:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260915-rage-familiar-ce584a905434@spud>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
 <20260915133805.3249587-3-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wkaSDCky/Q9z86Vm"
Content-Disposition: inline
In-Reply-To: <20260915133805.3249587-3-petko.manolov@konsulko.com>

--wkaSDCky/Q9z86Vm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 04:38:03PM +0300, Petko Manolov wrote:
> Add DT compatible string for Draeger's M48 CPU Module that is also
> based on Altera SoCFPGA.
>=20
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Document=
ation/devicetree/bindings/arm/altera.yaml
> index 3030cf46fe74..8ed1ba733510 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -47,6 +47,7 @@ properties:
>            - enum:
>                - altr,socfpga-cyclone5-socdk
>                - denx,mcvevk
> +              - draeger,M48

lower case here please.
pw-bot: changes-requested

Thanks,
Conor.

>                - ebv,socrates
>                - macnica,sodia
>                - novtech,chameleon96
> --=20
> 2.47.3
>=20

--wkaSDCky/Q9z86Vm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlyhgAKCRB4tDGHoIJi
0rfDAQDdKCOBtfYjI0eW8vNcE+P0Ky0IUbeL/xAx7S7vIoXRnQEAzIz0XxDH5bKb
PLDWoMwUTMlo9gABT64/nk22awD7fA0=
=NBQp
-----END PGP SIGNATURE-----

--wkaSDCky/Q9z86Vm--
