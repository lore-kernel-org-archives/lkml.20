Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233408;
	b=1RdnOeXJRuDsX0CxmA5XrGu0Hki0tL0GAPbApmuQm+xxeBzuTUKNFl4uswdNUVuW2UEr
	 jN7JbVFfNn1sK+tWyX7G5wzXXl57kWJQ6Iq0BTuIKmVCwtEINGnab76bT7/j28qm8ZQc6
	 j0k/wbujR98OVMhK4QXuP4RX+IfC44QWTfYLX9OJEEresmanOzYu4IEW6fdaUjmLBoudt
	 fyJawe1EIYlGnX44jvHHtU/uBY9iUlaLYiXAPaz8130j4CYnsvHHPmC2nRvM9FJvJrJ+s
	 BUtPZuFpSOLhi/uXWbhzDEfK3ypzG+23RwJcpjMsZKQ1UBXiz2fqx696+zI3+6667Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233408;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=UumFrd9y4gKn6E/16LjevO68J+aGZOvTAFwfFFWKBMI=;
	b=kiGrA6p1DEgqge98fEz9zgHaBEt5Gn+/35/AN7wL8XR+ckB1vX6AO0hh7X2Oz8TrLyUH
	 Rt50b4gZhlDwX+STtWa99V8sX+dr+KLDAeNTMJrm5VIf7Lpo5CAL/pBEoO16e0ATF1/ge
	 p7/kdY/S+stubNHUR5rXt+dPHTm7dZWj9UtSWXzaqC1+hXOqv7v52CsAgJ+fSOl8V02JM
	 CcjvOMhNKsFsw9U05F9PcR5r+mr+3yXDiygUokmMVEQapfl5puCwAwSyfyobzfMLK3L5s
	 aOg4ga9FIIigS978nm/hyP1pQqVuIfnRNakWPZfuHF91j9KulwlxvGd+cd4qvz9nC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBjvHATG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B091606A32A;
	Mon,  9 Nov 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBjvHATG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C347B1F008A2;
	Mon,  9 Nov 2026 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233407;
	bh=UumFrd9y4gKn6E/16LjevO68J+aGZOvTAFwfFFWKBMI=;
	h=Date:From:To:Cc:Subject;
	b=iBjvHATG9QSanZHo+5InXBElfRU/cBTraZVZ50iXabWbUJ+jdQZXJQLoxKlH0xlb8
	 LcwFdsz6i+ZH4oSQvzeyR2mlpMoAEksJHNHzxzqsK0NFVyTKM5GlDdhyWNeY/FyQ6M
	 RsPn7vCt9kN59QEyqFyiTfVzfTRfjvKJv4NStBMFf3k0MAKgDjzBG6V00HHK8k5iEb
	 mO3Wi7XZxlLGZ8bB4y7rUvAhSZw2lyZOO70NG+oSQYQXTLgXf8KlGyv7eQcOebKg7s
	 ovY21BI3Rj21JRVBYycPQTxoINSW82lEx66hifNWPWDKnL3zqA0NHzu7p1dOaXY4DT
	 3x3gjXJF3VPhg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A45C51AC5995; Mon, 09 Nov 2026 14:10:05 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:10:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sound-asoc tree with the origin tree
Message-ID: <avHUPVYXBtNqBH3m@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="oQj5po3DA9pvaXD5"
Content-Disposition: inline


--oQj5po3DA9pvaXD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/codecs/twl4030.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  5c23fe26f1163 ("ASoC: codecs: twl4030: fix external mute GPIO lookup")

=66rom the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined sound/soc/codecs/twl4030.c
index e207721b99414,9541c8a5a24e8..0000000000000
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@@ -6,6 -6,7 +6,7 @@@
   */
 =20
  #include <linux/delay.h>
+ #include <linux/err.h>
  #include <linux/gpio/consumer.h>
  #include <linux/i2c.h>
  #include <linux/init.h>
@@@ -13,9 -14,9 +14,9 @@@
  #include <linux/mfd/twl4030-audio.h>
  #include <linux/module.h>
  #include <linux/moduleparam.h>
- #include <linux/of.h>
  #include <linux/pm.h>
  #include <linux/platform_device.h>
+ #include <linux/property.h>
  #include <linux/slab.h>
  #include <sound/core.h>
  #include <sound/initval.h>
@@@ -198,40 -199,53 +199,53 @@@ static void twl4030_codec_enable(struc
  	udelay(10);
  }
 =20
- static void
- twl4030_get_board_param_values(struct twl4030_board_params *board_params,
- 			       struct device_node *node)
+ static struct twl4030_board_params *twl4030_get_board_params(struct devic=
e *dev)
  {
- 	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_de=
lay);
- 	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_de=
lay_value);
- 	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset_=
cncl_path);
- 	board_params->hs_extmute =3D of_property_read_bool(node, "ti,hs_extmute"=
);
+ 	struct twl4030_board_params *params;
+ 	int error;
 =20
- 	if (of_property_present(node, "ti,hs_extmute_gpio"))
- 		board_params->hs_extmute =3D 1;
- }
+ 	struct fwnode_handle *codec_node __free(fwnode_handle) =3D
+ 		device_get_named_child_node(dev->parent, "codec");
+ 	if (!codec_node)
+ 		return NULL;
 =20
