Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846983;
	b=4iObKEHAD/my0l0q2BZht8DPJhwvPbHm3EluQywFH6xe0fe4Fs0P0NEbjeFFeC66k2VF
	 J3nhZeiq0hIDqysDobyakTUrF9NUCrDXFtqNFqWYrJnDxSoYIEyktt9It1GIXtRRFe+h+
	 UWlLA4fY9kT8uidYewqK/IqGsexfpPCBi4gcpl8z+VlrRST6sIffNbr9I+oerjj7vZldJ
	 OsCM3/XUxWZuFgU+GsX7pkO27+5g2jkzDtvo/4rARsnY4+O2wCghcWpm7xNlAa8UPvMS5
	 bnt8kSmkt6NjZM78SW6aAJ1Cpow54qbVJOiRO+6278KBPCqZ6FEynoJba991xZoy7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846983;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=I7Ca8ICpTz7JsnZNb3hwa55ByTirk5R6wmAQCfjrTFE=;
	b=OKtrGAHRJMdvQPjPLTuXxO8utITLRdZ2+4bSdUIKGeUyPDAax+c7ePGp5xFax++bCn4W
	 yRbyihx8H4+OrIyy3WSTw/sVvC1/9AWbB7lCGe4vcbjyuH30ApGOOUOzxkDA+aeyTT3eS
	 CANbdQTHzxo0U7+Mp9WlKjn8aTOaf+x90qYt7oH+RYzgGhYduUBxOIoUP6WsBxIxIwR7Q
	 q/k4E0+kJYUAlcEIxD04PAJL2vUI+w8lDOeAfeMrm60gd/DDuVrpDvXy44452V4tQmn9M
	 Tcb+4I7hIZKGuk3+ib0AkHQqIFQEPfTylQ0PMGlYuAeOCW5Fo4kvd1rQNSNWYrw3/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKmxykhl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB28606A31C;
	Mon, 16 Nov 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKmxykhl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E0E1F000C4;
	Mon, 16 Nov 2026 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846982;
	bh=I7Ca8ICpTz7JsnZNb3hwa55ByTirk5R6wmAQCfjrTFE=;
	h=Date:From:To:Cc:Subject;
	b=QKmxykhllu4ofrdbtovDSfpr5Ekq8pjrOZJqEirhXQi0jsPF/E26Xytx5YMtJVJH6
	 gc7GfSZrKV3S29xvE2WI+HfO09eNdbu+VLsEzA2wlTT7LkZ64BdjO/7rrTZF8/XGwL
	 fLWhwk06xmOM4XEGi0v64/nwps+GUk4NqpqCbWsYQ1IhQ3Sbcj2m1GAkC9yoZ5ugp0
	 zfW7TtgzUSN7Bz0anW7Dv6KyjR6YJSmtidSHuiaCwbdaOZ3KGqouBbygyQfJ3aENOS
	 6b0dIm1MbeNkJPplVblF6L7pbaRSR6QXGdl4OJrcgz9N5qlNLyQC7DV56xDTQZXhbu
	 x7s7inLluuS1w==
Date: Mon, 16 Nov 2026 16:36:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: linux-next: manual merge of the v4l-dvb tree with the origin tree
Message-ID: <avsxAvgy5sbJWl4y@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="gmYpxAH5QGuzAVPI"
Content-Disposition: inline


--gmYpxAH5QGuzAVPI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  03ec4aa9817b2 ("media: synopsys: hdmirx: free the driver data when the la=
st user is gone")

=66rom the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 713aa95be8179,a241761b1bcd9..0000000000000
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@@ -678,13 -678,9 +678,9 @@@ static void hdmirx_plugout(struct snps_
  	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x0);
  	cancel_delayed_work(&hdmirx_dev->delayed_work_res_change);
 =20
- 	/* will be NULL on driver removal */
- 	if (hdmirx_dev->rgb_range)
- 		v4l2_ctrl_s_ctrl(hdmirx_dev->rgb_range, V4L2_DV_RGB_RANGE_AUTO);
-=20
- 	if (hdmirx_dev->content_type)
- 		v4l2_ctrl_s_ctrl(hdmirx_dev->content_type,
- 				 V4L2_DV_IT_CONTENT_TYPE_NO_ITC);
+ 	v4l2_ctrl_s_ctrl(hdmirx_dev->rgb_range, V4L2_DV_RGB_RANGE_AUTO);
+ 	v4l2_ctrl_s_ctrl(hdmirx_dev->content_type,
+ 			 V4L2_DV_IT_CONTENT_TYPE_NO_ITC);
 =20
  	hdmirx_dev->plugged =3D false;
  }
@@@ -2941,6 -2937,16 +2937,16 @@@ static int hdmirx_register_audio_device
  	return 0;
  }
 =20
