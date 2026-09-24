Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5E4B1263;
	Thu, 24 Sep 2026 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275974; cv=none; b=Av8JG7/HpSezJfkwUqaMtX1zLLYdkzhH65k2o7PBFYOAtyHvae87exAliv2PyZDuBzK3LjCofr3srCN4QrT5fCDbkMB1y28mxKmWanyKS46zRk64QVWxn5hpv5XdzWaA8BIedNqT9q8GuHHFVqgGpeygtZjvSt9SC+ZRXYJRenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275974; c=relaxed/simple;
	bh=Pl/xA3ygJKVzqHUMb12CX8WaWpxlk6Cj0meRDVwPfpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3usvyF/8QNCcdRELUp12vdQCyfZru2cuHoH4BNwwVSWlzOJfSWKSJ+fUG48f44wjG+HKh8A+uZwRfjjGIvn7oTN62wWmpAP5HoQZvJ7nK4s5VVPnuoTJLh0bSMNFGW8sR+DCfOh0L+WnPClYLyywHsCTBBCWp8MygqlYaH8jJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtK2tqQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtK2tqQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E5A1F000FF;
	Thu, 24 Sep 2026 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275963;
	bh=7ivzNNM0qOSmPLMUedRxuIJEs9Lzr+tN197aUMye2mU=;
	h=Date:From:To:Cc:Subject;
	b=JtK2tqQWIjA0p27pi1sI0awGJfI/kWTd2H1qAbKNGLNwoYHZcmSnKNSx1PkfXZtIc
	 uSqwHlMVTVwjQohikKGgVEwwD2bW5LmMbC5hCHKkgBU46SNOzm+2q0xRlwhsPh9jiM
	 /oqq4XRdjEbVtB4+uBCXeLz+UHIh6KiSCRPv0a92yE0rbNMzEr/Nl5huAd3lx/+fo2
	 updiMkHQTukesR75jZ77yrYmTeVvTE1E7kLFAhpolFpmXUV2Hs9WkzYe52fB0PaIad
	 k9vRSj0UAfpSRg4C5vGnWhQX6R+PKan/Td/wDCZN95yVHKnu7m0UHGYhpA2y2iR1ST
	 w0fs0x4ixgEmQ==
Date: Thu, 24 Sep 2026 19:52:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the last build
Message-ID: <arVxd8GejREjgvPt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZkVVwYKsmpLZIZ8G"
Content-Disposition: inline


--ZkVVwYKsmpLZIZ8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pagemap-headers tree, today's linux-next build
(arm64 allyesconfig) failed like this:

ld: can not size stub section: file truncated
`$d' referenced in section `__patchable_function_entries' of kernel/kheader=
s.o: defined in discarded section `.discard.addressable' of kernel/kheaders=
=2Eo
`$d' referenced in section `.init_array' of kernel/kheaders.o: defined in d=
iscarded section `.discard.addressable' of kernel/kheaders.o
`$d' referenced in section `.initcall.modnames' of kernel/kheaders.o: defin=
ed in discarded section `.note.gnu.property' of kernel/kheaders.o

Caused by commit

   69efc02bccc76 (module: extend module_blacklist parameter to built-in mod=
ules)

I have reverted that commit and 1ca4515ee4e01 (module: rename
module_blacklist to module_denylist) which collided with it. =20

--ZkVVwYKsmpLZIZ8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1cXYACgkQJNaLcl1U
h9B4ywf/d6kjVDceYh09vJa1oc4KrVeYh3QhzAn1xdEaMjVmR/wsmBZrcIXxsKVG
3dM8JqwzgCM3JxgYjDBQY3UWdlAvX5MetL7et5KhBLZKKFpYkTDQOQPp2yeUB9pQ
GL5lhpIn9TvjEUOpzSatR55CTZmKAIL7cIEPBZXhcWZbdfVZyyu+g/+tOiCw7Ghs
2aVqy4V/un28UwJmxm/pwrLu4brg+1g4c/nNeuBv6fUc7NBkC7YuFM6e2geNr77/
K/1SASgWxXr3mvcICm4VKtIQibrqf5SjuK6OHkObGVyxz/vEf4/p6tvmuYZymZ/m
/k3KrggLvC1owMViwCSUJWSIPu1j0Q==
=tW7M
-----END PGP SIGNATURE-----

--ZkVVwYKsmpLZIZ8G--
