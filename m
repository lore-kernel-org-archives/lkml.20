Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794439010;
	b=wqNOXrq0V5t2gqTjZKhA5GABBR5JsO0sSTzFJN5wUFoM0ZFb4/5a4Qwa8IgkanSFputD
	 2iDy25JruDSL+GGzGDCKypYHhi3FnlX3blr48UVE3Eewqor7VXmCD4UyfiB+ZyI/+Af9T
	 2POIl7oHEyhtVwhtS5MsSWwLa+FbqwNesP8i1ZNkvKry6E7Jg1SNSe4oAnjwQgdQHlb+A
	 Vsptu7hb53mOn4I2FSueJMKJbT7aqx7LWSzXNrjLxSh46RGVre/sXn06pPQLvnXXEE+1T
	 KlgY2ntCDppLcOKeIMpfPrBcdMtM+vZxXNFiFHG8rhGaheo8rjB5U6Tn0jAeRD+CRcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439010;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=NvPBlAzQoSKxmosw9FKhs8IhNX9BrvaSRhdmsN4ons4=;
	b=Y6hFHtgASNCQQ9H+FVRrmxqWirRT0qrHD0mshZioNfA3w1yMBBTUh1AX8WYT+8a7wZCl
	 +2g4n3Vzob3uVJRMBh1GQLMFi17MaRefh+dijdoWZocWlUvXmXyB2tcZlUAXWe9t1ac1Z
	 dHi5nElgXL1eqQb8MpdGNkQDoSkFmDow0SeOTBxUqh/NT0zWkzIFB4SPS6HiJtZC8EWcp
	 8KVASFArsIFLKUE7byzMQeymVnqi7rPVpz26Dn8Vg3Ru0QAy6P05kq0eNwfnJ6PVhHsYh
	 xmwg3aNaRH5cJs/fAN5gEcvawAnqMRKei4Y9fD2zfTbkZNE8ekYo6ltBtZjCd77Z04w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WVnd2FBk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226EF606A339;
	Wed, 11 Nov 2026 23:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226EF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WVnd2FBk
ARC-Seal: i=1; a=rsa-sha256; t=1794439002; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K6NkVIyeUzuuI6tICJ6feWakgcSDpiN4682xNRNF2YfTzuBQDGfFvJ40BXpRKpuNP+9jja44WlMnyP+JUFVQ2Bv06CSenV93Vjkm3XrsXv63p4lwhWw+ZNRJfMhmsZq3l6FbrW2T6g+qbyXoGmGpw7ZKhF03/zvzP2eLwIVPCqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794439002; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NvPBlAzQoSKxmosw9FKhs8IhNX9BrvaSRhdmsN4ons4=; 
	b=GjpKKwALj2l3dGEbmg+mUJ/IF7DMnDoB7Bkj9gtnUZwJTGkF5i/Xvk9JGFG7qxh04gvXhtQQwuZltXIm7JMImCvfT/E0o87dpT++rP1Eo4WJo2JdY4+1TZse8KYtnS5SdC6VGvH1adaZUn9/XbC1xNgrdGhuwmK4vHbrKFuQwEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=WVnd2FBkM6N+vjXa+6hcSbWYLFk4LOIr5jtY0IVsiDIUGO6vVtxNzOF7J3zDmh5grCdwPDeuEMYk93Ua1UHN8qctN1ooBVTToHMhk/RMxQ/rN/e/NUMOc5eo6utE+BGZnkTYU6r2b6k9WlTsJSX5183cIy6xXDuJIGE2un8PMp4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=NvPBlAzQoSKxmosw9FKhs8IhNX9BrvaSRhdmsN4ons4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794439000183729.0756031063353;
	Wed, 11 Nov 2026 15:16:40 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id D04D3180758; Thu, 12 Nov 2026 00:16:36 +0100 (CET)
Date: Thu, 12 Nov 2026 00:16:36 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] usb: typec: fusb302: Tell SOP' messages apart from
 SOP
Message-ID: <avT3NwaPZGFkUyHY@venus>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
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
	protocol="application/pgp-signature"; boundary="pwsoatsifebtztoa"
Content-Disposition: inline
In-Reply-To: <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--pwsoatsifebtztoa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] usb: typec: fusb302: Tell SOP' messages apart from
 SOP
MIME-Version: 1.0

Hi,

