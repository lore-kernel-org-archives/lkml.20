Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235447;
	b=n6EW7kDJVDGiHYhVA1MMDOzNj9b3HBvw/2aoIWhB+2znOqAv8QLTeg+QBYrCRsD6SFtv
	 GrPsrcZF9c0o/+JxLceeCMS1XClW4gSEuPkIAi+UBec+xYIRuxvkaKZL6VSf6GSTyeJIZ
	 yFUhK27suwCk3R9qjjywy4OdRMV91shaqixkFpcTHRNAs9NSu59cZZOlWL0kCOP174BHJ
	 lOR/zLM5z50yDsaxhIQ2+McTOmQ4bI59zq+hMCEgIIvQW9hDsF5OeN2M6mgrWWPIzrh5m
	 EfFi7VUqRodaOCyjBc61N455nL1staypiE5LSZtruNe2BkjCMr/8bVaJlHH9XDdzjTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235447;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=3rl7LhJNjiKGMy+KoJ8+dPrC9DmEvWGZz/NwltQ/uqs=;
	b=4WH0p6sMUTTe1j7miuQsR0W76Rt7SKtnS4QxGNtSuTeba6oxmU190RRsT42f9PwTvR59
	 E3ejBw2DPOlas0HL5nMoSDq//9Nrdm9XqQCi3CrbB4LfkMMrO04TuEuN7CMcqs9TaBlPk
	 ZGDR89vjdEo/W2Zfm7EB9QnoepNcr5N51Vy6rizsOMQIOx+QpJdHtA5JAxdH/P3cxJta3
	 Ba7ulnh6nurFPb3hYGFQ+atXWoitNdeALvWWJcjeHvEiYM5E1seuf1OgA/D+HsZGFVOls
	 Txuq+p0oq3Ltr5xG6U3p1bCUEs+0vXmdCJGboeWEMS00eDVceftvrNSpOyI6fSNfOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Srb+MIgS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE09606D815;
	Mon,  9 Nov 2026 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Srb+MIgS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324BF1F008BF;
	Mon,  9 Nov 2026 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235446;
	bh=3rl7LhJNjiKGMy+KoJ8+dPrC9DmEvWGZz/NwltQ/uqs=;
	h=Date:From:To:Cc:Subject;
	b=Srb+MIgSMEv3DACXCyp0n1jC9cd2Bw45MBCzB89+EnaGVH9HfjL/bYjNS6AE3LWn3
	 k2almqvXyoamMc2GjSguw8gQyaitWCEMrkTrphvVmclWVitvsXI/+iy8exTwttFrDB
	 kFUYEvi+C73NuHjISrFFCPs2KOmQBCYmTab1uY3XxBa58Tfo/SZmk6g9efHJzFd5E5
	 2+3DgDoQbJgN7j9fJ9zjaTn+Jiqj31QO2eFtRCs0HGaTMUdU/vUPuRr/L28Mevlman
	 HFpc+hUxydbhKdQk2GdIoZJVq0we6zGJGUVeQz0ZYBKwvBtXDhDGf9EPEelC9dH0L2
	 Kb8tjg7wU25TA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D53211AC5995; Mon, 09 Nov 2026 14:44:03 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:44:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Francesco Valla <francesco@valla.it>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the origin tree
Message-ID: <avHcMzeFfcumgrNt@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="gme3rOL+2A7oZixo"
Content-Disposition: inline


--gme3rOL+2A7oZixo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpio-virtio.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  d5d4132419a41 ("gpio: virtio: convert to immutable irq_chip")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpio/gpio-virtio.c
index d0ae3d57c6403,e2add87d76a8a..0000000000000
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@@ -17,6 -17,7 +17,7 @@@
  #include <linux/kernel.h>
  #include <linux/module.h>
  #include <linux/mutex.h>
+ #include <linux/seq_file.h>
  #include <linux/spinlock.h>
  #include <linux/virtio_config.h>
  #include <uapi/linux/virtio_gpio.h>
@@@ -243,6 -244,8 +244,8 @@@ static void virtio_gpio_irq_enable(stru
  	struct virtio_gpio *vgpio =3D gpiochip_get_data(gc);
  	struct vgpio_irq_line *irq_line =3D &vgpio->irq_lines[d->hwirq];
 =20
+ 	gpiochip_enable_irq(gc, d->hwirq);
+=20
  	raw_spin_lock(&vgpio->eventq_lock);
  	irq_line->disabled =3D false;
  	irq_line->masked =3D false;
@@@ -265,6 -268,8 +268,8 @@@ static void virtio_gpio_irq_disable(str
  	raw_spin_unlock(&vgpio->eventq_lock);
 =20
  	irq_line->update_pending =3D true;
+=20
+ 	gpiochip_disable_irq(gc, d->hwirq);
  }
 =20
  static void virtio_gpio_irq_mask(struct irq_data *d)
@@@ -512,7 -517,7 +517,7 @@@ static const char **virtio_gpio_get_nam
  		return NULL;
  	}
 =20
 -	names =3D devm_kcalloc(dev, ngpio, sizeof(*names), GFP_KERNEL);
 +	names =3D devm_kzalloc_objs(dev, *names, ngpio);
  	if (!names)
  		return NULL;
 =20
