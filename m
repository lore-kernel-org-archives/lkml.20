Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24433F8BE;
	Fri,  2 Oct 2026 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942285; cv=none; b=fGrtJAFpxvHaBkKwY+FoZQmKGboS6rXzqm8yHwePE4rnB/vtBTnIkItp9ndQpdsSTt1KJUmjdPRSEgMIIiEeRhvzzjhjgEu/JF0eXLHbzM9zIGLhNf1Egd163K7d4NMW00ZO/pvZOO/ZBoDeYjNp+cr/870wqnPIS9oJTEfcnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942285; c=relaxed/simple;
	bh=IDgVVrz2uLssWE5i/jVJJU+yOsHXT0qxmKJX/eAV9ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGecFW7ql5HixASmWipehr9kv/Nw7r1BhlV9woZPByl73pUiReYgsJy8Qm1t9xbDG232RRBXviMPWxbPh7IQCpSzA1bcbHnKI7EtFlBTQfDNrn+g4S3zuyf1aBU+JjZLAzOg3O24gotapx4BbcnPrHvpGO11rLXAOj0VA9TQhLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9xiJsmn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9xiJsmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3343F1F000FF;
	Fri,  2 Oct 2026 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942283;
	bh=ydK8dbGhrgDhsj/8beDwLlAXJVHl8tc6mfeYtxgUlUw=;
	h=Date:From:To:Cc:Subject;
	b=A9xiJsmnYjQzhaGRCXOmUk24ByH4hUE9tNXS9lE2QwxVHvW1RLRI4Jxw7ONIdVmSx
	 R8UGjiz1tMQaTr0ZzZcSX5zB5/Xl5OBTiOxt3rWxv/xDqJcTqqRMMOdQwt3SQfK39B
	 WILbTy15+Dj36bXQ3dYSGvv2IWHoXkkZwaF8vtlewIvb1d3xrryxdTZ0hLgBJyWV4m
	 a1WiqIMYKYhaqTmDpPpERFRFpiMPJiy2XL2WOajk9Uug+rgBHqB6oQgm/p3npbCpqv
	 fJxX+Y+F3yz3/NYprbiLtY2QNYEqDMrsUvpl+ig4EHOX1ffGbKVapJ6VPvqPZ+1swN
	 XPvYB/99WP6+w==
Date: Fri, 2 Oct 2026 12:57:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	soc@lists.linux.dev, Thomas Huth <thuth@redhat.com>
Subject: linux-next: manual merge of the omap tree with the arm-soc tree
Message-ID: <ar-cR1FLtZBS7dpn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hBYHKv2gBJELt6+"
Content-Disposition: inline


--3hBYHKv2gBJELt6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the omap tree got a conflict in:

  arch/arm/mach-omap2/control.h

between commit:

  cbd33c61480b8 ("ARM: omap2: remove omap24xx support")

=66rom the arm-soc tree and commit:

  9d458ad3ec155 ("ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__")

=66rom the omap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm/mach-omap2/control.h
index 3ab1c6e6dde67,e4f4b16958084..0000000000000
--- a/arch/arm/mach-omap2/control.h
+++ b/arch/arm/mach-omap2/control.h
@@@ -18,7 -18,11 +18,7 @@@
 =20
  #include "am33xx.h"
 =20
- #ifndef __ASSEMBLY__
+ #ifndef __ASSEMBLER__
 -#define OMAP242X_CTRL_REGADDR(reg)					\
 -		OMAP2_L4_IO_ADDRESS(OMAP242X_CTRL_BASE + (reg))
 -#define OMAP243X_CTRL_REGADDR(reg)					\
 -		OMAP2_L4_IO_ADDRESS(OMAP243X_CTRL_BASE + (reg))
  #define OMAP343X_CTRL_REGADDR(reg)					\
  		OMAP2_L4_IO_ADDRESS(OMAP343X_CTRL_BASE + (reg))
  #define AM33XX_CTRL_REGADDR(reg)					\

--3hBYHKv2gBJELt6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/nEYACgkQJNaLcl1U
h9DlKgf/RBOJ++/ASMoO8BYHxt4kuPobQ0Q03Piw9PJ3kdyV3lTju1LRjpqn2ECF
7/teDjHbWcr5I0wuRNJ8wpCwm/slnAZbtOSxX4fUYfgbPQutFsRjSvxhPH1ZyGWa
0VlJqzJKTuqXJQLTViZ0VWOmAgbbRvzCHl/U0EWSiMQq6xlbNG1CzB3VWUUbH/nt
ksNGfXTZQOE3K8x9kEGtxJ/X2gxv/wkr+mHtH+wv32aeDGSJTU3maPFsPNUalmWD
mcSwSi57dTkS9hQQCifZLlzX3yZ7uLEER+yQkRhkx3SQuwHbokMxee7TTmxXdYpL
SNFFLdksm0/hOIS0jGfAcp6vV9aL2Q==
=DjnY
-----END PGP SIGNATURE-----

--3hBYHKv2gBJELt6+--