- static struct twl4030_board_params*
- twl4030_get_board_params(struct device *dev)
- {
- 	struct twl4030_board_params *board_params =3D NULL;
- 	struct device_node *twl4030_codec_node =3D NULL;
+ 	params =3D devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
+ 	if (!params)
+ 		return ERR_PTR(-ENOMEM);
 =20
- 	twl4030_codec_node =3D of_get_child_by_name(dev->parent->of_node,
- 						  "codec");
+ 	fwnode_property_read_u32(codec_node, "ti,digimic_delay",
+ 				 &params->digimic_delay);
+ 	fwnode_property_read_u32(codec_node, "ti,ramp_delay_value",
+ 				 &params->ramp_delay_value);
+ 	fwnode_property_read_u32(codec_node, "ti,offset_cncl_path",
+ 				 &params->offset_cncl_path);
 =20
- 	if (twl4030_codec_node) {
- 		board_params =3D devm_kzalloc_obj(dev,
- 						struct twl4030_board_params);
- 		if (!board_params) {
- 			of_node_put(twl4030_codec_node);
- 			return ERR_PTR(-ENOMEM);
- 		}
- 		twl4030_get_board_param_values(board_params, twl4030_codec_node);
- 		of_node_put(twl4030_codec_node);
+ 	/*
+ 	 * Headset external mute can be controlled either via TWL4030's
+ 	 * dedicated GPIO6/EXTMUTE pin (enabled by the boolean "ti,hs_extmute"
+ 	 * property) or via a separate GPIO line ("ti,hs_extmute-gpios" or
+ 	 * legacy "ti,hs_extmute_gpio"), which implies external mute is active.
+ 	 */
+ 	params->hs_extmute =3D fwnode_property_read_bool(codec_node, "ti,hs_extm=
ute");
+=20
+ 	/*
+ 	 * This will attempt to parse "ti,hs_extmute-gpios" or
+ 	 * "ti,hs_extmute_gpio".
+ 	 */
+ 	params->hs_extmute_gpio =3D devm_fwnode_gpiod_get_optional(dev, codec_no=
de,
+ 								 "ti,hs_extmute",
+ 								 GPIOD_OUT_LOW,
+ 								 "hs_extmute");
+ 	error =3D PTR_ERR_OR_ZERO(params->hs_extmute_gpio);
+ 	if (error) {
+ 		dev_err_probe(dev, error, "Failed to get hs_extmute GPIO\n");
+ 		return ERR_PTR(error);
  	}
 =20
- 	return board_params;
+ 	if (params->hs_extmute_gpio)
+ 		params->hs_extmute =3D 1;
+=20
+ 	return params;
  }
 =20
  static int twl4030_get_hw_params(struct device *dev,
@@@ -243,30 -257,19 +257,19 @@@
  	if (IS_ERR(board_params))
  		return PTR_ERR(board_params);
 =20
- 	if (board_params && board_params->hs_extmute) {
- 		board_params->hs_extmute_gpio =3D devm_gpiod_get_optional(dev,
- 									"ti,hs_extmute",
- 									GPIOD_OUT_LOW);
- 		if (IS_ERR(board_params->hs_extmute_gpio))
- 			return dev_err_probe(dev,
- 					     PTR_ERR(board_params->hs_extmute_gpio),
- 					     "Failed to get hs_extmute GPIO\n");
+ 	if (board_params && board_params->hs_extmute &&
+ 	    !board_params->hs_extmute_gpio) {
+ 		u8 pin_mux;
 =20
- 		if (board_params->hs_extmute_gpio) {
- 			gpiod_set_consumer_name(board_params->hs_extmute_gpio, "hs_extmute");
- 		} else {
- 			u8 pin_mux;
+ 		dev_info(dev, "use TWL4030 GPIO6\n");
 =20
- 			dev_info(dev, "use TWL4030 GPIO6\n");
-=20
- 			/* Set TWL4030 GPIO6 as EXTMUTE signal */
- 			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
- 					TWL4030_PMBR1_REG);
- 			pin_mux &=3D ~TWL4030_GPIO6_PWM0_MUTE(0x03);
- 			pin_mux |=3D TWL4030_GPIO6_PWM0_MUTE(0x02);
- 			twl_i2c_write_u8(TWL4030_MODULE_INTBR, pin_mux,
- 					 TWL4030_PMBR1_REG);
- 		}
+ 		/* Set TWL4030 GPIO6 as EXTMUTE signal */
+ 		twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
+ 				TWL4030_PMBR1_REG);
+ 		pin_mux &=3D ~TWL4030_GPIO6_PWM0_MUTE(0x03);
+ 		pin_mux |=3D TWL4030_GPIO6_PWM0_MUTE(0x02);
+ 		twl_i2c_write_u8(TWL4030_MODULE_INTBR, pin_mux,
+ 				 TWL4030_PMBR1_REG);
  	}
 =20
  	twl4030->board_params =3D board_params;
@@@ -2191,7 -2194,7 +2194,7 @@@ static int twl4030_codec_probe(struct p
  	struct twl4030_priv *twl4030;
  	int ret;
 =20
 -	twl4030 =3D devm_kzalloc(&pdev->dev, sizeof(*twl4030), GFP_KERNEL);
 +	twl4030 =3D devm_kzalloc_obj(&pdev->dev, *twl4030);
  	if (!twl4030)
  		return -ENOMEM;
 =20

--oQj5po3DA9pvaXD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHUPQAKCRAv73Ows9A4
iewDAP9hD8LPSezrX4J7V+vmwXySgTbsky+ly6Yb5dserZrhrQD/V23jToBJ+B/k
Ib0ObLdWB1PDwLP46KXv/2vz1QVUWAY=
=YkMN
-----END PGP SIGNATURE-----

--oQj5po3DA9pvaXD5--
