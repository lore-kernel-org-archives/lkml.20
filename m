Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916205;
	b=CI6BJbO82pkPWwLRR0gBlgRtHi13SFwCW44TlNX2IMAorh11tL7zaENhJ2l5iiXCPdpf
	 MySw/2Vs+Kga7EBW/UXdHG2WWZE+qoV11+0jeJV0uod8mGElG3YnHhlAL+S2MilKq8XgG
	 3xYaPEYViw/Gp4GMEARMLqLF+UU43MHoSMNAc6B36lkofKWxCoL2FNoO0m9pohV0nZqLz
	 jMKUZemGxWAIS9IDJqyKjtQG4BLiR7LunQX7Z2je9lhRPNWN2u34vAGqPeOYxUz67SfUX
	 +MGHSO6Nb1lgsxSjsTv6Wgd/G2/ArdcYtMP06TO4Gb6I+cUoJPyrNGRZpsD4BAgHJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916205;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=E5XVEdzDo5JHpV+/pH5z1q3CEsULxV5blNLQaoOgStA=;
	b=UjkSHLT1A7yr9uzql8ZzS8ByE/eOZVEFxJcaXeewWSgahC97BTgVFepQLwXLNrLXtZde
	 ltWROu+Q6OPvtDnvchiqeAYiDnSrKnC/vI0NNb0XtE1ozGaFkTOzjvHOPEWUkCROPlrTI
	 MPXqNmpbiTqWdJIQZ2Wqf/+gj6Xcfm5KLTXBJS+KeBSP09B+/2wdE9irm5HP728fxR640
	 zjtNLJRYQUz9vReiDBNoUj6+c2T6TOEq4wXLIaerrRbRrQFl0ujMkNtLyxavg43QqXgUL
	 z88P4JGpkglyl451ts7ZHNwFb4p+x+BsC7B9GuLkUAk4OUyOfe/SduN8l31FW8daFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HssZkQHH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899CB606A323;
	Tue, 17 Nov 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HssZkQHH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23F21F000C4;
	Tue, 17 Nov 2026 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916205;
	bh=E5XVEdzDo5JHpV+/pH5z1q3CEsULxV5blNLQaoOgStA=;
	h=Date:From:To:Cc:Subject;
	b=HssZkQHHlOSGvb3FMoa3ps12JSnp+LC+S7ElNidy52mn0thnu4c+f4uoxr17qfdzo
	 3cU73x/t5g8oADE4ToJDb5qrgr5idPS7rbN8b7bs7zKC+KBgkWzEzNF7bCmrLrJPOa
	 dL7Rw3NQc7Pwi8AnXPRQ8+cdHVKPDv4sCepf4AY5is3bKhUwBMHruJ7rBatkDNZYbr
	 U+3SAngGvfqMoA4tHFsioSzwCxQOxOR6Ysas9kFcQApBjGiQTMkAcZdNh27cCNqgVb
	 yIMmyD2AqBtpTkNrnTbDQzQWHl+oAYz4Zb1h57zv7fEbsMobg/1LqLdehGclPGSF8p
	 PK32RvoZOpiTg==
Date: Tue, 17 Nov 2026 11:50:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Steven Whitehouse <swhiteho@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	William Chuang <founder@logarcheon.com>
Subject: linux-next: manual merge of the gfs2 tree with the origin tree
Message-ID: <avw_aaazVSUWavzX@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="VLS0vNsfEiKtuTyo"
Content-Disposition: inline


--VLS0vNsfEiKtuTyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gfs2 tree got a conflict in:

  fs/gfs2/inode.c

between commit:

  9e8fc16dc6b47 ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the origin tree and commit:

  e3280ea8b7396 ("gfs2: Fix NULL pointer dereference in gfs2_seek_data/gfs2=
_seek_hole")

=66rom the gfs2 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/gfs2/inode.c
index 75fb1a0c91425,d4678e4832b35..0000000000000
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@@ -2253,9 -2253,11 +2253,11 @@@ loff_t gfs2_seek_data(struct file *file
 =20
  	inode_lock_shared(inode);
  	ret =3D gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
- 	if (!ret)
- 		ret =3D iomap_seek_data(inode, offset, gfs2_iomap_next);
+ 	if (ret)
+ 		goto out;
 -	ret =3D iomap_seek_data(inode, offset, &gfs2_iomap_ops);
++	ret =3D iomap_seek_data(inode, offset, gfs2_iomap_next);
  	gfs2_glock_dq_uninit(&gh);
+ out:
  	inode_unlock_shared(inode);
 =20
  	if (ret < 0)
@@@ -2272,9 -2274,11 +2274,11 @@@ loff_t gfs2_seek_hole(struct file *file
 =20
  	inode_lock_shared(inode);
  	ret =3D gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
- 	if (!ret)
- 		ret =3D iomap_seek_hole(inode, offset, gfs2_iomap_next);
+ 	if (ret)
+ 		goto out;
 -	ret =3D iomap_seek_hole(inode, offset, &gfs2_iomap_ops);
++	ret =3D iomap_seek_hole(inode, offset, gfs2_iomap_next);
  	gfs2_glock_dq_uninit(&gh);
+ out:
  	inode_unlock_shared(inode);
 =20
  	if (ret < 0)

--VLS0vNsfEiKtuTyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8P2gACgkQJNaLcl1U
h9BduQf/ZIvdYEF8U5McVN9Gs80ah8OshHhWFjebbP/kUoXXkykXzPy1QnSLXeBV
LwmxM/uxiYZXl0CWyqZx6LAHHvb6DpBw1MX2IOG2Jil6gpFZ1whhgBRaUrtW3rgj
SIcO4CpciF7uSzsOHrVxbSMssNhgnDyzyNq/Dw9oQUdq4PjHb+DTEwerD4t3MECM
Aa5qCafgqukntT3C+VtayePtav5b+0DIjjsCkgd6FlF8HOfZD6WWTBNgSH6Jyvv7
AXFLJnqWWwsvo2oN7eSWRfhXCZVJusKMD7VhsFJT8v3nLSzqw5WySjGToDtnVXrV
+4JI0z8L8fkuzti8nQzdWnTprfRG9w==
=YEm4
-----END PGP SIGNATURE-----

--VLS0vNsfEiKtuTyo--
