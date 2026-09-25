Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7146C82A;
	Fri, 25 Sep 2026 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337282; cv=none; b=bW6OUyxAOzlIbSmNjvyq5fyK60sYpbuZyeB7W9DmVrYG59NCHBfc/tW/wUgnDEx3uwFoMR71SXOksi2/7NHw8Fl1EuZvdr54t5ge1juC2q8qoQyTxBUjdcDcwo9DAW768ApQ6u+zSVL0wB0xqy7yWuZgl4o5n4S9Du02diTG8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337282; c=relaxed/simple;
	bh=nfgLLjrwwD3uObSzsRmduhwcQTlr9Gm4soLxyoUaShI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjkJ5o7m0UMQgsYL2iD9lxCwSx+QNtcqSUbkNGSX5R26HJRpb51Av6KAXJQnBZLFGFLqIp9oBhyY5Kvp9GXAalwQRSSTWTzUWaMJhPgWH2L3aTVMYuj972xnF38yIBDs9W1EcuP6s6/ckiVdkBD78CbINzFLc4PAwnCco2iMvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl3uuik3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl3uuik3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8A41F000FF;
	Fri, 25 Sep 2026 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337280;
	bh=F04C+0aFaTUnhLw5ly1g44yzl5Lp7qeHMj0LQGPRSAY=;
	h=Date:From:To:Cc:Subject;
	b=Sl3uuik3nE9pXJ1uL2MqG9b1MpWHEXDWQBTp5SI3jr7QwRcbucBBSsNO6n8uXmo2T
	 df57ijDcM8+nvDL1/Owr1ZwR/WNeNqvWxKikd+rgGaYeZ3wt9EiXg86fhGdzV8uj44
	 sm+i1T+TDJqt7/Qbu3Cf4U8MLGN6iV0djBPrwsqEKsfDhhpesD/Bxj2nNt51Zotzxh
	 DsJBal9CTIBi9y5Xf6CzXBaeKp6rejfkFF46WIbiQpv0QdpoI2THmlOVmGU+gZudwV
	 piOAMpVnPp4fQj7K7LLT5AnYkDkl2PsA4MJ8f2b4kYzBxhmaqFVrbmAXeJLteIpdoi
	 BWZNxMWilwzDQ==
Date: Fri, 25 Sep 2026 12:54:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Hajime Tazaki <thehajime@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Ricardo Koller <ricarkol@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the uml tree with the mm tree
Message-ID: <arZg--vlHZ0LAzKg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B7zYKXDjuazmUcow"
Content-Disposition: inline


--B7zYKXDjuazmUcow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the uml tree got a conflict in:

  arch/um/Kconfig

between commit:

  f56266a653013 ("mm: make userland page table freeing RCU-safe")

=66rom the mm tree and commit:

  626ff2b34dbb7 ("um: allow deselecting CONFIG_MMU")

=66rom the uml tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/um/Kconfig
index 94b8ff70f578b,59d62c74fc41f..0000000000000
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@@ -44,10 -45,16 +45,15 @@@ config UM
  	select HAVE_SYSCALL_TRACEPOINTS
  	select THREAD_INFO_IN_TASK
  	select SPARSE_IRQ
 -	select MMU_GATHER_RCU_TABLE_FREE if MMU
+ 	select UACCESS_MEMCPY if !MMU
+ 	select GENERIC_STRNLEN_USER if !MMU
+ 	select GENERIC_STRNCPY_FROM_USER if !MMU
 =20
  config MMU
- 	bool
+ 	bool "MMU support"
  	default y
+ 	help
+ 	  Turning this off allows a nommu build, say Y.
 =20
  config UML_DMA_EMULATION
  	bool

--B7zYKXDjuazmUcow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2YPsACgkQJNaLcl1U
h9BG8wf/Qox48pXrDqjEIRnK9WTno37YSEtoMrsJAsjoQ0gFd+RDAy3uARh1sQXD
BmRhbVHnhAAvhrvO7Ib1iXdQCpwIjLINPfFgodKknRoCr/PaYceLE0jtJnZYBokq
S+rG0Fz9HFm3CQ5uSZVxZplSzKRvDMst20sYNjwpqcXWlJCXWSZOncV3DfAYLSV4
lMVu6DmGo41kU8ffA26y2l9lnqkLYmXfxg5bdTN0E34p7Tth8HMjt89mKzKarAZS
xpolX6dFOqOHu5injcnLNNsbkBTCS7mZM7Mw3MBHxtiPCfFHiLK99T7kYau/Zvyv
I9kHLZhfoLxJjKCd3ms9YTZMtk1O8g==
=jsjG
-----END PGP SIGNATURE-----

--B7zYKXDjuazmUcow--
