Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857234;
	b=FdmBHmhyRtkqir31jhDQOT9buroDnGW7TpG7lkcbik/FzKeXI3VJ/8AQhn9EDmP64n9U
	 gLkShN4WdyVfpazQRQ5JFK8d0OY8mrc3Ux9CT6HIvlDSrPeRr1WISLIJw+g+9wR1F0DGi
	 cnp3Y43mciLJWoeaQU2CjFpzHl2hJSmP0P7GNcS/fzbFcWEYpWxbvf9edBpNpzcXmpvwj
	 if+zgHoe00nk8vYxwA2DfkT+I6XxL1qwoXo3rOXFCxN+v92vbGwbwiVnKdBhmum7UBoCd
	 SPM43hGDAGmL5rUPv4nTEoHU6nRRHKlp5sXzeZ9YlPmwoLdQhOyC/CyKuRHLBqYgnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857234;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=e9PvDEVcMLMO6mVD+QDDgXDEsL7JFascfg8e4zMTooI=;
	b=vMg4mWGQozbUirsXpNFgDoaY5wU/5xjpBsoNg56DtF8e1vark91+dIsj8wiRIaMrVq3L
	 Q+MPQDpw0uL+z3Wcw/SHfHXBfyQKS9vnMAoTCMT5pwzdDRKpxjvHQDMj/eyAMA3hdDlfD
	 XJtkGx94523hOCcWvRLwTUA/BacmH7FQXrxibXWg+0aaOoMA7vIxv6KcrPqe3X5Ae5N8C
	 x+xrnF2y/i5qqLn/lsnOal56gtAb6SbITrwkOLudoLAcXM/D+eSfohfZWMj925ehUcnZX
	 YY5ct8DHyFxfMgZGWToMmU1mKVw7vvpjjdOCiPeXvxr7McvJdwVjEh4ijLlJBPLAcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQVwDP6e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128E606A330;
	Mon, 16 Nov 2026 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQVwDP6e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E301F000C4;
	Mon, 16 Nov 2026 19:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857233;
	bh=e9PvDEVcMLMO6mVD+QDDgXDEsL7JFascfg8e4zMTooI=;
	h=Date:From:To:Cc:Subject;
	b=VQVwDP6eEzbWjmRSome0V/K8mZZveFBvSzK9vDNcRIIi/NVZK3k84+usiVHE9DQaM
	 wVvPP+C8BosyuHV8MsNc6Bqxc4fVOd+tEqravf0HnHoKQ6G0xcAcC2LLdjaDLwT4Hz
	 snSgiWiDSTc6lY8djMiqqc7weegsHmE82zhXL2ylW735kEEF/9hL5O3LOWC9yJV8ya
	 3vaYvlPh7KmxW9PNgctmorNvPJfREz3LqHjzLjgYRiSo+qeh1K3gooWHEStoFjirKN
	 Q14tBEDp9sT7WErB+0dXmvcAvQUH5YxlZuxcVQ7KtklXy4BNgXkbEgpySJjGDncaEg
	 wh5HvYtjFdNjA==
Date: Mon, 16 Nov 2026 19:27:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Benson Leung <bleung@google.com>, Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chad Aldreda <ca@modelmiser.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: linux-next: manual merge of the chrome-platform tree with the origin
 tree
Message-ID: <avtZDbrv2YL6kfQR@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="lC12tJHL3yfxxy81"
Content-Disposition: inline


--lC12tJHL3yfxxy81
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the chrome-platform tree got a conflict in:

  drivers/platform/chrome/cros_hps_i2c.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  2c1aa3d09aad8 ("platform/chrome: cros_hps_i2c: Fix use-after-free in rele=
ase() after unbind")

=66rom the chrome-platform tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/platform/chrome/cros_hps_i2c.c
index c320489bfe1a0,436afc4f50d38..0000000000000
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@@ -14,9 -14,12 +14,12 @@@
  #include <linux/fs.h>
  #include <linux/gpio/consumer.h>
  #include <linux/i2c.h>
+ #include <linux/kref.h>
  #include <linux/miscdevice.h>
  #include <linux/module.h>
+ #include <linux/mutex.h>
  #include <linux/pm_runtime.h>
+ #include <linux/slab.h>
 =20
  #define HPS_ACPI_ID		"GOOG0020"
 =20
@@@ -24,8 -27,26 +27,26 @@@ struct hps_drvdata=20
  	struct i2c_client *client;
  	struct miscdevice misc_device;
  	struct gpio_desc *enable_gpio;
+=20
+ 	/* hps outlives the driver binding while files are open. */
+ 	struct kref kref;
+ 	/*
+ 	 * Protects open_count, and client against remove(). remove() sets
+ 	 * client to NULL after dropping the files' runtime PM references;
+ 	 * release() then leaves the device alone.
+ 	 */
+ 	struct mutex lock;
+ 	unsigned int open_count;
  };
 =20
