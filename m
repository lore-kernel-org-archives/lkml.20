Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490072;
	b=pd/HZsOAXS+Uv8yYTyxHqGoDgh5pEtOiBzUafLH33jv+Sx7SZB80hoEblM/FlKptKYJu
	 G/4+GvnaNOGWJXh2rN6xXrBQBQRhxc3xNaqfh+P0LzisWrXYLDSU90ZEbQv1cZPXyt5PE
	 LtmapJGGCUnRafbuTuUiZZylGhVeuBjeL4jaVmPygeRmX6VD7kW/gWAfSfufbD7+to52M
	 0rsYPBSSKVwHb01BLoQ9BXHBAQaYr3f0LnsvziyX/wfT+2V6NGVXwNacX3uY418AVR5GY
	 hcIF9tbco4Ugp5yyUCuf9YCDUgY/VzZTVWMbKn2BE5uBgvtbbpYtrtihEiMF4L99tuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490072;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XU02vtpj4WKj/rbk9TEtb2CY+iaX9oVs0uiW/nlc+38=;
	b=2ayRiIRD19YNuP6WqPHE+JmtbP8rJdHeDACiBSYLrpGi0LnXNnjRJlFX9AGnYYSSIMKB
	 a1vaVrqvHSjgL3mvcfDUlYh9aQlUMVWRfaSlCwpVDuJSdQ0xQE3qgSa1KonAEPP7JLS0t
	 a0ge+Pfl+I6SA4l+ZUzhNXnMAP0k9YBw3y/gFLMTFW8Gfbe4FIoEbP2TJsDlMZCdhfAAb
	 ZMDoGmLoNJ+v2rz1s/tgKiw3qIHp95Y1JO9YKAY9glEC05RZ/OP1uDznNtfSv5tNnW+BJ
	 9x1kjYCILrwDj0x5g/SKWH+CTv+v8Fxvwfb+LIWQDM1a4LvPBY59bnlgF3B1gTcELIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuGOs1lV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB80606A31C;
	Tue, 20 Oct 2026 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuGOs1lV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD3D1F000C4;
	Tue, 20 Oct 2026 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490071;
	bh=XU02vtpj4WKj/rbk9TEtb2CY+iaX9oVs0uiW/nlc+38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UuGOs1lV/boJy/jYSxjma4ZO0M62wbFXX2JbzpRWvo0tKGQKUJRDI40vvg1J7g60l
	 Kktq8aahK9sxls5oxBS8W+f/mZoLIi2IuRpRzNshXcxbuC5JXkGVd/reNW82dRoizM
	 xq/F6CY17vCRNs2u7j/GdXpYw1iMfcHGZi5of+DWc5Y7u9bGnAWhgp/MfIAU0FkagJ
	 bY6HsafGt5uBawjbUbpnhqZmE9qgKS7w/3CB0IuQaLhtw9MK1nL58p7QwfVe1QdxdQ
	 q+QOVtQCNzmcfoC+LflnAZwOAawgl4pbPKEemRcYgMPXitfT/SIMOsY1Jq9GC2eTJW
	 ndBun4aA/NDGg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 29F6E1AC57D0; Tue, 20 Oct 2026 10:54:29 +0100 (BST)
Date: Tue, 20 Oct 2026 10:54:29 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <atc6Vczti_EjFrQq@sirena.co.uk>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
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
	protocol="application/pgp-signature"; boundary="WQI98jbIRqyKTEdn"
Content-Disposition: inline
In-Reply-To: <20261019.Za1phooV2oom@digikod.net>
X-Cookie: You buttered your bread, now lie in it.


--WQI98jbIRqyKTEdn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:11:20PM +0200, Micka=EBl Sala=FCn wrote:
> On Mon, Oct 19, 2026 at 07:17:09PM +0100, Mark Brown wrote:

> > This issue is still present today.

> I removed these wrong kunit checks Friday so it should be good now, but
> I notice that linux-next still has the next-20261001/landlock merge
> commit instead of the latest changes from mic/next (which should not
> conflict).  Could you please confirm that a normal merge works?

It was broken with whatever I fetched yesterday hence me reporting it
still broken and merging the old version, I've just started the merge
for today so I'll find out this afternoon if the fix worked.

--WQI98jbIRqyKTEdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatc6VAAKCRAv73Ows9A4
iZ7PAQC7hbnLj8m6w6Yt74Ts/HWwpLMG9QcILnyDuKClQ2hiBgEAoE8XxC1R1lzq
m/G7Q90zXPhCg7HSRCZ5iDUiUAM/TgQ=
=hz3m
-----END PGP SIGNATURE-----

--WQI98jbIRqyKTEdn--
