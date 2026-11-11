Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440489;
	b=BbOnk7BwHjkTxxVjAZI9hWJsZ/1+PHtgx4O1pcnxDqZPxyTkrCzFIl2CQQ8xrh4yJopC
	 hanKZJFLQG93lH1hQpaeB0HWvK8gTAwN4mYd9YgOr1zebgjyigMMeTsuDYx//k+QMhdnD
	 4DKetTSxXGZnuDccX56ocWYqyaC6ga30IApjs+xyCy5JYliBD5j/6EOxWh+mBXIKKlQGe
	 YSBh93jtRxtorWb2aRIqSgCqmcG7Bw/spWtzc6sVhxB2b+FiQV3isO4uj9tUUlSmcyWsO
	 TnXG68avmJ7PyJJ6rl+25J3DCyLiaailqffrE0Qq7WQ8pcfrEmfk95fBW7VXFaRF5PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440489;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=MCCByGHy0kXTXSTv30Riz71pvxdzfw/apceMHLuYIrk=;
	b=S6vD9OYOemvtJcD1P5MoFM2nYOfVKGugytWILqGSurqpzdiO5W5w2odm+znJdgYLvwn4
	 R9ZI+gEBWNIcqv+YG1KrpbdQdrYZvjjtGHO5kzQkUfG92jpGhYn7ZPAKTlbDrH1MHj6ba
	 stmlGU8jXWzzs0HRNYypfkIizHzT6BlHVun9ljsWauLf1pjji45I4nE1mAyx7R3zfoD4P
	 e1XyrUjMAAAUwcBnc77R6RWBqj9q8Z9Zt7gDc+P/NbmG1qbxjp/l/fRzbNLatkAbC3mWO
	 ZL66y+QhrI6DXc59ffBEHZwmyLY8nwpiO5B+USFQNKp5PDThFBijA/qdcR5pkR+++lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ef3vhtmy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E092606A31C;
	Wed, 11 Nov 2026 23:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E092606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ef3vhtmy
ARC-Seal: i=1; a=rsa-sha256; t=1794440483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nM5xGdVuSsNNRSxnswEv4KSZBsnfkpyOgmRz5p2O52WAvT7sClwmckyzIg1L/Vp4dVbXpal3lJeJsugfWOVlUNl6PQ0Bm+5XzDCsxMcIC/EI0WtFINMjPm6SYmkBTPdFw7teb8jg2+Qkd7YHb4U+tdlWNX4osslelm4vbEJAEEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794440483; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MCCByGHy0kXTXSTv30Riz71pvxdzfw/apceMHLuYIrk=; 
	b=JENE83Chl0i831ayHnYVuGhnlwWk3ySAsyunp7WuH9z3eCJF/ivnhVIzXauo7OO4qgmrrWt9LT5oYN4Dz2TPm0JYmrFtviDRNGUFYNKPu9j/4NfK0wIbiowNGi0xXxsc+IWwYxSYWZcyBOjSoiuQhxqXUMp0kCV1siRDuvSd2h4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=ef3vhtmybvY+m2sPCg+JCsIFNhKAT43ym7RbEhxtdlDm/+aZlI8TWmu8zxMRi87E0NdcW5lWV3+fZhhmHe5YY8E5qqnTvZqawdXWJH6uJJ3lm2UNk4GRQqRDzXlNDjNYvQNt9N/mplu5Br0Z+hkjNgLVU5rb07wV36XfQ93PWWg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=MCCByGHy0kXTXSTv30Riz71pvxdzfw/apceMHLuYIrk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179444048277562.734735209920586;
	Wed, 11 Nov 2026 15:41:22 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 1403C180BC0; Thu, 12 Nov 2026 00:41:20 +0100 (CET)
Date: Thu, 12 Nov 2026 00:41:20 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Send PD messages longer than one
 SMBus block
Message-ID: <avT9B2EdbX8Vqkz2@venus>
References: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
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
	protocol="application/pgp-signature"; boundary="7ztggilt5a2wpiqc"
Content-Disposition: inline
In-Reply-To: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--7ztggilt5a2wpiqc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: fusb302: Send PD messages longer than one
 SMBus block
MIME-Version: 1.0

Hi,

