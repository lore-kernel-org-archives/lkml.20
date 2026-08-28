Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093654519A7;
	Fri, 28 Aug 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923706; cv=none; b=Gp+ovaQFsX0YK7nvdOsX/f2k0PrXpaqVU5k1C5QmZg8TZKcyJF9LuA/dVpbxNcp2sMSZGfvTOP5+Q3ydVKGSuhGkR0Dzz7i1iGIvhO6eZvS9eA9llCkMHdzsM/pLbt+H79UAgjfncrrxNA2YENSDFpiYoB9aG7/5tAzHT7XjPIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923706; c=relaxed/simple;
	bh=RiODUeUjABImH3qJorm+rpf/Q+s6DZ0GaVitJhb3ils=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twPJ9aIF217mBFB7x83T8Q/QOFZtqCe0CWfzQ0WA/W0bL7aC8ABcbtOCM0JebLCScy4jt1fASVR+usEphNxosGdI/k38n0hxMemqymfXgLq1+xmrQwbmo5tWqWfsjkUdJson/EAhcfm8mYKUam3EiaoUxLg9hSt/g3CnblZt1P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGLVompB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGLVompB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9881F00A3A;
	Fri, 28 Aug 2026 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787923693;
	bh=Z9XFHw8193gUVih1de3Wkahzt/dMfC/OsH5/5SmruHs=;
	h=Date:From:To:Cc:Subject;
	b=UGLVompBuIlNqI4klAkC1VUFCdA0wWrTXHo5QYJ5uu4aWT1eCBTHApoj5XlledBJ3
	 uiKx6nmn0lgNIpH9BXHA+IQUcuQSPP08CzllSQOdhmR0Q9ZiLGoj9mWkt73bRRSR6f
	 QikSSG/4vN3r4oVCY7l6kh5Fj2splzMFXQ0RxA0OnHGahjiuO+31JTelcUvnqL3xt3
	 M6iRkenY06+rrmLMxKjzAy54fS+jflWROOf69aiYNaVmj5jQ09oicYqrfnTN03gyNF
	 yOjgoEk5gxX4gTV5nhBRI8JIQ/hsrODDWsJwSWiVVbZ9/6rRuuWcw2oSnvKtUU5jD9
	 Q54BI/bYbBGxw==
Date: Fri, 28 Aug 2026 14:28:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>
Subject: linux-next: manual merge of the pagemap-headers tree with the ceph
 tree
Message-ID: <apGM6cq5O7jTNtcm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+UCGIS5SAdnqZAv"
Content-Disposition: inline


--H+UCGIS5SAdnqZAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pagemap-headers tree got a conflict in:

  net/ceph/osd_client.c

between commit:

  9ec08b7499a62 ("libceph: validate OSD extent maps before cursor advance")

=66rom the ceph tree and commit:

  aedeab60c2cc3 ("net: Remove includes of pagemap.h")

=66rom the pagemap-headers tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/ceph/osd_client.c
index f36ce5ae75680,86b681a56e206..0000000000000
--- a/net/ceph/osd_client.c
+++ b/net/ceph/osd_client.c
@@@ -6,8 -6,6 +6,7 @@@
  #include <linux/err.h>
  #include <linux/highmem.h>
  #include <linux/mm.h>
 +#include <linux/overflow.h>
- #include <linux/pagemap.h>
  #include <linux/slab.h>
  #include <linux/uaccess.h>
  #ifdef CONFIG_BLOCK

--H+UCGIS5SAdnqZAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRjOkACgkQJNaLcl1U
h9DFHgf+McrcF8eW/8sg9IRf9V8H7Gn1x7teOccgx8ZhCWkKBGVadUYl7+UbeLo8
/JdGEiXwkeQM9ZjLKf4H3Xad//5OtKVeHQIblgUFE5YPp7nHTBKunJddIyi4d4+7
CkNPOqt4O6UCgt5QwGLDH7WhKkS2XDrFRrKWGpoIWyM88Iu3L++xLJuVWamd/smu
VqJp96sM1iw5lk1c1CG/POlNT7SXgI4MR1qM0pYkXz6LL0bh/JB/X19u2KECYztJ
V4VoVtHbqPoaxZIO7Y000BfZCqCYiMbIUUsgmOb5kXjLFr9pr435qXSVImjIwWMi
vv3+tqqc87pU8UMLqLzpFCbKlIYZjA==
=SPCb
-----END PGP SIGNATURE-----

--H+UCGIS5SAdnqZAv--
