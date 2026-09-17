Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2F4B0E58;
	Thu, 17 Sep 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675769; cv=none; b=UVOXPfgUtUX1bMCj2wqhxmBqopeEngsO6+wzotcrrCzDGemgFvKryFB4q/9K0/RB5IHQ+R1c4apw2PykxSCpsh4hEImowIJFjkrgshjUbg7kE4wYpAaDJ7ALj9OORhC8LvZ8UAE/wr2ywP8P7bVV+9HIr+rt/B3ebHNjnpKZFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675769; c=relaxed/simple;
	bh=LrdzPuAeOMCh1XYPVMaYS23p5HuS60Re2k0g1aBk+TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsdO4LeOKUA4HyemKV1mJlF8CAs0NRngDdvNCMpbI3ZrvwR6PnxlaYuaF+4CeJYrdiDtSlta/UJytgHtzqWXmE5iM9iJ7TtiGSdnQlwk4XGwl/CfbvSvQeOHaUnIuRxW/emd5keLn8ebxhruuCCfZjnKwRLD1mS9V++ilJEQFlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+8pDKl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+8pDKl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D691F000FF;
	Thu, 17 Sep 2026 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789675763;
	bh=1VGH7FCPQMH0rOO2TSaoooSKn8+1ZPhH8jHLIKt4FDM=;
	h=Date:From:To:Cc:Subject;
	b=m+8pDKl5uTywcpyvpbTq5ETqiLufiozR+urjfs7lN8hF+RsaM5HRJtsqLpsmyDr7R
	 4dwVm90mm1Hr1qTikh3rpMt9sFo7xhwRIEmTphqfM85VO/fV4vf3Bey5rtHuK5jwDX
	 k2E83pVgErfPMZPYIatB7lKul7RSvT/E/wxCcZP3hCjwbPLMYHHhbwrsI+GOlB8uhN
	 m3b4X69n67mtT1Qebfy0aiDANX4mdf08hNf6IRUcTf9RdDAHAkc67/wKE7DWqMSbCq
	 Zc348MhjIslKz+wi7TGKIUHoi7Nje7u60EOU4qwid+oDfPZTEnib9xKtwc2bzODSgt
	 PDHWEEhxe0nyQ==
Date: Thu, 17 Sep 2026 21:09:18 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	"Milan P. Gandhi" <mgandhi@redhat.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the origin tree
Message-ID: <aqxI7qklaslOJL7Q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/i7+QyKZHgmod3k0"
Content-Disposition: inline


--/i7+QyKZHgmod3k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/mpi3mr/mpi3mr_transport.c

between commits:

  419d129f970aa ("scsi: mpi3mr: Fix target device refcount leak in mpi3mr_s=
as_port_add()")
  dba9e2181ca5e ("scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_=
port_add()")

=66rom the origin tree and commit:

  29e3f0856e854 ("scsi: mpi3mr: Fix SAS port allocation and registration er=
ror handling")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/scsi/mpi3mr/mpi3mr_transport.c
index 232af978d7372,a3412cd4ca5bc..0000000000000
--- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
@@@ -1504,11 -1560,17 +1560,20 @@@ static struct mpi3mr_sas_port *mpi3mr_s
  	return mr_sas_port;
 =20
   out_fail:
+ 	if (tgtdev) {
+ 		tgtdev->dev_spec.sas_sata_inf.pend_sas_rphy_add =3D 0;
+ 		tgtdev->dev_spec.sas_sata_inf.rphy =3D NULL;
+ 		mpi3mr_tgtdev_put(tgtdev);
+ 	}
+=20
  	list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
- 	    port_siblings)
+ 	    port_siblings) {
+ 		mr_sas_phy->phy_belongs_to_port =3D 0;
  		list_del(&mr_sas_phy->port_siblings);
+ 	}
 +	if (tgtdev)
 +		mpi3mr_tgtdev_put(tgtdev);
  	kfree(mr_sas_port);
  	return NULL;
  }

--/i7+QyKZHgmod3k0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsSO4ACgkQJNaLcl1U
h9CR+Af/bBxUrJVzS09JJDunWe7/eXFR+nqv1CanDU8WY4uYmx1Z0wi2Fnbwk/Tc
rCulUQRvrpLYoQP2jj7wse490DifHM4txQVBdJNkppavzbBUhXJifBq4HKqugDY5
CukBurJROJFuvHNxAWvX6qVQ/+MqGRij1ux+cd3MIc1ACmPn9Wn9+elpMWdEPjwT
AjG/I7WWAntFph64wkR2dMfcc6pfZQKV9XAUDYUKtFeNU37QwBJA7TKtiq8b+tx/
ISUYc0+L3MMHIIIMnIEnfU1g3E9OFxmtjEAfypHxE6lMUjrJ5OpaMA6VG6hGNpPi
KJlVYvonyr+Tq6MN9F5hSg2NyidYgg==
=l+gz
-----END PGP SIGNATURE-----

--/i7+QyKZHgmod3k0--
