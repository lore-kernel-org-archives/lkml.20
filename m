Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501366;
	b=Zz3Q8lzZ1lmyICOqtz3LxAplOZ6KHQHwMLAnhacYdZGHWFJRQcJLDJ6QXEuELptN9A+6
	 zI6V50A2s5cAwUEZN0sZOwrFZDr/9goTEYnZZ+j/36XQnzIiljDu326rkb+dru6WhFWNk
	 pSp5mFf7Eb+krzeCvt4z8ROJN9Z3nd/M4qCEC3fpps+yQavM4x5UNkahNUnnk5rTZG/d4
	 jBN7Uqq9Irm0oszC2dTXAO9bcMZJ1ux2lRebV9UoqnRCOTjycmaF5DjPc7lYj0EtaF0ur
	 DQqOABzWPN5vRSFpQDnahD7l0/ZJ6lmNRrS1rM16awu2WuSZhcyZcXGl97bXk2ZY/Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501366;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XjqD9mi3a7SlFw0+plMv68LLvm4shJazjoeG4jpWusM=;
	b=BZjCjW6NGRhollbJN5rvCjmB33gj629kQ9FTOK8UhTVy/jrQ0o5ryXAp8TBH/B0y5zg7
	 nchaeecd4eU6By48YfEDv9cZJdgbWi2YtVn7Wk3ZUfMEfIgoE2bchkYshZJ/y2iYoXF7P
	 UkF11RJyar0VisPRZpVOrOnxZDMKkix2iBhcPtI4rVJrhomp/i6o0IGHS2wVB4CN7Xs47
	 UlS/cdwjbFWXRRJTOImRMJxX5uc9I5thheQL7gU2JstObZjuqzycDOqEzQzXI3J5NZAsG
	 vzLYCrIbCYSieZfq7AMaqHJkCt5DbEalOsgZsav72F+iI+pYzFUPF47SUUct4glDnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbzYp3XP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2E606A322;
	Tue, 20 Oct 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbzYp3XP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3878A1F000C4;
	Tue, 20 Oct 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501365;
	bh=XjqD9mi3a7SlFw0+plMv68LLvm4shJazjoeG4jpWusM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbzYp3XPWbQAu5Pzb6tJF1leVUTbsxHy1C2Gwt1vOaLXmF5vueonKBv10wEM+F2FC
	 S9L5BlgxMGkqkC/qGOqgWl/zlkbLoi3rH5edPqJGrJIglphwzUYvtg9K98Plo+FqKA
	 nZxZTAic4+psAGpRR8g5eJE777qPpGqrlECC+B/GfeXphcECfIfMDPX61Bx5QBcO59
	 ZsJj+1gVs7FoP9TmOshQKUzjUzXnukgg8j9ZRV31H8A1YbWtmtNEpNdvEsLqvq5p60
	 6pDbVglkeHPJTt2yVWZykyh7EQ0LW3+CuC8sFfC9aIfcIX08I/uVYm7DScpwUJkP+v
	 oRO6v1ERQQ01g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 012641AC5994; Tue, 20 Oct 2026 14:02:42 +0100 (BST)
Date: Tue, 20 Oct 2026 14:02:42 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <atdmcnGhgZ9U8g_S@sirena.co.uk>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
 <20261020.ij4euziuYovo@digikod.net>
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
	protocol="application/pgp-signature"; boundary="fXeEPFHiEPB49S7C"
Content-Disposition: inline
In-Reply-To: <20261020.ij4euziuYovo@digikod.net>
X-Cookie: You buttered your bread, now lie in it.


--fXeEPFHiEPB49S7C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 02:28:48PM +0200, Micka=EBl Sala=FCn wrote:
> On Tue, Oct 20, 2026 at 10:54:29AM +0100, Mark Brown wrote:

> > > I removed these wrong kunit checks Friday so it should be good now, b=
ut

> In fact, I updated mic/next Wednesday with a new patch series addressing
> these issues.  I only added two (unrelated) commits on top of that
> Friday.

What I have today is f349c073889ff7694b470ca34dae9bd94d47b0cc which is
"landlock: Fix superblock use-after-free in release_inode()" rebased on
the 16th (I just tried refetching and there was no change).  It seems
very surprising that there might have been an infrastructure issue
fetching the tree all of Thursday, Friday and Monday?

--fXeEPFHiEPB49S7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdmcgAKCRAv73Ows9A4
iURzAQDux0kCgieWr1FCAJaprrrTfJ4xbsq5YVg0IAuk4W+rtQEAnKwF2gvzNgOl
hzlpLYgUxIQYNpoWnjmN8GTLZYQpUg4=
=xqp0
-----END PGP SIGNATURE-----

--fXeEPFHiEPB49S7C--
