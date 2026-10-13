Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B2519E0B;
	Tue, 13 Oct 2026 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912011; cv=none; b=kzGFkLNAR5ScPxmu5F7OFgCy72P9Q7Loam4U02JM21roTr9V5xFtLZibXgeN0QrQ5zj7stFrsB9dG/d084UJtcjZ425BcJ2F/sYwCzUhjOyVmopVkpMAmCCWitNzAPVh9raTbAbMO95K5po7Pf1g4741/L7THofPC915FHlYGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912011; c=relaxed/simple;
	bh=t0cGaFCzYu1pS2PRaPMhgelVe0llC2xQaULFYEtihv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFQpYUCeWh9fb35Jcd8lP2G57s93npQfgtlXjDO7fX6guAFYNjy0kOZop2PLmx2f3G2ztrL/NLhC3IsBGvj07Z4UCVoJnG131BODrfpT+BQ/AlRbt6SPt6mHjBhdDEcMLoRncaBrkmr+0Nu2hiqOBL7081ZMMYLQuIpYdRUgYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq0oFezj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq0oFezj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FE21F000FF;
	Tue, 13 Oct 2026 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912009;
	bh=+n1HefB73czLSrsKSb7EVG6zCRETDVIEKXXVgdISk1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aq0oFezjlcddMr1flNZC7JSDuzWE0jZe3P3ATg4C9OM6NVAK+Lyw7PShBCnVNDSYE
	 I0ELaMeM9XxoO1ghSxjw6o9stMWJf/nfpxrniD7ZhJ+GPPFL3zlPuisVzkCkouS+iT
	 otkcxbMV/B5JILf5w3/e6+8gFLLm6dlYY762u6mwujfmFFZ1SYqO268LPZETaRBjsM
	 vBLQTY+FVCl4Yx81FSNoc57NzZggQMQk2NH+PadKQDDLBIaHKpupk/wO4q/MgYOqe3
	 UYZstsP+IHyuZu77HURsgj2y8Ov9okM62WAUGlzDT2pCnm/N7aseFbcQBoqfpDETUz
	 Qt4fa+espIS0Q==
Date: Tue, 13 Oct 2026 18:20:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <c4818b35-67b9-4413-bd36-c17660fa6a4e@sirena.org.uk>
References: <as5jnDJEt1iZZqZk@sirena.org.uk>
 <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4fVUm2g1Z/7NZEWA"
Content-Disposition: inline
In-Reply-To: <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
X-Cookie: Some equipment shown is optional.


--4fVUm2g1Z/7NZEWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 11:07:56AM -0600, Jens Axboe wrote:
> On 10/13/26 11:00 AM, Mark Brown wrote:

> > rsrc.c:(.text+0x1a9c): undefined reference to `io_register_dmabuf'

> > Caused by commit

> >    4bb7978523289 (io_uring/rsrc: add dmabuf backed registered buffers)

> > I have used the tree from next-20261012 instead.

> This is already fixed, which sha did you pull?

I have 8ba95aa196dc8f3fb50f123f9fd32459d65a49e2.

--4fVUm2g1Z/7NZEWA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOaEUACgkQJNaLcl1U
h9C9Jgf8CCjeMS0h3hwug7cpj52riNkyvHu60f45kAEnBdzF8ILgfCYBIUZgV4CP
KPFUb4GepLDp2t9hMR/gKhwAJ3wYH13w91SaQ0cxSG5bImcpPOLrc4MnnTc0vXHz
Rvh3GygXi1Lr+4o4YjwwGiRFsPj75GIuyaOMfDp26J5uNNwtGl10KHwRjVAccZ3a
idjfPpqTiBTPYVqWQ5ruU9sbAX1hzDOFbm1QFEBqzwEa4p4qzY2FgelrjsiBgNm4
PVihrbyWUK/ntDCUNZA2CxnrH6P69OQbE9PF29UiB4+CiVNIYp6BK/FtxySJj2I4
EpzbZEr9YGQTzUJLxfAVZED+sNd9Qw==
=6c/y
-----END PGP SIGNATURE-----

--4fVUm2g1Z/7NZEWA--
