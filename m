Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77513492E35;
	Wed,  7 Oct 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369496; cv=none; b=gSt1SE4IWC9As9plkMEzw5XM7tz7N8vVVXKRD6oEnvs8LN/EdjwqEDjTe8nPiBNJGEYc4iO3tKRGsp+IFfC+hXLuYn5yj68jc5gLxVHy2ms6nkkdorMm6/wr1FEws7IYipCD7sqeIXWHyLY7urU2Zg4E4srx6nKhrQ09aLRG1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369496; c=relaxed/simple;
	bh=WsDUD1TFZA2fOWRE+vsk3ceoJCG7MxBl7m/WBuxsuEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ek9l4OHdh1z/NiYQvS83qElVDGuC/m4ywEbS1OI7y5dO3lbGl163bZAJmJgpSTMc6TtAQo4LeIeKTKQhGjCTFsbpeZIJnzAj6/x8fIBaI7MXE6+HDFE15GfilIA2G60d6/5Hy0LNPKLpgU4mxDST8HLcNImXqgssg+PEKJWw+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dp9HXltK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dp9HXltK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F21F0089D;
	Wed,  7 Oct 2026 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369459;
	bh=WsDUD1TFZA2fOWRE+vsk3ceoJCG7MxBl7m/WBuxsuEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dp9HXltK9x1TngY6K80fyflYAxE2KYsXcel7AUhtobSHZwy63LvuH5B3FMux0rf9G
	 ZzZ2hNGG7x0rldsr8WN8fikZEOyJFDOI/xdlMxkVpwXavg8Uzbt5qFUFrksCi86ABl
	 vsTOdptbbPTBH53eisw1ApvQpBDaWikqe9cvP+Ay9MEu4h0N96o44ZYG/dW1E6mfcG
	 9zCYZwKGifakSubbZKfBLLOfFE3fQQy/NytwbDHzP1Oeu9FPwS7xVy361HRKZ0ngP+
	 lGTlkOAfubBxlMD4v0aN66d3fH8MEe2HV4r90FLgq2yYjKk5Ht4kj2mtN879xp8hQ3
	 fl30XYzmEbGtw==
Date: Wed, 7 Oct 2026 11:37:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset
 lines
Message-ID: <20261007-a1450faf9f78a0ecd2ee9e48@squawk>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTSLNB1Ohr0OPKRo"
Content-Disposition: inline
In-Reply-To: <20261005152425.25319-2-jszhang@kernel.org>

--HTSLNB1Ohr0OPKRo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HTSLNB1Ohr0OPKRo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYg7wAKCRB4tDGHoIJi
0gCmAP9is6y25kk/RSvD17DU+AgBQ+na8H8Pg7XOxRUaU+V6PgEAgb4lXZX1Z0BR
a5lBUo8knDvZfmmoBo9H4OQBWjkXHA0=
=e7DX
-----END PGP SIGNATURE-----

--HTSLNB1Ohr0OPKRo--
