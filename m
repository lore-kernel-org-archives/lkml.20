Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936234D92C;
	Wed,  2 Sep 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368668; cv=none; b=r2uObrLa26PgbAVEAdEz5gigYxsNJ7zU1wciqBDn1ZntaEtJexPACPiM2b1H+e5vY8Ma/qitnyuaRDYtoverHZDMqMhaXVkS0IrrW28OcykztBr2BPNAAh1UQ3U6WJoQOv9kigKjq6uJ+1oKolXfF21mAJPJW02VvIzzApwNsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368668; c=relaxed/simple;
	bh=BF1vDy5egjT7wK7AaB8z1mWQl1XgoL8p6zRqn0fvwPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAX70MEvgIPD7NHCRRWfFBY7e0oVPjwmQx1w1bebTV2wBEay4Uy9faA98tFnYXswnw1xMXimPdUAla3dnyuVO2THaw4sFG0NP6t6LbovUHoimUKMdbMvcetx9JsgxJgtRmsCbHA2QP151qifx+m4X92kI5M8BP3/ryEP0tQYAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP/2g6ON; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP/2g6ON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D9A1F000E9;
	Wed,  2 Sep 2026 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368666;
	bh=BF1vDy5egjT7wK7AaB8z1mWQl1XgoL8p6zRqn0fvwPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LP/2g6ONzXchC5R52wUOvmYJrPFHCSaxn95nBH+9awsyIickuT42kz+bC/jUcyGJV
	 X7w3T7K5N1MTjqfeL+LuIIY28FBXrIY23Xa3n9KGfsEPiBTi1Lop0cBwkoje/V5peV
	 XBcdZZoxfFFZNPVhdRtckiqSvGG3nVbzP2YRBHJRjrnLB3NthXRvTzrFk3h+B687w1
	 +d5XgGb9ua7c6w4tICVJQHqUO63bx2+KTezRXpfZP7e3TguPYtbV3Dh98VMUCDz6ZS
	 4etg8G85ur2T78HLcB0X+G6Du4J4jlX460nUzzdt1RP9neomf1R04CzM38Jvuu1tDW
	 wKOHjKUNOG57g==
Date: Wed, 2 Sep 2026 18:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260902-dubbed-showdown-fe35274613cc@spud>
References: <20260902124018.606544-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oU6Ws+W7UKePY0JM"
Content-Disposition: inline
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>

--oU6Ws+W7UKePY0JM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 02:39:49PM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oU6Ws+W7UKePY0JM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphXFgAKCRB4tDGHoIJi
0qS1AQDHcYddGZziqomcQ98fOBIT7MZWZgQ/5EwurTOZzgjuFwD+Oqcdork48p7x
q0zGEHQN8C0Gpyip7JMTuw7QsSfxdwc=
=pVYf
-----END PGP SIGNATURE-----

--oU6Ws+W7UKePY0JM--
