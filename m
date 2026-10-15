Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0F541E69;
	Thu, 15 Oct 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078469; cv=none; b=Y9FbfnDZq1nl71d19uwYZTWNk0og3Lz9vhDWi219cTgldpXrFjfFyino7CwXBJX1TgaQk3IOl5GM1eOA94ixLtr/l7MG1P4/Jqlk+KNtp8jWOba+5bzFmGHhBABjlG3yjaQ1mxYNsx6WkHXHO/OAgKNxnwXJIqut2eVqgBpxi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078469; c=relaxed/simple;
	bh=yV1GY7ND7lu8rkd0JxgOF+YuarmDBLRX5V8XQ5RSVXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkPtRAbnNYoeeNmuRIUra+onjjtALylaz5XFqD/tlG06lsP2oocSdf252f+jHADSLm5WpqfOkhJZ57FZM2FCPVHXxKnrKymmJGYJMyrTqrkCLs6jVamk0Ijn4Ejjy2rGYgii/vK0ErzO8sEw1vsrfc7XUi7fzvO/qrZz1Rbghzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzvXirs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzvXirs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53531F000C6;
	Thu, 15 Oct 2026 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078455;
	bh=TY86a0mHp5yHaGyXzoXEHyVTL87TWAxcR/9+ORDCkNM=;
	h=Date:From:To:Cc:Subject;
	b=UzvXirs2c4Ja6nS+ZO6m+UbzOPwzJRk7QUKBXE/PHHsnriRlagodBd/DMJQZ9OaxC
	 nU4Gsj1ky63S7z0ONvPJuoCIPoq7b1iry2cbU0oGdnm87Nv16yT752dJ3gdP0lRhGm
	 TtPxA1bjppiXZqy47ZiImxSgNCbIMi+l+CibUMtRozMaa8Yz5LGsYEcGJ2CJloNd9K
	 9HdaGaWkmRMaYGbkBCgKT4qjGwryrEyKC2rTcwCqROXCd5VShj3VgbwqGSV31XK74j
	 aBS1vBcQUx3yoy3VPjpxQ+Su/iTON1Kd1uXVpF6+UiLNeqL5ksZ4iYBCIHhdAUDrfd
	 U4B3/EXNspjRw==
Date: Thu, 15 Oct 2026 16:34:11 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 tree
Message-ID: <atDycwCquCFNwruf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7mfmNpBRuW9C6ctu"
Content-Disposition: inline


--7mfmNpBRuW9C6ctu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/libiscsi.c

between commits:

  c5958c770b2a0 ("scsi: libiscsi: Validate the ITT reflected in a Reject PD=
U")
  11bffcd9cb346 ("scsi: libiscsi: Validate the task named by a management r=
esponse")

=66rom the scsi-fixes tree and commit:

  ae1c0d65bc711 ("scsi: libiscsi: Pass the session pointer directly to seve=
ral functions")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/scsi/libiscsi.c
index 2ab55d1e66529,34d4125417db0..0000000000000
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@@ -1136,22 -1159,21 +1159,23 @@@ static int iscsi_handle_reject(struct i
  			 * Just resend.
  			 */
  			/* In RX path we are under back lock */
- 			spin_unlock(&conn->session->back_lock);
- 			spin_lock(&conn->session->frwd_lock);
+ 			spin_unlock(&session->back_lock);
+ 			spin_lock(&session->frwd_lock);
  			iscsi_send_nopout(conn,
  					  (struct iscsi_nopin*)&rejected_pdu);
- 			spin_unlock(&conn->session->frwd_lock);
- 			spin_lock(&conn->session->back_lock);
+ 			spin_unlock(&session->frwd_lock);
+ 			spin_lock(&session->back_lock);
  		} else {
 -			struct iscsi_task *task;
 +			struct iscsi_task *task =3D NULL;
  			/*
  			 * Our nop as ping got dropped. We know the target
  			 * and transport are ok so just clean up
  			 */
 -			task =3D iscsi_itt_to_task(session, conn,
 -						 rejected_pdu.itt);
 -			if (!task) {
 +			if (!iscsi_verify_itt(conn, rejected_pdu.itt))
- 				task =3D iscsi_itt_to_task(conn, rejected_pdu.itt);
++				task =3D iscsi_itt_to_task(session, conn,
++							 rejected_pdu.itt);
 +			if (!task || task->state =3D=3D ISCSI_TASK_FREE ||
 +			    task->sc) {
  				iscsi_conn_printk(KERN_ERR, conn,
  						 "Invalid pdu reject. Could "
  						 "not lookup rejected task.\n");
@@@ -1286,8 -1311,8 +1313,8 @@@ int __iscsi_complete_pdu(struct iscsi_s
  	case ISCSI_OP_TEXT_RSP:
  	case ISCSI_OP_SCSI_TMFUNC_RSP:
  	case ISCSI_OP_NOOP_IN:
- 		task =3D iscsi_itt_to_task(conn, hdr->itt);
+ 		task =3D iscsi_itt_to_task(session, conn, hdr->itt);
 -		if (!task)
 +		if (!task || task->state =3D=3D ISCSI_TASK_FREE || task->sc)
  			return ISCSI_ERR_BAD_ITT;
  		break;
  	default:

--7mfmNpBRuW9C6ctu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ8nIACgkQJNaLcl1U
h9ByIAf/cq82qaBuVLrbK9fp43s4DLfAGA7fLnEkRfOv5QxV1be/QJY+23HBIyuw
gpQjGvQDMwg5a1X0pZofzqVGk6EF/pWakyfFp74JHfZZThXnuyaEOPUGWRJ3qaUh
1R+AQmH8IaGxt7f+NvC7d+YvR4VFWlLdPBhq2DFaZJOWrG/RTjT1W6igRYtQ1KRn
y8+Gbxng/tX2EvovApTdFPCMyr5QeSUFf8ql2GjS08OKFPd73Zq6X3R9+6177ySO
qYdfGJa/E0CmsnudnE5NQ+yQycE555jDTGrQEUaulp/XKhlwIiB21iJvBArCHQlf
XwCatuCe2YJ2MbbcveK/8sAvMk4ClA==
=XTUq
-----END PGP SIGNATURE-----

--7mfmNpBRuW9C6ctu--
