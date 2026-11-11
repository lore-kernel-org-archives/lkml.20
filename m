Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794439029;
	b=1OWbWo3tRD3Ihg7dQxwMNiWkSZCW4hrB5Wt2LLkhGRAKGEVXaIwvR4gNvPtTEl/13XL/
	 4Zz3dTY/iUczCMtmanq5Ri5bg8wXCGoXuNFaRId/Wnn60ZrlYTIemtR8+a8AS04/ePl41
	 e4g50sA43k69PQZSRWUOcYIWZ9nYqoX8Q0DroltGr1CzpvQnSH2pI3T2Fjs0AYY9g7ZhU
	 /DnJJ2o9ORSDgmhgCRs0Y1t+yIfUUjqxI6YVfNhRjYQfiwYRzjFg8UsT8ekEeKD0EyJUo
	 KBEDJpCl8BvtL6PyC1nQOOTOry7boNUpE6OGaOg8CI+yU/ylvGZ+5CTchk0WXXI1how==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439029;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=X566TSp1g08t2T54eFFHOyU2hPE+x6DCobn3glJTKO8=;
	b=3Lt8AKvJCiNlu+U5RYlyDY4hdTVa+ZQg5G3WMu43fa2Yh3dA26sUvjXMbqr1FWcWIpIj
	 owX9lIYyHBFDz+rPCXLP2TxerOYzXg3MjRrr+BS23Ep99F4tqPu1k42xzXR8e0oOI2dv8
	 XJnWTupv7zjyZhbrt7rTigyEGafN4IVVSHKgjuKe8fduwuWRv1872IkiyHYwev104uwnI
	 RjPzyXB6mOfuDCZE1TKmpOQvjrnSKPkmQ3KB1DUitiJdkJnpV1+LkIG3Fi/l0n/RslxCQ
	 ss3pb1BUOeG8b68grNVnaXwBoFChrq3ZpVkAlOa/+9WWfY1dZBC3eTVASGKXqNIdWFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KLtxO6XD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506C606A33D;
	Wed, 11 Nov 2026 23:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4506C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KLtxO6XD
ARC-Seal: i=1; a=rsa-sha256; t=1794439022; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GACz1vdHwqszkeQQlI9SH1FHiFyAKVZsqXHjf1RdQeuVn0GOqd2S75Rd7Nl6QBfiZ9Uoqh5BC9MH/ib1EOYZhR91Opx0pjhc5qaVsYCXYZYGAfW29RyiyPIiFhjL3hUqouA1jnn3m0KQIIl4bEC3x81CYl6mPYsdzdkPhncbPJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794439022; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X566TSp1g08t2T54eFFHOyU2hPE+x6DCobn3glJTKO8=; 
	b=GUHiLz7pMXAg38RSVW5ppXaRns+TpAI3DkB96sSXbu1gdFUsnEOZVrjN8QUWIhe7/HWt4ny41gWEYv08JSVubxL4yOhKduGUGHh3k1N6eD1RGhDdMBJsZCQfOT0kWbwMkblp9tiDBqScZZd5Hm/atS+nIkRWLUWRfg2fGp3TZKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=KLtxO6XDpBsD4ifRhx8/ISMrL2Tj+s2nEkyODervBl1T3i1lK1h41qSzZOeN7KkoeGXZLCMfwfeXr442al5XW7K3pnUZ6Ndvt0HBGHIq9r5vDT0l2aMymAJm0a20ujMyHf6jCJw5b/zogmXkVxU1nycIiTvEq16OXEQe2os47XI=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=X566TSp1g08t2T54eFFHOyU2hPE+x6DCobn3glJTKO8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794439020559405.26800457098693;
	Wed, 11 Nov 2026 15:17:00 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id BDDBE180758; Thu, 12 Nov 2026 00:16:57 +0100 (CET)
Date: Thu, 12 Nov 2026 00:16:57 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: typec: fusb302: Enable SOP' communication
Message-ID: <avT3VpGTdwkv3G40@venus>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-5-6217dabc1a85@flipper.net>
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
	protocol="application/pgp-signature"; boundary="m353sa5fb4jbqqq7"
Content-Disposition: inline
In-Reply-To: <20261103-husb311-cable-comm-v1-5-6217dabc1a85@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--m353sa5fb4jbqqq7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] usb: typec: fusb302: Enable SOP' communication
MIME-Version: 1.0

Hi,

