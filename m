Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E225213E89;
	Tue,  6 Oct 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283132; cv=none; b=UVPCqbwX+pGG/NsypS+gjKCylWEAwpLnbYZ+6bhC7gcZDcMsuDRt27/ASktijmx7Zruu7YddGOHb03XlVad2o6rqI7jdq80SoLpYEw4SZTP3JMuPpe3iVQOLSiI/lWuNsm26143nYkrn7mWTlYwvGvj4/pk5uYDulQkhZFTBKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283132; c=relaxed/simple;
	bh=H+1ObyLhlvd+nCxTBi5GvGK3ucz4aYmNYNXY5CKwWvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOf3vRfz4QT2OHCdI0LIu8go038AOj88e8BmTxJOI+QlSmZdGvfvmFCx26Mm2/jCUf6CakQ+l128zqEYWFBykMth69UdOeKPTXgDuxIP/tlyVB3JfORqhWuhsnGs1wk1Wq01ujX5XpHvAP0c2GNDKLxYG9Uwkpu+/6GhiBxyBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmZSXQvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmZSXQvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221A01F000FF;
	Tue,  6 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791283131;
	bh=G5O2Gdu6HO9FaMWnLVj3bL92m9RdctEjJTK22si55xc=;
	h=Date:From:To:Cc:Subject;
	b=HmZSXQvnxR12vXy6F187SDhPCZE2j27CR117izCgMt7ra9LN0c9F0hxXTn/s6fOO7
	 oiE/EZZpsN9alKqOxZKo/vf9R40UTYW4giX4ZsZh6mhD6gtYa7yefWevBET36YS5h5
	 LNKnia9p/Q0U2wE/zsca30A/jdlAqagaxVPEGKkF+FcPDUf81bV6Cc3B+FFyZ1OJmR
	 IvDGW0ihHQR/QzlhV2NVSUYx8+jUkcYtzmbkG8S6EslokBuAdAfqtaJk532Q83GSiv
	 TCI0ar9qXYnZ1/XAMxXPk4Kt0YCsA59kEt6ZhB0Duj5hwBZO/HyxvciudrGdKvGgJW
	 A758SCN67IRMw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9D1941AC57CE; Tue, 06 Oct 2026 11:38:48 +0100 (BST)
Date: Tue, 6 Oct 2026 12:38:48 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <hebaoquan@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sound tree with the
 mm-nonmm-unstable tree
Message-ID: <asTPuG6GxkRDR8Tf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="USavb+Dc0cRfA0og"
Content-Disposition: inline


--USavb+Dc0cRfA0og
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/mips/snd-n64.c

between commit:

  d9202799374c2 ("ALSA: n64: don't use GFP_DMA when calling dma_alloc_coher=
ent()")

=66rom the mm-nonmm-unstable tree and commits:

  e81f85fd3ca66 ("ALSA: mips: n64: Handle card removal properly")
  2964a4aae2e04 ("ALSA: n64: don't use GFP_DMA when calling dma_alloc_coher=
ent()")

=66rom the sound tree (looks like this is just a race with me fetching the
mm-nonmm-unstable tree and will go away tomorrow).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined sound/mips/snd-n64.c
index e2cf9df15d485,da889570cebcf..0000000000000
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@@ -273,6 -273,15 +273,15 @@@ static const struct snd_pcm_ops n64audi
  	.close =3D	n64audio_pcm_close,
  };
 =20
+ static void n64audio_free(struct snd_card *card)
+ {
+ 	struct n64audio *priv =3D card->private_data;
+=20
+ 	if (priv->ring_base)
+ 		dma_free_coherent(card->dev, 32 * 1024, priv->ring_base,
+ 				  priv->ring_base_dma);
+ }
+=20
  /*
   * The target device is embedded and RAM-constrained. We save RAM
   * by initializing in __init code that gets dropped late in boot.
@@@ -280,14 -289,14 +289,14 @@@
   */
  static int __init n64audio_probe(struct platform_device *pdev)
  {
- 	struct snd_card *card;
+ 	struct snd_card *card __free(snd_card_free) =3D NULL;
  	struct snd_pcm *pcm;
  	struct n64audio *priv;
  	int err, irq;
 =20
- 	err =3D snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
- 			   SNDRV_DEFAULT_STR1,
- 			   THIS_MODULE, sizeof(*priv), &card);
+ 	err =3D snd_devm_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+ 				SNDRV_DEFAULT_STR1,
+ 				THIS_MODULE, sizeof(*priv), &card);
  	if (err < 0)
  		return err;
 =20
@@@ -296,29 -305,24 +305,24 @@@
  	spin_lock_init(&priv->chan.lock);
 =20
  	priv->card =3D card;
+ 	card->private_free =3D n64audio_free;
 =20
  	priv->ring_base =3D dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring=
_base_dma,
  					     GFP_KERNEL);
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
- 		goto fail_dma_alloc;
+ 		return err;
 =20
  	pcm->private_data =3D priv;
  	strscpy(pcm->name, "N64 Audio");
@@@ -331,28 -335,19 +335,19 @@@
  	strscpy(card->longname, "N64 Audio");
 =20
  	irq =3D platform_get_irq(pdev, 0);
- 	if (irq < 0) {
- 		err =3D -EINVAL;
- 		goto fail_dma_alloc;
- 	}
+ 	if (irq < 0)
+ 		return -EINVAL;
+=20
  	if (devm_request_irq(&pdev->dev, irq, n64audio_isr,
- 				IRQF_SHARED, "N64 Audio", priv)) {
- 		err =3D -EBUSY;
- 		goto fail_dma_alloc;
- 	}
+ 				IRQF_SHARED, "N64 Audio", priv))
+ 		return -EBUSY;
 =20
  	err =3D snd_card_register(card);
  	if (err < 0)
- 		goto fail_dma_alloc;
+ 		return err;
 =20
+ 	card =3D NULL; /* probe succeeded, don't release as error */
  	return 0;
-=20
- fail_dma_alloc:
- 	dma_free_coherent(card->dev, 32 * 1024, priv->ring_base, priv->ring_base=
_dma);
-=20
- fail_card:
- 	snd_card_free(card);
- 	return err;
  }
 =20
  static struct platform_driver n64audio_driver =3D {

--USavb+Dc0cRfA0og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasTPtQAKCRAv73Ows9A4
iXw9AP4pI8U+zXIobj9MDOt6qiVa5QZGM6AdSyIixdX+0IDSugD/Yqi3u8Lpviht
Qvuk10qEEFFrIctKAgWuxkXKcZAU2gA=
=NkCh
-----END PGP SIGNATURE-----

--USavb+Dc0cRfA0og--
