Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8711041DEE5;
	Wed, 26 Aug 2026 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757595; cv=none; b=pDfiTAxXt22o/NJF5PnjeGAFAKsN1tSPZvOMGdfRtQhWTrHcWHyqGe3kYhZ54M6oMlYFELs0eaHx/Mt25xRCFlVAMH6eFBZC9n3lMQ+mg1mbU4mW6DMTmPwOQelClaedhEoyG5P+CvvJMq31I7kE4cgaDsoFhr6scPIkjha+pMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757595; c=relaxed/simple;
	bh=/EhSTVyMRvH1ZrsOqPUQS6lF97pGd760mnYd+lPjepk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4Kt/YB7K4Chp/7/ItnEdcMXMC6LvdyFVijv+rzJ/miQpxsLjetQ7ghizq0BjVAejt0Lej9dP2GXmCKwOD517eoU1fTsGS+YCapzrT7GDgImfhvKxT9XeAI0v8qIjP6IE0b4CPEQgvDMh9t2y2nuhU9QrAi/6qK1hVCUFCv0ImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baiGS0ec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baiGS0ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6610A1F000E9;
	Wed, 26 Aug 2026 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787757594;
	bh=/EhSTVyMRvH1ZrsOqPUQS6lF97pGd760mnYd+lPjepk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=baiGS0ec/NQRSuJUVRR7rANxNNCsCDdwxfmQPA48kfdREeX0JzQFy+Z5Pv2sXJzX7
	 OKCHJmyquRyluyR+QJZ+AW6mo3RUsRt6Cde1qJEB85A+jy4j9QA7xPQVraxnA8MMRb
	 ov1QOtL8CM7LS7fNI1sflnrb5b8PD06mbnKdc80VV7YpzjOaVFJ6oeBR+3vUN+j5hi
	 ozh0YJeCOFqdQadPCh+4YLzDXq5NO6HzCvMJa5xXQLZonAaPb5N+PhvqrThjEvL1fR
	 /xkLy0OmItlbF5gy3R6YCLZFdPqoIXbBSYl6jcD6wzjyfu6ny7VcG1s3sX4QHVCW+2
	 WAZRgyRI5TqrQ==
Date: Wed, 26 Aug 2026 16:19:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Sushanto <seditorofficial@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Fix OF node reference leaks for
 analog controls
Message-ID: <f85f13cf-15a4-406a-8348-ca18a9e3c3ab@sirena.org.uk>
References: <20260825141035.784-1-seditorofficial@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hiQ//mDqVcF3f7in"
Content-Disposition: inline
In-Reply-To: <20260825141035.784-1-seditorofficial@gmail.com>
X-Cookie: Obey all traffic laws.


--hiQ//mDqVcF3f7in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 08:10:35PM +0600, Sushanto wrote:
> The device node obtained from of_parse_phandle() for
> "allwinner,codec-analog-controls" in sun8i_a23_codec_create_card(),
> sun8i_h3_codec_create_card(), and sun8i_v3s_codec_create_card()
> has its reference count incremented by of_parse_phandle().

This doesn't apply against current code, please check and resend.

--hiQ//mDqVcF3f7in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPBBUACgkQJNaLcl1U
h9CZaAf+PNSZtr30Psfd1D71HSSAJAQqew/fXp6EhxqPNu/88MCkIeI/EPnvaQnB
Y0verE4QxaeReuDBqIF4GRjswmiVHYwxzKr6Xeo3ko+KASuiN8qf9uqzcDxYwv5o
TiYmunH7jLyZFfB8vzxlik1avzqRJpm86Rgqf1WAGjHPeyYbe89kl/JBE3a8BNE0
vY43az8n2RTferb/3Lu4GZ9iN3gXn5TYcSlPDHkm5x0NmrfBQGuZ6jGJnMP6pu2a
EuPvO/TP/7uvYP/2HSxBxZ3y+KD/uQMiE5yFlwLKrTNeZCkoupFbUeX+kYvX/0vM
SiXD48oPc7rskQVbSSumQiwa08T6dg==
=A6Rx
-----END PGP SIGNATURE-----

--hiQ//mDqVcF3f7in--
