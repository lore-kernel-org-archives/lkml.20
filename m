Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F4315D43;
	Wed, 26 Aug 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760138; cv=none; b=StfJ+18WHP+N/I3CuMhMicB9BrGH0/YQ52/jGe1BIXrppamBqdw9b3WFdpI8gNPR29gVJJU7MabTf8L0NqqIauedKhJRFytla+adcfYolG/YtkMpp4/x/FwlLgyrXUdudiWgwyy4a2UidKUejWndswcS7lkbqu8g1O5jUOooJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760138; c=relaxed/simple;
	bh=A2tCkHhAnhJUieAoIFUwqetCNrCTpIRrvxTeG80BJcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plWD5OpjKWe/lblfUTi1QRAmo3cCFkM5eRgP8UCWLIJOsGsEriAlmlBVqMjYGy/tccXqOeNc4lVdx16Fy257pHnA0dvJPBp+La8MZPihMe2H1VLLX68WPw7d7aovNq2ZQsWFSDeXGyTHEM6y3W1fhcnpmCyEFtVLWewNP4QCTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTuCTctg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTuCTctg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F248F1F000E9;
	Wed, 26 Aug 2026 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760137;
	bh=A2tCkHhAnhJUieAoIFUwqetCNrCTpIRrvxTeG80BJcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hTuCTctgZTYuRNeOUOL3Dh8vVZl2dFrmaatOn/Y7BhOSDxGpqMQt5TgUGz3GrV158
	 taSnjYbCC5ZrRhPXrRS71rSq5QJCwjpDgtVJEHDMqTdFQKzcwKJ2KPthSO/qdTKrL/
	 sZ3XiSV4J87OO8PNpYpoI0+pKr0mWH/pb5MABxRPmJ4nW9KO3tL8ouK16T1hoA7arl
	 ZxcY/O+MlNMfH/xTOtGARX3Hjbgll56apmb6aZ2VyeJsY6tbs/yYLWzLmcbVZ29IDC
	 qhZqlnDf94wDy39JS1Q7GxM6mwCCo4SpRcVNbl77JeNXlqEx+7YaMROH2zM1R16riK
	 jcK7xn/2Js4ig==
Date: Wed, 26 Aug 2026 17:02:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add optional
 repeater phys property
Message-ID: <20260826-phosphate-churn-06da285b0c0f@spud>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
 <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Slhqmh3WOacDfSwh"
Content-Disposition: inline
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>

--Slhqmh3WOacDfSwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Slhqmh3WOacDfSwh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8OBAAKCRB4tDGHoIJi
0k4+AQDUm2QUPhWgZ45GL8qPZVL+UlFrND1Hjkl5dEzc8QNDtwEAz/kB6ZPUpBNQ
tLL2hWIYvJKTOwtT9FGCc456h7rwBQw=
=YZCc
-----END PGP SIGNATURE-----

--Slhqmh3WOacDfSwh--
