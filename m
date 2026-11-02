Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610436;
	b=bJ6XmT6lNHMK02BadUQA6oj+fj0VZOtd5OdpJJBayYF7PvJ2hI3UTS7t3NrnzS9exLYz
	 /OAxP8s4b+SPkstFqw3YM/Prova0ABvbUU2QScjYEyRbDLtIDBdlzNTiYoJZ8PO3KJCkG
	 0ZXnehPF9HEhLgCYWUHHaiHk5ttX413KcXjkwE6LJ40nKNL+yX8CS+yQQqHDlGEo1yb+r
	 udfTwEjkhZ2Ee/eo5AKaicJxoL5Cm+bInM2OMQmO+EmF3Cuiagju5TmIIoiQdt8FwR1fC
	 EZd+rwUNaBtI/MQmYkauiGMwBMZq9fWLRInNQCZpNp/KylW/6XevC6e4eNe+uHErxNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610436;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Last-TLS-Session-Version;
	bh=c/g49nFPeRz4B/L5aA+LteW9NXGE4MbgmMFxsqaFUas=;
	b=xNT//jA7uPwVGZ2St2qvXd6BLmNqOd+0KDVE2KdQ/+gSeeDihCl9Smcekc9yr56zb044
	 d4RvDpBKm1Hx92qHTwTI8jSji1oc2603S1eYrw5uM26S0LCttp5zL31pBaer5iNypnOU2
	 YACc+DRrAdQKMZpKw0UbnrWniq0XVyncgbKS0/v0mPBfFex/sTZWbzEi9F0n5k3Ww2E7K
	 LU4TjuPrVuiQML3+4pfcw1KdnTeJYVM5cb7ZHEXzbV98dLMaRT+2KUlAOa+ktv9PMAVjm
	 Uk7oMZuz6zCT4gYUlqnNneA4cm/+fNwuY6ElMVDBnzxRKmo0ga4WGz7Ewi9vIv7zu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pGkMklKq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ACB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ACB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pGkMklKq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D453C8F44B;
	Mon,  2 Nov 2026 09:08:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 469D860750;
	Mon,  2 Nov 2026 09:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA1C21032909D;
	Mon,  2 Nov 2026 10:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793610431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=c/g49nFPeRz4B/L5aA+LteW9NXGE4MbgmMFxsqaFUas=;
	b=pGkMklKqunngYRx5ODCb4MqckGVeq7YQzv93sU4GgP7rxhXCAEmdFa8zYcKP2W89JyUxPJ
	8RkwIOzK15DhuI+73MS/l/EZvJm2i+W0B2iQcl2hYh1u8IZSPVF/rk3bG5rNbq5zZApvb2
	ip9uq9XXmnCkhtSU9xxQOE8GqRjBdw6SDGFxHkAkDLq3VfTtw8/16I6PI/naohBqGEeJ9+
	wszyhFGmucb11pE+P9W9tdAqpSc5A7O7Lg6KjWnZxEU20Me1JEeR5R9OETEHEgM0QuQhMB
	pYGCAORKwsEiOpgd7QbycvVeXn40AAuRJLAi7cOyq8H99hJyigB4zORum3gXvw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 stable <stable@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Hongren Zheng <i@zenithal.me>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
 Neill Kapron <nkapron@google.com>, Ijae Kim <ae878000@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Elad Nachman <enachman@marvell.com>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Rui Miguel Silva <rui.silva@linaro.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Subject: Re: [PATCH 00/19] USB: a bunch of llm-found fixes
Date: Mon, 02 Nov 2026 10:07:05 +0100
Message-ID: <YtfyUuznS--yITFLi0LGPg@bootlin.com>
In-Reply-To: <20261102090416.12865-1-romain.gantois@bootlin.com>
References:
 <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261102090416.12865-1-romain.gantois@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParteJh-TC9LQmK7_9l4Xi1wyQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextParteJh-TC9LQmK7_9l4Xi1wyQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/19] USB: a bunch of llm-found fixes
Date: Mon, 02 Nov 2026 10:07:05 +0100
Message-ID: <YtfyUuznS--yITFLi0LGPg@bootlin.com>
In-Reply-To: <20261102090416.12865-1-romain.gantois@bootlin.com>
MIME-Version: 1.0

