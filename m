Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A84E4C37;
	Fri,  9 Oct 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559099; cv=none; b=Axm8H7bkFvDeZ+gRFDd3mqwsAAfYrj/T1l9WxabB+uFx3uTwP0cAVZTJw05Ud1ydEWXwWP7UAffNzKzVFRTOyWRBqj1ClfyKHy6PynIRhYaY3dGBGyX2yjpAIyY5WRBiyBj4FGXBCnrzPKdUNndU3PSSrNa/FGLgIlylTj0ukuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559099; c=relaxed/simple;
	bh=c/JQbYrD20ZNrZOp/WwsPdHq9rVQbZ6QDJB5EhRpIAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzpDHrjSuMmvy3rMTobQjcoAvJhfjPpJwiVJuUqZ/+oHqvHs6QDt4wIRR/YV0MjYTTQFK0wgTmwrUf1uRABP4NeMWVTtBxkCvnvutW3JV0cSjfwBmr55k4qbA6TTmt9+uIkLRWHzCP6GbIz0trA/wRBIpxj7K6l3TvROVlJpJJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTSfg5Eg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTSfg5Eg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C551F000FF;
	Fri,  9 Oct 2026 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559091;
	bh=yKiYq3nBQChoJq5xFXwMk2/attlyMYfjvd8XtY2spr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTSfg5EgzpqMGgpYGcKSLicKdJ6I20SKyQ0GbPVAEmnvRN+K0pTHmi/TodidoVunr
	 tpuNi1AwAhWjgG+5Rmn+n2+uu5gDbc5hRfsTmUofaYaETr3QBfjVp9veRxBlGWNPF6
	 qHu3D7kDFSdshs4rhIx8FtDo2Ow5lmBB1WM5eMQCtuNjeT/QtYMVuxOok4ZD9ypSav
	 I9s+rnXIEtgVXEUi9x/60TP0tN3RT0/2nma/+2srECfFml1FxFG6lN18bNcdPBwVAA
	 M0930xKFP8KJ7sLxPlcm2ysxAnXlKtO2IEQe+9I4TGa7wIvfjUu+GDlLKR1o5iBFh3
	 kIIE+Nckg0bQw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 95CE61AC57CE; Fri, 09 Oct 2026 16:18:06 +0100 (BST)
Date: Fri, 9 Oct 2026 17:18:06 +0200
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Please add the kapi tree to linux-next
Message-ID: <askFroY6LlF-pQP6@sirena.co.uk>
References: <20261008142350.3067287-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XVlr3sPH8q4zVAuf"
Content-Disposition: inline
In-Reply-To: <20261008142350.3067287-1-sashal@kernel.org>
X-Cookie: You will forget that you ever knew me.


--XVlr3sPH8q4zVAuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 10:23:49AM -0400, Sasha Levin wrote:
> Hi Mark,
>=20
> Could you please add the following branch to linux-next:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git spec
>=20
> It contains the kernel api specification framework which I intend to send=
 to
> Linus.

Should be there from today.  BTW, note that https:// is generally
preferred to git - it tends to work better all round for both clients
and the server.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--XVlr3sPH8q4zVAuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaskFqwAKCRAv73Ows9A4
iRmOAQDHXug5gqF37vSy7cueORA9FLCwCM7EQA+P/qddqn2yPQD+PYRsihwDlNUq
uFVhyZHmjGGGW3myhJ/ggjVLmm+poA0=
=e1o8
-----END PGP SIGNATURE-----

--XVlr3sPH8q4zVAuf--