On Tue, Nov 03, 2026 at 03:21:25PM +0400, Alexey Charkov wrote:
> The driver sends every message with the SOP ordered set and reports
> every received one as SOP, which leaves TCPM no way to reach the cable
> plug. Start a message with the SOP' ordered set when TCPM asks for it,
> and report a received message as SOP' when its RX FIFO token says so.
>=20
> SOP' is Sync-1, Sync-1, Sync-3, Sync-3 in USB PD. The Sync-3 TX token
> and the RX FIFO token codes are from the token tables of the FUSB302B
> datasheet.
>=20
> Nothing changes yet: TCPM asks for SOP' only from a port that claims
> cable communication, and the chip drops SOP' packets until ENSOP1 is
> set.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/fusb302.c     | 26 ++++++++++++++++++++------
>  drivers/usb/typec/tcpm/fusb302_reg.h | 10 ++++++++++
>  2 files changed, 30 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9..8b3a2e095ef8 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -961,7 +961,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  	return ret;
>  }
> =20
> +/* K-codes of the ordered set that starts each kind of packet */
> +static const u8 fusb302_sop_tokens[][4] =3D {
> +	[TCPC_TX_SOP] =3D {
> +		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
> +		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC2,
> +	},
> +	[TCPC_TX_SOP_PRIME] =3D {
> +		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
> +		FUSB302_TKN_SYNC3, FUSB302_TKN_SYNC3,
> +	},
> +};
> +
>  static int fusb302_pd_send_message(struct fusb302_chip *chip,
> +				   enum tcpm_transmit_type type,
>  				   const struct pd_message *msg)
>  {
>  	int ret =3D 0;
> @@ -969,11 +982,9 @@ static int fusb302_pd_send_message(struct fusb302_ch=
ip *chip,
>  	u8 pos =3D 0;
>  	int len;
> =20
> -	/* SOP tokens */
> -	buf[pos++] =3D FUSB302_TKN_SYNC1;
> -	buf[pos++] =3D FUSB302_TKN_SYNC1;
> -	buf[pos++] =3D FUSB302_TKN_SYNC1;
> -	buf[pos++] =3D FUSB302_TKN_SYNC2;
> +	memcpy(&buf[pos], fusb302_sop_tokens[type],
> +	       sizeof(fusb302_sop_tokens[type]));
> +	pos +=3D sizeof(fusb302_sop_tokens[type]);
> =20
>  	len =3D pd_header_cnt_le(msg->header) * 4;
>  	/* plug 2 for header */
> @@ -1037,6 +1048,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, e=
num tcpm_transmit_type type,
>  	mutex_lock(&chip->lock);
>  	switch (type) {
>  	case TCPC_TX_SOP:
> +	case TCPC_TX_SOP_PRIME:
>  		/* nRetryCount 3 in P2.0 spec, whereas 2 in PD3.0 spec */
>  		ret =3D fusb302_enable_tx_auto_retries(chip, negotiated_rev > PD_REV20=
 ?
>  						     FUSB_REG_CONTROL3_N_RETRIES_2 :
> @@ -1044,7 +1056,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, e=
num tcpm_transmit_type type,
>  		if (ret < 0)
>  			fusb302_log(chip, "Cannot update retry count ret=3D%d", ret);
> =20
> -		ret =3D fusb302_pd_send_message(chip, msg);
> +		ret =3D fusb302_pd_send_message(chip, type, msg);
>  		if (ret < 0)
>  			fusb302_log(chip,
>  				    "cannot send PD message, ret=3D%d", ret);
> @@ -1475,6 +1487,8 @@ static int fusb302_pd_read_message(struct fusb302_c=
hip *chip,
>  	 */
>  	if ((!len) && (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GOOD_CRC))
>  		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
> +	else if ((token & FUSB302_RX_TKN_MASK) =3D=3D FUSB302_RX_TKN_SOP1)
> +		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP_PRIME);
>  	else
>  		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
> =20
> diff --git a/drivers/usb/typec/tcpm/fusb302_reg.h b/drivers/usb/typec/tcp=
m/fusb302_reg.h
> index edc0e4b0f1e6..c98a502bfbfc 100644
> --- a/drivers/usb/typec/tcpm/fusb302_reg.h
> +++ b/drivers/usb/typec/tcpm/fusb302_reg.h
> @@ -174,4 +174,14 @@ enum fusb302_txfifo_tokens {
>  	FUSB302_TKN_TXOFF =3D 0xFE,
>  };
> =20
> +/* Tokens starting each packet in the FUSB302 RX FIFO, valid under the m=
ask */
> +#define FUSB302_RX_TKN_MASK			GENMASK(7, 5)
> +enum fusb302_rxfifo_tokens {
> +	FUSB302_RX_TKN_SOP2DB =3D 0x60,
> +	FUSB302_RX_TKN_SOP1DB =3D 0x80,
> +	FUSB302_RX_TKN_SOP2 =3D 0xA0,
> +	FUSB302_RX_TKN_SOP1 =3D 0xC0,
> +	FUSB302_RX_TKN_SOP =3D 0xE0,
> +};
> +
>  #endif
>=20
> --=20
> 2.56.0
>=20

--pwsoatsifebtztoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr091AACgkQ2O7X88g7
+pq40A//XRWpFlNmPEehU9OkEACWXEbMmpYQ4vkHnqCgwq4cZVpx/cjEzo0/sbHn
vYUlHju7mw6XCkG+wzodLo3BZEq/uxiXh3NszdJbc/O1GNQOqT8vOkTQclpumDWq
n7j8iOOqR4P4/4Owa14merr+9siiFtkMdsjugBooASrhvI8Edfn7KiQTW2Y3whRp
OrppORQIz8LX//ia5hjA6BxJYxOzIPA3GxrvxuCWpwUcMsRXxQbsdklJXpAL4FBy
OuY2bBK0i7Zms/UsxtVo5973r7A9SzaMURE17ZsZMaHWFkYnYbecG3MoDvo2p9/h
brkIm1gA9760ulnKP0aYWO+9rYF6W/frN4rdXvtmVWqkeo6267zSCxpI1t2VNf+W
o40ChmmNxfuzqPG0VY0b3E9Dp26ehCl5r2sPnodIGuMSbMFPInqJw0IF0xAoehf9
15CmViE9e0LMNPw3TtMDOz1W7JY0AU0qMViQb/GAG1CSOWQCFltbZbvptIE0bG0t
hbCWnkW4uTC9SOdih0f4iZ5iPg6UpPUGpIIpC8jYpcMZcVcflpUz35yy94on50RR
DbQpEJ352e+gnAJiCBReTeAhUYv8x/shsxhcN1lBv2rBlcVB13n0XJx1kF6CIw6r
PFZjBMng+ZV0AWmzuFNz4s7Ix+v0juhdCAY8CMINckkGSDYwmMA=
=Lnpr
-----END PGP SIGNATURE-----

--pwsoatsifebtztoa--
