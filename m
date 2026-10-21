Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590176;
	b=lJswkm4C7VJUBpLwRU2p6qYqfynawwGqzetso1Xazc6JTosJP7cxCYpG93ZSgcN/458+
	 d4oK9kQmHc0drqAAfUxqcnwo//hUy6hP9DP6zb8RZK5QsIiw2iFGgfVJPBxPEkkv2/CmF
	 4EJje1R1oJEuNoTDb2zTX+mWJ0Jx4S4YGdfzBOi/+26t4Jj3jRjQIBVCWWJs8liitnipJ
	 ppqDiArF3eC4bVJzR36iBoFeuywuctBRKmNXJF1dt2zIS2JXJ8begvVgiQbfM6KFslYC9
	 C4GkcQaD3/np3w7l5pWgnzBRn2fWmyv66kR/Yqca3QJvDxoP1OAKvWx0xWgztDVMGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590176;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Snudw6aa3dgyGN1atTUOiV1i38ybRY/ZUb2eon26EFI=;
	b=KgaAfmKUW2KmChhYXwvhoPYDWWzByKOdODzcClnpIqlFbotVseZggdSEgannoYClO46E
	 1kdG6Cke035vktdTlzeUqAq0+mTI2M3ivL/5E37qPUj9HFJwRI1ruMm3bY85pldhK5OcE
	 AboNwpxko8vyTHCnB8OflOm9tY+iCJXvw2bKmXm8YKj6IvHmv5QZPzkYvOKG8b4dOhnra
	 e8Ziyg7zbqsQ0xPq9TEQ0o9rYm7awwdPy5ELEDkT5OcNLbIPHDBJDefYCZKxj5PVaNb5m
	 QPagC459kBQ+C/VEXnhM08AjNPs/7CNwIuswBcHuqlAjyBvVuP1EuU/SVyfIKWDJeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REzpWRiD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342C4606A33A;
	Wed, 21 Oct 2026 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REzpWRiD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33F11F000CC;
	Wed, 21 Oct 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590176;
	bh=Snudw6aa3dgyGN1atTUOiV1i38ybRY/ZUb2eon26EFI=;
	h=Date:From:To:Cc:Subject;
	b=REzpWRiDaCSz2pAJ2JYkq2ePCd2Z7p9Mm8Bxo8e1Ki/hULxrBETqD8seGIP7hkBmP
	 Xcwsz80mSvyA4vA8hydnSweZuY6glqpkt9JGPV1o/S3DGcclfx1Om13SrWZ/QYPPY+
	 MRry35lnHa+hHaSqEuOVCdXYysAQnur2pNNPGaxgQ//xI+Rc4WNoH1oV9PUEV6pecS
	 bdQ+q17oHUoaKgD8p2RthMRBDMvvi1ehCIE1ljO6dkCP3kCZayF/B4pdUR6E14Igus
	 o0yOEUcNuFpkE5EeMEOnyhg9dvzJAG+vqUoqKERTBWKX8oJcribh4pXoQNUkKBSI/D
	 7B/zdpgIV57Kw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9366D1AC5997; Wed, 21 Oct 2026 14:06:13 +0100 (BST)
Date: Wed, 21 Oct 2026 14:06:13 +0100
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>
Subject: linux-next: manual merge of the mm tree with the origin tree
Message-ID: <ati4xX95dHM-JY3c@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="pZcSBVM0UYAG2rVX"
Content-Disposition: inline


--pZcSBVM0UYAG2rVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  arch/alpha/Kconfig

between commit:

  0d4c9dd06c364 ("alpha: select SPARSE_IRQ")

=66rom the origin tree and commit:

  35e340a47888e ("mm: userland pgtable freeing is RCU-safe now, remove left=
over bits")

=66rom the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/alpha/Kconfig
index 8fafbfabd1e51,9063c7bda4e41..0000000000000
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@@ -71,10 -42,7 +71,9 @@@ config ALPH
  	select ARCH_STACKWALK
  	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
  	select MMU_GATHER_NO_RANGE
- 	select MMU_GATHER_RCU_TABLE_FREE
 +	select SPARSE_IRQ
  	select SPARSEMEM_EXTREME if SPARSEMEM
 +	select SYSCTL_EXCEPTION_TRACE
  	select ZONE_DMA
  	select TRACE_IRQFLAGS_SUPPORT
  	select ARCH_WANT_FRAME_POINTERS

--pZcSBVM0UYAG2rVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCati4xQAKCRAv73Ows9A4
iSY/AQCzmE3RB/3lT/vu3TRu+c1hUE769rpAj/iGbcwixSNIrAD9HGuZvFLkr4Eq
uVoIvsDCq3QIbyiJ16u655OCSiT4UgI=
=b8nm
-----END PGP SIGNATURE-----

--pZcSBVM0UYAG2rVX--
