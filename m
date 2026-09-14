Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974523AD512
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395250; cv=none; b=IiF/3jQ0uEvHF+S0u100/PqwDE1HG9n/jdiSUo1AZ5zoB3NCzOuiI+acb49xEMjvqhgYhbNwZsZBKYIMR2klOgfAy3edIRHH8IlBq+AACd4iKwVYUUrVOMzm0XAKJVKi/o3k96mwMz1Rsj5IZlMV5qt4GNdfwHwxID0wHQR6wKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395250; c=relaxed/simple;
	bh=RWJvYQEWf+BFlQ0GdCnaYnksU7xLFIKwsEilIpVitzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw+bp1vSqWJB7eytQCTIDPRhA9X4gK4dw1KZ+MPq+zqxLtIf/d1KbXWnfzRAGL4ZPwSDZdcAwKcbyZjNrja5CqK0yMGyWMhLiU4g6CK0urXnfTIhTEpMvv8w/rq1TaZ1eR3joLqVjWFs3X1bTUXYx7PI98vw/lcgqIxi8QyuwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiCO6UA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiCO6UA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EFE1F000FF;
	Mon, 14 Sep 2026 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395249;
	bh=Fa4Q+i3u+KTemDw2Ubs4ZfKrlJ/SsNylJ1poUIGV+SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oiCO6UA8Q7+xGJWRolFBc1egiwc/ef+8AflkEeDT2BW6GYD6VbXm1rVs0lhiOXL/Q
	 JzqWnlmV2SrnuGNqi0yu9ab3tj0NOgqv/H+r5R32MPHih9TzBxWd5ed/VJD1kydK/d
	 ToCWR7N215/wgL9Bi++M553fgMwDNGdjDhskZR/1Ch5TnINVvXZNJRpfCJnYKiVN6P
	 qOdO0xTWGtYnsO9Xm/7goLS0wDmvBYkMiwDsPnjDo7acCLD8lgUxzlYOt5D3yu9k2I
	 SiyeqBZ/6FRrj+oHhJOboNfVJgUQ4gO79M05zsX8LhzK3rS8HDHkIY28a41c8Fa7Zw
	 3nzYPVFry2TYQ==
Date: Mon, 14 Sep 2026 16:14:03 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] sysctl: minor CONFIG_SYSCTL cleanups
Message-ID: <dhz3e4yd5ofwuvll74oeesyti5h6gjdcahpcri2t73mamrsz3e@mosqvttfirhf>
References: <apRNJWJD52wsaX3s@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ehgaeldjevl6zpa4"
Content-Disposition: inline
In-Reply-To: <apRNJWJD52wsaX3s@redhat.com>


--ehgaeldjevl6zpa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 05:32:53PM +0200, Oleg Nesterov wrote:
> Hi Joel,
>=20
> I tried to address your comments to V1
> https://lore.kernel.org/all/anX-II_sAoJQy83X@redhat.com/
>=20
> Changes:
>=20
> 	2/3 - new
>=20
> 	3/3 - don't remove the extra whitespace in drivers/parport/procfs.c
>=20
> Oleg.
> --
>=20
>  drivers/parport/procfs.c |   8 +--
>  fs/dcache.c              |   2 +-
>  fs/file_table.c          |   2 +-
>  kernel/sysctl.c          | 174 ++++++++++++++++++++++-------------------=
------
>  4 files changed, 89 insertions(+), 97 deletions(-)
>=20

This All looks good to me. Will put it in sysctl-next to see if it
breaks something.

Thx



--ehgaeldjevl6zpa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqoASsACgkQupfNUreW
QU8MHQwAjNph7z7iGor4vLhI5HX/jzjW6QAJT9xOfdN5uxRk/nSt075MjWU+QZb5
5qNyBHVdLQFDt9eNlsUcRcnkD/TqqvJekrC1Vw0LZOok2TLQTeYCVZiFs4by7l06
HAB8MxNR1dvb+SPPrf9BiCO2HnZxOZMyrDzTB/s2GHutvZB7HEkEC2DKUerjouJ7
nVBBY7uvkcplhJ91FEYaXVaCWn8QBGsimyckZVaPCa8czBgANQ1VEJEkUK3Jt9WJ
wlvSLXo2lqZiaovJSwKjrPwCSw6eby7VTkAjJuwHurrtj+h2xhEO1XQroNY9VBEl
mmYw2osSPKfmaNSJ26JE+dN7ihg16OvVGBEDkWNWSah0AB7QX8nFNFDErCR/Fhoy
9SFGlZqJxFKESlBSZvCPdmOTQsvouMNxfs5GMAtbb7WY96hblpv9b15sLkDAscyQ
z4GACutalvAFqyM4yW5YqLi0+tRdY2Lwy4SloVi9MFMftReNi/c446fr89xHgcC/
w8oQSE/Z
=nbu2
-----END PGP SIGNATURE-----

--ehgaeldjevl6zpa4--
