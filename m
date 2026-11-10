Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337882;
	b=bG2CsBjTYp4Qydwi33IOgbAJ26zoCMlUKzVPFJ5McSkwgDi8xK/aMz6Ns1ReS7gxlGBY
	 e8JU9YamLKUQS/2hYuL5VCezt9/CzlcvMOBB0bGXt0RmgT668wtXsgsiJfZUhgBc3W36R
	 LvHGhlVIydoj+uqZgFGuZaUo07pOCDFOTrwcGoCwFXT2S2dFhraG8qtLrfQccubQAEgpH
	 XKwvlE+HC5HmcRqtNQbm7GX7ZeF/4FJjMRt7/3g4PsaeK7pSCvfO84EXCTIujQGxWnkoD
	 TBw9qt0fneZjusC4V+RsaKq875zx06wqalsW1/emTKEpaACExut/iuvj8yA3fR3S4oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337882;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XIGm2kAAxpVHsgl8rLVGtSNefegxgi/Yap4OiVfb9jQ=;
	b=XQ4SnV/iWGsblQFN+0UYfhZ6Q5fAaA62gie+QIFQuQ21LHYJ38hUvzGksID2PzoouPJD
	 UNvI7CDQ7rnSXa2wnKVa2vMg212iofyCWFAy54zxrd4CLRT0OIYSmxgbC0vecyJzPRkG1
	 al+v+Pc7h2RbHC/UvaFr3dAgomgE0Wmb93l8Il7M27gETcjxW5zu/jlTyoGqjEMqlc1Hf
	 rOhqSdtzHzhb4v3AlkQ82rhglyTiNB6y0/j4AMWkyt+eG2a1Zf1Bul6xFPm2DqENvKDB8
	 cleFtDjtXwHP9E5wEB8m+5V9B83FbTYFIv7cFSbKIrTIo621aNbQjl3z9/z/Fyd+O7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PymGmf2m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E4606A321;
	Tue, 10 Nov 2026 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PymGmf2m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2CB1F008A1;
	Tue, 10 Nov 2026 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337882;
	bh=XIGm2kAAxpVHsgl8rLVGtSNefegxgi/Yap4OiVfb9jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PymGmf2mVPhJhqctWsPveAOhOEV9X65I+mS9VirXqxW4+XOogKbW3x60Q1MDPuLuD
	 BBBkjK61t61k8l4f62sLzPXJg33M6iaAbI31wECJJleBC8wxcoLg1qJtkh+kLAa2y7
	 xDJnaGUWMMRGA7Jk9B20RL63VZO8OJHPvORq6i8Tki4j9TAx6kUFq2GlQhRxWNi1WP
	 SzJ6dFH895jVtFIbZrdXcW2J6oODS7G1ERypFC8P62C8P7dIFStASbZNXNKUBasHUZ
	 RFr2JIStRF9Uf1m1NCxfJMByKjJe/9E4+G9ycRi+tKPvkymGc+BVJ4kh7oBvBJ7MbD
	 z2SKORsQ0qB+g==
Date: Tue, 10 Nov 2026 19:11:18 +0000
From: Mark Brown <broonie@kernel.org>
To: fixca <jaehoon1744@dankook.ac.kr>
Cc: Vijendar.Mukunda@amd.com, shumingf@realtek.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U
 (rt713 + rt1320), speaker still silent
Message-ID: <14e136c1-431a-40d3-b9a0-a4b5f41f726e@sirena.org.uk>
References: <20261110125459.3924-1-jaehoon1744@gmail.com>
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
	protocol="application/pgp-signature"; boundary="YYKW+HT9jAMWw2dC"
Content-Disposition: inline
In-Reply-To: <20261110125459.3924-1-jaehoon1744@gmail.com>
X-Cookie: You can't take damsel here now.


--YYKW+HT9jAMWw2dC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 09:54:27PM +0900, fixca wrote:
> Hi,
>=20
> The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
> PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
> created. The same generation 15Z95U has been reported with identical
> symptoms (https://github.com/CachyOS/distribution/issues/516).

This doesn't apply against current code, please check and resend.

--YYKW+HT9jAMWw2dC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzbFUACgkQJNaLcl1U
h9DgDgf5Aa48Ft2q8qW1SLCSPyNkc3HfSYCKIpyNaumSDn2Eirln9GBZgvgAOoSG
Q3HqR/V4LQuISArHFZ2i2wbYL6zTPVQ6ORaReCqsKh+5RDiluPUqFDKLDch/svT5
zWG398rkRhmezmjoUX5HIYocmAVT0pW/te6A8Q1ITxz4Hm3ftrr1IOLTrOKQ22Hz
tDfy4HHL+EW0QRk9lPRaUjEaC5a6DFA7VybhYoQVNvH6hOp+dc96ryOeqFOyjJl7
4zyt14L4bgx5alqb0gHQVJbHEQQrSshZfITEoV7LT3jWg8L0dsexOzQCbhlaECiz
Cjn+poS3xPRMzqOBikdeMZiKyR5npw==
=GPm0
-----END PGP SIGNATURE-----

--YYKW+HT9jAMWw2dC--
