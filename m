Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715555;
	b=zzrHR35omARn8PuGsdMY4N0kQlxzbVK7T7otlSclQTzYvGW1xt4GXaDCFTkwQPHMxw4K
	 dCJRsFlRWy7mPCXwbtfrZNEbejosR67RSxjMErGzixAQkBSwk3cPv0mj+WCZIXZ4nrG7u
	 vT1QuFa2Nfvhet/NmaSLEu38SJX5EOILL2wL2h/hpkCMEtg/3V1rUdWt0eq3ZJo+TB1VB
	 7djID4uGUUyDaPCszshmchooDp+CdgIfNxfgoJ5un6d27fN1IJHTZEamOORoBZ3A8Blvw
	 HDelHLZMimbe/LAHzPUUcsQ6J2QXnfZ1Jx4iwz7WuAcGS5oz0aPBJ5XdOI30hjWgwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715555;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=tvx6JCmTroZKHXwhLSqePhouVC/T90z2COn4c0vx7p8=;
	b=3Gu8bl9+M9rdjvNIMt/IjL7sp6vGZyz9IfsdAP7HDjsd+w/hySq136qMuXSdZTObrRxb
	 eiwU6l7ylMYzfVt/7htS+7HW3NQiMT7X9aFaN2D+tk7/wL4EOaq5L7Orae7HGti1eNZhr
	 bvxB+cOFScjcaQ8WMvXnEJWMaUIJ1AVYWioSvd04SdUljmSqLObjffCly+iZAbi6IbnIW
	 xZAkXeafX23H6qblMsIKN1FwmnTHLKa0IltTdrZClrvDNCY/qk+k2KqJOHUeP5K0tIgaM
	 8oeTeUBg+lIK7gGl5ugt94z1QCAC1nzQYT6khy4/+dS1wqGLmFnZQABkQBTNhNhnxWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYCkIn5e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1048606A336;
	Tue,  3 Nov 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYCkIn5e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070331F00A16;
	Tue,  3 Nov 2026 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715554;
	bh=tvx6JCmTroZKHXwhLSqePhouVC/T90z2COn4c0vx7p8=;
	h=Date:From:To:Cc:Subject;
	b=hYCkIn5eiDKmR0EZ0wa18ohRkwF6ul9NLz80ROdgMw0l6pQrwZeT0b3wtwg4AY68Z
	 3iVWDOMZujI3MJcXgCOTJGe0z2eJC1jbt6Qz06ahwwBEnGe0XfZrhBv6NkXB5yv9ks
	 hQQURpVq/rBjtLcD5m+Bs9FkGKELJ4pp83b8c0H9qqxLtYKBKAHZF6kXRgMQ7MyvnO
	 TuoimmVrSTdvAl6rJ4nny4K7WdyV+R7EuaxaWwbbDjUo+NvvxdQluFRJCGtf0SPbKT
	 DaiXMhXclNa6ORbQDXjx57VWbg1FOGyYqjdEHyELT+680xRNENnJ6/bOd54ezDzoWb
	 VkvSr5eNzy2aA==
Date: Tue, 3 Nov 2026 14:19:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Christopher Hoover <ch@murgatroid.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sanjay Chitroda <sanjayembeddedse@gmail.com>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <auntXn1lF8QIemTp@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ePI7VleqgFTAcDT7"
Content-Disposition: inline


--ePI7VleqgFTAcDT7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/temperature/hid-sensor-temperature.c

between commit:

  73c53b592a982 ("iio: temperature: hid-sensor-temperature: Use per-instanc=
e callbacks")

=66rom the iio-fixes tree and commit:

  f5df16bbfbd60 ("iio: temperature: hid-sensor-temperature: convert probe a=
nd teardown to devm-managed resources")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/temperature/hid-sensor-temperature.c
index ae67daff6df5a,ac5a287d1de32..0000000000000
--- a/drivers/iio/temperature/hid-sensor-temperature.c
+++ b/drivers/iio/temperature/hid-sensor-temperature.c
@@@ -233,39 -238,14 +234,17 @@@ static int hid_temperature_probe(struc
 =20
  	platform_set_drvdata(pdev, indio_dev);
 =20
 -	temperature_callbacks.pdev =3D pdev;
 -	ret =3D devm_sensor_hub_register_callback(dev, hsdev,
 -						HID_USAGE_SENSOR_TEMPERATURE,
 -						&temperature_callbacks);
 +	temp_st->callbacks =3D (struct hid_sensor_hub_callbacks) {
 +		.send_event =3D temperature_proc_event,
 +		.capture_sample =3D temperature_capture_sample,
 +		.pdev =3D pdev,
 +	};
- 	ret =3D sensor_hub_register_callback(hsdev, HID_USAGE_SENSOR_TEMPERATURE,
++	ret =3D devm_sensor_hub_register_callback(dev, hsdev, HID_USAGE_SENSOR_T=
EMPERATURE,
 +					   &temp_st->callbacks);
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
- 	sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_TEMPERATURE);
- error_remove_trigger:
- 	hid_sensor_remove_trigger(indio_dev, &temp_st->common_attributes);
- 	return ret;
- }
-=20
- /* Function to deinitialize the processing for usage id */
- static void hid_temperature_remove(struct platform_device *pdev)
- {
- 	struct hid_sensor_hub_device *hsdev =3D dev_get_platdata(&pdev->dev);
- 	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
- 	struct temperature_state *temp_st =3D iio_priv(indio_dev);
-=20
- 	iio_device_unregister(indio_dev);
- 	sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_TEMPERATURE);
- 	hid_sensor_remove_trigger(indio_dev, &temp_st->common_attributes);
+ 	return devm_iio_device_register(dev, indio_dev);
  }
 =20
  static const struct platform_device_id hid_temperature_ids[] =3D {

--ePI7VleqgFTAcDT7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp7V0ACgkQJNaLcl1U
h9Dtgwf8DzmA8eKVxMEVAqkT/nUfh7PX7lfRwpZGGUMKf/wpWtuEw8pldYoAzYQo
iEpy1FIrkj86JnPdemR86EzuD+4kB+CYYK5iaUwebBrPLlX4bwfP6+zbQ3ZXXqNE
Q4Y2wbX60/Hb3jPNKEHefV4K/Z46+Umc5+HrgzawYJ7XgLtzW+uOuWbB6V5PJnoQ
BlNaxUFv9wicw1bxMeSUu6cXdzO0UZkvKACdIaqyOKq9EvplCa3nNWRCnK6n81lm
q3TkTWlw30RwzZlJnkzoWNZ+ivhHfLiRaHiUfdyOh0pYWNRFYJVbHfro9zKtzCMG
mkU4eKEVk09JaWcm+3tNFhE3YnZS8A==
=uxSj
-----END PGP SIGNATURE-----

--ePI7VleqgFTAcDT7--
