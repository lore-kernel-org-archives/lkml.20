Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE247255B;
	Wed,  7 Oct 2026 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366780; cv=none; b=MnPhsZS3nRZW6CA5xpcYFcr4MJyX1uhnGDKj5P+i1+FeJFEjsqZIt/TqZ5vSstZhsU4x5JcGVx63gHWOQXu4bo3CwX8dG1gVkajRDRPzFUOMBNoOMv9NR1jJw9h5WWcC7kfjIkQmCPFsbxKQ0sXynXZxp2C5459+kVR9O3SdhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366780; c=relaxed/simple;
	bh=Ep7ZM0DXdAg7QmwhZzhF+x5i+V9wwSk/tPABrGHUwuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbwzW4KGd6wfQ+5SZ3SHztkukJ6rOJcMInR+rQdOivfCeGM0dZ5SAL2RBnJr3PjVWRTbVULWsOF+BKVqV5aMvW+Mn53zWXrULwyIOAHJWzvEx7KhCqW1ywbu6AusdsLRNDHD6GAv3hkZnxCWqWlUSvANCdskY6sK/GdWYrNFXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6gc0Vzi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6gc0Vzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8AA1F0089C;
	Wed,  7 Oct 2026 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366770;
	bh=Ep7ZM0DXdAg7QmwhZzhF+x5i+V9wwSk/tPABrGHUwuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f6gc0VziYb2OPPtYu3qn3Td52W4Jm9BAOCgRpm0XbynqDBN/ijWPFEyImgpN8cGVf
	 6nndLeRCF+DrDBrp4ADDyk9ycJwh3GJciNJ1ZIrqXgbu6beEAajj6Mg6BYcgRpvY/V
	 7fYdQ/VSgYsKUp9M9ocl/n31sqQBgwEZez4JqpuKobh77WUS9phEUMhUuZmacIiVz6
	 a1Qr1UCFc/Kae1+oZEfNu67Md/ryIjO0zlHOvAK2+ELjqQ/fdHLFpHI5ZNV8rviGEv
	 /leVubWhWw8KHDBvB6ufawxDlg3twcUJejadSHI64va0jey/ZtHkwBYaVk9MmO9fpw
	 hFUT+5squul9Q==
Date: Wed, 7 Oct 2026 10:52:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <asYWbtDDtYuMZql5@squawk>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
 <20261007-quarkpi-ca2-v8-1-b83192bed07b@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EJ/9AV6+bq7LOx4K"
Content-Disposition: inline
In-Reply-To: <20261007-quarkpi-ca2-v8-1-b83192bed07b@163.com>

--EJ/9AV6+bq7LOx4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--EJ/9AV6+bq7LOx4K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYWbgAKCRB4tDGHoIJi
0q5MAP0fodGNWZAsaLDlNyoV2LAs0BRTRQdJOrUpEOfLFQkd4AEA4rlIu3exzSoy
WZh9G7NQi3ExqcxwM9BUqmK4HJSRww8=
=u6QM
-----END PGP SIGNATURE-----

--EJ/9AV6+bq7LOx4K--