On Monday, 2 November 2026 10:04:16 CET Romain Gantois wrote:
> On Tuesday, 27 October 2026 15:57:55 CET Greg Kroah-Hartman wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> > 
> > typec_set_mode() passes a state without an alternate mode, and the USB
> > and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
> > TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
> > set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
> > attached. tusb1046_mux_set() then reads state->alt->svid: plugging in an
> > analog audio adapter is a NULL pointer dereference.
> > 
> > The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
> > value of TYPEC_DP_STATE_D. Without an alternate mode connect the
> > SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.
> > 
> > Fixes: 7c561b8c3e83 ("usb: typec: mux: Add support for the TUSB1046
> > crosspoint switch") Cc: stable <stable@kernel.org>
> > Cc: Romain Gantois <romain.gantois@bootlin.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > 
> >  drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/mux/tusb1046.c
> > b/drivers/usb/typec/mux/tusb1046.c index 34ef81f75693..a463ba5f53be 100644
> > --- a/drivers/usb/typec/mux/tusb1046.c
> > +++ b/drivers/usb/typec/mux/tusb1046.c
> > @@ -43,11 +43,17 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
> > 
> >  	struct tusb1046_priv *priv = typec_mux_get_drvdata(mux);
> >  	struct i2c_client *client = priv->client;
> >  	struct device *dev = &client->dev;
> > 
> > +	unsigned long req = state->mode;
> > 
> >  	int mode, val, ret = 0;
> > 
> > -	if (state->mode >= TYPEC_STATE_MODAL &&
> > -	    state->alt->svid != USB_TYPEC_DP_SID)
> > -		return -EINVAL;
> > +	if (req >= TYPEC_STATE_MODAL) {
> > +		/* USB and accessory modes: not the DP pin assignments */
> > +		if (!state->alt)
> > +			req = req == TYPEC_MODE_USB3 ? TYPEC_STATE_USB :
> > +						       TYPEC_STATE_SAFE;
> > +		else if (state->alt->svid != USB_TYPEC_DP_SID)
> > +			return -EINVAL;
> > +	}
> > 
> >  	dev_dbg(dev, "mux mode requested: %lu\n", state->mode);
> > 
> > @@ -60,7 +66,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
> > 
> >  		goto out_unlock;
> >  	
> >  	}
> > 
> > -	switch (state->mode) {
> > +	switch (req) {
> > 
> >  	case TYPEC_STATE_USB:
> >  		mode = TUSB1046_CTLSEL_USB3;
> >  		break;
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

That was supposed to be a reviewed-by, sorry about that, sometimes Mondays are 
hard '-_-

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextParteJh-TC9LQmK7_9l4Xi1wyQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmroUrkACgkQmGofZEox
B4OWSg/+NmOPcDiPv3kqhva3bAjRyVBO9UQfQ2CUGRypuCcMzVK7fZndCiYSPHjl
ROPKguti96JGNplbheyhPGf4YWbbur//5FpssDaJH9iXHkgjnxbb2b8LJ/RZbpOA
H7rsc1u/XCLi5kWQeUfdIDWAomY0u83ldnT9LLuYPJhlUZ2OeQRCoi5Bb1ehApLc
+8eSfVUiDlIcLNoFeh6jcA2n8JPXDsGDKBR4/7Dq8JMHxzvDD81EJenF6QICMv2Q
7jKhGLq/67l5hfOW+dmd+dQc4eYcUAjM/IgSHUoaP5RfInrfuN58/NImzFr9Ch1h
fBENsUfwsBwyl89EkBGGJwVXUPkHuLJFDYnM5TYQ5Ml/lwO1nyo8Mpv4JhSSjuKG
qGECU/0ENFb3DCiaBngBSA3eKmH4sVGKXqhoQHGIxrk9uyNQpHupFynuXeaOv1wz
EP2tYpl4wZqQc5/1j6LY3HP2I1k5R6VFDZy7gD4cYSae4mgLM/LZxhmameGwP+LH
jQWGKrmMTQ7WLZXmO0BNZag3/8QCt7RwVxyjthjiiAi6tvhjSXA8ZYtC9tSlPPHP
mp3sB7oXqMbnLKbfe6HUlCLpYHYIgrCQOKa3UgNw/8QhmbkapbxyLC35TJiihqVY
QEV+lZ8nIAznToc8RcQe7xoLtRnPICf1SmLvLjX7k0OBxuBXTww=
=erWq
-----END PGP SIGNATURE-----

--nextParteJh-TC9LQmK7_9l4Xi1wyQ--



