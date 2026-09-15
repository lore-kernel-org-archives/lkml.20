Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700954B53E4;
	Tue, 15 Sep 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491396; cv=none; b=c0zpOyhDs/JPt3fNSuelXtsHSvR06Aco2jvEiFxxVDviZfaahggwrB/v50V/z4RYwkeUoYDg0f2PGzm4bae/eUdn5zutDNi9VTYfGA2UUNJzRiP/1n4NQOtwP/H99ppykg6dmWztDUSx5U3p+Q1NX7wjW4fI+l76dLWs5SE2bxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491396; c=relaxed/simple;
	bh=GAkhn+z0ub07VOWpNCsE7w2z9r4RYr+sixMhLdWU9Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNjRF2tyoUDMH+bEKhUPBRe2jtog/l7aUp3Tr982l9NwciLs0a6GDnDToNoF9teVbvvNWxzgr/Rbsm7jpSPYZYQHF3wxEgSECyQcRlLzP2q4jYlAPkPlSPKfBT3+o2y+ZUlCcpbadpzBhJuvUH3eQQvgdenOrpF7MJ8zHFXlAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9zUbT48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9zUbT48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4606A1F000FF;
	Tue, 15 Sep 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491394;
	bh=GAkhn+z0ub07VOWpNCsE7w2z9r4RYr+sixMhLdWU9Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9zUbT48m5ll+mJL0w+ov+3vrPSlN0DDARGf4MhWYeNi7bq0xyAkSdfrjW2OFY3/v
	 d2l8xlN4QakZFH6LrGPbzv3Z0V8E/uao/DP+WlI76utAllCHFKc6iRnZeu3NEwi4J9
	 T4Qh5NxuQ9Faw106glSxeqLB136eDw+Nxis7Ec9s+83sB/SowBOFcPNjp/l0xtZ3tS
	 HyK4hoa9Ffs4EIWePSYX25BsVWAU6RH48HabEAV7P1zygNkNyIlPKxahzQUFiZjX2z
	 3NfpEy+ShS/6Wmh8o2aO2Khr0H9vHDDheTki89tIzkhlFCPaKjtlxjW5uex2GvOM4a
	 CmzFoj+ZwZeKQ==
Date: Tue, 15 Sep 2026 17:56:29 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Message-ID: <20260915-snowman-expand-7a4e8902db8a@spud>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yAn0LXcnisqLx379"
Content-Disposition: inline
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>

--yAn0LXcnisqLx379
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yAn0LXcnisqLx379
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql4vQAKCRB4tDGHoIJi
0v4eAP4xAjGW5J0P3AHtQQ0aRuus9MvCIKAELyuXj0IREJ38TQEA59g04SqdOcT6
qqqWzA06o5NnvFcNfdX8ZCaXPGR7QA0=
=R965
-----END PGP SIGNATURE-----

--yAn0LXcnisqLx379--