+ static void hps_free(struct kref *kref)
+ {
+ 	struct hps_drvdata *hps =3D container_of(kref, struct hps_drvdata, kref);
+=20
+ 	mutex_destroy(&hps->lock);
+ 	kfree(hps);
+ }
+=20
  static void hps_set_power(struct hps_drvdata *hps, bool state)
  {
  	gpiod_set_value_cansleep(hps->enable_gpio, state);
@@@ -36,18 -57,33 +57,33 @@@ static int hps_open(struct inode *inode
  	struct hps_drvdata *hps =3D container_of(file->private_data,
  					       struct hps_drvdata, misc_device);
  	struct device *dev =3D &hps->client->dev;
+ 	int ret;
 =20
- 	return pm_runtime_resume_and_get(dev);
+ 	ret =3D pm_runtime_resume_and_get(dev);
+ 	if (ret)
+ 		return ret;
+=20
+ 	mutex_lock(&hps->lock);
+ 	hps->open_count++;
+ 	mutex_unlock(&hps->lock);
+=20
+ 	kref_get(&hps->kref);
+ 	file->private_data =3D hps;
+ 	return 0;
  }
 =20
  static int hps_release(struct inode *inode, struct file *file)
  {
- 	struct hps_drvdata *hps =3D container_of(file->private_data,
- 					       struct hps_drvdata, misc_device);
- 	struct device *dev =3D &hps->client->dev;
+ 	struct hps_drvdata *hps =3D file->private_data;
 =20
- 	pm_runtime_put(dev);
+ 	mutex_lock(&hps->lock);
+ 	if (hps->client) {
+ 		hps->open_count--;
+ 		pm_runtime_put(&hps->client->dev);
+ 	}
+ 	mutex_unlock(&hps->lock);
 =20
+ 	kref_put(&hps->kref, hps_free);
  	return 0;
  }
 =20
@@@ -62,10 -98,13 +98,13 @@@ static int hps_i2c_probe(struct i2c_cli
  	struct hps_drvdata *hps;
  	int ret;
 =20
- 	hps =3D devm_kzalloc_obj(&client->dev, *hps);
+ 	hps =3D kzalloc_obj(*hps);
  	if (!hps)
  		return -ENOMEM;
 =20
+ 	kref_init(&hps->kref);
+ 	mutex_init(&hps->lock);
+=20
  	hps->misc_device.parent =3D &client->dev;
  	hps->misc_device.minor =3D MISC_DYNAMIC_MINOR;
  	hps->misc_device.name =3D "cros-hps";
@@@ -83,32 -122,49 +122,49 @@@
  	if (IS_ERR(hps->enable_gpio)) {
  		ret =3D PTR_ERR(hps->enable_gpio);
  		dev_err(&client->dev, "failed to get enable gpio: %d\n", ret);
- 		return ret;
+ 		goto err_put;
  	}
 =20
  	ret =3D misc_register(&hps->misc_device);
  	if (ret) {
  		dev_err(&client->dev, "failed to initialize misc device: %d\n", ret);
- 		return ret;
+ 		goto err_put;
  	}
 =20
  	hps_set_power(hps, false);
  	pm_runtime_enable(&client->dev);
  	return 0;
+=20
+ err_put:
+ 	kref_put(&hps->kref, hps_free);
+ 	return ret;
  }
 =20
  static void hps_i2c_remove(struct i2c_client *client)
  {
  	struct hps_drvdata *hps =3D i2c_get_clientdata(client);
 =20
- 	pm_runtime_disable(&client->dev);
+ 	/* After misc_deregister(), no open() is running or can start. */
  	misc_deregister(&hps->misc_device);
 =20
+ 	/* Drop the runtime PM references of files that are still open. */
+ 	mutex_lock(&hps->lock);
+ 	while (hps->open_count) {
+ 		hps->open_count--;
+ 		pm_runtime_put_noidle(&client->dev);
+ 	}
+ 	hps->client =3D NULL;
+ 	mutex_unlock(&hps->lock);
+=20
+ 	pm_runtime_disable(&client->dev);
+=20
  	/*
  	 * Re-enable HPS, in order to return it to its default state
  	 * (i.e. powered on).
  	 */
  	hps_set_power(hps, true);
+=20
+ 	kref_put(&hps->kref, hps_free);
  }
 =20
  static int hps_suspend(struct device *dev)

--lC12tJHL3yfxxy81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WQwACgkQJNaLcl1U
h9ACCAf/Sv2fkkYWnrY/TuOJsTj/6dm24pBd2e2WPQtySI+/1IavqUYTxmawPKuY
CDhiuz5VP9axIOq4us/o/uy9QY5dCxF5yCHoRobuI0HbUZB/waV1prfkpBtWQ5g9
/c2z2TlKsoxyd0L4Fb1G92oV8OKBB+P79kcBQcMgysk4kp8Smn7dVG5SrU57Bf6Z
INVpgcD4wtPebnAf8QSAT0AdMDpkRnFnYXRwyo/58YBsK22svVxZqGJaoC7PdRQY
8KL5kumnDW7EF8LhJq4vxCEMnpek0sVIfRggVU/86agb9tgUH1RQSOsleOO4s0bE
m8CrYpxnFUWhb9Ca3koQ+SLm1J6KIQ==
=p83e
-----END PGP SIGNATURE-----

--lC12tJHL3yfxxy81--
