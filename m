Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17233357CFC;
	Fri, 11 Sep 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128435; cv=none; b=g3mJ67jGqYSBP+8DqjYknYpTslhYGxbvkqJJyYtTeTA2U7rbImVXC9P+llUFYlr1Aq9kp4gjBkJSQKwT/5NmO74j57jDtpQrag6+u/eJnnovUfDCiABCHizPoRSrjWSKyVA09rFbMZc4PK3CkcuGOPv1gRTdD8Pk+jCdR41tXfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128435; c=relaxed/simple;
	bh=MXuvTorQodOS4EtPrn+Qo+LDicYNEi7CHhrrLuCObWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYfpCWeGof+tXw0I/tuVl7QeBkMwDBWI6ChvXzXXBLSp0KxVw6ic4A3vZlnJvr8Heu0ikdaXPBXG7wEtMYtLudylgXPlMyOp36/ml9kQjgYisCbG5Fh56PMxDG0DK0OF4dCACbZlXFTQX04lQiP2ZQvb/AsBwwpYR/56GedsKKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmRGIjsh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmRGIjsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E1F1F000FF;
	Fri, 11 Sep 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128426;
	bh=MXuvTorQodOS4EtPrn+Qo+LDicYNEi7CHhrrLuCObWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DmRGIjsh2aPIl/1QcnY120wrAXnsb894JdS/cgY8JAr7CBSnefcRCoZex1I5yutD6
	 JKb6ZlregLeDRytlnag7/8TtpGy+FuHdQ1Qyn/VjZ5kVID0oE+13UdgomMVhcd5xy7
	 LtZAuhYzqexYM0KgxqFCK9FyP/hIXylHF17dRaXqn2u/9DUoIS0HJy5BNFv5f2nqDJ
	 lM8zMs8xmZ65tX864dy9G6zrGWmTf+y29lq0b5JPlY44wknmOIxDIQUg8NPy+SMYBL
	 tfOJaPHHwpgBf2xTTkYnWoqpEw2RC8h4FhAQ7hWsSbbhB/gnkDOV4E4av9txvQSL3d
	 vKRCjUCDw9dcA==
Date: Fri, 11 Sep 2026 13:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM
 errors
Message-ID: <3c0d7679-b352-496f-8254-9ed093b1753b@sirena.org.uk>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
 <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
 <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tR11EWl+LkcAth9"
Content-Disposition: inline
In-Reply-To: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
X-Cookie: Piece of cake!


--5tR11EWl+LkcAth9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 10:00:39AM +0700, Bui Duc Phuc wrote:

> On a related note: do MediaTek or other hardware vendors typically
> provide development boards to independent upstream contributors for
> testing purposes? It would make it much easier for contributors like
> me to properly validate changes like this one.

Some might but it's not the norm.

--5tR11EWl+LkcAth9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqj7uQACgkQJNaLcl1U
h9BThAf9Fo+eBNlrnEZhwg4joxojjUQHlNk8Iq8KUhDWYkQFdP3nRgetm3zOyE2/
yz3VTHX6cVPMwbj/slZfi1iREPR+7nGCIxHQHBtYnBRJOUkR8CuiFffCTekyCn25
HgvR85pDb4sPjwMeIIkOYsJu3vltY6Qo12qcbFzxHpn8MuXpoF4L9nSPzXNwLfBn
aJ2OpyUUcj7ai0oHJxyJcPm2UYY1ILUIyNUbXKpJba+oQUPj85SHq2n/uxMq6Sxp
uIMfVeeJC0orUHrL1k/QtjUDnfnM2timr1a4EuWjSWrRrjT5IPabULX8a9fgv+Bu
5uNcGx8aEExMQWJvW9ke/aJps6F4rg==
=3Wkc
-----END PGP SIGNATURE-----

--5tR11EWl+LkcAth9--
