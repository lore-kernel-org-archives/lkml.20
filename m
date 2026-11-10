Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328457;
	b=Jqx+cJf0aiOqCB4Q3v1hwAqg9hlk2OkrQOvn5gHo4HcC0TQ8BBAJ2Uk/i68yebvI8RCJ
	 N8EdBD1MNJhyHxWIEtislpheRyPZ3pMAuZGHOzPBAHtsKR55xDgZBOjiX+2b6ga66LFpH
	 bG46h1UOZNQJMuaxZ8Gxve18Snnh9Thk9+x2dqLogDzSkEVaDPpU3iRPmFZG5h/D+o8Nz
	 5jvlPz3AyEHrzpggu7xV1/6lapvy38EMsDs+5BluHfeiWNsxW/w1WH3lwXSgtWu7WxGKc
	 99hwSjiUWET+bdbqM94v4kiY2uBtwUUmRdV8KCdutB0NKuH8Fw1FWa5KYkZo4/b/z3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328457;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=858hpGP/emzJlDPR0OjXj8v8qO8aVnb7/CS0vxybbl4=;
	b=lKhkyTogrLxM/jJHou0SttwRycG08PVz1B6TEGXhWQbphS0B0sUKoDhEAxO6bySpmQoE
	 6d1KjtjQq3dmEvwh1y2S7pmkfo827ZxUk40qL8VYkrAlNru7iYZR2BiBbcpM7reks2N1A
	 cxBR3Dp8MHRVIfJwnlIS2ktf8K49KPcvJzjb22jiVCgrzBJM7FYvJgWuRdLqRRvmWE/Yy
	 kLYfgIX3dpqj/y/NrLbgZ06SjJRpMZuQsR72QpLJprdUYIRmhkeszW3SB5ynyg0mqTeNs
	 I1hSm0krx2aG3oetij+/29rvuXVTsNCxnhko/kp0W+VFq4sT/1g3D650DlQ32JgEpgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e+z/YEIW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F160A5BD5;
	Tue, 10 Nov 2026 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+z/YEIW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05AA1F00921;
	Tue, 10 Nov 2026 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328456;
	bh=858hpGP/emzJlDPR0OjXj8v8qO8aVnb7/CS0vxybbl4=;
	h=Date:From:To:Cc:Subject;
	b=e+z/YEIWQh4JMXcMkub/EEBYz3ntqVTpbR6QSSLk7EIXrg5HAzMf4E4w7DaSALw3d
	 K2pBq4/1YUO8EdhCCowaCQgUBeKe1SQv0fSAAXGAOgV4olpY1f2FogvJE6CwwdPOKh
	 SshbNO/EPD08Lh9wNUZkN3XSbKeLaIpXbPDSou3eBludhjqEbQMjJ3kX4vlDwqN/Hz
	 YFn6NEJ4C5c5dXbjqAqoeJlXaDcmGZugewHHHVEEvkf1a0K2/faJqg/L+Wvw0MWWA/
	 EWvlvGaBRzG1InBDPucLVgHAfSsDbFPBJfblSqvH3HhlTe2yZ552A8coJQhGCYYbdL
	 f00eBYx0eGkFg==
Date: Tue, 10 Nov 2026 16:34:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Aniruddha Rao <anrao@nvidia.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tegra tree with the origin tree
Message-ID: <avNHhMIj5RxlO8Ce@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qOQS4AEnW0x6v/a6"
Content-Disposition: inline


--qOQS4AEnW0x6v/a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  drivers/firmware/tegra/bpmp-tegra210.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  ee98ea41ee3fb ("firmware: tegra: bpmp: Add ACPI support")

=66rom the tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firmware/tegra/bpmp-tegra210.c
index a33bb027c8b8d,fdc26c66f7c2f..0000000000000
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@@ -166,7 -166,11 +166,11 @@@ static int tegra210_bpmp_init(struct te
  	unsigned int i;
  	int err;
 =20
+ 	err =3D tegra_bpmp_init_channels(bpmp);
+ 	if (err < 0)
+ 		return err;
+=20
 -	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 +	priv =3D devm_kzalloc_obj(&pdev->dev, *priv);
  	if (!priv)
  		return -ENOMEM;
 =20

--qOQS4AEnW0x6v/a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzR4MACgkQJNaLcl1U
h9DwqAf9HmSzWIkc+5bjy0HsAEeeskuCDFloZ/Ptyfb7wVT8dk95Ry3GYVFk+MS8
uJtJ1WnwM8Sc80jRdq2HCi/dK1oJsjQDoG2HFG4AJFNd74SMuC1raPJ0M8eDEeN4
xVKjPaY5HIRrzE/DsCGF8/a9ircXnd8474VR74YSPXt0xOmbzKOzXJyke0U18lPe
zX+Ax5LFrY9zLNssaYSl4QOMB3CtsUpXQ+gtu8AtinyOb1wZPcxfqyFCAqufNkpK
XibkKwYZmh+5sEPbW7nxRR6RUbCq4wINA03Bf1OONL27As5m/P3htCPPANoG7YAX
icnuEmSQ4WmTU1mC2iSv22r/kwZFRg==
=K2yh
-----END PGP SIGNATURE-----

--qOQS4AEnW0x6v/a6--
