Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A44D37B8;
	Mon, 28 Sep 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604940; cv=none; b=NEaf7EECL2vN2MfOuKEijbaP9abT9Q2NDJ9QLwLlUdj1jl1sqQBX+fUWO9K/zF8YZf1BRANAcnZOZFSpTpJrHwuASufAIND2+RY6KzFJ1q9YHx2dA++mI366ejPZZzBrgC1nRy5Ms0ZF07LlWHr6OmfhioEv+fkBiMcqChfR7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604940; c=relaxed/simple;
	bh=H0zydXEwNUbOBR53FnDNB3BCZ6u0wDqJNmZDjnb67v8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GO64/xBdqvoDIk0dCY8VqhcgyshAl0+m9SBKtU1pbrXyfoV/beENQgCirIbIZ5Pob9/bFGfbuiWluGm3jDDpKmVbK/pvQwtWewmORKovI0jBg5Xgi9nrudVniB2sqCAEycJPh+ZXqpu00bZNT+kZVVFXFNLBO9vl901NUcaz7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUSNbgUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUSNbgUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C25F1F000FF;
	Mon, 28 Sep 2026 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604939;
	bh=pa93twYBl9vXGYqrAAhwXNWJ/zu9dg0Ri5hpbsU7T64=;
	h=Date:From:To:Cc:Subject;
	b=LUSNbgUtsmbomOGu5BT8fu8bY9DRO1mRNhA1+9qhvEq+1Z7n5+AuPVjaddkFaE9zc
	 jAZoz/GfbYdur6hovR8PgrTpU/aD6E/2mASJGKOUJ3Qyh2mEohOz2yLVz6otth0Hci
	 9oIt65+acNglDDMH/Xuqr0auJsK9L8xvqlGGRc6ne74xfhCv6vX/pP5ac7qn7P9JkH
	 fmbAGsco7yz1X80xWS1IOzh35xMKRtaAnaFS+KnACIFlah3TguzBCfClhEfN/Umdvf
	 IScV5+g1xx3BBEftJqpYhGjPqq4higsG+2axLIoku97Xh9h5cmlsKQSTYfawyou6KL
	 qPOgDT8xIY6yg==
Date: Mon, 28 Sep 2026 15:15:34 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Message-ID: <arp2hp7wRlcK_4D8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QfufTBJOg9YeTsli"
Content-Disposition: inline


--QfufTBJOg9YeTsli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/mpi3mr/mpi3mr_transport.c

between commit:

  29e3f0856e854 ("scsi: mpi3mr: Fix SAS port allocation and registration er=
ror handling")

=66rom the scsi tree and commit:

  0b5b2fb484f3b ("Merge tag 'v7.3-rc2' into 7.4/scsi-staging")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/scsi/mpi3mr/mpi3mr_transport.c
index a3412cd4ca5bc,8ee7ce1480c8d..0000000000000
--- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
@@@ -1567,10 -1567,12 +1567,10 @@@ static struct mpi3mr_sas_port *mpi3mr_s
  	}
 =20
  	list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
- 	    port_siblings) {
+ 				 port_siblings) {
  		mr_sas_phy->phy_belongs_to_port =3D 0;
  		list_del(&mr_sas_phy->port_siblings);
  	}
 -	if (tgtdev)
 -		mpi3mr_tgtdev_put(tgtdev);
  	kfree(mr_sas_port);
  	return NULL;
  }

--QfufTBJOg9YeTsli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6doYACgkQJNaLcl1U
h9ALswgAhP4JDpPCn3Xd7BZj7o+iRcVHKctsPJ2rFgVrub9zu3h8XsnJLpHdDuut
n52jfxFf28krUhk9QSZzlE0Pj/ssl+7o+DXmQSQvlN7584GfTiz7vVAcwsTwVzQT
rwcSRdP9lWcwdRJkU1+O6IFbFLWHJXulDEYE+9AdwX1IbJ7N8UTWoBOZAmIqwpC9
L0sAumG6uSuhivAQui/HyplDUpxH9Ks2GiWxfxlBiEsdEcfriD5+RNWMEPc29N1h
8/4Ac/+VyLITRHVWS2rCodNb9Mv/RUYva1W7XDYZBXIDk/nktjTF8scSLLe52SI8
sXea4DALAnieO1Uv3ZT8wBVEnh88/Q==
=CCR9
-----END PGP SIGNATURE-----

--QfufTBJOg9YeTsli--
