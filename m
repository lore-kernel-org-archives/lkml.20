Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335310;
	b=FTCMzqFkh4kiLgGnPwKqlMbVj+vkuieyyeQBqDpDeIGF3A0mLU4vPGgWe7UmkGKvKgqn
	 ZDDMaoYr99Sjle8+Q1uT5Dc+0L4rVJRC0J2EeoI4KN000AhurVR3oX0SaATBAal3saMEM
	 9yQbd/EFhO1Hu0cgGzS1MB+y3vpcAVGoXuyR9QzNunpGgHsuH5/JxzoADEJqA4jy906Xt
	 pPgRPQmlUiNB07gxANYruqodOtJn8/LejI0W1OKtVO9VrTwqiIjQq03qKQKnAeWWOgb/c
	 FfznGNgxqSxZRHuWLx8UleDJPl96JWakbD5ls1lIIm3xD/YMhjiFrV/FGiCOKHlilqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=71z5gCBJeOymYLSOBnrsmJia6D/zSs2bsjFv6ZJhMD0=;
	b=eLLWcBSa1ufvf+U4LqYr7zdLO5MZMuvoYmlO3B/ScMvXx6THA63drzCCEl1cHhzE4bX9
	 5hc0t9+qhmSiJe5y2/khpBdSH2As5J4k21K9wUPjhJySsqv9Ur/TFv4WqwXLQgNeZgFj+
	 tCszcZy7wwITQO6xGje3Vv2H5vJOiX6KzdVL2m64FYmyI9xiNiulTJiZx1A2p/uA7htZo
	 YI/nkMnlMM65VT+dzburZ6rCmYRDQozn04f+r75AsNwelADipWOJtBpfd3Nu211QGVEg/
	 UJSNp9ibvGPsOypOTuzrtkwBsg2YXQgf+eXWhORNUkZqgzLoCiWUPIgddJBliPn0cdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n05aHFWu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265E606A320;
	Tue, 10 Nov 2026 18:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n05aHFWu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6BE1F0089F;
	Tue, 10 Nov 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335309;
	bh=71z5gCBJeOymYLSOBnrsmJia6D/zSs2bsjFv6ZJhMD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n05aHFWunLjUbVDjJr+7dG/rN5JXeCkcEUWW56UAf0p/m3/NKoB3F+ggEUYVFatCz
	 P9GNMyE3LyrwWoTgC2onnIGRgTsIj23sIvevFSG7xNqJWK7VkYb8CTzvLv+NzEyVyF
	 hmapRn8sypjmoQT1khs+qKdoUSni0KijrXCFaGvbo4e5ZEKFbOvjjqCg2Bjr9LdRup
	 IaA0iO4KsEUIq+1M9zaD333Ta2v88/UpSsMylpAn68y4HxGlQ/dmrexjnbdsmWU42t
	 Geqnuv6vF/7Eh0BmikszLQyGSPCo7PnDDrRX6OYCG6kLeHo1DPwc+MFtoimzRzEA2Q
	 s4KLIbjUgOfoA==
Date: Tue, 10 Nov 2026 18:28:24 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com, Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: airoha: add AN7589
Message-ID: <20261110-tremble-ripping-75bb06cd9804@spud>
References: <20261110172143.296304-1-john@phrozen.org>
 <20261110172143.296304-2-john@phrozen.org>
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
	protocol="application/pgp-signature"; boundary="+hlanfLMqur4GNsR"
Content-Disposition: inline
In-Reply-To: <20261110172143.296304-2-john@phrozen.org>

--+hlanfLMqur4GNsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+hlanfLMqur4GNsR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNiSAAKCRB4tDGHoIJi
0jFUAQDXVx6E5NsArY7Gj1j5r6xduRM2nveKZcaagCvtmPfGcQEApckpWnMJ6zQ+
EY5R5udVSj3SdH+Q92aYTYVacQS+xQw=
=C45S
-----END PGP SIGNATURE-----

--+hlanfLMqur4GNsR--
