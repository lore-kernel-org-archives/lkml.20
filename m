Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF943CE73;
	Wed, 23 Sep 2026 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155648; cv=none; b=genRPwi7UizCtZXDK/4ouRNV1+gBm1fSzkBCQ2xZ7z4ih/UqSD6Bm8ctDD3ulzhLi/vLzYFSmIme7nps1sRAeSKZPkcXzUmX0L4/IPLEe/ClZ4UD7ti/pHG6RXAyiTuQ6lOtM6pkmYB7R//8h23nHIliPwrHBzdEqvzpd/b+o/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155648; c=relaxed/simple;
	bh=Oc3I9oM07fQXOzzlZmp9DA8/cglCDSgCrJ3EQT7iH0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq45NiV+7a0sP7NrAoSzrVn9zcKc4E0EjcNgStG5ZVqSLItY+AxDLklEv2Pcyb6JUspfoVHUq1DRzfzG+WVl4sgB8Kgu96yLj47mXeE6+wC0ac6ZAqHMZoMoLqMFx/iTEcbvXlE5ijib55KW/+IdsVV6odViN9JujT4d/95z6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyWMMTiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyWMMTiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571651F000FF;
	Wed, 23 Sep 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790155646;
	bh=/O9z/zdlbyFkDq4QkzPdgb25n16zFLBUEpRgnQqB/Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AyWMMTiQL6QY9D1XC/zFhcD3u/KfKA7aJIAYE39KBVbGKN5CcD8y/zGCbQO9KDhmR
	 Yx3ocCfLDLV+6f8HCOiAe+9/Kom1WsHtFBOa1RW9nB44oC9Q3ADmrupsVV+fgZ2iq+
	 3FtQPVYoULrc7ztk7u+4t8K1pFptPZNAgtpjEoXAMQyV3VdD3TAsldb238oecrN2e8
	 WdOVl3xays+4cmYIln4b/D575CsJ2h3JTvoqoUTx4m3tF0rBj6bqe4hM7yfZ7329MJ
	 4hTCHHbwZZ/Sb2xPszUz1r9VNxSM9cCDkruzNiRGVXaF5D0F7EkSN7ET4Y6PSLIBi8
	 wuLkSFGRdHv6A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2F1BB1AC5737; Wed, 23 Sep 2026 10:27:23 +0100 (BST)
Date: Wed, 23 Sep 2026 11:27:23 +0200
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/10] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Message-ID: <arObexxuRRmQ5qqw@sirena.co.uk>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YJywhoxg+swNLprd"
Content-Disposition: inline
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--YJywhoxg+swNLprd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 12:18:20PM +0530, Harendra Gautam wrote:

> base-commit: 46e864b539a2d2f6c0e5d08623654513ee50c556
> change-id: 20260907-b4-qaif-shikra-audio-729007ceff72
> prerequisite-message-id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
> prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6

So, this does actually apply independently but does have the
dependencies above.  I have repeatedtly asked Qualcomm in general to
please stop sending things with in flight dependencies, it makes things
very hard to manage.

--YJywhoxg+swNLprd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzm3oACgkQJNaLcl1U
h9AAbAf2Iz8v6VhOlWsVms2yyOdc36qKA6LwSz7G8avXO29wlrAYzARI6W+4gbI4
ugjAVQrFgmx4XEjNxb0iTznS8+5wcZfQATQ6R5h7YoZ18lE2A8NCVwAUhZb8XhAJ
E+kJWOqyevN7Z09ht3fcjagPsiVsC9n1iuPeLn1pCWkhLDwBtblEEv0kJxzmVrN3
Cb8xG9ekXgPaBFmL4rb/yQk028sBP3HGWBtNgM4Sq+Gy7N/W1yI2ETbZSHU+YSu/
lHICwrH6zj5iRzLHrve84i5L1rV0/CfsXboLJLtqZxKQqW4vJOHsJV/b3L/VsJ4E
z+ZkcwLKh/RdzRqi0SVEUORqbQoY
=84BN
-----END PGP SIGNATURE-----

--YJywhoxg+swNLprd--