On Mon, Nov 02, 2026 at 05:44:38PM +0400, Alexey Charkov wrote:
> The whole message, tokens included, goes to the FIFO in a single SMBus
> block write, which carries at most 32 bytes and silently drops the rest.
> A message with six or seven data objects needs up to 39, so it loses its
> closing tokens including TXON: the chip never sends it, the transmission
> times out, and the truncated bytes stay in the TX FIFO ahead of the next
> message. A Discover Identity ACK carrying a full set of sink-vdos is one
> such message, as is a Source_Capabilities with six or seven PDOs.
>=20
> Write the message in chunks of at most one SMBus block. The FIFOS
> register has no address auto-increment and queues every byte written to
> it, so consecutive writes append to the 48-byte TX FIFO. TXON is the
> one token that is not queued but starts the transmitter as soon as it is
> written. It still comes last, so transmission begins only once the whole
> message is in the FIFO, as the datasheet recommends.
>=20
> Flush the TX FIFO if a write fails, so that a partial message cannot
> stay queued and go out together with the next one as a garbled frame.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/fusb302.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9..e10b7a4b679f 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -967,6 +967,7 @@ static int fusb302_pd_send_message(struct fusb302_chi=
p *chip,
>  	int ret =3D 0;
>  	u8 buf[40];
>  	u8 pos =3D 0;
> +	u8 i;
>  	int len;
> =20
>  	/* SOP tokens */
> @@ -1001,9 +1002,23 @@ static int fusb302_pd_send_message(struct fusb302_=
chip *chip,
>  	/* start transmission */
>  	buf[pos++] =3D FUSB302_TKN_TXON;
> =20
> -	ret =3D fusb302_i2c_block_write(chip, FUSB_REG_FIFOS, pos, buf);
> -	if (ret < 0)
> -		return ret;
> +	/*
> +	 * An SMBus block write carries at most I2C_SMBUS_BLOCK_MAX bytes, and
> +	 * a message with more than five data objects needs more. The FIFO
> +	 * register queues every byte written to it except TXON, which starts
> +	 * the transmitter instead. TXON comes last, so the message can go out
> +	 * in several writes.
> +	 */
> +	for (i =3D 0; i < pos; i +=3D I2C_SMBUS_BLOCK_MAX) {
> +		ret =3D fusb302_i2c_block_write(chip, FUSB_REG_FIFOS,
> +					      min_t(u8, pos - i, I2C_SMBUS_BLOCK_MAX),
> +					      &buf[i]);
> +		if (ret < 0) {
> +			/* don't leave a partial message ahead of the next one */
> +			fusb302_pd_tx_flush(chip);
> +			return ret;
> +		}
> +	}
>  	fusb302_log(chip, "sending PD message header: %x", msg->header);
>  	fusb302_log(chip, "sending PD message len: %d", len);
> =20
>=20
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-fusb302-long-tx-d2d06ed2a937
>=20
> Best regards,
> -- =20
> Alexey Charkov <alchark@flipper.net>
>=20

--7ztggilt5a2wpiqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr0/R8ACgkQ2O7X88g7
+pqmvA/5AefUpBguaa2UXR1fqZ7y/o778hy0mbRfpVia5Wtmo1I8kNcAE6vPaW5E
WPTYOID6Sw/a4ltKD5SHBsE/9mF2hTkgEOk23NGQQQWQ0RcmR4IY2NjT1NQPjjPn
LCz+iS/eTO8hOGu/AYlmi9MKVxL/uFRUafP+sUzk3mADXe80g9BU7tki4dZ00B+B
tIjXTD5Ui6JvqRw2At7A2MAxFBQxqnCAH9z/Uuor9Ayp4rloQZ1VglXojvY9Ug+S
oTpZ4o+4jeK1gZX2PAAdpgTbuKjmV/XXkZwf31YdmANKHK+sSuj90zoTll+34mi3
nzxF6jrJ7WRf0R3raIEPAsdkLnrgxkaS7Ii+q1H3ExyChwHZ4YwRKBAGrbCmYM8O
DGryd/mbmZERiJbcUQTEYZ+EYkVOcB9bA+sIT36aJ6sG3/IOgNWPq/wrc9h/1mEW
/mgYtYccGdApVepU03ZBUvCm8dDTL6uTd8MFE9Ep0u89g2BPnRgO0IYPC08KeFWH
8w71zb/fU0Jw6fMh+u8J4KlW5aMvYPIfSYEe5ASsAyLV8JBgenCwugGUgbZk+xsn
vYB458qSsaPI0tMJcFBVNp6/0Oe2I/88HUV0uQnxL1AsPl2YH7VzDsqvb4IZHSLZ
xylSUM3DjIvcC/jySihLeLw7J7HjGAXnkR+pdq7uujsFiD58BF0=
=bma2
-----END PGP SIGNATURE-----

--7ztggilt5a2wpiqc--
