Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F641A903;
	Mon,  5 Oct 2026 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199299; cv=none; b=ZRhpctJenC5N+YFI4p7P9CdLMPXI7kevBLTO/JHshTr1oWcoG4xPewhJjM2h+RAOeO2AYOWn1++TE0cA8C/N/DPQSpJqmtlTVEdkaoLUAHL9FbGuNGNo6lRN2aQIUIX8FBrkqXyAJFSVDadjqeuAf//hofUOWUjRs0XrirhDPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199299; c=relaxed/simple;
	bh=VEyECi85g1ge+99kdmwAMXMNJKRjLT+2WgyElgBSNxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S7/DrHnElA66HSwSrmKAEZ0bcjX6jSHki/L0sV0pf8OayQIKLIXyU6iz31ZSUCYmT3oA7+xoXPv/QqBmt33PRNV02Is0Cry4MzhJS+GQnCPOaaC4Lfi45wX9s5Uo4XMVgN/8jtPZ9y2z9fx3qAqtSNyCBE5ET31F5boqimPgBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exE1ACfo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exE1ACfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FCE1F000FF;
	Mon,  5 Oct 2026 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791199297;
	bh=vMgT/vHflwLEWIB9Qybuy9AJGiJTeyls88kVMAgiXkM=;
	h=Date:From:To:Cc:Subject;
	b=exE1ACfoYSnPwrPW5B1gGDv24sXZhhh/NN+43F3bOyN+fwW8OYsaswz3ad8r99QEg
	 j8bd6+4UW+WJegfjTGccJri48R4q50Ccd7OjLo84UlJZx9Z3JYCa6Nx4BT/TOV3kht
	 qWtBhPnUW1P8arYpZj6pU3Jwe7kkliADKgn/pMiN4SgnhXST/kkT5Vcd/Yn95OdGfl
	 ibrzT9KZ4w2bPEYy1l4Fb7nplwfYXAOd3F24vzpiADwemlle3hhYPR33hZOrQwojlK
	 /FpMFKdQ2RiPTzaApAVsrjXNWAS3VpLoPH+mS3AAIrKvzB2uoeUIRlWyAJS4z4sLr1
	 /syfhYfwfmwHA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DF19E1AC57CE; Mon, 05 Oct 2026 12:21:34 +0100 (BST)
Date: Mon, 5 Oct 2026 13:21:34 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <hebaoquan@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the sound tree with the mm tree
Message-ID: <asOIPgOu7MHRPLWU@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vSKz1RjxWDGbXQgY"
Content-Disposition: inline


--vSKz1RjxWDGbXQgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/mips/snd-n64.c

between commit:

  0d62c52af5499 ("ALSA: n64: don't use GFP_DMA when calling dma_alloc_coher=
ent()")

=66rom the mm tree and commit:

  e81f85fd3ca66 ("ALSA: mips: n64: Handle card removal properly")

=66rom the sound tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc sound/mips/snd-n64.c
index e2cf9df15d485,8cc001c58d5e6..0000000000000
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@@ -296,25 -305,20 +305,20 @@@ static int __init n64audio_probe(struc
  	spin_lock_init(&priv->chan.lock);
 =20
  	priv->card =3D card;
+ 	card->private_free =3D n64audio_free;
 =20
  	priv->ring_base =3D dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring=
_base_dma,
 -					     GFP_DMA|GFP_KERNEL);
 +					     GFP_KERNEL);
- 	if (!priv->ring_base) {
- 		err =3D -ENOMEM;
- 		goto fail_card;
- 	}
+ 	if (!priv->ring_base)
+ 		return -ENOMEM;
 =20
  	priv->mi_reg_base =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(priv->mi_reg_base)) {
- 		err =3D PTR_ERR(priv->mi_reg_base);
- 		goto fail_dma_alloc;
- 	}
+ 	if (IS_ERR(priv->mi_reg_base))
+ 		return PTR_ERR(priv->mi_reg_base);
 =20
  	priv->ai_reg_base =3D devm_platform_ioremap_resource(pdev, 1);
- 	if (IS_ERR(priv->ai_reg_base)) {
- 		err =3D PTR_ERR(priv->ai_reg_base);
- 		goto fail_dma_alloc;
- 	}
+ 	if (IS_ERR(priv->ai_reg_base))
+ 		return PTR_ERR(priv->ai_reg_base);
 =20
  	err =3D snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
  	if (err < 0)

--vSKz1RjxWDGbXQgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOINQAKCRAv73Ows9A4
idcdAQC0yoTApdcl2a9AlLUf5d33mgfdGuZcYdmFF/7N72lemQD9Fj+z8kFgmPZa
Joce8+ZCSwolRu/cLgRZ33G/Vc8MVgI=
=pUVQ
-----END PGP SIGNATURE-----

--vSKz1RjxWDGbXQgY--
