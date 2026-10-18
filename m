Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC764071DE;
	Sun, 18 Oct 2026 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792349483; cv=none; b=kUbKDTujaEXZaxaZ107mDc9oV26O4PyXtCypqvlEp+r3AIYjoTFb73voL/Uuo47aKl9AVxKlg566rCBTMnzUJg5gXX3+7VSDq9dx+c7HqL7VRPYPJqbXO7jjKAcQUvxtPqBzVNTy4J7gfMNLUnXG9m3UKovdWQj7HYd8WGTRec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792349483; c=relaxed/simple;
	bh=nI0Mo9K6wNbpzc6WH1o0ex4u9xbK7kaPdxDmuDw24eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNf+mwx1UXU6pM51vgkjYbpHFpIrNrIXI1i1wgBdoDlWctZC59ZB94kixf2RhlzM6Ua56JXRFlNRPPuYMDTikoKs18Kl2DE1JUae9aNCgjVKC8Nj5HvIFZqCLFEIZlP+dyvorTmoHrWYZdnQU4GG5L/HnOz8EFKezdhSo1ZF34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dku5uRPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dku5uRPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F561F000C4;
	Sun, 18 Oct 2026 18:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792349481;
	bh=nI0Mo9K6wNbpzc6WH1o0ex4u9xbK7kaPdxDmuDw24eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dku5uRPa+b4JnRohhs4dIyC7stFLjtCohgCs51GQxs5n4o6LNlfD5sDP5I+9rxK5N
	 xc3CPquir26Tc56Og0zOOBBpqEGkPnYGBLygAc74ZBzB0fVIByDLTFXxByQT4LhPJJ
	 VNt+/AkkI7Pj0MwEJop6f3zW51JMwHsT8usRZd3rw1mHVbo4+lVXUOAwTVY4ujV2Zh
	 MNK19G/JJ1IOdc01iKlN9Za5+BiZjhSPBjk+UMinU5vjtMY/VImMsJUpuaVn4fnoIf
	 Nf9CNJ+9MyB/9BXChq8F3SSGIUzTi0pU2qdomMMDj0Cn5fG1gOXcshkGWdUx3z2b4q
	 DWCO0LkEmI6IQ==
Date: Sun, 18 Oct 2026 19:51:17 +0100
From: Conor Dooley <conor@kernel.org>
To: tianshi12127 <tianshi12127@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add smartisan
Message-ID: <20261018-delirious-equal-86755d897a0d@spud>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
 <20261017103250.800109-2-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwjdUVkLnxoBgmOc"
Content-Disposition: inline
In-Reply-To: <20261017103250.800109-2-tianshi12127@gmail.com>

--lwjdUVkLnxoBgmOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lwjdUVkLnxoBgmOc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatUVJAAKCRB4tDGHoIJi
0qqNAQCHjqcEBCc1TJ1D7e8eiw/2FXICrT55fWjoVLIa89ymzAD+IV1CY2I9fbVp
wB5G2DKF0KV7+X+2KUsvIIF6NixUGgM=
=X6Vv
-----END PGP SIGNATURE-----

--lwjdUVkLnxoBgmOc--
