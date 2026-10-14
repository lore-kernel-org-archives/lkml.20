Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F539184C;
	Wed, 14 Oct 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990089; cv=none; b=ESjfr4RsMdxO4U4BQwrAHxdz7yif/+KTdUIclKnCdvwl4/ETZLkqvLdqzGQ5ci4aJIANaKRylsxsgJN3VOQtlR6Qklg8id/rx3m4u7zwNzSyzJALQDQNsidUE+f6mhgJqNGakhtfpOUiu0X2dgS0rc06zs/j3gQXOWUKEaV4hqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990089; c=relaxed/simple;
	bh=mO3MhpGmoGNp9PcIRit1tV/rJYeS4uv/eFAEdF0LS7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpnOBsgUPHMrk44e5ab5soBYFB4rBKtNeXyIYInS2K7EAI8rnmzK/zOl+CiHHaCJBwkjTpcNzHvDor98gMgValVr+RvXtlDpYi177KIYCZUrMHDV3YOvstNdQ6ZpdVu55vmtGNwX087UUcnkKAVt+exe5mREJ8lo0Tjs+w0LO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy/tEyE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy/tEyE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49401F000C4;
	Wed, 14 Oct 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990087;
	bh=uQtNw5apxFTSDYwVirEsr/tZDEYPYvkyMkL/ct4mmQc=;
	h=Date:From:To:Cc:Subject;
	b=Gy/tEyE1a95dvOF8JXe+mDWJcHZ21YgpcolKMv1cBfqrCENMwATaKfgHdA9Fw+1c0
	 NrPhXeODEN5Wu9COlFD4fZSks/OeOq+FFVbXkBip29GiP+0gqC4HjmL9Saiw31+y8j
	 0ipRqku1wrj/96PvrY97AsN3abH05oHFJ2ur7bYI5hrYUyNwnpgOISldMHDcOUfFkO
	 eSu4hSHC7j+BpiM3SYSNvmweIAATH9Au0p3Txvin27QWoJ4Xqh9Vbj/FbHCa2fAL1u
	 W++RNODVv0qBTjNHEJvs8JLs6hn/YPjkgC8E1KX/41XAoVwBqqz4GlfC4EE0pW3o0n
	 QE/xjlOGfpIFg==
Date: Wed, 14 Oct 2026 16:01:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the modules tree with the drm tree
Message-ID: <as-ZQxI6N4rR0qNN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jh4TGVSxnZtLjnkx"
Content-Disposition: inline


--Jh4TGVSxnZtLjnkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  drivers/gpu/drm/clients/drm_fbdev_helper.c

between commit:

  6ccc5b5fc1d36 ("drm/fbdev: Move fbdev helpers into client library")

=66rom the drm tree and commit:

  df2908090cda3 ("Linux 7.3-rc2")

=66rom the modules tree.  I think.  It looks like git got confused by the
backmerge of v7.3-rc2 and the file move somehow, I can't actually see
any relevant commits in the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/clients/drm_fbdev_helper.c
index af8f15c947f03,36009bb02c257..0000000000000
--- a/drivers/gpu/drm/clients/drm_fbdev_helper.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_helper.c
@@@ -31,10 -31,11 +31,11 @@@
 =20
  #include <linux/console.h>
  #include <linux/export.h>
+ #include <linux/stringify.h>
 =20
 +#include <drm/clients/drm_fbdev_helper.h>
  #include <drm/drm_atomic.h>
  #include <drm/drm_drv.h>
 -#include <drm/drm_fb_helper.h>
  #include <drm/drm_fourcc.h>
  #include <drm/drm_framebuffer.h>
  #include <drm/drm_gem_framebuffer_helper.h>

--Jh4TGVSxnZtLjnkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPmUIACgkQJNaLcl1U
h9ARHgf/Wc4xGw4DOU0BgcqwcQ6fj1Vw9MhZbqMRCXKMTGF3WxTxdO/GUfEJ0u6F
IC98G54BG/9T1xJX2TOI3qIOso/wdqpzgJR4eVlZxIsM8jZqiOYvobp+iVa2iJCI
cFi44pYUkDpGUb3Z11xTkPCsltkbqlaGv+7utrkkmGbZ61cmCJTxGhOklkOUGjWn
gT0EYj2/B5c8srP0XgvdlbAP6+R+L0PJeCEEPEpSLZIpL84zWjGyixv/lervY7jf
GILs5pBKneV34kmlQuEE06gd8sN1Y3i2i9+vM27PK1in7gBhFhWBFATyq6bYMomN
AznPbYsdofreA6tCSWCqSFAw3+QmMg==
=KWN0
-----END PGP SIGNATURE-----

--Jh4TGVSxnZtLjnkx--
