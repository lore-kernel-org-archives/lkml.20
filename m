Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380842;
	b=5QV8CxQYJI1KmuI7Hq46JT7LHazj/smu78SLkxQfn18GMzXay1iGkWiDhaenAqtv6PMQ
	 yuhE6I78053aKf0NEIBWV25lkjxEhOBA2Ql8MJclDTx602xDPtYGROPPAflmEdjF/07Oa
	 gozLVFL8BMynmjMaqktCOylfSYMFaJnU6fhz2nAt60V2g5RSQJaSY8I8kniQDver+3YrR
	 gHD/3srjcQoZpaAqjpz7BY3LgN0TivJiWtfjQDtqS0KbGm3sEEXeo7QyuKiJrlYAttKeT
	 EBfKwmEmO/muWBM9cyODiodRRTlXNgsuSYvDm66ncqGbtbO5xgOyfZj2iXadSDaIcbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380842;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=99JF9ni7lMh2XS7Eh3oQ9i4imj6eYD+w5Xckj1NeoD4=;
	b=GqthzSz0iq05M5MXDjojbkQU09RiYMMY2zddMHp/kbQiBpi7HZ/sozTQ4ozGbqaTKpp+
	 vfNnfHjVpl386cMwKhtKa3hxGsfc+ZejQoUG0W9cjjgnwM4UiCSKjIXqdqXRsFe42wOrz
	 27V6h8+dSSsHgygv8wuc0TCtI0lMKSbS5tubCXEzJ7ztAW3TacQVA5l12y6XUWQqFoSRQ
	 0O2EtNT3k4XUmStDf03zsu1GVQx87W225r9nlkQwZDiNnKwCVzf/wE2ur8jrXW2o2t9Bi
	 HhQP24wQhixdMBSJMuk2XvbUBH/kMZDJMZuBmapTp+26o+Es1lbaul1LYzkUlM+/HwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGCMelnw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29E606A31F;
	Fri, 30 Oct 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGCMelnw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89541F00A16;
	Fri, 30 Oct 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380842;
	bh=99JF9ni7lMh2XS7Eh3oQ9i4imj6eYD+w5Xckj1NeoD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGCMelnwiwzHlejcoTgA4EX6xtf6ggHRlXy/eCSL8zzQm9jWD9dwvgzwkAHTqdDz9
	 +sUUVExRvJNPFi2n0sjUnMqAg9GdD9sgJs9R2k1KheDQshDOCZOvzOUUZXYIJ/VLoM
	 XTM+dQ6PZ2P4cMqqduS1/lkrGHVlNCGb2+2/DA7X3LuxOYTz1Yw2p5xCpGbXA88DGX
	 tm1h1b/z49MDp+68lVn7VrsYnnU3DW497GfAOigWGBDiqo8mVqgTZUCjI+WX4M1odW
	 RNoCbqMMktbVHkC7pO5h+kq58qvJau/QTTvRLllo15iiBGo08jXkOJ8FQDJBGoo1Hb
	 +QYkTXujH8nYA==
Date: Fri, 30 Oct 2026 17:20:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/2] ASoC: cs35l41: Use common wait_for_boot and
 reset_and_boot apis
Message-ID: <a1813064-d449-4859-993d-6db89c452a34@sirena.org.uk>
References: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
 <20261030171045.469944-3-sbinding@opensource.cirrus.com>
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
	protocol="application/pgp-signature"; boundary="DVwn7atQoEV82SKv"
Content-Disposition: inline
In-Reply-To: <20261030171045.469944-3-sbinding@opensource.cirrus.com>
X-Cookie: Orders subject to approval.


--DVwn7atQoEV82SKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 05:10:15PM +0000, Stefan Binding wrote:
> Use the newly added common wait_for_boot and reset_and_boot apis on
> probe.
>=20
> This should prevent issues occurring if the chip is not ready on
> before it starts reading and writing to it.

Acked-by: Mark Brown <broonie@kernel.org>

--DVwn7atQoEV82SKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrk0eUACgkQJNaLcl1U
h9BacAf/QYzNuMXj5LjtqTPoC0fHbLlpU+ofQayn4xFd+NMa5An5LUZd0eQT2eCU
yL+oN2sY5TC9QQx8aHv6RNO2R1jW/1TkgXaq5WH/yiRrxYe46A+T1EMDsZIPLPA5
CeMSg+2ThLeZSGkyoll/n1rTobAX4PezlgN/AcNEMCL0neZ6reqiVOd0Kvy1dPNJ
R3E0RkPWqM3t3C+S5xboqyJ5hQx2DzXeNGUgXdrWsfQTo4moyD3Ij4n2OBOLvumP
NpaVYQ/BvHlI010q2tifeeJNzfLCpjMrw3pcenR7VB9dY9mhbQoKChcskAXEOnhf
OSLh4KZGaZf6u6BZFn5a4UTManAp/A==
=Zcib
-----END PGP SIGNATURE-----

--DVwn7atQoEV82SKv--
