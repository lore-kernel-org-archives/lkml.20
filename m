Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610285;
	b=OJY81m8jNaqfux/y5PEB7dheMKiEvFbdc2ELJ/M7P+rL0PS1F9AVJ/Gqh/HiaFBdso7E
	 9yD53GybptwXeeTA0kfKFoBTB2MQ8XOTW6yRZmADFDfMQuQ34ANaZXTAIUVZQRzCtB8cc
	 4iaCxbtW+HxmxcOSyA5I8Vt3KWVzGC29dXWMBymoLny2TAE2F1tjWUVuwtbmO1DJhb8p7
	 0Pi9hh6NzEhOgajhk3NIOiy+8LAtq8Ehrag4OsGVzgv72DVS/tqB6zTm1adyqZMKdMATW
	 fN0ESqsTcr2uOz8Q6VcY5m9LBCMiHDEvs04XKiph1KwOh36YIxNshmX7X8l2KexytXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610285;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 User-Agent:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=HUY2PGBmTQl+X2D2BoUwfoPeXyROWhfRuAYN7bnM+eo=;
	b=xANDSNiqIxtKdVPFnZPsVPtdRt0HKiVWamCoDC8S4RF5h7lBPwOJdvSk+Yd6t1u74C6j
	 E/zuKEzZnGTpVBBq4bys9ZnM4J+0SE1gLkZ+Fv1SmoUgHLWpnuKv604kOYfdHvYiHXo6i
	 RNK5degccpj5+3NYSm+syCzvTjrYHvR9JmuEK/06W9fStnCSLwR4MQRS22JR4HfsovYzS
	 whmqY3jHtYC4j9aM9L95kVyNkN4BgvMt09B4bA1HIHn5+2niEUmm+IqrTBhbh+LUOdFnn
	 DRTMG5QUI14v6Iek0g4Vw37bP/fd00xYKcO2U/VWjkNnt2WH/AUjbbhCMQK4vroLFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pYbMCmqV;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B7606A32E;
	Mon,  2 Nov 2026 09:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pYbMCmqV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D3B79C8F446;
	Mon,  2 Nov 2026 09:05:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B6060750;
	Mon,  2 Nov 2026 09:04:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27B53103280EC;
	Mon,  2 Nov 2026 10:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793610279; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HUY2PGBmTQl+X2D2BoUwfoPeXyROWhfRuAYN7bnM+eo=;
	b=pYbMCmqVfTGKf3KdjOWu/GvlBsAWwN9oedfFKPfTpeasYb7Auvaya3mBq+bs4MFYkU5zXz
	EdJ99g22xzG4fbKEPEgxVE7cp1CUDMp+hIDyHk9X4H/mNzbv9fDzvjlkw20mU32jvGkK3u
	ulaJZ6bfs6UD2pNkckP3J7Z69Lq0BO4Ei3NTgsTse01E0CPd2NQi3Qx9VnuXjzX15+bOf1
	Gd6MkTOkggoDmbh+a+oDPc5ZKlEsSkWgHed2a8yo8ksQQUjA6+wLhjXpzKF0f+HcUjDV1M
	KQEnNrNu4pZaIrxFhQ803ZfAwbF/i7UsmWrPfIcjQOymh7W/IC04SDNE7EuFKA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Oliver Neukum <oneukum@suse.com>,
	Johan Hovold <johan@kernel.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Neill Kapron <nkapron@google.com>,
	Ijae Kim <ae878000@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Elad Nachman <enachman@marvell.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>
Subject: Re: [PATCH 00/19] USB: a bunch of llm-found fixes
Date: Mon,  2 Nov 2026 10:04:16 +0100
Message-ID: <20261102090416.12865-1-romain.gantois@bootlin.com>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: koshi/0.3.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, 27 October 2026 15:57:55 CET Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> typec_set_mode() passes a state without an alternate mode, and the USB
> and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
> TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
> set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
> attached. tusb1046_mux_set() then reads state->alt->svid: plugging in an
> analog audio adapter is a NULL pointer dereference.
> 
> The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
> value of TYPEC_DP_STATE_D. Without an alternate mode connect the
> SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.
> 
> Fixes: 7c561b8c3e83 ("usb: typec: mux: Add support for the TUSB1046
> crosspoint switch") Cc: stable <stable@kernel.org>
> Cc: Romain Gantois <romain.gantois@bootlin.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c
> b/drivers/usb/typec/mux/tusb1046.c index 34ef81f75693..a463ba5f53be 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -43,11 +43,17 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	struct tusb1046_priv *priv = typec_mux_get_drvdata(mux);
>  	struct i2c_client *client = priv->client;
>  	struct device *dev = &client->dev;
> +	unsigned long req = state->mode;
>  	int mode, val, ret = 0;
> 
> -	if (state->mode >= TYPEC_STATE_MODAL &&
> -	    state->alt->svid != USB_TYPEC_DP_SID)
> -		return -EINVAL;
> +	if (req >= TYPEC_STATE_MODAL) {
> +		/* USB and accessory modes: not the DP pin assignments */
> +		if (!state->alt)
> +			req = req == TYPEC_MODE_USB3 ? TYPEC_STATE_USB :
> +						       TYPEC_STATE_SAFE;
> +		else if (state->alt->svid != USB_TYPEC_DP_SID)
> +			return -EINVAL;
> +	}
> 
>  	dev_dbg(dev, "mux mode requested: %lu\n", state->mode);
> 
> @@ -60,7 +66,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  		goto out_unlock;
>  	}
> 
> -	switch (state->mode) {
> +	switch (req) {
>  	case TYPEC_STATE_USB:
>  		mode = TUSB1046_CTLSEL_USB3;
>  		break;

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
