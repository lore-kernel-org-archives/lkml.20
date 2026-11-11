Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440519;
	b=zGxqj6di25SLWY1H3k4l75nNQsaLG9tbelUUYYjSAcNc69RaUWH3zlrNvRKc8RqiMw2M
	 jiay4I7wD38YUxCyR0y3wlva8z1y3qAGRbcOHxKY+9+Fzx7WUzo/Y2PUAx3eS7dAfcs93
	 6ggg4HTwMujxrXrwtDQEOd46hb5sKhMwjgDufckU3FyPAD8SE2I2IV2Yc+HztOYNht/ur
	 sEkWkFekC+efAXsHzpdYDi736PwXYfBAHZx0TYgdh8DxkQaxgkLBO8ElyZeY6blM2d2cz
	 9VL3r4+YpW25jx38GY4n8oWtFqrqnvbEp/bvB2OSV6M+TBVFrERokMoLxZi8suCDc2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440519;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=v38HfFZ9Pdu0yelSZ11CgmGSdw7Wpfua0MH8sQcQiwA=;
	b=qzGBSZKV+HbL/BTfkm75gUYC6ieeHY6EglvP2N2OOjFO9WK+jTVpp6K4UkZfyq/cfxdw
	 S3kCk+/9cp1gEXDiGMwbDi/6cLgeekoZQAZz8gIIg/B3wbTB9BK8IqUGtZJCCfW0dAUZA
	 C+jTXIs6ZX2wbC+7lx8UvNPU8eVkDgE41vCFIoCCNYrHb2N8mje0y0OkF4gqclI4/PaLs
	 U4P/h0rSlaVH6fhfzB1Y+O0fWm5ekTr3wCiLruehA7XwJcHzSqcWW99DLVSEMGAjGZ7Ne
	 BS4qMKHuDTy1KuyZjz4lhn8/VK6IE62vu88jnTCm03hHEA9NFhnc3VvNzKmoLZoZdpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jdaXk5Bm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB7606A324;
	Wed, 11 Nov 2026 23:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jdaXk5Bm
ARC-Seal: i=1; a=rsa-sha256; t=1794440516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NDP/o04LQPSrzWBGbVuhSiCbRB3F590oIGkkVlZjEjTZl8TsOop4dG5Wa9RClNA45FEbZV76lzEvYAmm8KiFByjCVhyD5OXrww3YF56tgkEzrSnr07nIJBpOekHpiiOGHgX3YIitNRHluseGgBuD6kP1JpwYyP9hJ/2H6xxZoDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794440516; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v38HfFZ9Pdu0yelSZ11CgmGSdw7Wpfua0MH8sQcQiwA=; 
	b=X7EcyXUeRLdjTNC9qgG4HwVmMwY8V5su8hGu98EMK9ZouK+8pZ6pb7kNtcauN/kJHC6JWRmmtiIJlZe9LAyqwCp9gONYZCdK7NtKoipWMm2UVa0YEKeG0a3yeD1L0BoGC7yX23P0uarMH6mvP8op6eiED2US9hD6tiWWmV0aeQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jdaXk5BmE1vRQR6o9qCO7ohJ8NrIIZuVm4yqmG7WpUlvL8+g4EBErn0ZYoo49kWtXeAnSglRHNbPzeWiyhCHoCLJb4ltNfdQAto5dOsnaK2Rhwp9vhH8RRX/UV8nb7MSfD1Ex1psvi1hjzc+mFyH9eU/XZTWqhnkQrXEm46LBJw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=v38HfFZ9Pdu0yelSZ11CgmGSdw7Wpfua0MH8sQcQiwA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794440514891895.0405888317109;
	Wed, 11 Nov 2026 15:41:54 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id BAB6A180BC0; Thu, 12 Nov 2026 00:41:51 +0100 (CET)
Date: Thu, 12 Nov 2026 00:41:51 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD
 interrupt
Message-ID: <avT9KERG1udN-TzR@venus>
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net>
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
	protocol="application/pgp-signature"; boundary="34hqjqcemku5rbto"
Content-Disposition: inline
In-Reply-To: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--34hqjqcemku5rbto
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD
 interrupt
MIME-Version: 1.0

Hi,

