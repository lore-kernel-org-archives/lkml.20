Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07C4E80D3;
	Fri,  9 Oct 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557071; cv=none; b=dcP2m8P/Ccf/c3QSgSqWVRMNOlcqZ3Ww7PKS4S1Ngu+1br9O4QIFS+zC0KoHy158aiSQ6nvm+vNcRkbzADHiULvjWzeDQz9yqmj9wreD0YPBIvTNMuay1IlidstAABF8vWQju4676HzJzwEI8kujfWGCk5nHwxuoGb9E2jnqjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557071; c=relaxed/simple;
	bh=2aemY+UGhY60/8ubgvUnN8kpzs04w1+otIMRTikkqSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFt1criOXTdxq4y/DrMMnfDA9YJi9XPhMSMkK7yI0iTNPzxco1prTSZP1B8XHlrHDREeltMT+i35BDBDAqIu9A8Pk7Ux254dJLv5BydZ8vSDvUygdSxrdc0d1PHJxmeM/2R1JnIrJ492GOYaUQkv65wpHd6SFhXPiflaVEVVwFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgAR/+ie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgAR/+ie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB5C1F000FF;
	Fri,  9 Oct 2026 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557069;
	bh=2aemY+UGhY60/8ubgvUnN8kpzs04w1+otIMRTikkqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NgAR/+ie4+daensuw6LnghvUqohOWB2OOndjQ6APqUGKaRf696uyKQDXhRFLJm1Sg
	 DSg+yB5xqnwSFvc/tGJlgQt1qjvcDGn7d0suHXwYE8CUDpS1k2vFm669OSb2eFw1ww
	 El2fGJYM4N6E81y6MXCvmG34JFlfcm0RSkK4nag5xqr7BilubV28run/XYfLpLgv5g
	 plMRiMz0DtTaadbWBBcmRhRMQ8SzJUgXoMndv1bkHBi4MHtbpwJ5uFhIl3pJeuONCD
	 ZJpS1wtHwEF1ZqbPmKC5oPATUQ3PJNsS9pHKBC9XlHs13o8co3gNivgpF573To/dFj
	 hXYhPMNCZcYng==
Date: Fri, 9 Oct 2026 15:44:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <20261009-8fbfc1b31a4f57046e1735e4@squawk>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
 <20261009090444.3319517-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yut5qOub1ik3//Ee"
Content-Disposition: inline
In-Reply-To: <20261009090444.3319517-2-zhengxingda@iscas.ac.cn>

--Yut5qOub1ik3//Ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Yut5qOub1ik3//Ee
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasj9wwAKCRB4tDGHoIJi
0vHJAQCouzdHFAMv0dhxG/70lwYrwlY/tBaOX+vRU2EbD8bV0QD/Q3xZKbb4nEal
KrbLNq/GRpjWQmheqwB9+olZLhGWmQg=
=1yjO
-----END PGP SIGNATURE-----

--Yut5qOub1ik3//Ee--
