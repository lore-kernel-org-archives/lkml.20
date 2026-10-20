Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504022;
	b=XEMt5LgZ6HzA2WnPCbkr/EzWoiD5IuNuE1KtwHfSJbLboWrCzvoUkxYIH+p3wfgrpqw+
	 UFFcXrYZKHTzRsNOF6B+PsyCtz//+gbEC7/tn/zCzhSCo3gJjhZaPgPWFJy8f3xXBMo9x
	 t2qbfBzu0pW09nHlCh1d0S9k0q27PPnd2+9s1roI9olzGrWxSNn0JYr/atd4SP7YgtazB
	 CQJtIvxtYqATy47VB6WQnZpV7Sbg8YIXve4c7+KfOk8CViKwHHTN7lxBhITjVRoXV3BRc
	 Ls+k7HzGihV7si4cMFgARizuSBDBHWu4Au+FdFbSyS6KVbJPq2pugHDw/ZaJfsnMAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504022;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=iyg4H5SRUGivmpaxsEUidP1O3jWdLW1vfXgSuc6L4dU=;
	b=wo8WwvaqY57huAR6NBFrf/Jf0LfLprV47Ab/KBsHpleaLWFA1r8PtXWr9eptQkGtdqXx
	 +acDuDl2zlP6DZDaMfh8dmLgGNktwOXQ4LNx8IWz/vFYbwU/FIHrwDWNLBQkJMQ2BpMEe
	 HwSCIktLliPELit97HeyFur1mN+RDqMxXGbCwrrX+X27HVH4YoCMrI/wGY9pjk/DtK+FL
	 NzMYIjwgpY+cW3SGjR+kS/DKoSnq0IVodHarONnRdixV7nIswNK+J2Ei4NKgQVqdO3LwD
	 ZlsWVOaxZkd0MAmFHjnYIrcspskesJc4qnLrBupy5qSPcA/AIY3QJUe/llpXMgUUB3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Poz53Cht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C1606A319;
	Tue, 20 Oct 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Poz53Cht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754511F000C5;
	Tue, 20 Oct 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792504021;
	bh=iyg4H5SRUGivmpaxsEUidP1O3jWdLW1vfXgSuc6L4dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Poz53Cht7TcfqnYigoGhJhYLyYqh/rDzsFnoQsqJDptNeVckJye59BRLFJ7n9I/C4
	 0yAZgkLmcbqvl0YnpaNUQPKWTFkPQBsVDi/+VLytPJT71Ze0lorieEZV2M4hGD49RN
	 C8cOeBZAE9c+G3/1L+YFKeBjItsQSJheqPO4+3FcxWPPL1buUK4f29nQ1RZj3x67Zu
	 f1qoIvxmvbjq7rjv0HC5PiwYTyKPeczn7+OlP6IjoFTym5psfQbnvfyBMOtlHkjzhb
	 MM+/9sxlMWLKsgK5N0mUHwyhSv+yXepC+xdR42tuwP6JIPVrmnV82ul4THFbzKfC4c
	 hbWGI3jrpYhFA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B281B1AC5994; Tue, 20 Oct 2026 14:46:59 +0100 (BST)
Date: Tue, 20 Oct 2026 14:46:59 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <atdw08RMv2_LBc5A@sirena.co.uk>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
 <20261020.ij4euziuYovo@digikod.net>
 <atdmcnGhgZ9U8g_S@sirena.co.uk>
 <20261020.shai5aMoosai@digikod.net>
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
	protocol="application/pgp-signature"; boundary="eUVE/mekAGlK6d1P"
Content-Disposition: inline
In-Reply-To: <20261020.shai5aMoosai@digikod.net>
X-Cookie: You buttered your bread, now lie in it.


--eUVE/mekAGlK6d1P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 03:16:51PM +0200, Micka=EBl Sala=FCn wrote:
> On Tue, Oct 20, 2026 at 02:02:42PM +0100, Mark Brown wrote:

> > What I have today is f349c073889ff7694b470ca34dae9bd94d47b0cc which is
> > "landlock: Fix superblock use-after-free in release_inode()" rebased on
> > the 16th (I just tried refetching and there was no change).  It seems
> > very surprising that there might have been an infrastructure issue
> > fetching the tree all of Thursday, Friday and Monday?

> Commit 0da3cb3db77e3fe2202ddb637f6d27668dc360f7 appears in the
> transparency log:
> https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git=
/commit/?id=3D0da8a8d3dc37ec9a71b76f9739957297d64d4b73

What I have has made it through KUnit OK.

--eUVE/mekAGlK6d1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdw0wAKCRAv73Ows9A4
ie3jAP0dw+5M6ZHhgmpMvL4F/bOn9+CILeCyVZrUEY1uPnkoMwEAxZhkGYR52v7N
by/KokY3qkZKZkrAQfShoT9/TUwBlQE=
=5FJ0
-----END PGP SIGNATURE-----

--eUVE/mekAGlK6d1P--
