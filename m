Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663953;
	b=VmMNQMHCkKihnppGNu3hWMnUcsznQ4ykjSHTUMZpMnWuwdrZOM9Uj9rt/idcqAGIwml0
	 TM9gIkrF+Z8IGjbZXI5EcXZyKX8JUalMkAcZLJgLfl6pUpTcdv55yX8nsfQ7zVxncfu8i
	 sesQVjFwA4fhBk2qG7oNeJxQpFNyFR2LDVkmldaPDSdsSOQ2ZIJD5NfcVrJ6+qNMWr/Rx
	 9MO5dAxVhL9+ebncVY60Czs/7Oq3Blzt5GF/KUZluEwguCIg4Iz1pmXRvoQjC3ZHcOUaA
	 yEQJjRDLqIy/MmhCoREW5S6FSlJkxbRyBiKvUCha8Y+CKRxIsPczazk9PRWO1AhiZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663953;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=I6LBF614diLS3quciUgcgqsEvchlN/YGmM2r8ZpLtfY=;
	b=I/bXcVldOMLa+YzRGdDCPR6oEx8udLU82HNWVSbiCuTvWHUyk8TiUJ9YtH3CZHjP2GkJ
	 sVZu/YHPSxIrAzvxjJ93YJ1Hb7sIY7YGmgtshjg3V2KXV/f4mZCdmU2a9j7lzPCEJjPdf
	 5C2+QKeg1wnA8I17w3ZhuBgIXwx55VqIR/zjEL/+YY18PiIa6JZP+KkBiJJaAiC3YHpu1
	 eRLrGdGvwEq69RWh9HtsOP25192+8HkofD9RWe9vB03b9sEonU0fLhFbCYptbZd3flYU7
	 IcVosraVagVn1Thw69OpaL5L/4NCfq3alMl4cEK1hqrug+2FtLKgSmOn0AUmAhM6JyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Net8prDW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5016606A329;
	Mon,  2 Nov 2026 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Net8prDW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB9D1F00A16;
	Mon,  2 Nov 2026 23:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793663952;
	bh=I6LBF614diLS3quciUgcgqsEvchlN/YGmM2r8ZpLtfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Net8prDWHW2RnBjO2AJbpCjLDeyMBIav6hXEz1mpOzvY6kMhR/ln9kbVOEZTvHr/C
	 wFoRwdVuF0C/GfIGYrRlplOGse2AQ8v57YKzqqemMpJ+8t44E8I+gJmYYd1b26FQ2s
	 2pK4TJ/fuMzwfrFdejd/7BbE+cKMLHD3v1JTRzAMVk0ATvgdXSDx0WyYFGrn0uaGp6
	 phCeFxaSh/G6x673bErBL+xVg0RkaeVaVY6o1p3uQzqi1JuojZzA/Ybe95EFRBJGoy
	 MtzAhABwUiRV/HLmHrClIGbLVF23hwvTe2TlKhGfi9+gNwmeJkjrq7AJnW7F8u1UOS
	 XQ16GX9Gp+HCg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EC462253950D; Mon, 02 Nov 2026 23:59:09 +0000 (GMT)
Date: Mon, 2 Nov 2026 23:59:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: tas2783-sdw: use the BIOS speaker ID in the
 firmware name
Message-ID: <d01ea9df-e5bc-404e-91b0-802c27c103fb@sirena.org.uk>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-4-matthew.schwartz@linux.dev>
 <179366321499.2186205.14199496267448130552.b4-review@b4>
 <b501e25d-022d-4f37-88f6-f82af3d101ff@linux.dev>
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
	protocol="application/pgp-signature"; boundary="1wLPnUTMbwHeqAeX"
Content-Disposition: inline
In-Reply-To: <b501e25d-022d-4f37-88f6-f82af3d101ff@linux.dev>
X-Cookie: Whoever dies with the most toys wins.


--1wLPnUTMbwHeqAeX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 03:54:12PM -0800, Matthew Schwartz wrote:
> On 11/2/26 3:46 PM, Mark Brown wrote:

> > Mixing this in with the fallback decision seems confusing.  There's some
> > cases generated in the Sashiko review which look plausible though I
> > didn't fully work through everything:

> >    https://sashiko.dev/#/patchset/20261016232416.2628603-1-matthew.schwartz%40linux.dev

> Thanks, didn't know Sashiko feedback wasn't in-line anymore. I'll take a look and send out a v2.

It's per subsystem opt in if it sends emails.  TBH I prefer not to send
it directly since errors can end up confusing less experienced
submitters, and it's not appropriate for people to spend time fixing
detail issues if there's structural issues but those mostly need human
review.

--1wLPnUTMbwHeqAeX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaukjzQAKCRAv73Ows9A4
ics7AP9i9zM2Xme0f0sZn5ZJt+0924Y1B92HbFpj8qLE3Y8n0wD+IqylMHmBFcjr
EvLTxHFT40f1QK+JYbfEPP/lNmBRvAQ=
=D8Fx
-----END PGP SIGNATURE-----

--1wLPnUTMbwHeqAeX--
