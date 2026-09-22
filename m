Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CC54A7D2;
	Tue, 22 Sep 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084179; cv=none; b=mdHYxFSdFKkSz0Ch/3p/HTX3O6zlXD7yBu1rPXte5r4DZy/fNp8PzP/iCsmWgqwD8d4e0Q5o1OjQVPzsor7HLRAi4FsmumsDgBwbd+FVJadCQ3wfOMuWbc907Sp0MSIQeb717WyzPvDqQ0TXj6b7xiQ3W4BvpWMFx9oNPWCg5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084179; c=relaxed/simple;
	bh=qnDSQX/C0CskSPw8cbKoUazRbQKUpQuwEzk6DZpWzXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJRVxQ59Z7luxJuQ+vpxpyURJU4ErPlDYe+0difGXajNJ0RXSE9PxaaHs2qX+PMotnMsE01AR+gIXLWBIw/QO/FEfjTB7c9XM4E59cVIyxQT71oUbdQIFn2eykifDjSq3Zqt+96UoXK4fqgrB0KHLw+KtAAEnW7HFRF1xbOo+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+Qz3oyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+Qz3oyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD111F000FF;
	Tue, 22 Sep 2026 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084177;
	bh=yUS8IbG3Grtql9ALjoBqu7uaTHFxvZ+Qtu3U08bXozE=;
	h=Date:From:To:Cc:Subject;
	b=f+Qz3oyhjeRRwJD0edk8iRz7CcQx2WN/KE6k7CXOOk1aVbES5WxoVM+HMVDaGX55n
	 Quc5HhOIZoCP8LTTbWyXbxFaMB0zZdMZPnsWcZ+R80eOhmtEvukKsjyjy4Nk35bCN6
	 2N6X6bhIEyfJe2dq3uZmAtdxdsBPboZYWvkQKtHQmtDDHYo9w08q5wFHWHWS5tutjh
	 oJBJt+Jb0tE5HWYV9ZX03K5FADzOhskDDatqns2qQiov7sXavA1R38S9oMOm8LyP9E
	 PMWjCsnbQiqk0Vd6jDPCAXB8gjVjb/9UJsTOqgQYnBSoOBduvzkvERH9uvS/LiSflK
	 0AnZeLJR0NSmA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DF6651AC56C0; Tue, 22 Sep 2026 14:36:14 +0100 (BST)
Date: Tue, 22 Sep 2026 15:36:14 +0200
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hui Peng <benquike@gmail.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <arKETtHsac_ZwVc4@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MFDf4oOiyRB2/WJC"
Content-Disposition: inline


--MFDf4oOiyRB2/WJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
/tmp/next/build/drivers/ata/libata-scsi.c:3575:25: error: too many argument=
s to function 'ata_scsi_set_sense'
 3575 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMA=
ND, 0, 0);
      |                         ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
  206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *c=
md,
      |      ^~~~~~~~~~~~~~~~~~

Caused by commit

   c44f095a9d176 (scsi: ata: libata: Use combined sense codes)

interacting with commit

   3bab8c7e0c6ba (ata: libata-scsi: abort multi-sector pass-through command=
s when multi_count is 0)

=66rom the libata tree,  I have fixed this up with the patch below and can
carry as needed:

=46rom 900934c48a431c99de39a6b2976368408e7d2c83 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Sep 2026 14:07:31 +0200
Subject: [PATCH] libata: Fix up semantic conflict in ata_scsi_set_sense()

/tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
/tmp/next/build/drivers/ata/libata-scsi.c:3575:25: error: too many argument=
s to function 'ata_scsi_set_sense'
 3575 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMA=
ND, 0, 0);
      |                         ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
  206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *c=
md,
      |      ^~~~~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/ata/libata-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index afc2bad677bb9..e380d1b68101a 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3572,7 +3572,7 @@ static unsigned int ata_scsi_pass_thru(struct ata_que=
ued_cmd *qc)
 		unsigned int multi_count =3D 1 << (cdb[1] >> 5);
=20
 		if (!dev->multi_count) {
-			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
+			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0);
 			return 1;
 		}
=20
--=20
2.47.3


--MFDf4oOiyRB2/WJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyhE4ACgkQJNaLcl1U
h9AeiAf/WxuuMO4FNq6DK8swLF1NX3JgH+9wrwpxF00yTNDlKVNI2Vx27Jaaulfv
c5X4183BHV4ELMNAPtDru+KgN/mCEoLLdlN93ej1Bz5nKOcj/jJ2jf0UZIWWnhH3
DXnfxP/xfpAyN8AoCN8MxI9v5c9RrIEN5EdsW89eVFegoPd50PsMT6AEP33VXSMf
53xVJzAUyoQpmNVPxMQihGvuBRm53X+bisDLtRlWXLNHf14cU9cjPlwijACquN+N
CRjrSxZSCoG06qQnbS+qLiJcWTm9VHaXYlGwNZKqdqdwA9jzkGGU2NX9/Ab+kyva
1eUO4yZFPuvNE1JvArnhA6/AaRSwCw==
=FVoN
-----END PGP SIGNATURE-----

--MFDf4oOiyRB2/WJC--
