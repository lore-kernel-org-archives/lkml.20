Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE245D5D2;
	Fri, 25 Sep 2026 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337222; cv=none; b=PwWB+VoxBzUZAZI/LhB7593wsDQetIYJ8neXQaptRxBaWdX25FPYSWTYuItykjJtRlrP9kw7XN4sVf7MrKuT+mQO91VTV0oaSDAR6W6Z3xGK0LSGvRiF600ER8PPRt7H8ZGHIANSTy5i2yl+yeqli5bemuO6ITKvjK9hDSU2Weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337222; c=relaxed/simple;
	bh=cIarb9fQjdq8uHq7IPIYoCYuzpHpeEqPkGOwHPmaHZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IcHkqLvbcAjh55tQolQjvsN5KyS04kdX3FasheUhC+MahGYfizjMJwujjd1GyLQlWg3KglDBw+06yFs7Dm9SZAtlcOGTMdsrvZw6GrCZN2m/PtzrLTIGpudfrvD9+ccGSIR5H1xoNoVEbjQPblEXsozWlge/myFP9XKCFWvycqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIypwPRg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIypwPRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E98F1F000FF;
	Fri, 25 Sep 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337221;
	bh=ddAnMA6PcIqWfxfj1uKmKCq4oROZArw5U0mVUcUf51I=;
	h=Date:From:To:Cc:Subject;
	b=FIypwPRgt2lRZsrn5K6y/EVl9+xzvmjF9bE4upyxgL+V5pCzGx6GzTg4vk8z2AL6I
	 4muPFMfJINRasRSNdGsrXvtlhhT/4h2iRv+8ZfvRa9nwPV8YJSofKlPNWvlS7NzHH+
	 d3nh0TM/7hWRrtyI4ZlPjI8ExRIjRnm4pJxE8+3ConhuNuNhSv+jwr5q7csHIjlbiX
	 Kf1GNSZSADtd0X9CTT7LyCMzHln3NfkubVMFuMe9b8XKd0Wh2z4g9Frh0d2RJGq3PC
	 sC4X1fOPp1owxS0cs5LfE8zx2S+49M5MI+doG+nL8Bkc7kku3ZnV0+y8HggQ7cuHjG
	 qMf01bTKdZd+w==
Date: Fri, 25 Sep 2026 12:53:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <arZgwGn5MfEneJsb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kBWQL1iiMNuDby5C"
Content-Disposition: inline


--kBWQL1iiMNuDby5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/pageattr.c

between commit:

  0d227834a51e9 ("Revert "arch: introduce set_direct_map_valid_noflush()"")

=66rom the mm tree and commit:

  714153dca3a85 ("arm64: realm: Move Realm memory encryption ops to RSI cod=
e")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/mm/pageattr.c
index 132938b32eb16,14b2a3801f404..0000000000000
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@@ -272,12 -272,10 +272,10 @@@ int set_direct_map_default_noflush(stru
  		return 0;
 =20
  	return update_range_prot((unsigned long)page_address(page),
 -				 PAGE_SIZE, set_mask, clear_mask);
 +				 PAGE_SIZE * numpages, set_mask, clear_mask);
  }
 =20
- static int __set_memory_enc_dec(unsigned long addr,
- 				int numpages,
- 				bool encrypt)
+ int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
  {
  	unsigned long set_prot =3D 0, clear_prot =3D 0;
  	phys_addr_t start, end;

--kBWQL1iiMNuDby5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2YL8ACgkQJNaLcl1U
h9BjYAf9F1hZPsPx874CM1XRoeB4c1xcuyIqlfQIms+t0clfKXsWvyxMGYllxFOv
SVEEME8N6l4dLiAtBzdABcSOYt1J9uMsDYZbLENRtGkRhTYa/yTfT/00KIu0kKLm
ZwvtpWgXD44yd/IfHQd5bGpW7A94uKfjpLp9CiSBqyncuJMLSWTOJFktRpHzZnxB
z1mkvptvklFlrTUecukB2LemR/AYqVT0dGE9PlafTsfYlmj6HCEHftuEhPZ/ghrL
0qRrEuWwU7WyfcWCf+LYGwYRuhoxpOwO1E7LHp3ihgeDraWzoECa7rlMO2gU1Uw3
83gjShgznE01xmOL1zlnYT67eIaF/g==
=9rgj
-----END PGP SIGNATURE-----

--kBWQL1iiMNuDby5C--