On Mon, Nov 02, 2026 at 04:37:59PM +0400, Alexey Charkov wrote:
> The driver reads one message from the RX FIFO per GCRCSENT or TX_SUCCESS
> interrupt, assuming every queued message raises one. The chip, however,
> queues some messages without acknowledging them or raising any interrupt,
> e.g. it decodes only the low four bits of the message type and mistakes
> Get_Source_Cap_Extended (17) for a GoodCRC (1). From then on every read
> returns the message queued before the one that raised the interrupt, so
> replies answer the wrong message and a Soft_Reset is never seen. The
> partner escalates to a Hard Reset, which an Apple Studio Display repeats
> every 1.5s.
>=20
> Furthermore, two different messages received in quick succession may be
> queued without raising separate interrupts, causing all subsequent PD
> communications to be permanently out of sync, which usually also leads to
> a hard reset eventually.
>=20
> Read messages until the FIFO reports empty, so that each one is handled
> on the event it arrived with, whatever the chip left unannounced before i=
t.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/usb/typec/tcpm/fusb302.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9..6841db172e11 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb302_=
chip *chip,
>  	return ret;
>  }
> =20
> +/* The 80-byte RX FIFO holds at most 11 messages without data objects */
> +#define FUSB302_RX_FIFO_MAX_MSGS	11
> +
> +static int fusb302_pd_read_messages(struct fusb302_chip *chip)
> +{
> +	struct pd_message pd_msg;
> +	u8 status1;
> +	int ret;
> +	int i;
> +
> +	/*
> +	 * Drain the whole RX FIFO rather than one message per interrupt:
> +	 * messages the chip does not acknowledge raise no interrupt, and
> +	 * reading one message per event would then leave every later read
> +	 * returning the message queued before the one that raised it.
> +	 */
> +	for (i =3D 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
> +		ret =3D fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1);
> +		if (ret < 0)
> +			return ret;
> +		if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
> +			return 0;
> +		ret =3D fusb302_pd_read_message(chip, &pd_msg);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
>  {
>  	struct fusb302_chip *chip =3D dev_id;
> @@ -1513,7 +1543,6 @@ static void fusb302_irq_work(struct work_struct *wo=
rk)
>  	bool intr_togdone;
>  	bool intr_bc_lvl;
>  	bool intr_comp_chng;
> -	struct pd_message pd_msg;
> =20
>  	mutex_lock(&chip->lock);
>  	/* grab a snapshot of intr flags */
> @@ -1602,7 +1631,7 @@ static void fusb302_irq_work(struct work_struct *wo=
rk)
> =20
>  	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
>  		fusb302_log(chip, "IRQ: PD tx success");
> -		ret =3D fusb302_pd_read_message(chip, &pd_msg);
> +		ret =3D fusb302_pd_read_messages(chip);
>  		if (ret < 0) {
>  			fusb302_log(chip,
>  				    "cannot read in PD message, ret=3D%d", ret);
> @@ -1622,7 +1651,7 @@ static void fusb302_irq_work(struct work_struct *wo=
rk)
> =20
>  	if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
>  		fusb302_log(chip, "IRQ: PD sent good CRC");
> -		ret =3D fusb302_pd_read_message(chip, &pd_msg);
> +		ret =3D fusb302_pd_read_messages(chip);
>  		if (ret < 0) {
>  			fusb302_log(chip,
>  				    "cannot read in PD message, ret=3D%d", ret);
>=20
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-fusb302-drain-rxfifo-58ea00906afb
>=20
> Best regards,
> -- =20
> Alexey Charkov <alchark@flipper.net>
>=20

--34hqjqcemku5rbto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr0/T8ACgkQ2O7X88g7
+pqNHxAAgBouzM2xsKPsTspfwkXPAbaCPcGWb1lY3tOBFDXSxw52GoNPcW1XQ1ic
+PK8s9xWjxE2Qok1QoHaQd8aqVvv8rrjOFt/d3kUW3HzBuCsZ1Z86sv5n7g9fWVY
LmLjTZ0UzCne3NHKWlikCR7OY3IUS6QS0ZREECpBYyfjRaA7fB1ZXjyhGZTk4zBO
/i+f+Tj0gqKzhqpFQXAymU0OrWDAQdLT3rkAx7fX9UrAVG/EepbR8NpS4/k3V55Q
B3AwGqGSTlM4Sf64cEc5da2RiprO1pg1Xj5UvnUputG8g8kbKiwnn1aHG5Q3Ra4t
H+CDD+QeF0FxDDYhpbiKxUbFTs3mbFAz3MexmKdcHZAgL8fMLiSukwf9VP7Y3VLd
d/rwcbNBAB6QgoxxGZqXanEE0buM71amFE6Q/c8ppmTrHaFbczNjHCSAhMBn90KZ
ITqCZrrysecCtQ0kkyThutKQlKz09HSoMq63NK3wfKnBD8LsxcB8M8Eoa5yIcK3p
a/dmW3xxOPG4n9iM/osU7fGMlA4DRLbP1EOvzt+8dpchFviduMxfTNHpdmRJGZ0c
TcXE7vsloumj5u0ThrBNDDGM6riz4FkMQaVpj2AGMNA7fvd6v4njm/Q52deG9UPJ
/PlfQDswSy0nBZFBxC4kdp33q3PUIF1IFcpQDW3Gk1iZtZSFJto=
=Poo+
-----END PGP SIGNATURE-----

--34hqjqcemku5rbto--
