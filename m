Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AAF25B0B8;
	Tue, 13 Oct 2026 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891243; cv=none; b=VS11QLtEdDOY6RDPavcgt7BIMgXKfmQ4Jb558Wx0iQtgZAKI96v7VozRnb24kbi36vOaWiUGdaJ/p+ZnoX7tN+GLEl689BwMpI1bLKgHsAw+yUBSDa6WEGVLUGAaRVFTulh21zUX9xtxC6REQorMnT6p4eoX0rwf/EsqPwIqK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891243; c=relaxed/simple;
	bh=vHy6MWyWktfO4wu5CJ20FPYOgecdctEETXm6mRBAag0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0sLnTgPb4ZZRGzZi0/QaDgo30M7G5UBfXXLuNyJflEQI6X+MAg7ctxRP+6Ok5HPzvgaLzI5cPh731OlwGU9HRcHABtpJN1aRC3zsbyni4vCouUrb6gnuxwdPqnoUsJltwozf2S0gNmt5d7c0B/wXT4HJ47h/xUp0gT4PMGm39E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNG8IOrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNG8IOrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA31F000FF;
	Tue, 13 Oct 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891242;
	bh=ruX/XdPz1u9wSVSISSYCvO/r1Ffm3NbDarQT8v4moYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mNG8IOrfXJC46XBcB150FN6FIUAj4bwFJM4mGxQvSSIQJD1iUs8nvaMQ/drZKDvTP
	 P+ik6SFO7HsacVe7gymwssA4z+gYwq9wAqDTdVShddynXOwzhtnsNOmAMUZQFjrslE
	 nmGOxXZRyBMrbAvqGvQYB+Bhg2Be24DGdLVs5KS3DsxprOhC0Zkbw23s1jfxt+SYkU
	 B164LEGqDXcPJlfil/gXJszF8Cwiv6FDE8x+ImkJA4pSHssoegKRetwI45IQqLwzdk
	 GqyKAiMRuXzP5ru/nqTDTqEqh8Na2aSfHsUrnHCCa9a6CNE4oPohFyHqCw+5QdFihL
	 OSNeJz8vhQwkA==
Date: Tue, 13 Oct 2026 12:33:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <6e469d6d-88d6-4455-b49d-e40f9ee1fb8f@sirena.org.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
 <asOdosd0zROmuzu1@sirena.co.uk>
 <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
 <8f4e200a-c2fd-29c6-ee4d-a91137b90c12@linux.intel.com>
 <44fe29ee-9692-49f4-aaa7-7201c9cdcaba@kernel.org>
 <d1fa9d26-ba44-5cd5-76cc-1fc91ba9a6d8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f35ybG87NQxG6Pbe"
Content-Disposition: inline
In-Reply-To: <d1fa9d26-ba44-5cd5-76cc-1fc91ba9a6d8@linux.intel.com>
X-Cookie: Some equipment shown is optional.


--f35ybG87NQxG6Pbe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 02:05:41PM +0300, Ilpo J=E4rvinen wrote:

> It's not entirely foolproof though as the Signed-off-by could still be=20
> invalid one e.g. by being different from From and I don't know easy way t=
o=20
> extract From from a patch file (consider encodings and multiple From=20
> lines properly).

The script -next uses is:

   https://git.kernel.org/pub/scm/utils/next-utils/tools.git/tree/check_com=
mits?h=3Dmain

Greg K-H has a script a bunch of people use which is a bit more friendly
for using in commit hooks and whatever, I don't have a URL to hand for
it immediately though.

--f35ybG87NQxG6Pbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOFyUACgkQJNaLcl1U
h9AkWQf+J1u0+L2YaOwFFjbc2961nSU1taNfuBXVeE4RVUHzAyTwmqysElJYqAJ6
GaF/UzP95J+zTSow0ECPc0pz69sTWdlxu/o5moJVgDM/AA6/DCGMV+OHtJ7gKSEC
N7zd/lbid/nYird5S6dQhOqB/2VpRcnRwTRl4E6RPvAIVF45EgSbK1muAR9K53rH
UhaZEJRDJaLkoQ3IYyZ242HaGHTvilCN8MgFsYghd3jvrDWX8uQU2092DFgTbsxy
XBXxid5PwmUDLRt4y11VEQnfjmnBclkmr9OGx9r4h0L3Wga/yaW//vO9+5AQBxM5
JDeRtVLb4syBGnIk34BN/UahN1XVuw==
=sBid
-----END PGP SIGNATURE-----

--f35ybG87NQxG6Pbe--
