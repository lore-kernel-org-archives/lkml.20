Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263716;
	b=fPLAV6xbia5iyPFTqfvcb56va3AG6WeKsQ2pi+2LX3vNnShEUkGTgZee3wNu6VMGBf+b
	 dUg86G8XSRDawC0/E9aHO53DbJ+PzmQoc58RvlTjoBEIGzeocMNSgD5FOATsEOyHbm2us
	 V9vpYYvmbWPXWxwjr+5WT9afRP5X85xf5Xbz1FYi5XEqRo6TRkSHtMdWcxTuCGyoTG0Md
	 HfTIUAVwqflObKCEv1LMz3dyuPLA0pRNclvOwARNwa1Q19qs9Dr4n1fNpsju7SRN2LA+H
	 MlCn7krqWGTT1fl64c/VBlepvFnqup4SecOR/pOlGD5k160nWRANWWglOypKnOF3R4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263716;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=fQpTppDPw8YDlhiLl7nY8XQS2Ja3ohq3MPDeLqzC3bc=;
	b=pgHSEjQFOJwIVH9YyJTPV2BZqdFPfHyhEyC2/HLIC9lHA+kYKy8OVm2oAd67dAPioV+U
	 Q2HXK7AK4h0eImYrVGxorGpWBdfTzRsPdSLPirZpVcruCQAaqY9T3W5s32YYmDLcRYTAl
	 nVHq76/gnlXInE1K2CiC5TzOfN0M4Y0768wTOndonukqp34ARge858m9W+NsGyNsZACnW
	 lCXH5ctHNDk1GRiBNk3FnH20AqaW9H8vhhXC5HCl7Sb7+71/OzMv5tiUSx2FUGmFfssQ0
	 XOXwovX1RacGKiigc0o+xueAhB2IxJAwdKI4lQhFHFI5OsnJ1LYMwq7sOzaCU6QcOFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPfTp7AX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E921606A31C;
	Mon,  9 Nov 2026 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPfTp7AX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA561F0089F;
	Mon,  9 Nov 2026 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263716;
	bh=fQpTppDPw8YDlhiLl7nY8XQS2Ja3ohq3MPDeLqzC3bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gPfTp7AX/t1AFiXXWuc+n0MJxsY2Gx6DEuO3aO4AY9lURX8KTI7IwtssbLG6vtOuw
	 cwm652q1ho9Kl1hTF4Xe2MTNKhdPx7OwNRQ+S4Pva214mMoKoxYKKDqIwrhKtEd7+m
	 vObjJsQcJLJt/akuYrXUQpw3iZ7QBJJlRkuaOzKToX2rBhcHR2p/GNe8to/2C+9pxg
	 Rd1PsNOCOfhXFJhO80T/owzgE8CexIfeDM+OA5/89ZzcPc4Xnf6BERAerf3fNdReRd
	 xMyLwLt8mVS2exHKQlrFWKbGDUWsn22RrfJ2w33TeWJAb+FBNaCJ/FdlHyH+ElFdM7
	 QIxUi/dKweMBw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id AA6E3303EF23; Mon, 09 Nov 2026 22:35:12 +0000 (GMT)
Date: Mon, 9 Nov 2026 22:35:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 9
Message-ID: <970f8568-bc47-469b-8ff3-34bb2eb7a2d9@sirena.org.uk>
References: <avHgrm2PmkCsLyDT@sirena.co.uk>
 <20261109200324.GA950470-robh@kernel.org>
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
	protocol="application/pgp-signature"; boundary="erIxxcJPksV1gcmf"
Content-Disposition: inline
In-Reply-To: <20261109200324.GA950470-robh@kernel.org>
X-Cookie: Whoever dies with the most toys wins.


--erIxxcJPksV1gcmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 02:03:24PM -0600, Rob Herring wrote:

> It looks like a number of trees are missing today. For example, clk,=20
> reset, and i2c trees have fixes, but not next branches.

Hrm, unfortunate.  Sometimes things do fail to update (which was more
likely than usual today due to hotel WiFi) but we should still have the
last update.  I'll have a look tomorrow.

--erIxxcJPksV1gcmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavJKoAAKCRAv73Ows9A4
iU3VAQDwN+w5c7M8KXj4ZQ5LrfTx/ZhbJ4HvV2Mhjx6U90vL+AEAgEtbD+4Inmh6
mm8Up5Lj+aOyrJlMA7AuTvYx7Bok6wA=
=07+I
-----END PGP SIGNATURE-----

--erIxxcJPksV1gcmf--
