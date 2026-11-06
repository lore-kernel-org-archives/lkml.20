Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984724;
	b=FehOakbu44b+SCJHjrR1Ns3qnzLM5ikCQa/PSbFERKL5t72tWnGI8lRR8JVSRCPB0V7k
	 ZchpKMYPTZGVhgoy5tsrGHCvXUWiYghZxT7oH/E5XrZJaI0In2lCz22grQCvGWfasCFIK
	 XCHoiQRlZ2E6fDjNFLsrEmnR4kMbW6jYQviUbjGMxXDT2veomGq+LorQK49PCdRZQxzhT
	 8M1bq3JUM3VHgtgdgAwEmP4q4hiywMUa/8b2HuaZ4wEj2+LYEVK+WizdixzIdmYpWnjQG
	 PSq0Kr1ckJhfcjfdgdeE3puP3WYsv8fgUUBF/swQyNoo3/oyywJ/Q0oSyus0hO0OlCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984724;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4SttwiFqfOTk7qV+tK3jlNM8wt6TvO67mLzSeHcU888=;
	b=VJgnu7gRs4Y/EksUUw8CdSjkLxqvalqzNmtethqJEoC9USRKkfx0/6koATndmgpmiMyE
	 JsvXQlbHWvS+lqRhD6MQjuWRQgA/k0Fj47TH13ECkPIyuuW+GLn5p09JPuRdbWVkNJsyW
	 Z+WDzwuRtD299IariQVCRRVLdI+l8w5D7TMJCy26m2/c6eaSqizc/op6uQkRyCYFHszVC
	 GPE8FW2wOJPW7SW02Y1ieI+LiTl2Cd9I0nzmcuATti0JapQ9UmE1Yqm1mZ4IxDxg0M9ft
	 1nT6rtIprQ3jWyAYVp7JnKahjsPEEfelS9Rx/0wgr7Pp0vrI4ykuI31cPuXL6Otxb1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8+aU8o5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A9606A326;
	Fri,  6 Nov 2026 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8+aU8o5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C81B1F0089F;
	Fri,  6 Nov 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984724;
	bh=4SttwiFqfOTk7qV+tK3jlNM8wt6TvO67mLzSeHcU888=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8+aU8o556AFTD3MJUxxA97mQJ1vB35pWBmKebMRIUWmib/clE1TLaTXv9g1nEAt2
	 IONg1v4uVCR4vTpJ6JT6QFZlQtFNSmRkVL/wurw3iyb+wl0g1luEdRwMCOcipecDuo
	 MKX39mxdfPczUdt2+RcfrJBZmw8XV7ep6dmhP6FwkGBF21alxAWWSj3fBqETBSmgHz
	 Bs2L8RPYfTkr/vIRlRhNUkwIngK3nVNi+5+Yg3R/XGpulOKRiInAON7QH+6OHfh/uL
	 1I5TKl07J+iqPlNO+CUH6P2HX2aW2OtlHKpzkyTySogeBNrAGhaobSWqAHn0iP2vqd
	 A8WVKh99lcXWg==
Date: Fri, 6 Nov 2026 17:05:20 +0000
From: Conor Dooley <conor@kernel.org>
To: bengris32@protonmail.ch
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: fan53555: Add Silergy SYM827
Message-ID: <20261106-flagstick-sublevel-aeddc552bbc2@spud>
References: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
 <20261106-fan53555-silergy-sym827-support-v1-1-4e871c7f475c@protonmail.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fayYFU1ql3xyLLhY"
Content-Disposition: inline
In-Reply-To: <20261106-fan53555-silergy-sym827-support-v1-1-4e871c7f475c@protonmail.ch>

--fayYFU1ql3xyLLhY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fayYFU1ql3xyLLhY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4I0AAKCRB4tDGHoIJi
0titAP4gNj//i8T8/ls7UnQVYa+pQzCAP8sMIaukefApvX9TxAD+KLAaZFKxkhRq
dC5ydWq8P0HqhQUYAd6fYougpcrRnA8=
=Ll4g
-----END PGP SIGNATURE-----

--fayYFU1ql3xyLLhY--
