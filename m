Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283735;
	b=HicVL/45OJzcjzOl+TzthEs4rAHGT5EuoVTGeVYLssvWcg0IscBWow/UMLBgkwTQuNYU
	 Zay+2Z5XAMzi6HidOQcRDNnfKeQtJo+CvsLK+8cruVo/6z8kkopKnYTeVsb3Ac0vbIRTI
	 xYkwFPb2xUBXTML5riP5EJjEDSC/A5ykBSm26OQtKriTofPnYvGJbiswhFqkWcL9/aUgI
	 LMb7Yir0VHuPJCBxL/IhWEiCFRSyBVf9reEqMXl/sAqv8iYsieo5+kZ6Tom4mBvoCk2ax
	 xoHpznf5+gp4LwElv4+e4yyYX0wR7HVsGh5x8dKcpOmkU0KvGW6XX+bXJt1nJ68qh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=j4MdoI8l3gKzSINi5tC9m8gUShy8YW7D8B2w/POuro0=;
	b=fdQXPOp8BSr1dOcXftYcodLaoLS6Swtd2nSWrTSfglksGaDkY99PmIm6+sqSMajoFn6/
	 43s2o3nVUXl4qFnItummpH2jX1ZAYGdVvSe/b2lLWVTR6DehedCrZ9yBjthdPfVgHAAe9
	 xC1vWgm0XcS17Qc69r1b+UXm35/D+ZkYuwjz1nP+r3vAUTo9WbU0Qh8cy5mNtnLb02y10
	 eFD42tUcn36sld3yEXKIADhui0Jidch7J6p65sfzBqIBDX6PH45QJh+AlxUtcHZzaflhO
	 yCahd45ie/si1xKPGuNo2PzIyBYEiygbDAqmOBdwZbPjY2AFIGtBU3Gd1XvEwYNUisQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnG1WZpb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83153606A333;
	Thu, 29 Oct 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnG1WZpb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337691F01825;
	Thu, 29 Oct 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283735;
	bh=j4MdoI8l3gKzSINi5tC9m8gUShy8YW7D8B2w/POuro0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnG1WZpb79Np15C+C/DvEPeQsIRrIR+l2iWmrCWtTuH/H9en4qhcMDQKTrqY91L3z
	 mcKVgVDsu2gj7UpZjm6L/expnb+NUuUrch3ETFsmMNHf+zOl2OxPIyMlRRRpOK5OWd
	 PW2mQaEz/KrSIJuemzSeGXkXV7TlLOS425v1fswALLMO39f9+TYmL8BEFBgqvj3EDu
	 k3mVo7k9q709kupy7DWGoe7eowL9EyacDp1EMsLD71aF/eMEPiTgzuei5N5B7iWx8Q
	 746fxLUBrNpQh54Wl2M9HPNKN6mev4l6G4nIhvVEUXWN9tn7uMt8AL90N4n0nVF43P
	 tW3MiCF3qFaFw==
Date: Thu, 29 Oct 2026 14:22:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: request watchdog IRQs without
 devm
Message-ID: <9656c71d-81b2-4aa9-b83d-ab3f7e54317a@sirena.org.uk>
References: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
 <20261004102346.1203410-1-runyu.xiao@seu.edu.cn>
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
	protocol="application/pgp-signature"; boundary="i3VC6Mb08nDS3iwk"
Content-Disposition: inline
In-Reply-To: <20261004102346.1203410-1-runyu.xiao@seu.edu.cn>
X-Cookie: I have a TINY BOWL in my HEAD


--i3VC6Mb08nDS3iwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 04, 2026 at 06:23:46PM +0800, Runyu Xiao wrote:
> The watchdog IRQs are requested from the codec component probe and released
> from its remove callback. Use the same non-devm lifetime for both
> operations.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--i3VC6Mb08nDS3iwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjVpEACgkQJNaLcl1U
h9A8nwf/ei8qES+QJ8X+ocnEwYiQn52uZbxZ1o7TZYOrXDOcpiJqhzv3CXKdc/6t
2r/1tc2TyXDkitCZ14KuRa+9FhB+jqpvFVtUMWJU674SIoLSRd/5vTKveVHahG1e
up0w2U9yCDWFEdRfLKGP62bC3p7QQjtmrW0zaoxD1/nLGw4OZn7CMn+5YWTPnOaJ
8au1MWR98TMIzOsEqhIIxtJDZON7QDbJnLPMuPwt9bsyDhAaIsv0QSh1JdHH8uGr
QocfVu3jsQjLidrkxPsdWniSkkGbCAAyVRuaYl38YJ1IjXlMkBHcZhG8Tj9nrmnC
el2/xYdRnarWTY3O8LhTx/tz0OJGzg==
=b8Uj
-----END PGP SIGNATURE-----

--i3VC6Mb08nDS3iwk--
