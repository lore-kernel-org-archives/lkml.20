Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503209;
	b=jFxywDljgVMeU121pxxxyg+7qop37pt6B5ASPQXyHDkzGzaefWftcyFyIINMHJaPkVp8
	 CWR3hd8PgxTu9c1NafzICdzWzUXzinMyd6vIRBV/COXaO047o2EFQ0c91P1B1JWa5Eqlx
	 0hD4mXo68qBKZb6k362UPUzzkYOvkrQFinregjuOs/8e3zxchdJc16zTSNHwaIiKlyYPi
	 zxlbT2X4AznTyWRSRvHFW02cw4MGJ4wy0IYb+5a8EG4T0C/3E/2gNP1Di11GEJSirVVMV
	 dgycmVg8T2c7Me8zf+Ug/jjortpNYkfP2ooMW9mIli9MjC6stCJNDq7CxtTpm8OnK7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503209;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=BCOSugtDU7tYNM6qAZB9kUtVTwATXbzzWeOKKEyoHy8=;
	b=Pe50FZK4iBt4eA1S/sF80XGKzT/NuJB32hRaULJp1cpJ8z1/kFmGt53Kgcli3i/B+Din
	 +ibSUVTTnIXb/+dZwZgIASGmbqHJthN5WWYx0AwCfYC6oLwCU9ZbdCPZ1kv4st00y76yo
	 GH27qR7srXC9JKBQ/WMACDLosxy3H04sUy86sq+By91Eu1Lzw0/9FUI1Jx8S246p8JFaF
	 EqdEy3vePzM3lECEBb78+vwJBVCdiKoI59SGMeNvzPB27amwbwK0awXtCm+kli+JgF5mG
	 A0wDvm31yYSbxM5JsoSyvqdSSDzM776ha+5FO8VIdJsMjvOAJPtW9FjTcTXijEJVW3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GAwzRXJ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81529606A330;
	Tue, 20 Oct 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAwzRXJ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419F71F000C4;
	Tue, 20 Oct 2026 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503209;
	bh=BCOSugtDU7tYNM6qAZB9kUtVTwATXbzzWeOKKEyoHy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GAwzRXJ/SXGdNFvE3WzUM52GqWsfodP4EUDmh/Sf1M/wBBzhKbiM+Oai8idRpVWCM
	 sO0lCnRRdXRb1mECDi4lri/nK2v1tNOYV5+/SARitQ4LjOOau9KpZbetSm/7UujSlf
	 g3WPrxWbOWGOejH2smdBRrW05gsrTN6T0Z0CnGT1DLSZd/P4/UccoJ0Uk+HS6aK+Y1
	 Chxek2IIoNklIP8LBc2bmER4950LXqEjQ4f96OwP9kH5hUsMcN6U9s+rNCbmc5SaTA
	 aq+J+tunc8a5bFKNKNtn1tYSIS6Qk5oFC+9F40xH+Ek87x1pXE4DG2CsWYnZSMM8dt
	 zaqCy6lixjAXw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9AB001AC5994; Tue, 20 Oct 2026 14:33:26 +0100 (BST)
Date: Tue, 20 Oct 2026 14:33:26 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	helpdesk@kernel.org
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <atdtpq6msC2Fhy4I@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="DxNPYEuw6LsaSOxJ"
Content-Disposition: inline
In-Reply-To: <20261020.shai5aMoosai@digikod.net>
X-Cookie: You buttered your bread, now lie in it.


--DxNPYEuw6LsaSOxJ
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

This probably needs reporting to helpdesk (CCed), when I fetch:

   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next

or go to:

   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git/commit/?id=
=3Df349c073889ff7694b470ca34dae9bd94d47b0cc

what I see is the commit referenced above being the head of your next
branch, not this other one you are mentioning.  I'm on the fra mirror.

--DxNPYEuw6LsaSOxJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdtpgAKCRAv73Ows9A4
ic6HAP9MZz82JxjEk8ctDHW434cjQo4zGi5CNPsara4JGwYZjwD/Sod9LMvQlBqg
KLt4X6nTY3fz1RVLck3SE7cb9Bn/WgM=
=S82K
-----END PGP SIGNATURE-----

--DxNPYEuw6LsaSOxJ--