+ /* Runs when the last user of a device node is gone, possibly after remov=
e() */
+ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
+ {
+ 	struct snps_hdmirx_dev *hdmirx_dev =3D
+ 		container_of(v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
+=20
+ 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+ 	kfree(hdmirx_dev);
+ }
+=20
  static int hdmirx_probe(struct platform_device *pdev)
  {
  	struct snps_hdmirx_dev *hdmirx_dev;
@@@ -2950,7 -2956,7 +2956,7 @@@
  	struct v4l2_device *v4l2_dev;
  	int ret;
 =20
- 	hdmirx_dev =3D devm_kzalloc_obj(dev, *hdmirx_dev);
+ 	hdmirx_dev =3D kzalloc_obj(*hdmirx_dev);
  	if (!hdmirx_dev)
  		return -ENOMEM;
 =20
@@@ -2960,23 -2966,25 +2966,25 @@@
  	 */
  	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
  	if (ret)
- 		return ret;
+ 		goto err_free;
 =20
  	hdmirx_dev->dev =3D dev;
  	dev_set_drvdata(dev, hdmirx_dev);
 =20
  	ret =3D hdmirx_parse_dt(hdmirx_dev);
  	if (ret)
- 		return ret;
+ 		goto err_free;
 =20
  	ret =3D hdmirx_setup_irq(hdmirx_dev, pdev);
  	if (ret)
- 		return ret;
+ 		goto err_free;
 =20
  	hdmirx_dev->regs =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(hdmirx_dev->regs))
- 		return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
- 				     "failed to remap regs resource\n");
+ 	if (IS_ERR(hdmirx_dev->regs)) {
+ 		ret =3D dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
+ 				    "failed to remap regs resource\n");
+ 		goto err_free;
+ 	}
 =20
  	mutex_init(&hdmirx_dev->phy_rw_lock);
  	mutex_init(&hdmirx_dev->stream_lock);
@@@ -3031,11 -3039,12 +3039,12 @@@
  		goto err_pm;
  	}
  	hdmirx_dev->v4l2_dev.ctrl_handler =3D hdl;
+ 	hdmirx_dev->v4l2_dev.release =3D hdmirx_v4l2_release;
 =20
  	ret =3D v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
  	if (ret < 0) {
  		dev_err_probe(dev, ret, "v4l2 device registration failed\n");
- 		goto err_hdl;
+ 		goto err_pm;
  	}
 =20
  	stream =3D &hdmirx_dev->stream;
@@@ -3071,10 -3080,16 +3080,16 @@@ err_unreg_video_dev
  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
  err_unreg_v4l2_dev:
  	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
- err_hdl:
- 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+ 	hdmirx_disable(dev);
+ 	v4l2_device_put(&hdmirx_dev->v4l2_dev);
+=20
+ 	return ret;
+=20
  err_pm:
  	hdmirx_disable(dev);
+ 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+ err_free:
+ 	kfree(hdmirx_dev);
 =20
  	return ret;
  }
@@@ -3095,16 -3110,13 +3110,13 @@@ static void hdmirx_remove(struct platfo
  	hdmirx_disable_irq(dev);
 =20
  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
- 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
  	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 =20
- 	/* touched by hdmirx_disable()->hdmirx_plugout() */
- 	hdmirx_dev->rgb_range =3D NULL;
- 	hdmirx_dev->content_type =3D NULL;
-=20
  	hdmirx_disable(dev);
 =20
  	reset_control_bulk_assert(HDMIRX_NUM_RST, hdmirx_dev->resets);
+=20
+ 	v4l2_device_put(&hdmirx_dev->v4l2_dev);
  }
 =20
  static const struct of_device_id hdmirx_id[] =3D {

--gmYpxAH5QGuzAVPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7MQEACgkQJNaLcl1U
h9D8NAf/UKfmBrEWQMns1XD1B2tguwKtqbE0asrarfkonBQ27A2alh7hWHl0B0OY
MlACi2YatPbaT1e7yho8pR6Uhnr6ko9Fs8TWj1lXWQO7MnobfMagoDwynMDJfHnm
BGsb5TdVL8IOIxNhg4D8/gALX8f0xf9GvSU+fWcFAyZ0dJN4WnJdqwpzZ9EMPNmi
Zl1TcDmyLdImzfPCgs0mH+o6cNVE9dMONqKwqKJSvMml87L9lz5jZA4YaQR0ai/3
fHfJqM8qGQxP05ixyQnkefeWOm9nb0VMOkMAmWmcQ+xvegDVpQa7cIO2kvez41xJ
91tUq3fA+B0qsOKf9ulxQc+w1lmyyw==
=f0VI
-----END PGP SIGNATURE-----

--gmYpxAH5QGuzAVPI--
