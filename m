Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD42D876F;
	Wed, 14 Oct 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990103; cv=none; b=B9ellk+tsOokvCPu7e1wgkKOxxuuoNQq335j2WlDoG/6FMEc7D25WrrLvPYVYidmKiKUiq3b6JVQZtIQJPU3WGhgq0Zmod330LoPSIWaFP17c6twiwUsexGFtBifxc3fRFopIAMub5+uJRD1a2Tz856a7yNGa7bybNpFybsuUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990103; c=relaxed/simple;
	bh=kFHYNbCD3f+N4pP0eKoXdRZh2cxybzaBQGUgsjBT2vY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CkjNEwWDFhatX5eVqsU1Htc+9hTUCditLbVRlQHhTA/anVVhX/345uAFBuwNE8oeexiWIZHgaPQzSmPl2Ri7eMV9f2vtNnTQCA7ny0OXu4O5eJvbjRgwrIX5+aLy3R6KTzq6cGdSFykflrkOEo9ok2hwzKfRQRC9f5AfEzM6aoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXzq2Nrk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXzq2Nrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F821F000C4;
	Wed, 14 Oct 2026 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990102;
	bh=D+UQ1uiZjZZhv1DiPiIgMmcZDQ7M/KRqBMzKq/JjAlE=;
	h=Date:From:To:Cc:Subject;
	b=lXzq2Nrk/C44HINaXvzu8W9ZBGwZ1mRhBdF+sSHbOeocJtA5jUOyFkfQI8cVzGH2X
	 M/ret1q7is7YCDf3javY1qe+riNXthmmhnG9pFFBeJXtgdpYYejlAZ5F4WWQvq1lC/
	 NF1cC3MlZ0TpJD54Lmv56OoltaTTg9Bb9zmbri0nJgY9hYHHnKdercPGceS7jAlzrK
	 8KhZXG0S6rpynnT7z+z3cjzP9+QHj/d/DbxdoHtY4Mem5XxRhXYGdEqGytxVZFvEJr
	 wmInf2udaYHAOYS9yIMJxNX9yr6yWmXslGiKI32F8/gOIOTffaKIyMnbYKM6oMErQz
	 k3Z1cyoKMiFvQ==
Date: Wed, 14 Oct 2026 16:01:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the usb tree with the modules tree
Message-ID: <as-ZUTCmpY2iZf_T@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qNG7xqlsRmult1qi"
Content-Disposition: inline


--qNG7xqlsRmult1qi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/thunderbolt/tb.c

between commit:

  08abfa5a161e1 ("drivers: Replace __MODULE_STRING() with __stringify()")

=66rom the modules tree and commit:

  41d5a1fc28100 ("thunderbolt: Move tb_apple_add_links() to pci.c")

=66rom the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/thunderbolt/tb.c
index 9537110a5aa8b,4da608ccbccbf..0000000000000
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@@ -10,8 -10,6 +10,7 @@@
  #include <linux/errno.h>
  #include <linux/delay.h>
  #include <linux/pm_runtime.h>
- #include <linux/platform_data/x86/apple.h>
 +#include <linux/stringify.h>
 =20
  #include "tb.h"
  #include "tb_regs.h"

--qNG7xqlsRmult1qi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPmVEACgkQJNaLcl1U
h9ArJwf+JUBvaXay9LRUY0njmrrf0XMZwqxs5y2Y8P6HTpyj3f12wgwD2JPlDBxf
QEp0uyury7dt4Yi/6DQo9O/dnzQTW7JgyBY0OwBE/1xWqxFX0vKCYf3hTXrUeZU6
U6ayuqwajUyL074tfWyZjup83HCXF0AdvTuIoUT7zpDCoh3LIa5zEcU7636gXLqS
Mo7muLallqhBbLDGQuOmF3qNIpbmkrOQkkl4ytklhFRufpLY/h+2A+VL/JuDAQZC
yEqD2qBG6E0LJ1qZkJGMIRy3AbuXpZq/K4SAH6J2h/8lU120/jat1kAxHhE/qLae
xq2uXpbu1/HcmV1noW9EG37S+EgifA==
=oDON
-----END PGP SIGNATURE-----

--qNG7xqlsRmult1qi--
