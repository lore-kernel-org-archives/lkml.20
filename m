Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233400;
	b=j8wseCjANJBxeakU1VJUAlHWudqlbiDfqrpitBE6bJrwLWCoyE0zUPKq90pr6YXWZsvJ
	 Mp2F5RxVaC/ys+yo5mA4MbTFSbaAuuQHCgt5k26HfsnwA6H8zewVSzFr52LRZ+NBbxPXB
	 KrCSs/MljeMf/7MzVsmM8kXa1C4mZw8/RE9tfwKsZiJEUqSLVt4WQhqtgQfxDGuQILo4R
	 wIvCLXh80I926p0kc/R1yO86wQGi8m/oOZVVwzFuQC/GeIcP0NaPCSCEieNuMgk9T7JFv
	 7xLXh+hZN+XIfgo6fOqkqu7i3AjFCkDRDCYJpofTu8JsQNfJ4WpiCTB8Mu45K+3PqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233400;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=PO7g+lGXttnlXl0BDZq1t0lE88+kSOof69kb/rSlr68=;
	b=cpU5g4XwvqOYsn8/GWIHyH6tC7cP/Uml7jBsbLUt7MbNn1hcxu5W87Zs+sH75GCSFlVr
	 4Ibvz+jA9nDLLTgoGB5+SkqJG8vzRDPDy1lA303sQkbd51qIx7mC7wmMIbnjfQEcEdjVM
	 NwxFgEk/3g6ghdg4L4ZNom8mkkz5e4Os785pP4uSjMdxWkS9A/+W+JypYEMfZwSGNWzVw
	 E/we2MaZkjWDtAS0i9RSqSSuzH80viGMUXnvbT8R/Vw57kWyKa8YZwaj49k2YwDJjPTWM
	 2w2smF3+2ICSnIy69ddQRwixbv3wvqNgpSqXOUjZf/anbLAVzdHV5trXWgCHIcP4xqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IY4NdzoD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE288606A32A;
	Mon,  9 Nov 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IY4NdzoD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D21F00900;
	Mon,  9 Nov 2026 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233399;
	bh=PO7g+lGXttnlXl0BDZq1t0lE88+kSOof69kb/rSlr68=;
	h=Date:From:To:Cc:Subject;
	b=IY4NdzoD43npkVTVsKG/giSpu4B2mGBlw9WAAMntDnXckodYf5BWCxhTenS39lF3e
	 pKPM/nC1k+/t/0UXXAQjPG506TLfZIDBYX132wGDGpbAm7Oja6YihhCbxBVclLLM1n
	 Qi0rFX8PMjVbUEEZ+312+tlBGEKChblSbW/vRcFAU69fyCOP2h5LgArITffmPCGRtM
	 q+yLWh2K3Q8FVZ4DUWnhnJ9hKY3SaIzKOYakp5JfEQ+0dJGCjJpp2gO8ieKzQKbD46
	 +LYKjHS+LJpX6U1+uj3p2dZK7an1dZMBud+OHtrhSY8tB0khS03CnuvDaFwB/PJ95N
	 0OiaeO1zitAeg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 59E161AC5995; Mon, 09 Nov 2026 14:09:57 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:09:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: linux-next: manual merge of the sound-asoc tree with the origin tree
Message-ID: <avHUNWGDMmhAUeX4@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="Ux8Rnc84bPPA4enI"
Content-Disposition: inline


--Ux8Rnc84bPPA4enI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/amd/acp/acp-sdw-sof-mach.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  7de8faa0fb6ed ("ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for m=
achine driver")

=66rom the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc sound/soc/amd/acp/acp-sdw-sof-mach.c
index 8336eb5c82ea9,1d7487c872657..0000000000000
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@@ -374,16 -406,28 +406,28 @@@ static int mc_probe(struct platform_dev
  	struct snd_soc_card *card;
  	struct amd_mc_ctx *amd_ctx;
  	struct asoc_sdw_mc_private *ctx;
- 	int amp_num =3D 0, i;
+ 	int amp_num =3D 0, i, dmic_num;
  	int ret;
 =20
 -	amd_ctx =3D devm_kzalloc(&pdev->dev, sizeof(*amd_ctx), GFP_KERNEL);
 +	amd_ctx =3D devm_kzalloc_obj(&pdev->dev, *amd_ctx);
  	if (!amd_ctx)
  		return -ENOMEM;
 =20
  	amd_ctx->acp_rev =3D mach->mach_params.subsystem_rev;
- 	amd_ctx->max_sdw_links =3D ACP63_SDW_MAX_LINKS;
+ 	switch (amd_ctx->acp_rev) {
+ 	case ACP7B_PCI_REV:
+ 	case ACP7F_PCI_REV:
+ 		amd_ctx->max_sdw_links =3D ACP7X_SDW_MAX_LINKS;
+ 		break;
+ 	default:
+ 		amd_ctx->max_sdw_links =3D ACP63_SDW_MAX_LINKS;
+ 		break;
+ 	}
+ 	if (mach->pdata) {
+ 		pdm_pdata =3D mach->pdata;
+ 		amd_ctx->pdm_sel =3D pdm_pdata->pdm_sel;
+ 	}
 -	ctx =3D devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 +	ctx =3D devm_kzalloc_obj(&pdev->dev, *ctx);
  	if (!ctx)
  		return -ENOMEM;
  	ctx->codec_info_list_count =3D asoc_sdw_get_codec_info_list_count();

--Ux8Rnc84bPPA4enI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHUNQAKCRAv73Ows9A4
iYOBAP0ZH01fRdfFMKKeX/yhUT+2+UuXUppidcDj0mZn/YZkewD/XcicxaSvP9Hn
psT9zWQn3VLdxSPnju+P62LmZQcJaQM=
=tyCZ
-----END PGP SIGNATURE-----

--Ux8Rnc84bPPA4enI--
