Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610379;
	b=njqARbGKjcKHqv7S0SLcTqdcEDsZVezIA0gAmIYo0ObpjWi4DdOhBivrRp/XE1Dhxl1L
	 3LfbRWcoIafS9qfRshHKF+YLldkdlKyeJZbLmu5vOO8tHi4jMqaI52XHKk9HK/Z76cb1f
	 4S9H+hsLbgRoCfHHas/tAJua/CTihH5LvMwKyIVKbaT5ZU7kLqg9/v0YB3p7kj6+9d3Lw
	 fMNdvnSuvbEsgivxfnrJH5h8AiBPshQUTDXnUmxKHY7HQdX5iBpty1Ck58oxy1r9dWpBU
	 Mx67QWBN+Tn7QZKcMYqLFTR/TcFxg8x6gjBn/4UZGbwi2jvccbDm0eWDsiPNyT4BWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610379;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 User-Agent:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=t7e45QyRXwdTcxtvzKczysOOf5DXVWjfhXKIFEcpEQI=;
	b=IZL/H68ZEGl/XaSduIzKIAStI3Ol0UvgsxrzoJa4Z3XsjZs+RkKewc6SLbqQ7YkT9b1h
	 XzWiEG0/i7ehxxQw5CR7Ok6ItGOFiZqF/E2t9WzXpgjEDj6B8PVMGznVONQWAeJhpJ3Kb
	 7HfVPgdOaIwPijlbBtxBBRo3WwG6mHGLAYvcOrKO5Ybx+6vlOk1S8xpy6eqhmlJxCV6vJ
	 NN+4xdYUJYmQb6EDCZxjOchwjBC68npxA9+nE9oxg3+YJR58Zk/udM1lQebQCvdpp/X0T
	 tcAjGxtUgIlFoxYHeMhw/8xIOL/zgQqwEcHoeB3cV18E8GgkpKU7JSNDnixkxJDn8uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kp8vrrQQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF450606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF450606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kp8vrrQQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3B711A136B;
	Mon,  2 Nov 2026 09:06:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB1A760750;
	Mon,  2 Nov 2026 09:06:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D7091032909D;
	Mon,  2 Nov 2026 10:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793610374; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=t7e45QyRXwdTcxtvzKczysOOf5DXVWjfhXKIFEcpEQI=;
	b=kp8vrrQQt69+/P3hzqU4pEodu/3iWqr7oBsiktrIhhNdCKTk8tZPuX23WasfiVSmzHcZK+
	VD9Kzjw5TRNM/VWK46fsKc932tOiShJEv8Oh+QXRJMBNq9odaO8A0OaOvsBuAifIuGLMWt
	+qMTvQ5tvwYicyNQ0KynMqIUhXW4JgVp/cHOCLTXovCADSFPBloXg+B6EhNgMrIRbaoUA/
	RuC60LXZe/SSSRRKyynuTmEOOwxmn9DtYZlRhBxvJCr7JWvT0hfMOkwVk6NI5aRAF+YTc0
	81sqbodMtFNiIz/EPk8boLLGhE2Qs9k7XF6huNtDrxED+YBJsIshI5kr7vnIfQ==
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
Date: Mon,  2 Nov 2026 10:06:06 +0100
Message-ID: <20261102090606.13146-1-romain.gantois@bootlin.com>
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

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
