Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7D2165EA;
	Fri,  2 Oct 2026 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944196; cv=none; b=Zh2zd6c+QHsljDW/1JzilDBtdo4V7Fk0de3f+k5dgY4O0ubsV33JYj5r0g9E1DoRBZi5EZd74XwV+bs82cvHqMYz6M+zDe91hrB+B35krEAY6kNf8Hfc4kVM1N6rwtmBR9Uwu6tu4gVWApENnuIQxgow8b684bZPbWGUQPFMtok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944196; c=relaxed/simple;
	bh=8PJ7TznE2oxKJO1rYTkuKeEijdM19SGXUp8cRMDD28Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5y7ZrqjeEi1nsi2Zly5o5iHctqXTbLep/qtgwTHycHMVzAwJwuMbKv7gbO7WQZaLvS9yCU1+GEzyXr6y+2GU4oNYruPOj6O8QgTbXfsNOefci5t2y1ZlJwFIrIus7bnDBN6IdGyRgw6nBN1CoJI7UymAv7u2cL6pBzcvRrw9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a49YZpsk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a49YZpsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EAF1F000FF;
	Fri,  2 Oct 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944194;
	bh=6maPuX9C1HUAZMzdSb7AEMap5OJh4AIH8YuUrPQSQ14=;
	h=Date:From:To:Cc:Subject;
	b=a49YZpskB3HgJFPg2apPY/Wt8dInHu5cBIwFkYr3vZV7EDFTXXffpzBTeI5NgKxZY
	 RnroVRt6QGo+x8om/ennGge8KBTkf1JV7nVHBlNjE+JHqQ9NYhEjgE5t5UVKHl+w6i
	 IAdgQ9Ri7YN0UQFKsDrPTR9yKksiJq/1SA2j6WsvYTw2I77kr0J3rDlTGkcfX6T0pY
	 R8AThj/1e2+NC5Tp/iBsDsKkNRnsmqYr2XZPbtBlMYBEb6POks2Ukc3p04jIc3dlMR
	 Z8GzSj5KjBkdIK4O6Lghi43JXFrFurbfnvSNME7kvep46U4R7DyYsYdK/YTpxD30CK
	 L+NYCD62Fdo8A==
Date: Fri, 2 Oct 2026 13:29:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Dragos Tatulea <dtatulea@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ruizhe Zhou <zhouruizhe@resnics.com>
Subject: linux-next: manual merge of the mlx5-next tree with the rdma tree
Message-ID: <ar-jvtxea80okjIP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FocvHxqln2iCUjNC"
Content-Disposition: inline


--FocvHxqln2iCUjNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/infiniband/hw/mlx5/data_direct.c

between commit:

  08a978db86e87 ("RDMA/mlx5: Remove obsolete 32-bit DMA mask fallback")

=66rom the rdma tree and commit:

  00290b9ff59ef ("mlx5: Move data direct implementation to mlx5_core")

=66rom the mlx5-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(deleted the file)

--FocvHxqln2iCUjNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/o70ACgkQJNaLcl1U
h9DCvwf9EaG30KSAL7FOibMDId2d+ERTd9UeIxN7Jyt5Yk/k4lc8Z940t8lvvQBQ
YYHctmNtOxPB/OR2Kby5sCKy0zqHMpT+HyLgmUUx9NX3s8Alz7WwwGRz8x0oE4Us
NyuU/XwiNiMmXhSYc3cRkQ08M9mCg3njzG6esYNbovIuWSP7vh2SPpd0lh0RJkCP
L1UVfC/KIt55krqmJlpGfLZWm7WWDENWf38u+1rcRUOUjeGh0SIuHKjTgqzqx+d1
WQjM5e7vbPfpnwUdj1Sc2kVzGOd97lyFlb89XLyGhzjYq2Z11otbnv4fChs5aLv9
iFS3fe1y4JosFywEhkMWtGhB0ICCgQ==
=huJL
-----END PGP SIGNATURE-----

--FocvHxqln2iCUjNC--
