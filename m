Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE512D739C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476835; cv=none; b=BQdkouCGFt1tIw5UzTE5pSmdBqDSNB912qFw7YAzt3g5yvzkOWCOjpMPLDaq8tnSrX2lz+IGEPVy3iUXAGkbpUwUm5syuzbqKuPOZvrmKfpJU/10LxjF7G8sywiWp2Dpx3yj4oHktsLrS0i4xnuejWmAtmzsqJQ73B2m16hBVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476835; c=relaxed/simple;
	bh=Ioqc8RkDjsakiqCBHbEteKP1YeAkhAYQ5O17Lga+EwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJq6iQ5sciW67I69N0xGTZy1xCEKGljI5mhOWs3IO/w4U7Ru8t4CI8xgmf1MPbMdTFIk+hKa/9SIfVycKVOCWobELxQm3mw++1HhKSM4Mv/VOrgY/2c97zNQZHGDVLJ5o0DE61F/CVNfhTIVabuHDOWXmnr0syAeKW/uOJv/PT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaZmvW9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaZmvW9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ADA1F000E9;
	Thu,  3 Sep 2026 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788476834;
	bh=Ioqc8RkDjsakiqCBHbEteKP1YeAkhAYQ5O17Lga+EwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EaZmvW9aL9zZvVxfd0I3mG8p/GhX7B+++geaN1ceyuSZHwhjnsS+0RACzx8ikPbt9
	 9G0y3BRU88LIGJVs5e/W5QM5ZDdP5ig0SJ4Hj0JCv2Y5ES7QOMKF1QKP046u6t1cs1
	 iOc0/3OhjKUNTSBFOH5ve6nHDtaOxbLfvcab54APrnI+oFbP56DqwROlYInPgsLwfg
	 NP0+mGP3vSlIPcrn9sP907NYV2TX9T36FvUAKyCePZD0zUS+hIyLml/Bd7/qyJA2nE
	 spaH3ic7gjLXHSM2gOCBQA5pIuGjt9MbiAIU1R+YhGHvM6s+3HHe3dNV70Kcc3DF0U
	 Wt2OVbXHTSHvw==
Date: Fri, 4 Sep 2026 00:07:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] regulator: core: Export helpers used by regulator
 couplers
Message-ID: <5f440717-d60e-4c6a-b186-7684700ff47c@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
 <20260903062056.1024263-2-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PM+9XR2EbSztP8fL"
Content-Disposition: inline
In-Reply-To: <20260903062056.1024263-2-justin.yeh@mediatek.com>
X-Cookie: One picture is worth 128K words.


--PM+9XR2EbSztP8fL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 02:20:46PM +0800, Justin Yeh wrote:
> regulator_check_voltage(), regulator_check_consumers(),
> regulator_do_balance_voltage() and regulator_coupler_register() are
> already declared in include/linux/regulator/coupler.h for regulator
> coupler implementations to use, but none of them is exported. That
> limits couplers to being built into the kernel.

Acked-by: Mark Brown <broonie@kernel.org>

--PM+9XR2EbSztP8fL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ/Z0ACgkQJNaLcl1U
h9BokQf/SBNN4qkSup9Zx7/91V4CaMKzlLUJr7RIPR2bjDHlIghIIv3inDHwLWfd
k0Gw5OggesugAonFDvpW8/xTUreFyEk0VyC/zd+FArzIvDp6Aje2v8gBJrSkpWWx
PNT9RtmXm9ZVUS8pmDY2y9IOV15VGJCoB+cNT4PA7JTA67CPc9hOKHzsdq+bmNJm
t+DzRGQnL1t+Y71LciyoAZhQWqhIE3Yi0F9V+NraGgCBODsCxiQu0l3iWiuuOAqQ
u0sLge5VRmSmhfidF+UrJv5cGyBhkBl75GZFlXagNxcbeLvp9/oqzfgs9vLMNUdY
/TjfjCys5cCAs8FrrzU4OxFLqe4Szg==
=P0Wr
-----END PGP SIGNATURE-----

--PM+9XR2EbSztP8fL--