On Tue, Nov 03, 2026 at 03:21:26PM +0400, Alexey Charkov wrote:
> Let TCPM discover e-marked cables through the FUSB302 and learn their
> current and speed ratings.
>=20
> Receive SOP' only while sourcing VCONN with PD reception on. Only the
> VCONN Source talks to the cable plug, and acking the traffic between the
> partner and the plug would collide with their own GoodCRC.
>=20
> Switch SOP' reception off before VCONN or PD reception goes off and on
> only once both are on. If that fails, log it instead of failing the
> switch TCPM asked for: SOP' reception left off only costs cable
> discovery, and left on with VCONN off makes the port ack the partner's
> traffic with the cable plug until PD reception goes off, which beats
> keeping VCONN or PD reception in a state TCPM did not request.
>=20
> Tested on a FUSB302B as source with an e-marked 5A EPR cable. The
> datasheet documents the auto-GoodCRC header bits for SOP only, but the
> cable plug took the chip's acks to its SOP' replies without retrying.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/fusb302.c | 37 ++++++++++++++++++++++++++++++++++=
+++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 8b3a2e095ef8..10f2dabf3318 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -725,6 +725,27 @@ static int tcpm_set_polarity(struct tcpc_dev *dev,
>  	return 0;
>  }
> =20
> +/*
> + * Without VCONN from us, SOP' traffic is between the partner and the ca=
ble
> + * plug, and our GoodCRC would collide with theirs. So stop receiving SO=
P'
> + * before VCONN or PD reception goes off, and start only once both are o=
n.
> + * Neither is worth failing the VCONN or PD reception switch over.
> + */
> +static void fusb302_pd_set_sop_prime(struct fusb302_chip *chip, bool on)
> +{
> +	int ret;
> +
> +	if (on)
> +		ret =3D fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL1,
> +					   FUSB_REG_CONTROL1_ENSOP1);
> +	else
> +		ret =3D fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL1,
> +					     FUSB_REG_CONTROL1_ENSOP1);
> +	if (ret < 0)
> +		fusb302_log(chip, "cannot turn SOP' rx %s, ret=3D%d",
> +			    str_on_off(on), ret);
> +}
> +
>  static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
>  {
>  	struct fusb302_chip *chip =3D container_of(dev, struct fusb302_chip,
> @@ -743,6 +764,8 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool =
on)
>  		switches0_data =3D (chip->cc_polarity =3D=3D TYPEC_POLARITY_CC1) ?
>  				 FUSB_REG_SWITCHES0_VCONN_CC2 :
>  				 FUSB_REG_SWITCHES0_VCONN_CC1;
> +	} else {
> +		fusb302_pd_set_sop_prime(chip, false);
>  	}
>  	ret =3D fusb302_i2c_mask_write(chip, FUSB_REG_SWITCHES0,
>  				     switches0_mask, switches0_data);
> @@ -750,6 +773,9 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool =
on)
>  		goto done;
>  	chip->vconn_on =3D on;
>  	fusb302_log(chip, "vconn :=3D %s", str_on_off(on));
> +
> +	if (on && chip->pd_rx_on)
> +		fusb302_pd_set_sop_prime(chip, true);
>  done:
>  	mutex_unlock(&chip->lock);
> =20
> @@ -848,6 +874,8 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool =
on)
>  		goto done;
>  	}
> =20
> +	if (!on)
> +		fusb302_pd_set_sop_prime(chip, false);
>  	ret =3D fusb302_pd_rx_flush(chip);
>  	if (ret < 0) {
>  		fusb302_log(chip, "cannot flush pd rx buffer, ret=3D%d", ret);
> @@ -873,6 +901,9 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool =
on)
> =20
>  	chip->pd_rx_on =3D on;
>  	fusb302_log(chip, "pd :=3D %s", str_on_off(on));
> +
> +	if (on && chip->vconn_on)
> +		fusb302_pd_set_sop_prime(chip, true);
>  done:
>  	mutex_unlock(&chip->lock);
> =20
> @@ -1136,6 +1167,11 @@ static void fusb302_bc_lvl_handler_work(struct wor=
k_struct *work)
>  	mutex_unlock(&chip->lock);
>  }
> =20
> +static bool tcpm_cable_comm_capable(struct tcpc_dev *dev)
> +{
> +	return true;
> +}
> +
>  static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
>  {
>  	fusb302_tcpc_dev->init =3D tcpm_init;
> @@ -1150,6 +1186,7 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_=
tcpc_dev)
>  	fusb302_tcpc_dev->set_roles =3D tcpm_set_roles;
>  	fusb302_tcpc_dev->start_toggling =3D tcpm_start_toggling;
>  	fusb302_tcpc_dev->pd_transmit =3D tcpm_pd_transmit;
> +	fusb302_tcpc_dev->cable_comm_capable =3D tcpm_cable_comm_capable;
>  }
> =20
>  static const char * const cc_polarity_name[] =3D {
>=20
> --=20
> 2.56.0
>=20

--m353sa5fb4jbqqq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr092kACgkQ2O7X88g7
+pqe4RAAihWn2wGdOWmtb/tGwuuxkaDKyK1s2RcpjY1F/xsczD+qn62vfNMTTzbe
gLSbZ9kYignBtorflHx3MMlTpyMyRKO0pH4c/LTAzL/VkEOzTZ7DCSyJ6q/jCbmW
g64lW1uGDs7Dcni4gf/2PNhjss/hTHWJbVvqyBuwCHU0SOL7HZp6keNpIwK30fVT
cA0QuVparSD4DThAwCwY6jZJtn6cKoeToS/4eRxWAK3WHriB0lnqGZSRsSmi/kV4
uNKwlMwks5F9Ls+NVcRc0lgdASSZx4QymyIlK16enDSl2SchnbIyuA1FCMK0Ehse
XGbgbgh0vLVdQzzWVGtPcGC+KJV3xPs9MLzLKeI67vbczJfoJXl29RkvD3JVoS24
XWeAiflyVkSecji5pG/5yNO5x+SoOB56F1uyW9KMP9BchORQcQU7l7ukY4ZiTojI
RfOwjJMwY6GJswBgRJR5vyQCTqCpoWa6TwSc3p22t/nMxFduV4+P0kZNz983hYQL
Uz+Qb48ofnY4L7N9HuYTxJolQeRon6OD6HuSDCyNeHzxiQT2+zuE0yyHQxhaL5uf
btDPXRj90DCrYv9FD3yKnCndQcTLOFlJMcm0l1iVlpAcZkQbIUN3JFmt0rM3WamX
hqULwFJfwuJoh3ePDx6U5Sahcwe5PSRsbCI81JChwZgrcbIWdLI=
=XVHM
-----END PGP SIGNATURE-----

--m353sa5fb4jbqqq7--
