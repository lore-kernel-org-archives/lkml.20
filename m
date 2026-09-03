Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C404D90D4;
	Thu,  3 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449227; cv=none; b=EsSuLQZXlH+8YdL+NFR89Um12WgWotpVOF/V+xIfQLJjztMYSQIkFpbidLWO4BYvHEyDwCV3toxo82EJzUtXS/XOIeBnQubyUP9XDmMwPZmenkGD8Y7+CxmKqV8/HPCZyeeQzWT8rJy3TCHx6FrDmIh1qHFiFtpK1isk01irYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449227; c=relaxed/simple;
	bh=VXvoPdcCrjpptlKgTz/MJPVs4MZ6XjUeNqU12hqWl48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbSgEq3q04yzrLdGjL5kZFmrsWGwMMTP2ZsARrZPMw2d3gHqY2I5qYq/JcXBY8JuEAw6EXSpkWLwZUmJYpLvLX++skCziR0GBgzj9E0NZiw96vcUviUMtv3fOVelIBX1TDFTS7exOtW+6uSWBa3R8sXh0pUsIxzvHPC63BDScRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOp1Dfb4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOp1Dfb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717CE1F00A3D;
	Thu,  3 Sep 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449225;
	bh=3bMTYhn5WAbTyjDkVLOK9rLhZbEkMDVtpK5GQ/F4RKw=;
	h=Date:From:To:Cc:Subject;
	b=jOp1Dfb4NH15diej3YgeENnxFcNTIkFmttPRzJ2yESf1lAWmFCs2FHMx/C+Mo9BzG
	 dWVQK5a65Qy63sXZ4kFbupm2h9jJzT5iBJAFcNJw90cuYeIJXu4r2zNCOwHebguSEc
	 lYK9tbxxV96mh6y39bcllzReERLhfZKdDpbtaZARg4AsgoUPFnKAm4A7DFl999ZLEV
	 x9nmJD3ovWtkPkrpJWDx4e1DJXnWRp2VaQQSOMwVUc6nuXCEZtS+FMafBpsujA2sdf
	 nVIUliSuGtsB9M6UPdzaIlsXeoWdhZ6sTfNNtbdNsoxM7+CVhRVgYko0mPnUvdkshh
	 DCXrumDlE3dvA==
Date: Thu, 3 Sep 2026 16:27:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <apmRxcAhCOxxY-Tu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1QgiDruDWYXHq3M"
Content-Disposition: inline


--G1QgiDruDWYXHq3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/l2cap_core.c

between commit:

  56c2b5831d39d ("Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_=
connect")

=66rom the net tree and commits:

  ddaccd985bb01 ("Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_=
connect")
  6696072ffe072 ("Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already=
 has conn")

=66rom the bluetooth tree.  Please note the duplicate commit which is the
source of the issue, it'd be good to look at your workflow here.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/bluetooth/l2cap_core.c
index 644e31160d55b,a22edd2baf5e5..0000000000000
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@@ -3900,7 -4009,8 +4009,11 @@@ static void l2cap_ecred_rsp_defer(struc
  	struct l2cap_ecred_rsp_data *rsp =3D data;
  	struct l2cap_ecred_conn_rsp *rsp_flex =3D
  		container_of(&rsp->pdu.rsp, struct l2cap_ecred_conn_rsp, hdr);
+ 	bool locked;
+=20
++	if (chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL)
++		return;
 +
  	if (chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL)
  		return;
 =20

--G1QgiDruDWYXHq3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZkcQACgkQJNaLcl1U
h9ApgQf/TE8/ta/Bw2L1P2eJmcrvnPGjuE6VuuQ7alsdc4rAx4Uo0kjVbQbVpypX
2VcE8E8vom5/EjtXGUsBfeZrRtSpLpaKtoM6jXXoWV2Z2Hg7lhUNcNpImo3uNXjj
RQipjKK3eg9PXcwYTerLdoGiV5Aoi3xZR/YZJm/+UJfuTJ33jAIsQpoEcProaUMa
8lWVbMbtMuxjecuSRLXy9LK6G08jg9LqkecwtzoIplRGtA7hKtJ3BUG284wMHM/j
TBY1hLVF/McITHjanw2xNsq1c5azJS27TrO3YI4dWcNt0sNMvhoykM7nituXxUwJ
OF8MNUzKmjWPF6ognXRs6ZSvYcyR0g==
=l91H
-----END PGP SIGNATURE-----

--G1QgiDruDWYXHq3M--
