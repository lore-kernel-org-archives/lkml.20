Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8100513567;
	Fri,  4 Sep 2026 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545491; cv=none; b=Th5RmnZ1qqPARgDNQ0BM4zko8WwjBgEziS1QA6C3YtlLxy8Nxnbw5KkGrZDzVqekrRpMOnOy3lUcV+giGa/nK3FFYIggKAudFkWyKAGm86YcSZ3XDgoUf4q++iNOwUTYfzawTGGQPuSq+Ysd6IZtPmBsQQiUIayZwrBEFw2amgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545491; c=relaxed/simple;
	bh=jnCniGmQOU1k0NJkMtfHEcR1S/DHyr4/MqcqvPhLlUQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLnQZOK5jX7SOBka0kXfOD4NNbbQdxhJOzy4Y39dizfWBGZhrWJQePeRpnzORWf/x0aOyCWKlZQffylHEwUCxJc/HoxdHvtToiYzbqlyBRZlz9FdevHQFXf8cDRSeYb8YI7JxUlZ/Q+ne7TMHZNx8GW/aKHyF1es5zLiNQ9V/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyTpnHgo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyTpnHgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976711F00A3D;
	Fri,  4 Sep 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788545487;
	bh=w2ns4DtntHHwb8lx5E6p70oxztYynWIPJeNwRINXmNw=;
	h=Date:From:Cc:Subject;
	b=gyTpnHgo/ynu24NsCrN/3Xf9KMMmUoMD9dc3nmsOgg6t3M2tXB/Md7D3bCjneGzGw
	 48p8qRW04a+fnO9SwKYIP/6IsXvSBJx9YI0BhhzpyPVW65MsGALLGkiCx/vm2OhrUg
	 NyiyLbJDWc2IwOTzL9u0Gcv3Su4AMjQEaGHy8ppFTag4j3GbDQcNhhyAAOItiSQrHu
	 fDLE2gx4KeHrgHKU4GzjT1p6ZA+1zJJbsM30BLiRSI43wGwdsH86F1Oxa5fiTE/fgZ
	 PwgFCJne/rB1h8Hkcxqt7qttuiPqfBK7em2VjEzHXrCIhLYdle+Wh4lHIEJfrbQ/uB
	 2nj7w2fmmmvyQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C31C21AC52F1; Fri, 04 Sep 2026 19:11:24 +0100 (BST)
Date: Fri, 4 Sep 2026 19:11:24 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Disha Goel <disgoel@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the origin tree
Message-ID: <apsJzO0mzuBJhH8l@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dWCIgy2z/1TVt234"
Content-Disposition: inline


--dWCIgy2z/1TVt234
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  tools/testing/selftests/Makefile

between commit:

  4ff32f084c158 ("selftests/filesystems: fix missing and stale TARGETS entr=
ies")

=66rom the origin tree and commit:

  5550456dad376 ("selftests/filesystems: Move file_stressor to dedicated su=
bdirectory")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/Makefile
index 330d061f6366f,08f228765a930..0000000000000
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@@ -35,11 -35,9 +35,12 @@@ TARGETS +=3D fchmodat
  TARGETS +=3D filesystems
  TARGETS +=3D filesystems/binderfs
  TARGETS +=3D filesystems/epoll
 +TARGETS +=3D filesystems/eventfd
  TARGETS +=3D filesystems/failfs
  TARGETS +=3D filesystems/fat
+ TARGETS +=3D filesystems/file_stressor
 +TARGETS +=3D filesystems/openat2
 +TARGETS +=3D filesystems/open_tree_ns
  TARGETS +=3D filesystems/overlayfs
  TARGETS +=3D filesystems/statmount
  TARGETS +=3D filesystems/mount-notify

--dWCIgy2z/1TVt234
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbCcsACgkQJNaLcl1U
h9B/lwf/bCRGl9V0gJsKuny8y4i89WkECroCECpsKc1nLLVDZhbXZjjqnitnK4Rk
QoA9RReD7zA0fGcHeh8NdLavD6YHSGl1s/lEDSkhro7tC0XFQ+sGAjdH8HFmyi5h
cCPZhDIt9Lgu29ExX1qGS9kvD072Lj/upRclTDnjK9VFbdhtlIjvMTzioM/8drhn
EPi86iAKsQkuIQb5EeHdipuzC7q8SWPqWT2CvcA1WB/O9EJeij86Rqw1ExsD6MpJ
tUEMSjLK4ATx/rhL001d/so+tv6Kgn+SsuEnJPWjdGoBReNeQJ+w0SD6nvav9/jJ
VLEp8wias1DQQRP7BWGSxP8ltZCT1A==
=4LVj
-----END PGP SIGNATURE-----

--dWCIgy2z/1TVt234--
