Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716033;
	b=mtlhObE/0gKGyPXpQYa4QKnjEEQ7MNLusBu9Wnd7OSVdUL+bdXuuOFNstpJXZIjxXnBt
	 stfk/m0xIft58OMJ1HaeA++S0Klp6sysGBRuUL1NJtMf2TNyKCw+kQq3OTo9gDVvefl38
	 4V6jsrXhS1LFucyGWxF4HRC7L2Hgk8/9zx/+wnyAowqi4cPf1hEwU6sPeY+qMbu/FKhvH
	 /HY26OXNda9Hh0RwNC7VoZJKYEfpxW2VGWr3Kgeu41HzkfknbBrnVyPk/AhA8isYfwcMU
	 Vm7dmpRNccG90G+TpbF/tJNsxuNMl0PNFHrME29taJmTfOAS2SSs31uVJzqDvhTPnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=PlavnbKCE74AisgMn9WDgAPjXuY+QFoi/xWp6FCb8Ck=;
	b=koKMcOJOS6p8Ak5yKUEmUffhtSE1bENxplzcPxa21oFz4Jef/Ez3LCUW8IOTp97y5wuc
	 p+Er9mTD/boMuPILxJqerOoThL2BJzEz/TpA9MaT9WHOBVCe9LEob3SLWnMyEQTuBsbEV
	 WZr2QJTRMfwmkImL567La1AG1nqHnGytmG7j1TpaeVOgk+QCueqbrjm3iwci16ferDIqJ
	 mIUq+nVNmuAfvNkJMPXZWQaUbp+jsmpuYPapgcc5LyAsJCYhyRzILEoAzJdXYmZuX01bL
	 LhYK7kE5BwrUXeXaMeFD/AUDxgJh5kBBv/s87wg1kyuKokuXExRHe7Ytp/1NIeM7/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OV5Jc+r3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0357606A324;
	Tue,  3 Nov 2026 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OV5Jc+r3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4BC1F000C1;
	Tue,  3 Nov 2026 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716032;
	bh=PlavnbKCE74AisgMn9WDgAPjXuY+QFoi/xWp6FCb8Ck=;
	h=Date:From:To:Cc:Subject;
	b=OV5Jc+r3WM1blqiITyfR7TCbQ1/LT8J5r6sltbHWWOt2zCUX5FU+n+ylqwDiOCNE4
	 0cJ+cpPtAObtNySnoeqDw7wdL3p3cUjK3/iSKBYkzGPZqMZXNWpULBo9zT1q2OucY8
	 CL0RfsOj7qddX6wUqZdGcBS5t062WOswDMChpbCGIvs/QVBiCPMBoVzYheRPcoi/z9
	 7iWlEmYwCeHuNKQySHcB9TCjgXeyzi7vPK3fXuvt0Edl+2BYZU2QWpFaVDlkDloQr4
	 SImJBlDdKaRUHQzKPoCb2HNzJ+FgiawCSjOZvxl4tAjr95wPIaSqTpCIci15sQdS97
	 VJ/W1o5N5+9fw==
Date: Tue, 3 Nov 2026 14:27:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Christopher Hoover <ch@murgatroid.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sanjay Chitroda <sanjayembeddedse@gmail.com>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <aunvPGXM2F_VOMzx@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="v3CvYRVV1EmQ/Uho"
Content-Disposition: inline


--v3CvYRVV1EmQ/Uho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/humidity/hid-sensor-humidity.c

between commit:

  340d44bdf9db0 ("iio: humidity: hid-sensor-humidity: Use per-instance call=
backs")

=66rom the iio-fixes tree and commit:

  5ee5d306f1bd1 ("iio: humidity: hid-sensor-humidity: convert probe and tea=
rdown to devm-managed resources")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/humidity/hid-sensor-humidity.c
index aa7d4f25c3937,12c88efe66be6..0000000000000
--- a/drivers/iio/humidity/hid-sensor-humidity.c
+++ b/drivers/iio/humidity/hid-sensor-humidity.c
@@@ -236,39 -241,13 +237,17 @@@ static int hid_humidity_probe(struct pl
 =20
  	platform_set_drvdata(pdev, indio_dev);
 =20
 -	humidity_callbacks.pdev =3D pdev;
 +	humid_st->callbacks =3D (struct hid_sensor_hub_callbacks) {
 +		.send_event =3D humidity_proc_event,
 +		.capture_sample =3D humidity_capture_sample,
 +		.pdev =3D pdev,
 +	};
- 	ret =3D sensor_hub_register_callback(hsdev, HID_USAGE_SENSOR_HUMIDITY,
+ 	ret =3D devm_sensor_hub_register_callback(dev, hsdev, HID_USAGE_SENSOR_H=
UMIDITY,
 -						&humidity_callbacks);
 +					   &humid_st->callbacks);
  	if (ret)
- 		goto error_remove_trigger;
+ 		return ret;
 =20
- 	ret =3D iio_device_register(indio_dev);
- 	if (ret)
- 		goto error_remove_callback;
-=20
- 	return ret;
-=20
- error_remove_callback:
- 	sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_HUMIDITY);
- error_remove_trigger:
- 	hid_sensor_remove_trigger(indio_dev, &humid_st->common_attributes);
- 	return ret;
- }
-=20
- /* Function to deinitialize the processing for usage id */
- static void hid_humidity_remove(struct platform_device *pdev)
- {
- 	struct hid_sensor_hub_device *hsdev =3D dev_get_platdata(&pdev->dev);
- 	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
- 	struct hid_humidity_state *humid_st =3D iio_priv(indio_dev);
-=20
- 	iio_device_unregister(indio_dev);
- 	sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_HUMIDITY);
- 	hid_sensor_remove_trigger(indio_dev, &humid_st->common_attributes);
+ 	return devm_iio_device_register(dev, indio_dev);
  }
 =20
  static const struct platform_device_id hid_humidity_ids[] =3D {

--v3CvYRVV1EmQ/Uho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp7zsACgkQJNaLcl1U
h9AW2wf+N1sTihkOsyNMIru3ZhGqTaQVBls9qKChA6i/By/77lg9VZ1KlpOb/PU7
+YThd2DT7jNQV6yZPvFaDLTaIdojosre0dASqC0OOEsYvWFgbUO/FJWRiFj3KmGO
crbtMzFw90iymWCgxsGvch6mB4kkcVHJKCj+0rarKh5UX2+eHArhCIh//lCFuTYV
WzbLDIDRImQ6IKEBpCwxxuMyLqjD4bh+xd6aSkj1Wvw9OIUjthxTmKkTG/MjiQaO
Us+gHhREwJeh66+dtpNYkEP4I9rnSqrY0GET7cqWBXy9IHxOJKzVsgVAZSAByLAH
hE0rDh6ZO5HjU6QtQTbhHBT+9w4OPg==
=zks9
-----END PGP SIGNATURE-----

--v3CvYRVV1EmQ/Uho--
