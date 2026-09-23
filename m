Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABEF42F6F1;
	Wed, 23 Sep 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156021; cv=none; b=OiixhJ5uvQmVyEZ2ZNHhZH/p2NOeIpECqhESUZqXrQkSHiznYEJu+k6hugAgvPL4wtrnvdPUSjvFFTUddy6NjZaxIiWVS9I4fn5Q0nYMse/Kj4GOIRffPtvXlOPq2I3MwcJyHfyR0qUuqGBYlKaRuIGyTk9g7pKTUnnUuvemfQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156021; c=relaxed/simple;
	bh=0/nkeNgeSGnCoLTiFcQsUE9LWEEwaJs0vl/FjLc59BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbrmR4Z/l3GyoTUGkb6ZE46cWVkp4tVFZebTWcnirTI21E/+VehSLNjyNopmnUqAnS2CaHY7cYacEnaoGOQAs13zXFO68b/Lo1MKxjaMTICuNdXv/Y3POZRY0hwl4VUnn8yqQHXqI6UPUyoINXh/eMiHQQeetyke6OKpUEtmlaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJrkW1g2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJrkW1g2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE41F000FF;
	Wed, 23 Sep 2026 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156020;
	bh=1Y6hoer9W3p2iG1kXmdaNP3hX1Lpnnl1CRtfRD5f/SU=;
	h=Date:From:To:Cc:Subject;
	b=ZJrkW1g2/ssNhIaH8EMfoc0Gt2JpjNiQE5/KZCbHo3XGIUl2mrByLb7aZO4lJTS7J
	 76dF2Ks3YMzN3sTJlVRtBGSXnzWOhdwCf3kIldljpMdRNu4x3qit25yS/fUvPXvx2w
	 CqNewDW9DHBJeNnM+81XsLXtG5D1W9aVUgqvtlDpBYI/JNEXcJFoeAurGm+ec7oif7
	 TnKjsxEXtwbD0DehG5FpJFJUx1UY8RJ7QIY9+HRh4UPBrbO4XpU7Oa7yc8dfhsLBG6
	 CeZsqXuoZV4J9yPpgMbm65gJNp5lM8uvCOPxhxG8Igny1BpF8qQEkFxA2TAKPoyFWf
	 w6mYh3rmCmoqA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D96F11AC5737; Wed, 23 Sep 2026 10:33:36 +0100 (BST)
Date: Wed, 23 Sep 2026 11:33:36 +0200
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Disha Goel <disgoel@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 vfs-brauner-fixes tree
Message-ID: <arOc8LIkMo60d7s7@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4aiWyxKaMWgQw3K"
Content-Disposition: inline


--w4aiWyxKaMWgQw3K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  tools/testing/selftests/Makefile

between commit:

  76ebb69da677d ("Revert "selftests/filesystems: add mntns cleanup test"")

=66rom the vfs-brauner-fixes tree and commit:

  73bdd88ca86eb ("selftests/filesystems: fix missing and stale TARGETS entr=
ies")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined tools/testing/selftests/Makefile
index 273853937c254,330d061f6366f..0000000000000
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@@ -49,6 -49,7 +49,6 @@@ TARGETS +=3D filesystems/move_moun
  TARGETS +=3D filesystems/empty_mntns
  TARGETS +=3D filesystems/fsmount_ns
  TARGETS +=3D filesystems/fscontext_ns
 -TARGETS +=3D filesystems/mntns_cleanup
  TARGETS +=3D filesystems/xattr
  TARGETS +=3D firmware
  TARGETS +=3D fpu

--w4aiWyxKaMWgQw3K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqznPAACgkQJNaLcl1U
h9A2RAf8Dwmc+ll6ZZvBoekMk1QEcT/D1oe478hesMlS4NjX78DvsQC+fyrOdchc
Oepj0uCMDRwJPl7RbHhi7/yRFJFlcZ+k5nZnz6mCmQCamA95VyeUJFka4TvqKSx/
nz8zG5rQ09wC+ugVMszFn58oH01xJnenZeDVDWTkOXyR95WPdrMpOaQvIk+rMqPp
kEFBqn1ByXP+YPj+mP1ysee4tYj64v1v9JcdRgexugLfnrwbKNWzJxoy5CW7HdOb
ZN0XKcppOnsLmR95BCqsg6EaYA49xPcM1KpyH0aLsOY09C5oHY5QPtJ0V7nP+0Qw
rrOuXzW5+JEa+YUd4axjfgc8Y18JGA==
=/58H
-----END PGP SIGNATURE-----

--w4aiWyxKaMWgQw3K--
