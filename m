Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605396;
	b=OxbvjovWwHLk53314TMKK1XtVdQT5lLTOwdJgi2MGtI2dza1KhrizbSnnC9+LqByJpfr
	 I8MJR6MCT+oK07mv7gO6rFh0swA4lsLUgqsZRPG41CKMZa1bIRh6RfsIjvtvqlur3VMHZ
	 hwE3yntcgpzKyKLvbbcIxxjWVnO4BE9+KyCmr56TSaHRpSSuYlQzfT432MHaFIKeUzJvz
	 i1amYmbLtgPoV6HcpzK+hfGyChMcjGcQMsvUmvbjFHhjoaDsj3karmmdofW6kszi6FMmo
	 THgj3GVG/Dj7gqn5FRDATZR1JVClevWANTiDrNk675ExR95merwk+NWTFO3IvzbhA4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605396;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=wNl1ILUuOagNKDL6DoAxUE/Nnc1hqU//xyVRVOae8TE=;
	b=E1FVBBvb+87l0VfGEVijkxJPLjkYjWu9GVK2rdAoicT1IONoZa6hgN10gHtxrj17vRIS
	 lSQvFJctEt+70m9hue6gfoOBfJIFtKe4Tyut1iSPlokdzNUCftgp6lE2kA20gYa6aJl9c
	 d0OGZFjwEs3QaPURI4x4bNSI8BbwAV1awNOpv/clJKil/I06YTqPyFIfgLH+uY4GBoAEP
	 dS2hSZiiBBCy9TKLlBqE1Q39cfIqlE/cS1v50uVsxBJ01KH29zFZ9ipYUfFpcPyXUMhzj
	 n3C5cznaLkHQF5cvAtp1eiNKi+m6TbPq8vT3Gs8aW6l1s6T82pFooJnU6e7e9jzT0RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T/Xg44FN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5122606A891;
	Fri, 13 Nov 2026 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T/Xg44FN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914E81F000D0;
	Fri, 13 Nov 2026 21:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794605395;
	bh=wNl1ILUuOagNKDL6DoAxUE/Nnc1hqU//xyVRVOae8TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/Xg44FNG8Gw1lcYNBsv0YVVwrpA3Q5y9f/3DN0L+2KwRC0GzH24S6w5R+P9VWP+e
	 4VTujFYNHjDgZXxBK/dAfBf1K3ust+g/xHgJbwbQ220YTt+HPMWQ3/SQ+bSnRYPbgW
	 xTf/acfwp/1ghkiVEI8yJIk+Eh1Djax0+oeWqrCmq/joLdt5z2PPvYsWPJyn25M4Ji
	 9BfE7felpFsi+abm/icCinEo7aA39vTYWyE/9PUIy9ZuaPrEoXG2yCLN35JE2BKOG8
	 FwC5yG0oQjlWsQ1yT2W24NBXQdxDXLlt5bkj0LZZFh659fLaAubNodO+oU3R98GGir
	 xUlX0DwLtmyiw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A8A4F31DB15E; Fri, 13 Nov 2026 21:29:51 +0000 (GMT)
Date: Fri, 13 Nov 2026 21:29:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Carter <yass27106@gmail.com>
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <7cedfb7e-b54d-4fd9-8f8d-c34597fef85c@sirena.org.uk>
References: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
 <cb70e9d4bc154a52ba5d9351baa57191@gmail.com>
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
	protocol="application/pgp-signature"; boundary="SZgsSwmhcuuLEVn7"
Content-Disposition: inline
In-Reply-To: <cb70e9d4bc154a52ba5d9351baa57191@gmail.com>
X-Cookie: Earth is a beta site.


--SZgsSwmhcuuLEVn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 01:17:32PM -0800, Daniel Carter wrote:

> On the clock retry itself: agreed that the right fix is in the driver
> core / clock API so that deferred-probe runs are retriggered when new
> resources appear, rather than open-coding bounded retries in drivers.
> That is a much larger change than I can make alone, so my intention
> with this series was a stopgap for this laptop: without the retry the
> macro and SoundWire drivers stay deferred forever on X1P42100 because
> their clock providers register late.

> Would you prefer that patch be dropped from this series until the core
> side is sorted, or is a bounded retry acceptable in the interim? Happy
> to follow either direction - the device tree patches (1/4 and 2/4) are
> independent of it.

I'm not going to take such a massive workaround as that unless
absolutely needed.

--SZgsSwmhcuuLEVn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaveBTwAKCRAv73Ows9A4
id9WAQCF7dC3nP9PcOd4k7Y9QloMrwY21eHtE6rLVzplRAKMdAEAoSakG5bDmHBL
vn9cc4W7nXViCA7c6TyZ2w9ZertCdQs=
=xiZU
-----END PGP SIGNATURE-----

--SZgsSwmhcuuLEVn7--
