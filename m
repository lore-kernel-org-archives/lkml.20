Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017001;
	b=xVwv5gFGDNDtaPuloEcXmjaoKxnvOja3GiZgeo+Wm06Hi+vb1X8V8DxkTBZ+jMa7h96k
	 CI1KPzJzaPYYPP4vKLnvKkVsZWTpuWlgcRnrpMtlQgBiuboHwN/Xm0vFnCr8uezoFhaZe
	 cbmfn1nKZQQWm3YXXErwcgFugkU/1ABsYWINwudRb9zGQiE5tQ2p2OBNWqBk2FdXpiyMj
	 hhlRtO6+NxfNg3+jza6SPiCSJCvJ5qskaXANQ7UEE+AuNLhGllG5aJX0KQrCEBq2jJoaf
	 ElTCGBDpn2JlLSrWidAxHrQIzaJMn9XjRciKPOZvjxAW/+DVrEa05KA8kc7L0GWXQxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017001;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=OIRau+K059U9bsoMz+fliJDGjqrERsFkJBBiagvCp88=;
	b=Qy5spVOXsUfDKioJ0q1cfHRzuau0exempFWZ64R1TR7TCi9bHlc3PE3Qt38otq0nRkP0
	 POeWSli1UQEubg6fvSiO5u7OEs1ZI4OdEpzwcJA32uIUAqlzpvokrgodtL0sV1NlYw2aw
	 0KN/vEeA9HkbHuBmjXpYFVfDCoDvBskHHSD60PelxeAPYBPUJqA2Vzfj/EByO6AISX75/
	 Rd+SiGtPtXLxMXUNiQR5ASk456MdaHHmC9aSsOg56Kx8Kj/7a59rOP1ZnXcbo65nugSWu
	 lkklVkzyFG0a6bj1XRFp5lRHjEvXbhmS01+/msOy22dqgBRjzNcbEYK+hvNeEM8qxgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoeX1zY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF10606A31A;
	Mon, 26 Oct 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoeX1zY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EC71F01825;
	Mon, 26 Oct 2026 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793017001;
	bh=OIRau+K059U9bsoMz+fliJDGjqrERsFkJBBiagvCp88=;
	h=Date:From:To:Cc:Subject;
	b=SoeX1zY3viN6rGWSMONQeAuTuKGc4Fn9punMS2hcuAlfXBG0RHKhLiyVvsC3244JR
	 sAhoDd1ROM5+o5vYelvp36y+EKJ0gEyeF6+bd4TfZ6Dkc5D/VDqRj4iE6zkz+fn8Do
	 J16ZHN+Plwivxt+jWs5GjDVfgKmVmsFPeIIALxMdQnWZHhb/qd6pch/zH2AlVcHSiX
	 Of0i7NuYzZDDHhC0gfIDFbc+jGp/yI6+vPn7H2ADjqjiWFXriPRsIDj32YCIWwnPxV
	 cDwPECG9jWXHqVEh54Lehz98cOj546E9F1TBahuhLtDIuEpY2EBjasMJZYtsM72b7d
	 YHV4cXrqZfrCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A9DE01AC5994; Mon, 26 Oct 2026 12:16:38 +0000 (GMT)
Date: Mon, 26 Oct 2026 12:16:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the libata tree
Message-ID: <at9EpoN5yijg6WE5@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="aCfe1SnZC9KnUTxa"
Content-Disposition: inline


--aCfe1SnZC9KnUTxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the libata tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
/tmp/next/build/drivers/ata/libata-scsi.c:3586:25: error: too many argument=
s to function 'ata_scsi_set_sense'
 3586 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMA=
ND, 0, 0);
      |                         ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
  206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *c=
md,
      |      ^~~~~~~~~~~~~~~~~~


Caused by commit

   3bab8c7e0c6ba (ata: libata-scsi: abort multi-sector pass-through command=
s when multi_count is 0)
  =20
interacting with

   c44f095a9d176 (scsi: ata: libata: Use combined sense codes)

which is now in Linus' tree.  I have moved the merge fixup I was
previously carrying on the scsi-mkp tree to the block tree.

--aCfe1SnZC9KnUTxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat9EpgAKCRAv73Ows9A4
ieBZAP9zTVrOo/KmKscP1I7pJTPezbiBBG0GPfheKcJ/He4ETQEA7zWQvHCkCO2E
5lZMqD4aND9aqqB/VnkHZ890VBVjqwI=
=8qFp
-----END PGP SIGNATURE-----

--aCfe1SnZC9KnUTxa--
