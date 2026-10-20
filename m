Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495474;
	b=HiPPCs5ml6iWRSA5aY82/Cxb9tH9IkKmaVEDiTRGn1ED93wM2Iu0OgkLYBtfxnUcZWXZ
	 9Zk6Zt+sxJgoDbaDtDKhXPpAVTuXjJ0B38Ns3iKgvzNC2djEon8qB6I9sxl20snZw05vl
	 OO+N0JNb4JmaAR1EYPcofnDh4/Erh133rXze5dhcN8ZFi3yrwWUKKfgusvmQgjP5oTMZ6
	 U7KuJlsIZwM7EV/0dX4thDVGHapfm/AM97SSy+cGi4dXKBKWvBlGrxfQsxJnhamtlxC6B
	 pIy6dPCt+cMstwnkaosAlSuvKTnTFFnBOoFG9vptpChc4zQPXOEARVj5wUy4qVAQbig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495474;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=jWjEpzlhHF6Yb0PjewV4R8vsfjkbrVyepG07W1tq5mw=;
	b=K3JZSGnn3twJsbBUwG2tOVTdg5oJpqLFLjiQy+5SGlTjxq8f0SPStZfF0pFd2Zgru0U7
	 CcpLOzheg713i7Q+YVtsf9w8/2U6u0ZNE5r/Zh1pPmfSwYn0ykM5gQynEv7iBpdNG/bBx
	 Fyqu/gFz8N7RS2z7JCXShHzaoFVEnoLMJYruvkF+Q6XoqmSAksksmRpH5Axan4b8L0cAf
	 vw7dnH6PGvTuFZHWPto68AU9MGSl8uUHR0F8xOBf+86CLktQBCKpKEm9dmi19RS2OVEY4
	 /VonrbngOt693uyF+a8MQqsxl1+724LjlWZ+dhQLoEa++BASmgSltBYPQc7746TR6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sYdl5Q9q;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F76606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F76606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sYdl5Q9q
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64C0BC5CD5F;
	Tue, 20 Oct 2026 11:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0FE960393;
	Tue, 20 Oct 2026 11:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05401103289A8;
	Tue, 20 Oct 2026 13:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792495465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jWjEpzlhHF6Yb0PjewV4R8vsfjkbrVyepG07W1tq5mw=;
	b=sYdl5Q9q0R4/bzA/2Yv121OMuc2kFJKYE/JFAF8lRCYg2B0Ag1IIyNJqP+6Kh0LMapbgeW
	E2/ZSUWnMfqchh3cClg/Fg0vOzZ9YF46WTY4RZ0IgvPYTEiV8liTDwGoSNFc1Di2isIwuf
	JabsjwZbwtZQZNlly8Mf4NZeCJY4v9GAfRvDAfc0OePreXVWYGtlKwT+ObHpGq9Kk1MZ6M
	18Q+ShfpBfKBGgHV3Q9DZI02rbqVj9b95men1Q4zhzs5QnIM2nmEDeVN6rWVaXqOnW+xXn
	tmp+JZ5FDP36rKWu8WNrrMABd8sH3/DpN3uCMmUNxGMMf7FO8K/TwpgJGwQyOA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 13:24:21 +0200
Message-Id: <DM9MLYYD6H7C.ER1KSRN65HR7@bootlin.com>
Subject: Re: [PATCH v7 2/3] drm/panel: Use managed helpers in Novatek and
 Raydium panels
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Linus
 Walleij" <linusw@kernel.org>, "Cristian Cozzolino"
 <cristian_ci@protonmail.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Robert Chiras"
 <robert.chiras@nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
 <66eccc200bb4f5e26a3464a46448b1a4c03b53a6.1789994813.git.osama.abdelkader@gmail.com>
In-Reply-To: <66eccc200bb4f5e26a3464a46448b1a4c03b53a6.1789994813.git.osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Sep 21, 2026 at 3:17 PM CEST, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in Novatek and
> Raydium panel drivers and drop the corresponding manual detach and panel
> remove calls from remove paths.
>
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

...

> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/=
drm/panel/panel-raydium-rm68200.c
> index c535dc931903..f235cb4ae071 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -360,26 +360,19 @@ static int rm68200_probe(struct mipi_dsi_device *ds=
i)
>  	if (ret)
>  		return ret;
>
> -	drm_panel_add(&ctx->panel);
> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret)
> +		return ret;
>
> -	ret =3D mipi_dsi_attach(dsi);
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
>  	if (ret < 0) {
>  		dev_err(dev, "mipi_dsi_attach() failed: %d\n", ret);
> -		drm_panel_remove(&ctx->panel);
>  		return ret;
>  	}

You could even do better:

 	if (ret < 0)
		return dev_err_probe(dev, ret, "mipi_dsi_attach() failed: %d\n", ret);

Same for other drivers in this patch.

If you want you can send that as a separate series.

> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/=
drm/panel/panel-raydium-rm692e5.c
> index 8e9484768657..4065cdf690f9 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> @@ -315,7 +315,9 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
>  		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>  				     "Failed to create backlight\n");
>
> -	drm_panel_add(&ctx->panel);
> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret)
> +		return ret;
>

Not related to this patch, but I wonder whether this [devm_]drm_panel_add()
should be moved down...

>  	/* This panel only supports DSC; unconditionally enable it */
>  	dsi->dsc =3D &ctx->dsc;
> @@ -331,28 +333,15 @@ static int rm692e5_probe(struct mipi_dsi_device *ds=
i)
>  	ctx->dsc.bits_per_pixel =3D 8 << 4; /* 4 fractional bits */
>  	ctx->dsc.block_pred_enable =3D true;
>

...here, just before DSI attach. I don't see a good reason for setting
ctx->dsc fields _after_ adding the panel.

> -	ret =3D mipi_dsi_attach(dsi);
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> -		drm_panel_remove(&ctx->panel);
>  		return ret;
>  	}
>
>  	return 0;
>  }

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