@@@ -532,16 -537,35 +537,35 @@@
  	return names;
  }
 =20
+ static void virtio_gpio_irq_print_chip(struct irq_data *d, struct seq_fil=
e *p)
+ {
+ 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+=20
+ 	seq_puts(p, dev_name(gc->parent));
+ }
+=20
+ static const struct irq_chip virtio_gpio_irqchip =3D {
+ 	.irq_enable =3D virtio_gpio_irq_enable,
+ 	.irq_disable =3D virtio_gpio_irq_disable,
+ 	.irq_mask =3D virtio_gpio_irq_mask,
+ 	.irq_unmask =3D virtio_gpio_irq_unmask,
+ 	.irq_set_type =3D virtio_gpio_irq_set_type,
+ 	.irq_bus_lock =3D virtio_gpio_irq_bus_lock,
+ 	.irq_bus_sync_unlock =3D virtio_gpio_irq_bus_sync_unlock,
+ 	.irq_print_chip =3D virtio_gpio_irq_print_chip,
+ 	.flags =3D IRQCHIP_IMMUTABLE,
+ 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+ };
+=20
  static int virtio_gpio_probe(struct virtio_device *vdev)
  {
  	struct device *dev =3D &vdev->dev;
  	struct virtio_gpio *vgpio;
- 	struct irq_chip *gpio_irq_chip;
  	u32 gpio_names_size;
  	u16 ngpio;
  	int ret, i;
 =20
 -	vgpio =3D devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
 +	vgpio =3D devm_kzalloc_obj(dev, *vgpio);
  	if (!vgpio)
  		return -ENOMEM;
 =20
@@@ -556,7 -580,7 +580,7 @@@
  		return -EINVAL;
  	}
 =20
 -	vgpio->lines =3D devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KER=
NEL);
 +	vgpio->lines =3D devm_kzalloc_objs(dev, *vgpio->lines, ngpio);
  	if (!vgpio->lines)
  		return -ENOMEM;
 =20
@@@ -584,31 -608,17 +608,18 @@@
 =20
  	/* Interrupt support */
  	if (virtio_has_feature(vdev, VIRTIO_GPIO_F_IRQ)) {
 -		vgpio->irq_lines =3D devm_kcalloc(dev, ngpio, sizeof(*vgpio->irq_lines)=
, GFP_KERNEL);
 +		vgpio->irq_lines =3D devm_kzalloc_objs(dev, *vgpio->irq_lines,
 +						     ngpio);
  		if (!vgpio->irq_lines)
  			return -ENOMEM;
 =20
- 		gpio_irq_chip =3D devm_kzalloc_obj(dev, *gpio_irq_chip);
- 		if (!gpio_irq_chip)
- 			return -ENOMEM;
-=20
- 		gpio_irq_chip->name =3D dev_name(dev);
- 		gpio_irq_chip->irq_enable =3D virtio_gpio_irq_enable;
- 		gpio_irq_chip->irq_disable =3D virtio_gpio_irq_disable;
- 		gpio_irq_chip->irq_mask =3D virtio_gpio_irq_mask;
- 		gpio_irq_chip->irq_unmask =3D virtio_gpio_irq_unmask;
- 		gpio_irq_chip->irq_set_type =3D virtio_gpio_irq_set_type;
- 		gpio_irq_chip->irq_bus_lock =3D virtio_gpio_irq_bus_lock;
- 		gpio_irq_chip->irq_bus_sync_unlock =3D virtio_gpio_irq_bus_sync_unlock;
-=20
  		/* The event comes from the outside so no parent handler */
  		vgpio->gc.irq.parent_handler	=3D NULL;
  		vgpio->gc.irq.num_parents	=3D 0;
  		vgpio->gc.irq.parents		=3D NULL;
  		vgpio->gc.irq.default_type	=3D IRQ_TYPE_NONE;
  		vgpio->gc.irq.handler		=3D handle_level_irq;
- 		vgpio->gc.irq.chip		=3D gpio_irq_chip;
+ 		gpio_irq_chip_set_chip(&vgpio->gc.irq, &virtio_gpio_irqchip);
 =20
  		for (i =3D 0; i < ngpio; i++) {
  			vgpio->irq_lines[i].type =3D VIRTIO_GPIO_IRQ_TYPE_NONE;
@@@ -647,8 -657,8 +658,8 @@@ static void virtio_gpio_remove(struct v
  }
 =20
  static const struct virtio_device_id id_table[] =3D {
- 	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
- 	{},
+ 	{ .device =3D VIRTIO_ID_GPIO, .vendor =3D VIRTIO_DEV_ANY_ID },
+ 	{ }
  };
  MODULE_DEVICE_TABLE(virtio, id_table);
 =20

--gme3rOL+2A7oZixo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHcMwAKCRAv73Ows9A4
iVnBAPoDmllbBVBO+cp8PLEraL0c2wujSiowVv1l3y0FSPNYhwEAlq8+VQKiZioS
ZZclIgsbD+VP/h0La1xyhXXnsC180wo=
=bXUh
-----END PGP SIGNATURE-----

--gme3rOL+2A7oZixo--
